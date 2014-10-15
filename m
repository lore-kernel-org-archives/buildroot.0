From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 15:18:47 +0200
Subject: [Buildroot] [PATCH v2 1/8] package/mpd: bump to version 0.19
Message-ID: <1413379134-28918-1-git-send-email-jkrause@posteo.de>
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
Changes v1 -> v2:
  - fix missing dependency of boost
---
 package/mpd/Config.in |  4 +++-
 package/mpd/mpd.mk    | 14 +++++++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 8884464..f2dbbb0 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -1,12 +1,14 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE # boost
 	depends on BR2_USE_WCHAR # libglib2, flac
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	# avr32, sparc & CS powerpc gcc are too old
 	depends on !(BR2_avr32 || BR2_sparc)
 	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
+	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
@@ -211,4 +213,4 @@ comment "mpd needs a toolchain w/ C++, threads, wchar"
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
