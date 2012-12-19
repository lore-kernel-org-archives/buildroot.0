From: bogdan at nimblex.org <bogdan@nimblex.org>
Date: Wed, 19 Dec 2012 16:58:43 +0000
Subject: [Buildroot] [PATCH 3/4] gstreamer: adjust set of plug-ins for
	gstreamer-1.0
In-Reply-To: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
References: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
Message-ID: <1355936324-9585-3-git-send-email-bogdan@nimblex.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bogdan Radulescu <bogdan@nimblex.net>

Added wavpack to gst-plugins-good and opus to gst-plugins-bad
Added videoconvert to gst-plugins-base and gdkpixbuf to gst-plugins-good.
Deleted plugins which will not be ported to gstreamer-1.0.
Added FAAD

Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
---
 package/multimedia/gst-plugins-bad/Config.in       | 22 +++---
 ...d-opus-jpegformat-unbreak-non-debug-build.patch | 78 ----------------------
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  | 30 +++++----
 package/multimedia/gst-plugins-base/Config.in      | 10 +--
 .../gst-plugins-base/gst-plugins-base.mk           | 18 ++---
 package/multimedia/gst-plugins-good/Config.in      |  8 +++
 .../gst-plugins-good/gst-plugins-good.mk           | 14 ++++
 7 files changed, 59 insertions(+), 121 deletions(-)
 delete mode 100644 package/multimedia/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index d87aec4..ed43533 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -33,9 +33,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER
 	bool "bayer"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN
-	bool "camerabin"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN2
 	bool "camerabin2"
 
@@ -82,9 +79,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FIELDANALYSIS
 	bool "fieldanalysis"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
-	bool "freeze"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEVERB
 	bool "freeverb"
 
@@ -208,12 +202,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SMOOTH
 	bool "smooth"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED
-	bool "speed"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC
 	bool "subenc"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED
+	bool "speed"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO
 	bool "stereo"
 
@@ -241,7 +235,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_Y4M
 	bool "y4m"
 
-comment "plugins with external dependencies (there may be more available)"
+comment "plugins with external dependencies (not all from gstreamer are here)"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
 	bool "apexsink"
@@ -267,6 +261,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD
+	bool "faad"
+	select BR2_PACKAGE_FAAD2
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV
 	bool "fbdev"
 
