From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Feb 2013 13:58:51 +0100
Subject: [Buildroot] [git commit] rpi-userland: update to fix no-longer
	applying patch
Message-ID: <20130210125909.3571F9AA76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6056de8971bf25c9853c38583dc50b5abcb982de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our patches do not apply as-is against the version of rpi-userland we
package (weird...).

Since rpi-userland does not have releases, and is a relatively fast-moving
target, just bump the version to the latest cset from the git tree, and
get rid of one our failing patch, since it was applied upstream.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...0002-Test-for-the-existence-of-execinfo-h.patch |   69 --------------------
 package/rpi-userland/rpi-userland.mk               |    2 +-
 2 files changed, 1 insertions(+), 70 deletions(-)

diff --git a/package/rpi-userland/rpi-userland-0002-Test-for-the-existence-of-execinfo-h.patch b/package/rpi-userland/rpi-userland-0002-Test-for-the-existence-of-execinfo-h.patch
deleted file mode 100644
index ccc67d9..0000000
--- a/package/rpi-userland/rpi-userland-0002-Test-for-the-existence-of-execinfo-h.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 93ae1bcd8005216baf7361ba860b53a2cf2e0401 Mon Sep 17 00:00:00 2001
-From: Floris Bos <bos@je-eigen-domein.nl>
-Date: Sun, 25 Nov 2012 19:05:07 +0100
-Subject: [PATCH] Test for the existence of execinfo.h
-
-Previous code assumed that on Linux the execinfo.h functions are always available, which is a glibc extension.
-This change fixes building the library under buildroot, which uses uClibc by default
----
- interface/vcos/glibc/vcos_backtrace.c |    7 +++++--
- makefiles/cmake/arm-linux.cmake       |    4 ++++
- makefiles/cmake/cmake_config.h.in     |    3 +++
- 3 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/interface/vcos/glibc/vcos_backtrace.c b/interface/vcos/glibc/vcos_backtrace.c
-index 474a328..3bb8aa3 100644
---- a/interface/vcos/glibc/vcos_backtrace.c
-+++ b/interface/vcos/glibc/vcos_backtrace.c
-@@ -26,7 +26,10 @@
- */
- 
- #include <interface/vcos/vcos.h>
--#ifdef __linux__
-+#ifdef HAVE_CMAKE_CONFIG
-+#include "cmake_config.h"
-+#endif
-+#ifdef HAVE_EXECINFO_H
- #include <execinfo.h>
- #endif
- #include <stdio.h>
-@@ -35,7 +38,7 @@
- 
- void vcos_backtrace_self(void)
- {
--#ifdef __linux__
-+#ifdef HAVE_EXECINFO_H
-    void *stack[64];
-    int depth = backtrace(stack, sizeof(stack)/sizeof(stack[0]));
-    char **names = backtrace_symbols(stack, depth);
-diff --git a/makefiles/cmake/arm-linux.cmake b/makefiles/cmake/arm-linux.cmake
-index 89d8bbf..6f2114f 100644
---- a/makefiles/cmake/arm-linux.cmake
-+++ b/makefiles/cmake/arm-linux.cmake
-@@ -115,6 +115,10 @@ try_compile(HAVE_MTRACE
-             ${CMAKE_SOURCE_DIR}/makefiles/cmake/srcs/test-mtrace.c
-             OUTPUT_VARIABLE foo)
- 
-+# test for existence of execinfo.h header
-+include(CheckIncludeFile)
-+check_include_file(execinfo.h HAVE_EXECINFO_H)
-+
- add_definitions(-DHAVE_CMAKE_CONFIG)
- configure_file (
-     "makefiles/cmake/cmake_config.h.in"
-diff --git a/makefiles/cmake/cmake_config.h.in b/makefiles/cmake/cmake_config.h.in
-index 5f08ad5..080b8e8 100644
---- a/makefiles/cmake/cmake_config.h.in
-+++ b/makefiles/cmake/cmake_config.h.in
-@@ -8,5 +8,8 @@
- /** Do we have support for GLIBC mtrace() ? */
- #cmakedefine                    HAVE_MTRACE
- 
-+/** Do we have the execinfo.h include file ? */
-+#cmakedefine                    HAVE_EXECINFO_H
-+
- #endif
- 
--- 
-1.7.10
-
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index ece37d4..522a97f 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RPI_USERLAND_VERSION = 9852ce28826889e50c4d6786b942f51bccccac54
+RPI_USERLAND_VERSION = 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILE = LICENCE
