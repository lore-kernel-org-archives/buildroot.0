From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  4 Jul 2011 15:54:42 +0200
Subject: [Buildroot] [PATCH 3/6] gst-plugins-bad: clean up configuration
In-Reply-To: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
References: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1309787685-22269-4-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove obsoleted configurations and add some new ones. Still more
work needed here...

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/gst-plugins-bad/Config.in       |   64 ++++++-----
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |  115 +++++++++++---------
 2 files changed, 100 insertions(+), 79 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 23d5916..00aa4b0 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -12,14 +12,14 @@ if BR2_PACKAGE_GST_PLUGINS_BAD
 
 comment "dependency-less plugins"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AACPARSE
-	bool "aacparse"
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMDEC
+	bool "adpcmdec"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFFPARSE
-	bool "aiffparse"
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMENC
+	bool "adpcmenc"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AMRPARSE
-	bool "amrparse"
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFF
+	bool "aiff"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX
 	bool "asfmux"
@@ -28,12 +28,21 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
 	bool "apexsink"
 	select BR2_PACKAGE_OPENSSL
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOPARSERS
+	bool "audioparsers"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT
 	bool "autoconvert"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN
 	bool "camerabin"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLOREFFECTS
+	bool "coloreffects"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLORSPACE
+	bool "colorspace"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE
 	bool "legacyresample"
 
@@ -47,6 +56,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE
 	bool "cdxaparse"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DATAURISRC
+	bool "dataurisrc"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP
 	bool "dccp"
 
@@ -56,13 +68,8 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF
 	bool "dtmf"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDNAV
-	bool "dvdnav"
-	depends on BR2_LARGEFILE # libdvdread
-	select BR2_PACKAGE_LIBDVDNAV
-
-comment "dvdnav requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSUBOVERLAY
+	bool "dvdsuboverlay"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU
 	bool "dvdspu"
@@ -76,6 +83,15 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R
 	bool "frei0r"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS
+	bool "gaudieffects"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM
+	bool "geometrictransform"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GSETTINGS
+	bool "gsettings"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE
 	bool "h264parse"
 
@@ -124,9 +140,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL
 	bool "real"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMANAGER
-	bool "rtpmanager"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX
 	bool "rtpmux"
 
@@ -136,12 +149,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP
 	bool "sdp"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SELECTOR
-	bool "selector"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SHAPEWIPE
-	bool "shapewipe"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN
 	bool "siren"
 
@@ -157,8 +164,11 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA
 	bool "tta"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VALVE
-	bool "valve"
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMAXRATE
+	bool "videomaxrate"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMEASURE
+	bool "videomeasure"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL
 	bool "videosignal"
@@ -166,9 +176,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC
 	bool "vmnc"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_XDGMIME
-	bool "xdgmime"
-
 comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
@@ -185,9 +192,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON
 	bool "neon"
 	select BR2_PACKAGE_NEON
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OSS4
-	bool "oss4"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 5bbb53a..80fbe6e 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -12,22 +12,22 @@ GST_PLUGINS_BAD_CONF_OPT = \
 
 GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AACPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-aacparse
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMDEC),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-adpcmdec
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-aacparse
+GST_PLUGINS_BAD_CONF_OPT += --disable-adpcmdec
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFFPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-aiffparse
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMENC),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-adpcmenc
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-aiffparse
+GST_PLUGINS_BAD_CONF_OPT += --disable-adpcmenc
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AMRPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-amrparse
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFF),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-aiff
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-amrparse
+GST_PLUGINS_BAD_CONF_OPT += --disable-aiff
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX),y)
@@ -43,6 +43,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-apexsink
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOPARSERS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-audioparsers
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-audioparsers
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
 else
@@ -55,6 +61,18 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-coloreffects
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-coloreffects
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLORSPACE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-colorspace
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-colorspace
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-legacyresample
 else
@@ -80,6 +98,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-cdaudio
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DATAURISRC),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-dataurisrc
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-dataurisrc
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-dccp
 else
@@ -98,19 +122,18 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dtmf
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDNAV),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-dvdnav
-GST_PLUGINS_BAD_DEPENDENCIES += libdvdnav
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-dvdnav
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-dvdspu
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dvdspu
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSUBOVERLAY),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-dvdsuboverlay
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-dvdsuboverlay
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-festival
 else
@@ -129,6 +152,24 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-frei0r
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-gaudieffects
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-gaudieffects
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-geometrictransform
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-geometrictransform
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GSETTINGS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-gsettings
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-gsettings
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-h264parse
 else
@@ -225,12 +266,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-real
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMANAGER),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-rtpmanager
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-rtpmanager
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-rtpmux
 else
@@ -249,18 +284,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-sdp
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SELECTOR),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-selector
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-selector
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SHAPEWIPE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-shapewipe
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-shapewipe
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-siren
 else
@@ -291,10 +314,16 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-tta
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VALVE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-valve
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMAXRATE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-videomaxrate
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-videomaxrate
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMEASURE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-videomeasure
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-valve
+GST_PLUGINS_BAD_CONF_OPT += --disable-videomeasure
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
@@ -309,12 +338,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-vmnc
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_XDGMIME),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-xdgmime
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-xdgmime
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-directfb
 GST_PLUGINS_BAD_DEPENDENCIES += directfb
@@ -341,12 +364,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-neon
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OSS4),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-oss4
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-oss4
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL),y)
 GST_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 GST_PLUGINS_BAD_CONF_OPT += --enable-sdl
-- 
1.7.1
