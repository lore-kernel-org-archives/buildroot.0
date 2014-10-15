From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 12:39:17 +0200
Subject: [Buildroot] [PATCH 1/8] package/mpd: bump to version 0.19
Message-ID: <1413369564-22124-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Bump to version 0.19
* Add boost as dependency
* Add support for libicu

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in |  3 ++-
 package/mpd/mpd.mk    | 14 +++++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 8884464..cd7bbfd 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE # boost
 	depends on BR2_USE_WCHAR # libglib2, flac
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
@@ -211,4 +212,4 @@ comment "mpd needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on !(BR2_avr32 || BR2_sparc)
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 932df08..1542338 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = 0.18
-MPD_VERSION = $(MPD_VERSION_MAJOR).16
+MPD_VERSION_MAJOR = 0.19
+MPD_VERSION = $(MPD_VERSION_MAJOR)
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
-MPD_DEPENDENCIES = host-pkgconf libglib2
+MPD_DEPENDENCIES = host-pkgconf boost libglib2
 MPD_LICENSE = GPLv2+
 MPD_LICENSE_FILES = COPYING
 
@@ -19,6 +19,14 @@ else
 MPD_CONF_OPTS += --with-zeroconf=no
 endif
 
+# MPD prefers libicu for utf8 collation instead of libglib2.
+ifeq ($(BR2_PACKAGE_ICU),y)
+MPD_DEPENDENCIES += icu
+MPD_CONF_OPTS += --enable-icu
+else
+MPD_CONF_OPTS += --disable-icu
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_ALSA),y)
 MPD_DEPENDENCIES += alsa-lib
 MPD_CONF_OPTS += --enable-alsa
-- 
2.1.2
