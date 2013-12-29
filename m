From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 14:09:46 +0100
Subject: [Buildroot] [PATCH] cmake: add patch to fix Qt mkspecs detection
Message-ID: <1388322586-14688-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The FindQt4 macros that search the mkspecs directory had a bug that
prevented the mkspecs directory from being found, causing build
failures of the qjson and grantlee.

Fixes:

  http://autobuild.buildroot.org/results/75b/75b45da597c12034baad50492c0c8150dc1bf0aa/build-end.log
  http://autobuild.buildroot.org/results/3b9/3b9d022b02c4497efed178f35c069ea99a7d3eef/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...not-prepend-CMake-root-path-when-searchin.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/cmake/cmake-0001-FindQt4-do-not-prepend-CMake-root-path-when-searchin.patch

diff --git a/package/cmake/cmake-0001-FindQt4-do-not-prepend-CMake-root-path-when-searchin.patch b/package/cmake/cmake-0001-FindQt4-do-not-prepend-CMake-root-path-when-searchin.patch
new file mode 100644
index 0000000..8ab5a23
--- /dev/null
+++ b/package/cmake/cmake-0001-FindQt4-do-not-prepend-CMake-root-path-when-searchin.patch
@@ -0,0 +1,38 @@
+From 02a18089402de70188f2cf7b33fcb6edf7506871 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 29 Dec 2013 13:35:18 +0100
+Subject: [PATCH] FindQt4: do not prepend CMake root path when searching the
+ mkspecs directory
+
+When searching for the mkspecs directory, FindQT4 uses the find_path()
+function, but it doesn't pass the NO_CMAKE_FIND_ROOT_PATH, which means
+that all paths are interpreted relatively to the CMAKE_FIND_ROOT_PATH.
+
+However, both the ${qt_mkspecs_dirs} and ${qt_cross_paths} variable
+that are passed as hints are already absolute paths, and do not need
+to be prepended by the CMAKE_FIND_ROOT_PATH.
+
+Due to this problem, FindQT4 was unable to find qconfig.pri, and
+QT_MKSPECS_DIR was left defined to "NOTFOUND".
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Modules/FindQt4.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
+index 28b8454..0b8ce92 100644
+--- a/Modules/FindQt4.cmake
++++ b/Modules/FindQt4.cmake
+@@ -760,7 +760,7 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
+     endforeach()
+     set(QT_MKSPECS_DIR NOTFOUND)
+     find_path(QT_MKSPECS_DIR NAMES qconfig.pri
+-      HINTS ${qt_cross_paths} ${qt_mkspecs_dirs}
++      HINTS ${qt_cross_paths} ${qt_mkspecs_dirs} NO_CMAKE_FIND_ROOT_PATH
+       DOC "The location of the Qt mkspecs containing qconfig.pri")
+   endif()
+ 
+-- 
+1.8.3.2
+
-- 
1.8.3.2
