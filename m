From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 21:40:29 +0100
Subject: [Buildroot] [git commit] package/librsync: bump to version 2.2.1
Message-ID: <20191202083934.9A3BC8147E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d66e515ea9a7d4d05ed42e2e146680c8a3f11cae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

librsync can be built statically through the standard cmake
BUILD_SHARED_LIBS option since version 2.2.0 and
https://github.com/librsync/librsync/commit/1ad3c7c600dc7231b0d3feb9bfcd83fa0ebe1051

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-CMakeLists-fix-build-with-old-compilers.patch | 39 ++++++++++++++++++++++
 package/librsync/Config.in                         |  4 ---
 package/librsync/librsync.hash                     |  2 +-
 package/librsync/librsync.mk                       |  2 +-
 4 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/package/librsync/0001-CMakeLists-fix-build-with-old-compilers.patch b/package/librsync/0001-CMakeLists-fix-build-with-old-compilers.patch
new file mode 100644
index 0000000000..76598c21f1
--- /dev/null
+++ b/package/librsync/0001-CMakeLists-fix-build-with-old-compilers.patch
@@ -0,0 +1,39 @@
+From 77b78e01f83b65f3c38941f54f71beaaddcb6fc1 Mon Sep 17 00:00:00 2001
+From: Pierre-Jean Texier <pjtexier@koncepto.io>
+Date: Sat, 23 Nov 2019 16:51:46 +0100
+Subject: [PATCH] CMakeLists: fix build with old compilers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The librsync code uses some C99 constructs, but old compilers such
+as gcc 4.7 don't default to -std=c99. This commit makes sure librsync
+is built with -std=gnu99.
+
+Fixes:
+
+src/rabinkarp.h:82:5: error: ???for??? loop initial declarations are only allowed in C99 or C11 mode
+     for (size_t i = len; i; i--) {
+     ^
+src/rabinkarp.h:82:5: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code
+
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+[Upstream status: https://github.com/librsync/librsync/pull/181]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f810061..794d9c0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -149,7 +149,7 @@ if (CMAKE_C_COMPILER_ID MATCHES "(Clang|Gnu|GNU)")
+   # TODO: Set for MSVC and other compilers.
+   # TODO: Set -Werror when the build is clean.
+ 
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
++  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -std=gnu99")
+ endif()
+ 
+ site_name(BUILD_HOSTNAME)
diff --git a/package/librsync/Config.in b/package/librsync/Config.in
index 6957ddcc0e..652f0cb276 100644
--- a/package/librsync/Config.in
+++ b/package/librsync/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBRSYNC
 	bool "librsync"
-	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_POPT
@@ -10,6 +9,3 @@ config BR2_PACKAGE_LIBRSYNC
 	  rsync utility and is used in rproxy.
 
 	  https://github.com/librsync/librsync
-
-comment "librsync needs a toolchain w/ dynamic library support"
-	depends on BR2_STATIC_LIBS
diff --git a/package/librsync/librsync.hash b/package/librsync/librsync.hash
index 95206c39a7..d00e5cd337 100644
--- a/package/librsync/librsync.hash
+++ b/package/librsync/librsync.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 f701d2bab3d7471dfea60d29e9251f8bb7567222957f7195af55142cb207c653  librsync-2.1.0.tar.gz
+sha256 b5ab8e2092b82b7d7bb9c1dd52e6a77083a89f8ad9b9309da611f490d0b49a71  librsync-2.2.1.tar.gz
 sha256 5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 4e42f77344..82d9b9fe2e 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRSYNC_VERSION = 2.1.0
+LIBRSYNC_VERSION = 2.2.1
 LIBRSYNC_SITE = $(call github,librsync,librsync,v$(LIBRSYNC_VERSION))
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
