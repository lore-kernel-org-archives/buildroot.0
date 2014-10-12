From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sun, 12 Oct 2014 21:10:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.19
Message-ID: <1413141057-21530-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to new major version 0.19 and add new dependencies:
  * boost
  * icu (support for Unicode is enabled by default)

Support for new features will be added by additional patches.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 13 ++++++++++++-
 package/mpd/mpd.mk    | 13 ++++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 8884464..c4a263a 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -1,12 +1,14 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
+	depends on BR2_LARGEFILE # boost
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2, flac
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, boost
 	depends on BR2_USE_MMU # libglib2
 	# avr32, sparc & CS powerpc gcc are too old
 	depends on !(BR2_avr32 || BR2_sparc)
 	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
+	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
@@ -92,6 +94,15 @@ config BR2_PACKAGE_MPD_FFMPEG
 comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
 
+config BR2_PACKAGE_MPD_ICU
+	bool "icu"
+	default y
+	depends on !BR2_BINFMT_FLAT
+	depends on BR2_ARCH_HAS_ATOMICS
+	select BR2_PACKAGE_ICU
+	help
+	  Enable libicu for Unicode support.
+
 config BR2_PACKAGE_MPD_LAME
 	bool "lame"
 	select BR2_PACKAGE_LAME
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 932df08..b98043d 100644
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
 
@@ -175,6 +175,13 @@ else
 MPD_CONF_OPTS += --disable-ffmpeg
 endif
 
+# icu is enabled by default
+ifeq ($(BR2_PACKAGE_MPD_ICU),y)
+MPD_DEPENDENCIES += icu
+else
+MPD_CONF_OPTS += --disable-icu
+endif
+
 define MPD_INSTALL_EXTRA_FILES
 	@if [ ! -f $(TARGET_DIR)/etc/mpd.conf ]; then \
 		$(INSTALL) -D package/mpd/mpd.conf \
-- 
2.1.2
