From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jun 2020 22:03:35 +0200
Subject: [Buildroot] [git commit] package/librsync: bump to version 2.3.1
Message-ID: <20200607200416.DE00B814C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ba7d52ec14a486625e5e59290eda7e481d0e113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a patch release that adds peformance improvements. See [1]

Also:
 - Remove upstream patches
 - update hash file formatting (2 spaces).

[1] - https://github.com/librsync/librsync/releases/tag/v2.3.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-CMakeLists-fix-build-with-old-compilers.patch | 39 -------------
 ...make-FindPOPT.cmake-Add-PkgConfig-support.patch | 67 ----------------------
 package/librsync/librsync.hash                     |  4 +-
 package/librsync/librsync.mk                       |  2 +-
 4 files changed, 3 insertions(+), 109 deletions(-)

diff --git a/package/librsync/0001-CMakeLists-fix-build-with-old-compilers.patch b/package/librsync/0001-CMakeLists-fix-build-with-old-compilers.patch
deleted file mode 100644
index 76598c21f1..0000000000
--- a/package/librsync/0001-CMakeLists-fix-build-with-old-compilers.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 77b78e01f83b65f3c38941f54f71beaaddcb6fc1 Mon Sep 17 00:00:00 2001
-From: Pierre-Jean Texier <pjtexier@koncepto.io>
-Date: Sat, 23 Nov 2019 16:51:46 +0100
-Subject: [PATCH] CMakeLists: fix build with old compilers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The librsync code uses some C99 constructs, but old compilers such
-as gcc 4.7 don't default to -std=c99. This commit makes sure librsync
-is built with -std=gnu99.
-
-Fixes:
-
-src/rabinkarp.h:82:5: error: ???for??? loop initial declarations are only allowed in C99 or C11 mode
-     for (size_t i = len; i; i--) {
-     ^
-src/rabinkarp.h:82:5: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code
-
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
-[Upstream status: https://github.com/librsync/librsync/pull/181]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f810061..794d9c0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -149,7 +149,7 @@ if (CMAKE_C_COMPILER_ID MATCHES "(Clang|Gnu|GNU)")
-   # TODO: Set for MSVC and other compilers.
-   # TODO: Set -Werror when the build is clean.
- 
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
-+  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -std=gnu99")
- endif()
- 
- site_name(BUILD_HOSTNAME)
diff --git a/package/librsync/0002-cmake-FindPOPT.cmake-Add-PkgConfig-support.patch b/package/librsync/0002-cmake-FindPOPT.cmake-Add-PkgConfig-support.patch
deleted file mode 100644
index 1c8a332ab6..0000000000
--- a/package/librsync/0002-cmake-FindPOPT.cmake-Add-PkgConfig-support.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From f5a131ab66fec23d0c79b55fc3907603b094deb9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 31 Dec 2019 18:13:29 +0100
-Subject: [PATCH] cmake/FindPOPT.cmake: Add PkgConfig support
-
-Add PkgConfig support to retrieve popt dependencies otherwise static
-build can fail if popt has been linked with iconv:
-
-[100%] Linking C executable rdiff
-/home/buildroot/autobuild/instance-2/output-1/per-package/librsync/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/8.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/per-package/librsync/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libpopt.a(poptint.o): in function `POPT_fprintf':
-poptint.c:(.text+0x34c): undefined reference to `libiconv_open
-
-Fixes:
- - http://autobuild.buildroot.org/results/896e8e3efbedad90d66ae8c4e1e50f16206cab49
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/librsync/librsync/pull/186]
----
- cmake/FindPOPT.cmake | 29 ++++++++++++++++++-----------
- 1 file changed, 18 insertions(+), 11 deletions(-)
-
-diff --git a/cmake/FindPOPT.cmake b/cmake/FindPOPT.cmake
-index 1ca452a..87b3e95 100644
---- a/cmake/FindPOPT.cmake
-+++ b/cmake/FindPOPT.cmake
-@@ -42,20 +42,27 @@ if (NOT POPT_FOUND)
-   endif (NOT POPT_ROOT_DIR)
- 
-   ##_____________________________________________________________________________
--  ## Check for the header files
-+  ## Check with PkgConfig (to retrieve static dependencies such as iconv)
-+  find_package(PkgConfig QUIET)
-+  pkg_search_module (POPT QUIET popt)
-+  if (NOT POPT_FOUND)
- 
--  find_path (POPT_INCLUDE_DIRS popt.h
--    HINTS ${POPT_ROOT_DIR} ${CMAKE_INSTALL_PREFIX} $ENV{programfiles}\\GnuWin32 $ENV{programfiles32}\\GnuWin32
--    PATH_SUFFIXES include
--    )
-+    ##_____________________________________________________________________________
-+    ## Check for the header files
- 
--  ##_____________________________________________________________________________
--  ## Check for the library
-+    find_path (POPT_INCLUDE_DIRS popt.h
-+      HINTS ${POPT_ROOT_DIR} ${CMAKE_INSTALL_PREFIX} $ENV{programfiles}\\GnuWin32 $ENV{programfiles32}\\GnuWin32
-+      PATH_SUFFIXES include
-+      )
- 
--  find_library (POPT_LIBRARIES popt
--    HINTS ${POPT_ROOT_DIR} ${CMAKE_INSTALL_PREFIX} $ENV{programfiles}\\GnuWin32 $ENV{programfiles32}\\GnuWin32
--    PATH_SUFFIXES lib
--    )
-+    ##_____________________________________________________________________________
-+    ## Check for the library
-+
-+    find_library (POPT_LIBRARIES popt
-+      HINTS ${POPT_ROOT_DIR} ${CMAKE_INSTALL_PREFIX} $ENV{programfiles}\\GnuWin32 $ENV{programfiles32}\\GnuWin32
-+      PATH_SUFFIXES lib
-+      )
-+  endif (POPT_FOUND)
- 
-   ##_____________________________________________________________________________
-   ## Actions taken when all components have been found
--- 
-2.24.0
-
diff --git a/package/librsync/librsync.hash b/package/librsync/librsync.hash
index d00e5cd337..1b2130b1a4 100644
--- a/package/librsync/librsync.hash
+++ b/package/librsync/librsync.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 b5ab8e2092b82b7d7bb9c1dd52e6a77083a89f8ad9b9309da611f490d0b49a71  librsync-2.2.1.tar.gz
-sha256 5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
+sha256  dbd7eb643665691bdf4009174461463737b19b4814b789baad62914cabfe4569  librsync-2.3.1.tar.gz
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index bf0785b427..fbe56d4a28 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRSYNC_VERSION = 2.2.1
+LIBRSYNC_VERSION = 2.3.1
 LIBRSYNC_SITE = $(call github,librsync,librsync,v$(LIBRSYNC_VERSION))
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
