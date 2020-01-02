From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:17:46 +0100
Subject: [Buildroot] [git commit] package/librsync: fix static link with popt
Message-ID: <20200102081334.ED5748EB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca7d5675676cbc4d5e795db61181925cac37a972
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pkg-config to retrieve popt dependencies such as iconv

Fixes:
 - http://autobuild.buildroot.org/results/896e8e3efbedad90d66ae8c4e1e50f16206cab49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...make-FindPOPT.cmake-Add-PkgConfig-support.patch | 67 ++++++++++++++++++++++
 package/librsync/librsync.mk                       |  2 +-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/package/librsync/0002-cmake-FindPOPT.cmake-Add-PkgConfig-support.patch b/package/librsync/0002-cmake-FindPOPT.cmake-Add-PkgConfig-support.patch
new file mode 100644
index 0000000000..1c8a332ab6
--- /dev/null
+++ b/package/librsync/0002-cmake-FindPOPT.cmake-Add-PkgConfig-support.patch
@@ -0,0 +1,67 @@
+From f5a131ab66fec23d0c79b55fc3907603b094deb9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 31 Dec 2019 18:13:29 +0100
+Subject: [PATCH] cmake/FindPOPT.cmake: Add PkgConfig support
+
+Add PkgConfig support to retrieve popt dependencies otherwise static
+build can fail if popt has been linked with iconv:
+
+[100%] Linking C executable rdiff
+/home/buildroot/autobuild/instance-2/output-1/per-package/librsync/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/8.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/per-package/librsync/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libpopt.a(poptint.o): in function `POPT_fprintf':
+poptint.c:(.text+0x34c): undefined reference to `libiconv_open
+
+Fixes:
+ - http://autobuild.buildroot.org/results/896e8e3efbedad90d66ae8c4e1e50f16206cab49
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/librsync/librsync/pull/186]
+---
+ cmake/FindPOPT.cmake | 29 ++++++++++++++++++-----------
+ 1 file changed, 18 insertions(+), 11 deletions(-)
+
+diff --git a/cmake/FindPOPT.cmake b/cmake/FindPOPT.cmake
+index 1ca452a..87b3e95 100644
+--- a/cmake/FindPOPT.cmake
++++ b/cmake/FindPOPT.cmake
+@@ -42,20 +42,27 @@ if (NOT POPT_FOUND)
+   endif (NOT POPT_ROOT_DIR)
+ 
+   ##_____________________________________________________________________________
+-  ## Check for the header files
++  ## Check with PkgConfig (to retrieve static dependencies such as iconv)
++  find_package(PkgConfig QUIET)
++  pkg_search_module (POPT QUIET popt)
++  if (NOT POPT_FOUND)
+ 
+-  find_path (POPT_INCLUDE_DIRS popt.h
+-    HINTS ${POPT_ROOT_DIR} ${CMAKE_INSTALL_PREFIX} $ENV{programfiles}\\GnuWin32 $ENV{programfiles32}\\GnuWin32
+-    PATH_SUFFIXES include
+-    )
++    ##_____________________________________________________________________________
++    ## Check for the header files
+ 
+-  ##_____________________________________________________________________________
+-  ## Check for the library
++    find_path (POPT_INCLUDE_DIRS popt.h
++      HINTS ${POPT_ROOT_DIR} ${CMAKE_INSTALL_PREFIX} $ENV{programfiles}\\GnuWin32 $ENV{programfiles32}\\GnuWin32
++      PATH_SUFFIXES include
++      )
+ 
+-  find_library (POPT_LIBRARIES popt
+-    HINTS ${POPT_ROOT_DIR} ${CMAKE_INSTALL_PREFIX} $ENV{programfiles}\\GnuWin32 $ENV{programfiles32}\\GnuWin32
+-    PATH_SUFFIXES lib
+-    )
++    ##_____________________________________________________________________________
++    ## Check for the library
++
++    find_library (POPT_LIBRARIES popt
++      HINTS ${POPT_ROOT_DIR} ${CMAKE_INSTALL_PREFIX} $ENV{programfiles}\\GnuWin32 $ENV{programfiles32}\\GnuWin32
++      PATH_SUFFIXES lib
++      )
++  endif (POPT_FOUND)
+ 
+   ##_____________________________________________________________________________
+   ## Actions taken when all components have been found
+-- 
+2.24.0
+
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 82d9b9fe2e..bf0785b427 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -9,6 +9,6 @@ LIBRSYNC_SITE = $(call github,librsync,librsync,v$(LIBRSYNC_VERSION))
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
 LIBRSYNC_INSTALL_STAGING = YES
-LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
+LIBRSYNC_DEPENDENCIES = host-pkgconf zlib bzip2 popt
 
 $(eval $(cmake-package))
