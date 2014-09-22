From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Mon, 22 Sep 2014 13:31:07 +0200
Subject: [Buildroot] [PATCH v2] cmake : bump to version 3.0.2
Message-ID: <1411385468-24878-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 ...not-prepend-CMake-root-path-when-searchin.patch | 38 ----------------------
 package/cmake/cmake.mk                             |  4 +--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 package/cmake/cmake-0001-FindQt4-do-not-prepend-CMake-root-path-when-searchin.patch

diff --git a/package/cmake/cmake-0001-FindQt4-do-not-prepend-CMake-root-path-when-searchin.patch b/package/cmake/cmake-0001-FindQt4-do-not-prepend-CMake-root-path-when-searchin.patch
deleted file mode 100644
index 8ab5a23..0000000
--- a/package/cmake/cmake-0001-FindQt4-do-not-prepend-CMake-root-path-when-searchin.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 02a18089402de70188f2cf7b33fcb6edf7506871 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 29 Dec 2013 13:35:18 +0100
-Subject: [PATCH] FindQt4: do not prepend CMake root path when searching the
- mkspecs directory
-
-When searching for the mkspecs directory, FindQT4 uses the find_path()
-function, but it doesn't pass the NO_CMAKE_FIND_ROOT_PATH, which means
-that all paths are interpreted relatively to the CMAKE_FIND_ROOT_PATH.
-
-However, both the ${qt_mkspecs_dirs} and ${qt_cross_paths} variable
-that are passed as hints are already absolute paths, and do not need
-to be prepended by the CMAKE_FIND_ROOT_PATH.
-
-Due to this problem, FindQT4 was unable to find qconfig.pri, and
-QT_MKSPECS_DIR was left defined to "NOTFOUND".
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Modules/FindQt4.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index 28b8454..0b8ce92 100644
---- a/Modules/FindQt4.cmake
-+++ b/Modules/FindQt4.cmake
-@@ -760,7 +760,7 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
-     endforeach()
-     set(QT_MKSPECS_DIR NOTFOUND)
-     find_path(QT_MKSPECS_DIR NAMES qconfig.pri
--      HINTS ${qt_cross_paths} ${qt_mkspecs_dirs}
-+      HINTS ${qt_cross_paths} ${qt_mkspecs_dirs} NO_CMAKE_FIND_ROOT_PATH
-       DOC "The location of the Qt mkspecs containing qconfig.pri")
-   endif()
- 
--- 
-1.8.3.2
-
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index bfeb147..e09fddf 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 2.8
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).12.2
+CMAKE_VERSION_MAJOR = 3.0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.1.0
