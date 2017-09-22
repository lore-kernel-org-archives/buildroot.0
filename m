From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:34:31 +0200
Subject: [Buildroot] [git commit] mpd: remove version 0.19
Message-ID: <20170922213001.E30657FFC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8352f997df76b6a76b3316a8d312540413097ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MPD version 0.20 is affected by GCC bug 64735 and failes to build for
some archictuctures (NIOSII, ARMv4, ARMv5 and SPARCv8) with a GCC
toolchain less then version 7.

We added a version choice between 0.19 and 0.20 in Buildroot version
2017.02 as GCC 7 was not yet available at that time. This way, mpd could
still be build for those architectures.

As GCC 7 is now available in Buildroot remove the version choice for 0.19.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in | 24 ++++--------------------
 package/mpd/mpd.hash  |  1 -
 package/mpd/mpd.mk    | 10 +---------
 3 files changed, 5 insertions(+), 30 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 0c73548..ffeef9b 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -5,9 +5,8 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	# 0.19.x could be built with GCC 4.6, but for simplicity we require
-	# the same toolchain dependencies for all versions.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	# ARC toolchain issue
 	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	select BR2_PACKAGE_BOOST
@@ -23,24 +22,6 @@ menuconfig BR2_PACKAGE_MPD
 
 if BR2_PACKAGE_MPD
 
-# Hidden config symbols to select the branch 0.20 by default and fallback
-# to branch 0.19 for toolchains affected by GCC bug PR 64735. This way we
-# keep support for mpd on some architectures, like ARMv5, until GCC 7 is
-# released, which will fix this issue.
-config BR2_PACKAGE_MPD_VERSION_STRING
-	string
-	default "0.20" if !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	default "0.19"
-
-config BR2_PACKAGE_MPD_VERSION_0_20
-	bool
-	default y if BR2_PACKAGE_MPD_VERSION_STRING = "0.20"
-
-config BR2_PACKAGE_MPD_VERSION_0_19
-	bool
-	default y if BR2_PACKAGE_MPD_VERSION_STRING = "0.19"
-	select BR2_PACKAGE_LIBGLIB2
-
 comment "Archive plugins"
 
 config BR2_PACKAGE_MPD_BZIP2
@@ -342,3 +323,6 @@ comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
+
+comment "mpd needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 873286c..9898c38 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,2 @@
 # Locally calculated after checking pgp signature
 sha256  52fbc1125cdba41ba999add2820d45f3ce7cf493006bb04d8f0b2937204d3121  mpd-0.20.10.tar.xz
-sha256  8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e301730  mpd-0.19.21.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 692d402..ff22593 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,12 +4,8 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = $(call qstrip,$(BR2_PACKAGE_MPD_VERSION_STRING))
-ifeq ($(BR2_PACKAGE_MPD_VERSION_0_20),y)
+MPD_VERSION_MAJOR = 0.20
 MPD_VERSION = $(MPD_VERSION_MAJOR).10
-else
-MPD_VERSION = $(MPD_VERSION_MAJOR).21
-endif
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
@@ -17,10 +13,6 @@ MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
 MPD_AUTORECONF = YES
 
-ifeq ($(BR2_PACKAGE_MPD_VERSION_0_19),y)
-MPD_DEPENDENCIES += libglib2
-endif
-
 # Some options need an explicit --disable or --enable
 
 # Zeroconf support depends on libdns_sd from avahi.