@@ -274,6 +272,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS
 	bool "libmms"
 	select BR2_PACKAGE_LIBMMS
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPG123
+	bool "mpg123"
+	select BR2_PACKAGE_MMPG123
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MUSEPACK
 	bool "musepack"
 	select BR2_PACKAGE_MUSEPACK
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch b/package/multimedia/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch
deleted file mode 100644
index 2c98c3e..0000000
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 1725e702a3622cb45c8142622dd419fa0c410ac9 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Wed, 12 Sep 2012 09:10:35 +0200
-Subject: [PATCH] gst-plugins-bad: opus + jpegformat: unbreak non-debug build
-
-opus + jpegformat plugin builds fail when gstreamer is configured with
---disable-gst-debug as they are checking the GST_DISABLE_DEBUG symbol
-instead of GST_DISABLE_GST_DEBUG.
-
-Submitted upstream as https://bugzilla.gnome.org/show_bug.cgi?id=683850
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- ext/opus/gstopusdec.c         |    2 +-
- ext/opus/gstopusenc.c         |    4 ++--
- gst/jpegformat/gstjpegparse.c |    4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/ext/opus/gstopusdec.c b/ext/opus/gstopusdec.c
-index 0e2805c..ab7221d 100644
---- a/ext/opus/gstopusdec.c
-+++ b/ext/opus/gstopusdec.c
-@@ -357,7 +357,7 @@ opus_dec_chain_parse_data (GstOpusDec * dec, GstBuffer * buffer)
- 
-     GST_DEBUG_OBJECT (dec, "Creating decoder with %d channels, %d Hz",
-         dec->n_channels, dec->sample_rate);
--#ifndef GST_DISABLE_DEBUG
-+#ifndef GST_DISABLE_GST_DEBUG
-     gst_opus_common_log_channel_mapping_table (GST_ELEMENT (dec), opusdec_debug,
-         "Mapping table", dec->n_channels, dec->channel_mapping);
- #endif
-diff --git a/ext/opus/gstopusenc.c b/ext/opus/gstopusenc.c
-index 240a2cb..d991795 100644
---- a/ext/opus/gstopusenc.c
-+++ b/ext/opus/gstopusenc.c
-@@ -589,7 +589,7 @@ gst_opus_enc_setup_channel_mappings (GstOpusEnc * enc,
-       }
-     }
- 
--#ifndef GST_DISABLE_DEBUG
-+#ifndef GST_DISABLE_GST_DEBUG
-     GST_INFO_OBJECT (enc,
-         "Mapping tables built: %d channels, %d stereo streams", enc->n_channels,
-         enc->n_stereo_streams);
-@@ -654,7 +654,7 @@ gst_opus_enc_setup (GstOpusEnc * enc)
- {
-   int error = OPUS_OK;
- 
--#ifndef GST_DISABLE_DEBUG
-+#ifndef GST_DISABLE_GST_DEBUG
-   GST_DEBUG_OBJECT (enc,
-       "setup: %d Hz, %d channels, %d stereo streams, family %d",
-       enc->sample_rate, enc->n_channels, enc->n_stereo_streams,
-diff --git a/gst/jpegformat/gstjpegparse.c b/gst/jpegformat/gstjpegparse.c
-index f984a52..b4af9ed 100644
---- a/gst/jpegformat/gstjpegparse.c
-+++ b/gst/jpegformat/gstjpegparse.c
-@@ -545,7 +545,7 @@ gst_jpeg_parse_skip_marker (GstJpegParse * parse,
-   if (!gst_byte_reader_get_uint16_be (reader, &size))
-     return FALSE;
- 
--#ifndef GST_DISABLE_DEBUG
-+#ifndef GST_DISABLE_GST_DEBUG
-   /* We'd pry the id of the skipped application segment */
-   if (marker >= APP0 && marker <= APP15) {
-     const gchar *id_str = NULL;
-@@ -561,7 +561,7 @@ gst_jpeg_parse_skip_marker (GstJpegParse * parse,
- #else
-   GST_DEBUG_OBJECT (parse, "unhandled marker %x skiping %u bytes", marker,
-       size);
--#endif // GST_DISABLE_DEBUG
-+#endif // GST_DISABLE_GST_DEBUG
- 
-   if (!gst_byte_reader_skip (reader, size - 2))
-     return FALSE;
--- 
-1.7.10
-
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 714c987..6cfce08 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -3,8 +3,8 @@
 # gst-plugins-bad
 #
 #############################################################
-GST_PLUGINS_BAD_VERSION = 0.10.23
-GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
+GST_PLUGINS_BAD_VERSION = 1.0.3
+GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 
 GST_PLUGINS_BAD_CONF_OPT = \
@@ -58,12 +58,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-bayer
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-camerabin
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN2),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-camerabin2
 else
@@ -148,12 +142,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-fieldanalysis
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-freeze
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-freeze
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEVERB),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-freeverb
 else
@@ -508,6 +496,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dvb
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-faad
+GST_PLUGINS_BAD_DEPENDENCIES += faad2
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-faad
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-fbdev
 else
@@ -521,6 +516,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-libmms
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPG123),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-mpg123
+GST_PLUGINS_BAD_DEPENDENCIES += mpg123
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-mpg123
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MUSEPACK),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-musepack
 GST_PLUGINS_BAD_DEPENDENCIES += musepack
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 5d82533..4abfec6 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -36,13 +36,6 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ENCODING
 	bool "encoding"
 
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE
-	bool "ffmpegcolorspace (mandatory for video playback)"
-	default y
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_GDP
-	bool "gdp"
-
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK
 	bool "playback (mandatory)"
 	default y
@@ -57,6 +50,9 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TYPEFIND
 	bool "typefind (mandatory)"
 	default y
 
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
+	bool "videoconvert"
+
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC
 	bool "videotestsrc"
 
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index f4aab00..0203c5f 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -89,18 +89,6 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-encoding
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-ffmpegcolorspace
-else
-GST_PLUGINS_BASE_CONF_OPT += --disable-ffmpegcolorspace
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_GDP),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-gdp
-else
-GST_PLUGINS_BASE_CONF_OPT += --disable-gdp
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK),y)
 GST_PLUGINS_BASE_CONF_OPT += --enable-playback
 else
@@ -125,6 +113,12 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-typefind
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOCONVERT),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-videoconvert
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-videoconvert
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC),y)
 GST_PLUGINS_BASE_CONF_OPT += --enable-videotestsrc
 else
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 33ecb5c..92a56c8 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -79,6 +79,10 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLV
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX
 	bool "flx"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
+       bool "gdkpixbuf"
+       select BR2_PACKAGE_GDK_PIXBUF
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM
 	bool "goom"
 
@@ -204,4 +208,8 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX
 	bool "speex"
 	select BR2_PACKAGE_SPEEX
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPACK
+	bool "wavpack (*.wv audio)"
+	select BR2_PACKAGE_WAVPACK
+
 endif
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 1eefd45..a184055 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -147,6 +147,13 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-flx
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-gdk_pixbuf
+GST_PLUGINS_GOOD_DEPENDENCIES += gdk-pixbuf
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-gdk_pixbuf
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-goom
 else
@@ -303,6 +310,13 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-wavenc
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPACK),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-wavpack
+GST_PLUGINS_GOOD_DEPENDENCIES += wavpack
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-wavpack
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-wavparse
 else
-- 
1.7.12.1
