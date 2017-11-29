From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 29 Nov 2017 16:17:51 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Add upstream patch to ensure
 CMAKE_BUILD_TYPE is honored
Message-ID: <20171129141751.9325-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make WebKitGTK+ honor the value of CMAKE_BUILD_TYPE defined in the CMake
toolchain file by backporting the following upstream WebKit patch:

    https://trac.webkit.org/changeset/225168

This reduces the generated binary sizes when building in "Release" mode
(BR2_ENABLE_DEBUG=n), for example when targeting ARMv8 the size reduction
is ~17 MiB.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...s-of-CMAKE_BUILD_TYPE-from-toolchain-file.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/webkitgtk/0001-CMake-Values-of-CMAKE_BUILD_TYPE-from-toolchain-file.patch

diff --git a/package/webkitgtk/0001-CMake-Values-of-CMAKE_BUILD_TYPE-from-toolchain-file.patch b/package/webkitgtk/0001-CMake-Values-of-CMAKE_BUILD_TYPE-from-toolchain-file.patch
new file mode 100644
index 0000000000..6ac1258626
--- /dev/null
+++ b/package/webkitgtk/0001-CMake-Values-of-CMAKE_BUILD_TYPE-from-toolchain-file.patch
@@ -0,0 +1,52 @@
+From 3b13b1ec9985e72132ec6a3ba13cf60b34848817 Mon Sep 17 00:00:00 2001
+From: "aperez at igalia.com"
+ <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Mon, 27 Nov 2017 15:34:49 +0000
+Subject: [PATCH] [CMake] Values of CMAKE_BUILD_TYPE from toolchain file are
+ ignored https://bugs.webkit.org/show_bug.cgi?id=179971
+
+Reviewed by Carlos Alberto Lopez Perez.
+
+* CMakeLists.txt: Call project() first, as it loads the toolchain
+file, so that's done before checking CMAKE_BUILD_TYPE.
+
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 225168 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Backported from: 75986e1807b
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d80c37b950a..0a9bd17b981 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,8 +1,17 @@
+ # -----------------------------------------------------------------------------
+ # Determine CMake version and build type.
+ # -----------------------------------------------------------------------------
++#
++# NOTE: cmake_minimum_required() and project() *MUST* be the two fist commands
++# used, see https://cmake.org/cmake/help/v3.3/command/project.html -- the
++# latter in particular handles loading a bunch of shared CMake definitions
++# and loading the cross-compilation settings from CMAKE_TOOLCHAIN_FILE.
++#
++
+ cmake_minimum_required(VERSION 3.3)
+ 
++project(WebKit)
++
+ if (NOT CMAKE_BUILD_TYPE)
+     message(WARNING "No CMAKE_BUILD_TYPE value specified, defaulting to RelWithDebInfo.")
+     set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "Choose the type of build." FORCE)
+@@ -10,8 +19,6 @@ else ()
+     message(STATUS "The CMake build type is: ${CMAKE_BUILD_TYPE}")
+ endif ()
+ 
+-project(WebKit)
+-
+ set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/Source/cmake")
+ 
+ set(ENABLE_WEBCORE ON)
+-- 
+2.15.1
+
-- 
2.15.1
