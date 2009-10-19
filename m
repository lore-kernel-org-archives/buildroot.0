From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 19 Oct 2009 23:46:22 +0200
Subject: [Buildroot] [PATCH 2/2] gst-plugins-good: make new dependency-less
	plugins configurable
Message-ID: <1255988782-4840-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst-plugins-good gained a number of dependency-less plugins with
the last update. This commit makes them configurable in buildroot.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/gst-plugins-good/Config.in      |   16 ++++++++-
 .../gst-plugins-good/gst-plugins-good.mk           |   32 +++++++++++++++++--
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index b96f15d..fdb6646 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -61,8 +61,11 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AVI
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CUTTER
 	bool "cutter"
 
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUG
-	bool "debug"
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUGUTILS
+	bool "debugutils"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEINTERLACE
+	bool "deinterlace"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EFFECTV
 	bool "effectv"
@@ -70,6 +73,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EFFECTV
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EQUALIZER
 	bool "equalizer"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLV
+	bool "flv"
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX
 	bool "id3demux (*.mp3 audio)"
 
@@ -115,6 +121,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_REPLAYGAIN
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTP
 	bool "rtp"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTPMANAGER
+	bool "rtpmanager"
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTSP
 	bool "rtsp"
 
@@ -143,6 +152,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE
 	bool "wavparse (*.wav audio)"
 	default y
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_Y4M
+	bool "y4m"
+
 comment "plugins with external dependencies"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 4f4861b..5dcf64a 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -10,8 +10,8 @@ GST_PLUGINS_GOOD_LIBTOOL_PATCH = NO
 
 GST_PLUGINS_GOOD_CONF_OPT = \
 		$(DISABLE_NLS) \
+		--disable-debug \
 		--disable-examples \
-		--disable-directdraw \
 		--disable-directsound \
 		--disable-sunaudio \
 		--disable-osx_audio \
@@ -105,10 +105,16 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-cutter
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUG),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-debug
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUGUTILS),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-debugutils
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-debug
+GST_PLUGINS_GOOD_CONF_OPT += --disable-debugutils
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEINTERLACE),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-deinterlace
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-deinterlace
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EFFECTV),y)
@@ -123,6 +129,12 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-equalizer
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLV),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-flv
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-flv
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-id3demux
 else
@@ -213,6 +225,12 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-rtp
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTPMANAGER),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-rtpmanager
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-rtpmanager
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTSP),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-rtsp
 else
@@ -267,6 +285,12 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-wavparse
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_Y4m),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-y4m
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-y4m
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-annodex
 GST_PLUGINS_GOOD_DEPENDENCIES += libxml2
-- 
1.6.5
