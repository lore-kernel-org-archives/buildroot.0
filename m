From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Sep 2017 20:57:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <20170904185738.31182-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add optional dependencies to

- libva
  ffmpeg depends on libva, libva depends on xorg, so no need to add them
  to _DEPENDENCIES
- libtheora, libvorbis, libvpx, opus, x264, x265

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/Config.in      |  2 --
 package/tvheadend/tvheadend.hash |  2 +-
 package/tvheadend/tvheadend.mk   | 51 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index fc39d6f48..67a4b1419 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -12,8 +12,6 @@ config BR2_PACKAGE_TVHEADEND
 	select BR2_PACKAGE_DTV_SCAN_TABLES
 	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_LIBVPX if BR2_PACKAGE_FFMPEG && !BR2_bfin # libvpx
-	select BR2_PACKAGE_X264 if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	help
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 3154b3276..a69f8590c 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1994e379c798b118243e70f7fa38064a9b288d6e38b9ced0e8ad465f5d2e8fd9  tvheadend-54e63e3f9af8fdc0d23f61f3cda7fa7b246c1732.tar.gz
+sha256 5265960bb5569d5d978c434042824484b946945d6ca3b6f530f14f8b3ff2fc02  tvheadend-aa052acbe8cc3873bf9ed2c64dbc953124bcda16.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 6c0eb6375..e989c0d56 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 54e63e3f9af8fdc0d23f61f3cda7fa7b246c1732
+TVHEADEND_VERSION = aa052acbe8cc3873bf9ed2c64dbc953124bcda16
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -29,8 +29,13 @@ endif
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
 TVHEADEND_DEPENDENCIES += ffmpeg
 TVHEADEND_CONF_OPTS += --enable-libav
+ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_XORG7),yy)
+TVHEADEND_CONF_OPTS += --enable-vaapi
 else
-TVHEADEND_CONF_OPTS += --disable-libav
+TVHEADEND_CONF_OPTS += --disable-vaapi
+endif
+else
+TVHEADEND_CONF_OPTS += --disable-libav --disable-vaapi
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
@@ -57,6 +62,34 @@ TVHEADEND_DEPENDENCIES += liburiparser
 TVHEADEND_CFLAGS += $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)
 endif
 
+ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
+TVHEADEND_CONF_OPTS += --enable-libtheora
+TVHEADEND_DEPENDENCIES += libtheora
+else
+TVHEADEND_CONF_OPTS += --disable-libtheora
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+TVHEADEND_CONF_OPTS += --enable-libvorbis
+TVHEADEND_DEPENDENCIES += libvorbis
+else
+TVHEADEND_CONF_OPTS += --disable-libvorbis
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+TVHEADEND_CONF_OPTS += --enable-libvpx
+TVHEADEND_DEPENDENCIES += libvpx
+else
+TVHEADEND_CONF_OPTS += --disable-libvpx
+endif
+
+ifeq ($(BR2_PACKAGE_OPUS),y)
+TVHEADEND_DEPENDENCIES += opus
+TVHEADEND_CONF_OPTS += --enable-libopus
+else
+TVHEADEND_CONF_OPTS += --disable-libopus
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 TVHEADEND_DEPENDENCIES += pcre
 TVHEADEND_CONF_OPTS += --enable-pcre
@@ -64,6 +97,20 @@ else
 TVHEADEND_CONF_OPTS += --disable-pcre
 endif
 
+ifeq ($(BR2_PACKAGE_X264),y)
+TVHEADEND_CONF_OPTS += --enable-libx264
+TVHEADEND_DEPENDENCIES += x264
+else
+TVHEADEND_CONF_OPTS += --disable-libx264
+endif
+
+ifeq ($(BR2_PACKAGE_X265),y)
+TVHEADEND_CONF_OPTS += --enable-libx265
+TVHEADEND_DEPENDENCIES += x265
+else
+TVHEADEND_CONF_OPTS += --disable-libx265
+endif
+
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
 # The tvheadend build system expects the transponder data to be present inside
-- 
2.11.0
