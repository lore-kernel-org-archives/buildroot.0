From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 14:47:54 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: bump version
Message-ID: <20131004125504.F40E89B943@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c6408614bc1f6172a1b9de03349f31b7a9a9a13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

accurip, audiofxbad, ivtc, midi and yadif are new dependency less plugins,
dtmf, rtpmux/rtpvp8 and scaletempo got moved to -good, hls needs gnutls,
celt is gone and dash + webp are new.

At the same time fix the libmms comment dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      |   76 ++++++++++-------
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |   90 +++++++++++--------
 2 files changed, 97 insertions(+), 69 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0903aee..54e632a 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -12,6 +12,11 @@ if BR2_PACKAGE_GST1_PLUGINS_BAD
 
 comment "dependency-less plugins"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ACCURIP
+	bool "accurip"
+	help
+	  Accurip plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMDEC
 	bool "adpcmdec"
 	help
@@ -32,6 +37,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASFMUX
 	help
 	  ASF Muxer Plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD
+	bool "audiofxbad"
+	help
+	  Audio filters plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS
 	bool "audiovisualizers"
 	help
@@ -73,15 +83,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	help
 	  Collection of elements that may or may not be useful for debugging
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTMF
-	bool "dtmf"
-	help
-	  DTMF plugins
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
 	bool "dvdsuboverlay"
 	help
-	  DTMF plugins
+	  DVB subtitle renderer plugin
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVDSPU
 	bool "dvdspu"
@@ -129,9 +134,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GDP
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HDVPARSE
 	bool "hdvparse"
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
-	bool "hls"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ID3TAG
 	bool "id3tag"
 	help
@@ -150,6 +152,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_INTERLACE
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IVFPARSE
 	bool "ivfparse"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IVTC
+	bool "ivtc"
+	help
+	  Inverse Telecine plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR
 	bool "jp2kdecimator"
 
@@ -168,6 +175,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER
 	help
 	  Adds multiple live discontinuous streams
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MIDI
+	bool "midi"
+	help
+	  MIDI plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGDEMUX
 	bool "mpegdemux"
 	help
@@ -225,21 +237,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
 	help
 	  Removes silence from an audio stream
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTPMUX
-	bool "rtpmux"
-	help
-	  RTP Muxer plugins
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTPVP8
-	bool "rtpvp8"
-	help
-	  rtpvp8
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SCALETEMPO
-	bool "scaletempo"
-	help
-	  Scale audio tempo in sync with playback rate
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
 	bool "sdi"
 
@@ -303,6 +300,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M
 	help
 	  Demuxes/decodes YUV4MPEG streams
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF
+	bool "yadif"
+	help
+	  YADIF deinterlacing filter
+
 comment "plugins with external dependencies"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM
@@ -327,18 +329,18 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDAUDIO
 	bool "cdaudio"
 	select BR2_PACKAGE_LIBCDAUDIO
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CELT
-	bool "celt"
-	select BR2_PACKAGE_CELT051
-	help
-	  CELT plugin library
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL
 	bool "curl"
 	select BR2_PACKAGE_LIBCURL
 	help
 	  libcurl-based elements
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DASH
+	bool "dash"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  DASH demuxer plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK
 	depends on BR2_INSTALL_LIBSTDCPP
 	bool "decklink"
@@ -361,6 +363,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	help
 	  Wayland Video Sink
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
+	bool "webp"
+	select BR2_PACKAGE_WEBP
+	help
+	  Webp image format plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FAAD
 	bool "faad"
 	select BR2_PACKAGE_FAAD2
@@ -381,7 +389,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
 	  Microsoft Multi Media Server streaming protocol support
 
 comment "libmms requires a toolchain with WCHAR and threading support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREAD
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
 	bool "mpeg2enc"
@@ -457,4 +465,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 	help
 	  DVB elements
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
+	bool "hls"
+	select BR2_PACKAGE_GNUTLS
+	help
+	  Fragmented streaming plugins
+
 endif
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 385522e..fdc17eb 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.0.10
+GST1_PLUGINS_BAD_VERSION = 1.2.0
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
@@ -90,6 +90,12 @@ GST1_PLUGINS_BAD_DEPENDENCIES += orc
 GST1_PLUGINS_BAD_CONF_OPT += --enable-orc
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ACCURIP),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-accurip
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-accurip
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMDEC),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-adpcmdec
 else
@@ -114,6 +120,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-asfmux
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-audiofxbad
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-audiofxbad
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-audiovisualizers
 GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
@@ -169,12 +181,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-debugutils
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTMF),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-dtmf
-else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-dtmf
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-dvbsuboverlay
 else
@@ -241,12 +247,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-hdvparse
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-hls
-else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-hls
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ID3TAG),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-id3tag
 else
@@ -271,6 +271,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-ivfparse
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IVTC),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-ivtc
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-ivtc
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-jp2kdecimator
 else
@@ -295,6 +301,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-liveadder
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MIDI),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-midi
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-midi
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGDEMUX),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-mpegdemux
 else
@@ -375,24 +387,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-removesilence
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTPMUX),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-rtpmux
-else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-rtpmux
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTPVP8),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-rtpvp8
-else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-rtpvp8
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SCALETEMPO),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-scaletempo
-else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-scaletempo
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-sdi
 else
@@ -483,6 +477,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-y4m
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-yadif
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-yadif
+endif
+
 # Plugins with dependencies
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM),y)
@@ -518,13 +518,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-cdaudio
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CELT),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-celt
-GST1_PLUGINS_BAD_DEPENDENCIES += celt051
-else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-celt
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-curl
 GST1_PLUGINS_BAD_DEPENDENCIES += libcurl
@@ -532,12 +525,26 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-curl
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DASH),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-dash
+GST1_PLUGINS_BAD_DEPENDENCIES += libxml2
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-dash
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-decklink
 else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-decklink
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-webp
+GST1_PLUGINS_BAD_DEPENDENCIES += webp
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-webp
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-directfb
 GST1_PLUGINS_BAD_DEPENDENCIES += directfb
@@ -662,6 +669,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-dvb
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-hls
+GST1_PLUGINS_BAD_DEPENDENCIES += gnutls
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-hls
+endif
+
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
 GST1_PLUGINS_BAD_LICENSE += GPL
