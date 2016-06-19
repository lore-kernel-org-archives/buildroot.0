From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 23:01:59 +0200
Subject: [Buildroot] [git commit] package/libdvdread: bump version to 5.0.3
Message-ID: <20160619213724.08F6980489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd816b77510326898b241e240a3c0ed3c0c9d628
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0001-fix-os2-support.patch, applied upstream:
https://code.videolan.org/videolan/libdvdread/commit/75f8601ee3b19d8914528860f7e1d2906df4a411

Removed autoreconf, a configure script is now part of the upstream
tarball.

The script dvdread-config was removed:
https://code.videolan.org/videolan/libdvdread/commit/9991d1720b824902628573abce89916700933c38

Changed LIBDVDREAD_SITE according to the news post dating 13 Feb 2014
from http://dvdnav.mplayerhq.hu/

Enabled static build, tested using this defconfig:
http://autobuild.buildroot.net/toolchains/configs/br-arm-full-static.config

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdvdread/0001-fix-os2-support.patch | 31 ---------------------------
 package/libdvdread/Config.in                  |  4 ----
 package/libdvdread/libdvdread.hash            |  4 ++--
 package/libdvdread/libdvdread.mk              |  9 +++-----
 4 files changed, 5 insertions(+), 43 deletions(-)

diff --git a/package/libdvdread/0001-fix-os2-support.patch b/package/libdvdread/0001-fix-os2-support.patch
deleted file mode 100644
index 755bfaf..0000000
--- a/package/libdvdread/0001-fix-os2-support.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-configure: fix build on NIOS II platform
-
-NIOS II is a CPU architecture from Altera, which uses 'nios2' as the
-architecture part of the tuple. Unfortunately, 'nios2' matches the
-current '*os2*' test done by libdvdread's configure script to detect
-the OS/2 operating system. This leads to build issues as the build
-process of libdvdread then tries to use OS/2 specific compiler
-options, that do not exist in the gcc used for Linux/NIOS2.
-
-To fix this, this patch makes the test for OS/2 a little bit more
-specific: in the case of the OS/2 operating system, the OS part of the
-tuple contains just 'os2' (confirmed by looking at config.guess and
-config.sub in the gnuconfig project). So using '*-os2-*' will properly
-match the OS/2 operating system but not the NIOS II architecture.
-
-Upstream-status: submitted
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -146,7 +146,7 @@
-   *cygwin*)
-     LDFLAGS="-no-undefined $LDFLAGS"
-     ;;
--  *os2*)
-+  *-os2-*)
-     LDFLAGS="-no-undefined -Zbin-files $LDFLAGS"
-     ;;
-   *)
diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
index 1326709..dea59eb 100644
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_LIBDVDREAD
 	bool "libdvdread"
-	depends on !BR2_STATIC_LIBS
 	help
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
 
 	  http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
-
-comment "libdvdread needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index 11cc1ce..bef93fc 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	af9b98f049580a6521d56c978b736d3d609562dd12955e11d50e26d97542dcd4	libdvdread-4.2.1.tar.xz
+# From http://download.videolan.org/pub/videolan/libdvdread/5.0.0/libdvdread-5.0.3.tar.bz2.sha256
+sha256	321cdf2dbdc83c96572bc583cd27d8c660ddb540ff16672ecb28607d018ed82b	libdvdread-5.0.3.tar.bz2
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 6658460..78ea292 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,13 +4,10 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 4.2.1
-LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.xz
-LIBDVDREAD_SITE = http://dvdnav.mplayerhq.hu/releases
-# configure not shipped
-LIBDVDREAD_AUTORECONF = YES
+LIBDVDREAD_VERSION = 5.0.3
+LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
+LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
-LIBDVDREAD_CONFIG_SCRIPTS = dvdread-config
 LIBDVDREAD_LICENSE = GPLv2+
 LIBDVDREAD_LICENSE_FILES = COPYING
 
