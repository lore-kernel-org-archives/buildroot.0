From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 Feb 2017 18:47:59 +0100
Subject: [Buildroot] [PATCH 6/6] package/mpd: add choice between version
	0.19 and 0.20
In-Reply-To: <20170209174759.15819-1-joerg.krause@embedded.rocks>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
Message-ID: <20170209174759.15819-7-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MPD version 0.20 being affected by GCC PR libstdc++/64735 means no mpd
package available in Buildroot for the architectures NIOSII, ARMv4,
ARMv5 and SPARCv8 until GCC 7 is released.

As the next Buildroot release is in 2017.02 which is before GCC 7 is
expected to be released add a choise between version 0.19 and 0.20, so
that there is still an mpd package available for the affected
architectures.

Note, that we bumped the version from 0.19 to 0.20 within the current Buildroot
release cycle.

Note, that for the version 0.19 MPD requires libglib2.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/Config.in | 31 +++++++++++++++++++++++++------
 package/mpd/mpd.mk    |  9 +++++++++
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 8a28b4f1a..2f993737f 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -4,8 +4,6 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_USE_WCHAR # flac
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -20,6 +18,30 @@ menuconfig BR2_PACKAGE_MPD
 
 if BR2_PACKAGE_MPD
 
+choice
+	prompt "MPD version"
+
+config BR2_MPD_VERSION_0_20
+	bool "0.20"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+comment "version 0.20 needs toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+comment "version 0.20 needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+config BR2_MPD_VERSION_0_19
+	bool "0.19"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	select BR2_PACKAGE_LIBGLIB2
+
+comment "version 0.19 needs toolchain w/ gcc >= 4.6"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+
+endchoice
+
 comment "Archive plugins"
 
 config BR2_PACKAGE_MPD_BZIP2
@@ -319,7 +341,4 @@ comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
-comment "mpd needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 0efc8685f..ad5d2a678 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,8 +4,13 @@
 #
 ################################################################################
 
+ifeq ($(BR2_MPD_VERSION_0_20),y)
 MPD_VERSION_MAJOR = 0.20
 MPD_VERSION = $(MPD_VERSION_MAJOR).4
+else
+MPD_VERSION_MAJOR = 0.19
+MPD_VERSION = $(MPD_VERSION_MAJOR).21
+endif
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
@@ -13,6 +18,10 @@ MPD_LICENSE = GPLv2+
 MPD_LICENSE_FILES = COPYING
 MPD_AUTORECONF = YES
 
+ifeq ($(BR2_MPD_VERSION_0_19),y)
+MPD_DEPENDENCIES += libglib2
+endif
+
 # Some options need an explicit --disable or --enable
 
 # Zeroconf support depends on libdns_sd from avahi.
-- 
2.11.1
