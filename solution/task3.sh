#!/bin/bash

FILE_NAME="path_value.txt"

if [ -f "$FILE_NAME" ]; then
  rm "$FILE_NAME"
  echo "Удален существующий файл: $FILE_NAME"
fi

touch "$FILE_NAME"

if [ ! -f "$FILE_NAME" ]; then
  echo "Ошибка: Не удалось создать файл $FILE_NAME"
  exit 1
fi

echo "$PATH" >> "$FILE_NAME"

echo "Переменная PATH записана в файл: $FILE_NAME"

chmod 400 "$FILE_NAME"

FILE_PERMISSIONS=$(stat -c "%a" "$FILE_NAME")

if [ "$FILE_PERMISSIONS" != "400" ]; then
  echo "Ошибка: не удалось изменить права файла на (400)"
  echo "Фактические права: $FILE_PERMISSIONS"
  exit 1
fi

echo "Права на файл ограничены: чтение только для владельца (400)"

exit 0
