From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 May 2016 09:20:13 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/taglib: bump to version 1.11
In-Reply-To: <1464420013-23211-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464420013-23211-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1464420013-23211-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch,
a similar patch was committed upstream:

https://github.com/taglib/taglib/commit/ea55c8b5c1e3b72789c302aa2560d9c87faedd40

Also remove empty line from Config.in.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...he-standard-CMake-flag-to-drive-the-share.patch | 40 ----------------------
 package/taglib/Config.in                           |  1 -
 package/taglib/taglib.hash                         |  2 +-
 package/taglib/taglib.mk                           |  2 +-
 4 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/taglib/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch

diff --git a/package/taglib/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/taglib/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
deleted file mode 100644
index 535ccb4..0000000
--- a/package/taglib/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4e6a75eed3602f10aff516f49c8088c6da8db9df Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 31 Aug 2014 12:11:57 +0200
-Subject: [PATCH 1/1] cmake: use the standard CMake flag to drive the shared
- object build
-
-If BUILD_SHARED_LIBS is set and ENABLE_STATIC undefined, then drive
-ENABLE_STATIC with the BUILD_SHARED_LIBS value.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- CMakeLists.txt | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 317ffa1..9931957 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,7 +2,17 @@ project(taglib)
- 
- cmake_minimum_required(VERSION 2.6.0 FATAL_ERROR)
- 
--option(ENABLE_STATIC "Make static version of libtag"  OFF)
-+# Use the standard CMake flag to drive the shared object build.
-+if(DEFINED BUILD_SHARED_LIBS AND NOT DEFINED ENABLE_STATIC)
-+  if(BUILD_SHARED_LIBS)
-+    set(ENABLE_STATIC OFF)
-+  else()
-+    set(ENABLE_STATIC ON)
-+  endif()
-+else()
-+  option(ENABLE_STATIC "Make static version of libtag"  OFF)
-+endif()
-+
- if(ENABLE_STATIC)
-   add_definitions(-DTAGLIB_STATIC)
-   set(BUILD_SHARED_LIBS OFF)
--- 
-2.1.0
-
diff --git a/package/taglib/Config.in b/package/taglib/Config.in
index 209837f..6521d48 100644
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -1,4 +1,3 @@
-
 config BR2_PACKAGE_TAGLIB
 	bool "taglib"
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 86ac6a4..a3cfc79 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc967dc71a	taglib-1.9.1.tar.gz
+sha256	ed4cabb3d970ff9a30b2620071c2b054c4347f44fc63546dbe06f97980ece288	taglib-1.11.tar.gz
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 2410650..0a2ca4d 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.9.1
+TAGLIB_VERSION = 1.11
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPLv2.1, MPL
-- 
2.8.1
