From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 21:55:22 +0200
Subject: [Buildroot] [PATCH v2 9/9] package/taglib: fix static link
In-Reply-To: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409514922-9509-10-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- disable shared object build when BR2_PREFER_STATIC_LIB is set
- patch the CMake code for handling static/shared object build using
  standard CMake flags, instead of the custom ones.

Fixes:
  http://autobuild.buildroot.net/results/a9c/a9cfe66c57bffc5a4560b2e4dcb41994da59e294/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- add patch handling static/shared object build using standard CMake
  flags, instead of the custom ones.
---
 ...he-standard-CMake-flag-to-drive-the-share.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/taglib/taglib-0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch

diff --git a/package/taglib/taglib-0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/taglib/taglib-0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
new file mode 100644
index 0000000..535ccb4
--- /dev/null
+++ b/package/taglib/taglib-0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
@@ -0,0 +1,40 @@
+From 4e6a75eed3602f10aff516f49c8088c6da8db9df Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 31 Aug 2014 12:11:57 +0200
+Subject: [PATCH 1/1] cmake: use the standard CMake flag to drive the shared
+ object build
+
+If BUILD_SHARED_LIBS is set and ENABLE_STATIC undefined, then drive
+ENABLE_STATIC with the BUILD_SHARED_LIBS value.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 317ffa1..9931957 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,17 @@ project(taglib)
+ 
+ cmake_minimum_required(VERSION 2.6.0 FATAL_ERROR)
+ 
+-option(ENABLE_STATIC "Make static version of libtag"  OFF)
++# Use the standard CMake flag to drive the shared object build.
++if(DEFINED BUILD_SHARED_LIBS AND NOT DEFINED ENABLE_STATIC)
++  if(BUILD_SHARED_LIBS)
++    set(ENABLE_STATIC OFF)
++  else()
++    set(ENABLE_STATIC ON)
++  endif()
++else()
++  option(ENABLE_STATIC "Make static version of libtag"  OFF)
++endif()
++
+ if(ENABLE_STATIC)
+   add_definitions(-DTAGLIB_STATIC)
+   set(BUILD_SHARED_LIBS OFF)
+-- 
+2.1.0
+
-- 
2.1.0
