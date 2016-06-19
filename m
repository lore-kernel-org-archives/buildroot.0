From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 23:05:33 +0200
Subject: [Buildroot] [git commit] package/libdvdnav: bump version to 5.0.3
Message-ID: <20160619213724.1C2DC80489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80d3e50c9e326ea361f10aa92b34e03fbe9a91b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0001-fix-os2-support.patch, not needed anymore after the
version bump according to Thomas' note in the patch file.

Removed autoreconf, a configure script is now part of the upstream
tarball.

The script dvdnav-config was removed:
https://code.videolan.org/videolan/libdvdnav/commit/1de99510f507e4d84a658411605dd6424466d7b5

libdvdnav uses pkg-config to find libdvdread, therefore remove
--with-dvdread-config:
https://code.videolan.org/videolan/libdvdnav/commit/5254b5d7ad9c10b48c97ce72a1b8bf7aef54b12c

Changed LIBDVDNAV_SITE according to the news post dating 13 Feb 2014
from http://dvdnav.mplayerhq.hu/

Enabled static build, tested using this defconfig:
http://autobuild.buildroot.net/toolchains/configs/br-arm-full-static.config

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdvdnav/0001-fix-os2-support.patch | 32 ----------------------------
 package/libdvdnav/Config.in                  |  5 ++---
 package/libdvdnav/libdvdnav.hash             |  4 ++--
 package/libdvdnav/libdvdnav.mk               | 13 +++--------
 4 files changed, 7 insertions(+), 47 deletions(-)

diff --git a/package/libdvdnav/0001-fix-os2-support.patch b/package/libdvdnav/0001-fix-os2-support.patch
deleted file mode 100644
index 0f75f2f..0000000
--- a/package/libdvdnav/0001-fix-os2-support.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-configure: fix build on NIOS II platform
-
-NIOS II is a CPU architecture from Altera, which uses 'nios2' as the
-architecture part of the tuple. Unfortunately, 'nios2' matches the
-current '*os2*' test done by libdvdnav's configure script to detect
-the OS/2 operating system. This leads to build issues as the build
-process of libdvdnav then tries to use OS/2 specific compiler
-options, that do not exist in the gcc used for Linux/NIOS2.
-
-To fix this, this patch makes the test for OS/2 a little bit more
-specific: in the case of the OS/2 operating system, the OS part of the
-tuple contains just 'os2' (confirmed by looking at config.guess and
-config.sub in the gnuconfig project). So using '*-os2-*' will properly
-match the OS/2 operating system but not the NIOS II architecture.
-
-Upstream-status: not needed, newer upstream versions no longer have
-		 this test
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -166,7 +166,7 @@
-   *cygwin*)
-     LDFLAGS="-no-undefined $LDFLAGS"
-     ;;
--  *os2*)
-+  *-os2-*)
-     LDFLAGS="-no-undefined -Zbin-files $LDFLAGS"
-     ;;
-   *)
diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index fb13bc0..8cfcb4a 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS # libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  libdvdnav is a library that allows easy use of sophisticated
@@ -10,5 +9,5 @@ config BR2_PACKAGE_LIBDVDNAV
 
 	  http://www.mplayerhq.hu
 
-comment "libdvdnav needs a toolchain w/ dynamic library, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "libdvdnav needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libdvdnav/libdvdnav.hash b/package/libdvdnav/libdvdnav.hash
index 4a0d851..d3b6fdb 100644
--- a/package/libdvdnav/libdvdnav.hash
+++ b/package/libdvdnav/libdvdnav.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	7fca272ecc3241b6de41bbbf7ac9a303ba25cb9e0c82aa23901d3104887f2372	libdvdnav-4.2.1.tar.xz
+# From http://download.videolan.org/pub/videolan/libdvdnav/5.0.3/libdvdnav-5.0.3.tar.bz2.sha256
+sha256	5097023e3d2b36944c763f1df707ee06b19dc639b2b68fb30113a5f2cbf60b6d	libdvdnav-5.0.3.tar.bz2
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 2ff2ce9..ff5ae09 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -4,19 +4,12 @@
 #
 ################################################################################
 
-LIBDVDNAV_VERSION = 4.2.1
-LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.xz
-LIBDVDNAV_SITE = http://dvdnav.mplayerhq.hu/releases
-# configure not shipped
-LIBDVDNAV_AUTORECONF = YES
+LIBDVDNAV_VERSION = 5.0.3
+LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
+LIBDVDNAV_SITE = http://www.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
 LIBDVDNAV_INSTALL_STAGING = YES
-LIBDVDNAV_CONFIG_SCRIPTS = dvdnav-config
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
 LIBDVDNAV_LICENSE = GPLv2+
 LIBDVDNAV_LICENSE_FILES = COPYING
 
-# By default libdvdnav tries to find dvdread-config in $PATH. Because
-# of cross compilation, we prefer using pkg-config.
-LIBDVDNAV_CONF_OPTS = --with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
-
 $(eval $(autotools-package))
