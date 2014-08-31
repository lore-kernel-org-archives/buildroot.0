From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Sep 2014 00:09:57 +0200
Subject: [Buildroot] [git commit] package/taglib: fix static link
Message-ID: <20140831221145.80CA19D4F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be8b062f8039e7952af7220940f0ed7e4f8a5441
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- disable shared object build when BR2_PREFER_STATIC_LIB is set
- patch the CMake code for handling static/shared object build using
  standard CMake flags, instead of the custom ones.

Fixes:
  http://autobuild.buildroot.net/results/a9c/a9cfe66c57bffc5a4560b2e4dcb41994da59e294/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...he-standard-CMake-flag-to-drive-the-share.patch |   40 ++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

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
