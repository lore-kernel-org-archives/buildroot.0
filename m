From: Massimiliano Marretta <max@marretta.com>
Date: Wed, 25 Aug 2010 11:25:09 +0200
Subject: [Buildroot] [PATCH] GStreamer: add xorg support Signed-off-by:
	Massimiliano Marretta <max@marretta.com>
Message-ID: <1282728309-12422-1-git-send-email-max@marretta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 .../gst-plugins-base/gst-plugins-base.mk           |   16 +++++++++++++---
 .../gst-plugins-good/gst-plugins-good.mk           |   16 +++++++++++++---
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 91d9f1b..fcffe28 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -18,9 +18,6 @@ GST_PLUGINS_BASE_CONF_ENV =
 
 GST_PLUGINS_BASE_CONF_OPT = \
 		--disable-examples \
-		--disable-x \
-		--disable-xvideo \
-		--disable-xshm \
 		--disable-oggtest \
 		--disable-vorbistest \
 		--disable-freetypetest
@@ -28,6 +25,19 @@ GST_PLUGINS_BASE_CONF_OPT = \
 GST_PLUGINS_BASE_DEPENDENCIES = gstreamer liboil \
 		$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib)
 
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GST_PLUGINS_BASE_DEPENDENCIES += xserver_xorg-server
+GST_PLUGINS_BASE_CONF_OPT += \
+		--enable-x \
+		--enable-xvideo \
+		--enable-xshm
+else
+GST_PLUGINS_BASE_CONF_OPT += \
+		--disable-x \
+		--disable-xvideo \
+		--disable-xshm
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER),y)
 GST_PLUGINS_BASE_CONF_OPT += --enable-adder
 else
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index c44bdff..c11b865 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -16,9 +16,6 @@ GST_PLUGINS_GOOD_CONF_OPT = \
 		--disable-osx_audio \
 		--disable-osx_video \
 		--disable-gst_v4l2 \
-		--disable-x \
-		--disable-xshm \
-		--disable-xvideo \
 		--disable-aalib \
 		--disable-aalibtest \
 		--disable-esd \
@@ -28,6 +25,19 @@ GST_PLUGINS_GOOD_CONF_OPT = \
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GST_PLUGINS_BASE_DEPENDENCIES += xserver_xorg-server
+GST_PLUGINS_BASE_CONF_OPT += \
+		--enable-x \
+		--enable-xvideo \
+		--enable-xshm
+else
+GST_PLUGINS_BASE_CONF_OPT += \
+		--disable-x \
+		--disable-xvideo \
+		--disable-xshm
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
 GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
-- 
1.7.1
