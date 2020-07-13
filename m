From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 13 Jul 2020 16:51:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/{avro-c,
 python-avro}: bump to version 1.10.0
Message-ID: <20200713145110.29214-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patches that have been released upstream.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 ...2-CMakeLists.txt-fix-build-without-C.patch | 92 -------------------
 package/avro-c/avro-c.hash                    |  4 +-
 package/avro-c/avro-c.mk                      |  2 +-
 .../0001-fix-pycodestyle-regression.patch     | 28 ------
 package/python-avro/python-avro.hash          |  4 +-
 5 files changed, 5 insertions(+), 125 deletions(-)
 delete mode 100644 package/avro-c/0002-CMakeLists.txt-fix-build-without-C.patch
 delete mode 100644 package/python-avro/0001-fix-pycodestyle-regression.patch

diff --git a/package/avro-c/0002-CMakeLists.txt-fix-build-without-C.patch b/package/avro-c/0002-CMakeLists.txt-fix-build-without-C.patch
deleted file mode 100644
index 89a500c588..0000000000
--- a/package/avro-c/0002-CMakeLists.txt-fix-build-without-C.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From cdab7db8ad81884cfb21cc1cf94c981c59d17ef4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 30 Dec 2019 12:32:20 +0100
-Subject: [PATCH] CMakeLists.txt: fix build without C++
-
-Specify that AvroC is a C project and remove tests_cpp.cpp to avoid the
-following build failure if a C++ compiler is not found:
-
-CMake Error at CMakeLists.txt:20 (project):
-  The CMAKE_CXX_COMPILER:
-
-    /home/naourr/work/instance-2/output-1/host/bin/microblazeel-buildroot-linux-uclibc-g++
-
-  is not a full path to an existing compiler tool.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-Fixes:
- - http://autobuild.buildroot.org/results/135e246aa70f28c6b9aea5fd6b0eb9c7b45ebfe7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/apache/avro/pull/754]
----
- CMakeLists.txt       |  2 +-
- tests/CMakeLists.txt |  1 -
- tests/test_cpp.cpp   | 27 ---------------------------
- 3 files changed, 1 insertion(+), 29 deletions(-)
- delete mode 100644 lang/c/tests/test_cpp.cpp
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 11cbf018..b75418c3 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -17,7 +17,7 @@
- # under the License.
- #
- cmake_minimum_required(VERSION 2.4)
--project(AvroC)
-+project(AvroC C)
- enable_testing()
- 
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR})
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index b9e8fe1d..2e84a06a 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -81,7 +81,6 @@ add_avro_test_checkmem(test_avro_1405)
- add_avro_test_checkmem(test_avro_1572)
- add_avro_test(test_avro_data) # Skip memory check for datum. Deprecated and has a lot of memory issues
- add_avro_test_checkmem(test_refcount)
--add_avro_test_checkmem(test_cpp test_cpp.cpp)
- add_avro_test_checkmem(test_avro_1379)
- add_avro_test_checkmem(test_avro_1691)
- add_avro_test_checkmem(test_avro_1906)
-diff --git a/lang/c/tests/test_cpp.cpp b/lang/c/tests/test_cpp.cpp
-deleted file mode 100644
-index 13f98a9b..00000000
---- a/tests/test_cpp.cpp
-+++ /dev/null
-@@ -1,27 +0,0 @@
--/*
-- * Licensed to the Apache Software Foundation (ASF) under one or more
-- * contributor license agreements.  See the NOTICE file distributed with
-- * this work for additional information regarding copyright ownership.
-- * The ASF licenses this file to you under the Apache License, Version 2.0
-- * (the "License"); you may not use this file except in compliance with
-- * the License.  You may obtain a copy of the License at
-- *
-- * https://www.apache.org/licenses/LICENSE-2.0
-- *
-- * Unless required by applicable law or agreed to in writing, software
-- * distributed under the License is distributed on an "AS IS" BASIS,
-- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
-- * implied.  See the License for the specific language governing
-- * permissions and limitations under the License.
-- */
--
--#include "avro.h"
--
--int main(int argc, char **argv)
--{
--    (void)argc;
--    (void)argv;
--
--	return 0;
--}
--
--- 
-2.24.0
-
diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index fdddf0bd80..c4fd7d3f57 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,5 +1,5 @@
-# From https://www-eu.apache.org/dist/avro/avro-1.9.2/c/avro-c-1.9.2.tar.gz.sha512
-sha512  1bc4bb22c88b70235e8e0280dbb7aeee7aa3f6cb7ff78a1aa5a7a6a1aca5522e8cfc89064096eace1c07a50e98f2397abd3620de1a29f9e5103b6f4c84316927  avro-c-1.9.2.tar.gz
+# From https://downloads.apache.org/avro/avro-1.10.0/c/avro-c-1.10.0.tar.gz.sha512
+sha512  2e64926b214fd996abf0553572ec6f46b312cf84df17149d1a7e89f4033b63cc34fabef62b98d727799a8a5d452ac9254e275bdea4bf894e9e1e4588bc5dfc9b  avro-c-1.10.0.tar.gz
 
 # License files
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index 5cdbe362d8..ee6e864161 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVRO_C_VERSION = 1.9.2
+AVRO_C_VERSION = 1.10.0
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/0001-fix-pycodestyle-regression.patch b/package/python-avro/0001-fix-pycodestyle-regression.patch
deleted file mode 100644
index 63cb5da294..0000000000
--- a/package/python-avro/0001-fix-pycodestyle-regression.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a66459dd654489bf2c17e2828d5c314a4048be70 Mon Sep 17 00:00:00 2001
-From: Ryan Skraba <ryan@skraba.com>
-Date: Thu, 13 Feb 2020 09:57:02 +0100
-Subject: [PATCH] AVRO-2737: Fix pycodestyle regression.
-
-An erroneous import was added in the Avro 1.9.2 Python3 package.
-The issue has been fixed and released on pypi as version 1.9.2.1, but has
-not been published on the Apache download website, hence this patch.
-
-[Titouan: add detailed commit message]
-Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
----
- setup.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 20dd4e240..f6297bb1b 100755
---- a/setup.py
-+++ b/setup.py
-@@ -38,8 +38,6 @@
- 
- import setuptools
- 
--import pycodestyle
--
- _HERE = os.path.dirname(os.path.abspath(__file__))
- _AVRO_DIR = os.path.join(_HERE, 'avro')
- _VERSION_FILE_NAME = 'VERSION.txt'
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index fbc466a94f..2428be96e5 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
-# From https://www-eu.apache.org/dist/avro/avro-1.9.2/py3/avro-python3-1.9.2.tar.gz.sha512
-sha512  f981fd72bc64eb71e6c132c551700e89a8ebdd6cd9d7e6fa7559831cee69749fc255a49ee0859afd106e0d913c36327b27ca4c7b36efbf740515881b92076cb6  avro-python3-1.9.2.tar.gz
+# From https://downloads.apache.org/avro/avro-1.10.0/py3/avro-python3-1.10.0.tar.gz.sha512
+sha512  fb41f9227d2410c29cde10d7573aebbc142c2bf3f5945a1aaffdeac8b4b5ec690b0befdfc813a8762289dbbb7fc4e1be1564ba0c69d03092b84d8e938d6156f6  avro-python3-1.10.0.tar.gz
 
 # License files
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
-- 
2.25.3
