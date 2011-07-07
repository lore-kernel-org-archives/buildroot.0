From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Jul 2011 10:57:01 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: clean up configuration
Message-ID: <20110707090856.2A6F28A3A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=82a56c1bff4b102c4a845e284353eace654cdb5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove obsoleted configurations and add options for new
dependency-less plugins.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in       |   87 +++++++----
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |  161 +++++++++++++++-----
 2 files changed, 180 insertions(+), 68 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 23d5916..5ccaa16 100644
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
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
+	bool "dvdsuboverlay"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU
 	bool "dvdspu"
@@ -76,12 +83,36 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
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
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HDVPARSE
 	bool "hdvparse"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE
+	bool "interlace"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INVTELECINE
+	bool "invtelecine"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_IVFPARSE
+	bool "ivfparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR
+	bool "jp2kdecimator"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JPEGFORMAT
+	bool "jpegformat"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB
 	bool "librfb"
 
@@ -91,6 +122,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIVEADDER
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGDEMUX
 	bool "mpegdemux"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGPSMUX
+	bool "mpegpsmux"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX
 	bool "mpegtsmux"
 
@@ -115,6 +149,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NUVDEMUX
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE
 	bool "pcapparse"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PNM
+	bool "pnm"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_QTMUX
 	bool "qtmux"
 
@@ -124,9 +161,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL
 	bool "real"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMANAGER
-	bool "rtpmanager"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX
 	bool "rtpmux"
 
@@ -136,11 +170,8 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP
 	bool "sdp"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SELECTOR
-	bool "selector"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SHAPEWIPE
-	bool "shapewipe"
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SEGMENTCLIP
+	bool "segmentclip"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN
 	bool "siren"
@@ -157,8 +188,11 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO
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
@@ -166,8 +200,8 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC
 	bool "vmnc"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_XDGMIME
-	bool "xdgmime"
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_Y4M
+	bool "y4m"
 
 comment "plugins with external dependencies (there may be more available)"
 
@@ -185,9 +219,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON
 	bool "neon"
 	select BR2_PACKAGE_NEON
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OSS4
-	bool "oss4"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 5bbb53a..5012be2 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -12,22 +12,26 @@ GST_PLUGINS_BAD_CONF_OPT = \
 
 GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AACPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-aacparse
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST_PLUGINS_BAD_DEPENDENCIES += orc
+endif
+
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
@@ -43,6 +47,12 @@ else
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
@@ -55,6 +65,18 @@ else
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
@@ -80,6 +102,12 @@ else
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
@@ -98,11 +126,10 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dtmf
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDNAV),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-dvdnav
-GST_PLUGINS_BAD_DEPENDENCIES += libdvdnav
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-dvbsuboverlay
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-dvdnav
+GST_PLUGINS_BAD_CONF_OPT += --disable-dvbsuboverlay
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU),y)
@@ -129,6 +156,24 @@ else
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
@@ -141,6 +186,42 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-hdvparse
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-interlace
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-interlace
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INVTELECINE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-invtelecine
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-invtelecine
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INVTELECINE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-invtelecine
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-invtelecine
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_IVFPARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-ivfparse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-ivfparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-jp2kdecimator
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-jp2kdecimator
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JPEGFORMAT),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-jpegformat
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-jpegformat
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-librfb
 else
@@ -159,6 +240,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-mpegdemux
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGPSMUX),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-mpegpsmux
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-mpegpsmux
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-mpegtsmux
 else
@@ -207,6 +294,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-pcapparse
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PNM),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-pnm
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-pnm
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_QTMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-qtmux
 else
@@ -225,12 +318,6 @@ else
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
@@ -249,16 +336,10 @@ else
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
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SEGMENTCLIP),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-segmentclip
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-shapewipe
+GST_PLUGINS_BAD_CONF_OPT += --disable-segmentclip
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN),y)
@@ -291,10 +372,16 @@ else
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
@@ -309,10 +396,10 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-vmnc
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_XDGMIME),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-xdgmime
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_Y4M),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-y4m
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-xdgmime
+GST_PLUGINS_BAD_CONF_OPT += --disable-y4m
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
@@ -341,12 +428,6 @@ else
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
1.7.3.4
