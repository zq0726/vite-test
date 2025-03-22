#!/usr/bin/env bash

# 强制路径兼容 Windows
set -e
rm -rf dist/*
npm run build

cd dist

rm -rf .git  # <--- 添加这行解决重复初始化问题


git init
git checkout -b main
git add -A
git commit -m "Deploy: $(date +'%Y-%m-%d %H:%M:%S')"

# 使用 Windows 格式路径（反斜杠转义）
git push -f https://github.com/zq0726/vite-test.git main:gh-pages

cd ..