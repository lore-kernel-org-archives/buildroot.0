From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 May 2017 11:18:01 +0100
Subject: [Buildroot] [PATCH v2 next 05/11] gst1-plugins-bad: bump version to
	1.12.0
In-Reply-To: <20170512101807.42378-1-Vincent.Riera@imgtec.com>
References: <20170512101807.42378-1-Vincent.Riera@imgtec.com>
Message-ID: <20170512101807.42378-5-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove non-existant configure options:

  --disable-mimic:
    https://github.com/GStreamer/gst-plugins-bad/commit/ad661999ad2c79a5d7721f0eb1e7f1f83a304224

  --enable-dataurisrc:
    https://github.com/GStreamer/gst-plugins-bad/commit/de4bb6e1d4793637fd72d7316d06ebba4148583e

  --enable-videomeasure:
    https://github.com/GStreamer/gst-plugins-bad/commit/ca3020cf46d49d8e3fd54ec323b3a17cd389d780

  --enable-apexsink, --disable-nas, --disable-linsys, --enable-sdl,
  --disable-sdltest, --disable-libvisual, --disable-timidity,
  --disable-sndio, --disable-wininet, --disable-xvid,
  --enable-cdxaparse, --enable-dccp, --enable-hdvparse, --enable-mve,
  --enable-nuvdemux, --enable-patchdetect, --enable-sdi, --enable-tta,
  --disable-pvr:
    https://github.com/GStreamer/gst-plugins-bad/commit/9b5de053995488d5ddc78c1bf4df651101271d70

Fix wrong configure options:

  --disable-webrtc doesn't exist. The right option is called
  --disable-webrtcdsp, and the gstreamer plugin is also called
  webrtcdsp, so make the appropriate changes to Config.in and
  gst1-plugins-bad.mk.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
- Add legacy entries for the removed options.
---
 Config.in.legacy                                   | 60 ++++++++++++++
 package/gstreamer1/gst1-plugins-bad/Config.in      | 46 +----------
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 93 +---------------------
 4 files changed, 69 insertions(+), 134 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0bacac2..de02d4c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,66 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2017.08"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDXAPARSE
+	bool "cdxaparse removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DATAURISRC
+	bool "dataurisrc removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DCCP
+	bool "dccp removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HDVPARSE
+	bool "hdvparse removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MVE
+	bool "mve removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX
+	bool "nuvdemux removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PATCHDETECT
+	bool "patchdetect removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
+	bool "sdi removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA
+	bool "tta removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE
+	bool "videomeasure removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK
+	bool "apexsink removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL
+	bool "sdl removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
+	bool "webrtc removed"
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
+	select BR2_LEGACY
+	help
+	  webrtc wasn't the right option, it was webrtcdsp. Due to that
+	  it has been replaced by webrtcdsp, which has automatically
+	  been enabled.
+
+###############################################################################
 comment "Legacy options removed in 2017.05"
 
 config BR2_PACKAGE_SUNXI_MALI_R2P4
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 17cc22b..d137a6c 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -199,22 +199,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CAMERABIN2
 	help
 	  Take image snapshots and record movies from camera
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDXAPARSE
-	bool "cdxaparse"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COLOREFFECTS
 	bool "coloreffects"
 	help
 	  Color Look-up Table filters
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DATAURISRC
-	bool "dataurisrc"
-	help
-	  data: URI source
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DCCP
-	bool "dccp"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	bool "debugutils"
 	help
@@ -274,9 +263,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GDP
 	help
 	  Payload/depayload GDP packets
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HDVPARSE
-	bool "hdvparse"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ID3TAG
 	bool "id3tag"
 	help
@@ -338,9 +324,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGPSMUX
 	help
 	  MPEG-PS muxer
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MVE
-	bool "mve"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MXF
 	bool "mxf"
 	help
@@ -349,15 +332,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MXF
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NETSIM
 	bool "netsim"
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX
-	bool "nuvdemux"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ONVIF
 	bool "onvif"
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PATCHDETECT
-	bool "patchdetect"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PCAPPARSE
 	bool "pcapparse"
 	help
@@ -384,9 +361,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP
 	help
 	  RTMP plugin
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
-	bool "sdi"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDP
 	bool "sdp"
 	help
@@ -423,9 +397,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE
 	bool "timecode"
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA
-	bool "tta"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFILTERS
 	bool "videofilters"
 	help
@@ -436,9 +407,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFRAME_AUDIOLEVEL
 	help
 	  videoframe_audiolevel
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE
-	bool "videomeasure"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS
 	bool "videoparsers"
 	help
@@ -462,10 +430,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF
 
 comment "plugins with external dependencies"
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK
-	bool "apexsink"
-	select BR2_PACKAGE_OPENSSL
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 	bool "assrender"
 	select BR2_PACKAGE_LIBASS
@@ -660,10 +624,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SBC
 	bool "sbc"
 	select BR2_PACKAGE_SBC
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL
-	bool "sdl"
-	select BR2_PACKAGE_SDL
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM
 	bool "shm"
 	help
@@ -698,8 +658,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
 	help
 	  Webp image format plugin
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
-	bool "webrtc"
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
+	bool "webrtcdsp"
 	# All depends from webrtc-audio-processing
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -710,7 +670,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
 	help
 	  WebRTC echo-cancellation, gain control and noise suppression
 
-comment "webrtc needs a toolchain w/ C++, NPTL, gcc >= 4.8"
+comment "webrtcdsp needs a toolchain w/ C++, NPTL, gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 441afa2..68781dd 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.10.4.tar.xz.sha256sum
-sha256 23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966  gst-plugins-bad-1.10.4.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.0.tar.xz.sha256sum
+sha256 11b73cfff1b315a8e9be1756435ea84937e7cb90afbab0e8e6975367dbfb8534  gst-plugins-bad-1.12.0.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ffc9ab4..9dbde14 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.10.4
+GST1_PLUGINS_BAD_VERSION = 1.12.0
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
@@ -21,8 +21,6 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-winks \
 	--disable-android_media \
 	--disable-apple_media \
-	--disable-sdltest \
-	--disable-wininet \
 	--disable-acm
 
 # Options which require currently unpackaged libraries
@@ -44,29 +42,21 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-ladspa \
 	--disable-lv2 \
 	--disable-libde265 \
-	--disable-linsys \
 	--disable-modplug \
-	--disable-mimic \
 	--disable-mplex \
-	--disable-nas \
 	--disable-ofa \
 	--disable-openexr \
 	--disable-openni2 \
-	--disable-pvr \
-	--disable-libvisual \
-	--disable-timidity \
 	--disable-teletextdec \
 	--disable-wildmidi \
 	--disable-smoothstreaming \
 	--disable-soundtouch \
 	--disable-spc \
 	--disable-gme \
-	--disable-xvid \
 	--disable-vdpau \
 	--disable-schro \
 	--disable-zbar \
 	--disable-spandsp \
-	--disable-sndio \
 	--disable-gtk3 \
 	--disable-qt
 
@@ -218,30 +208,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-camerabin2
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDXAPARSE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-cdxaparse
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-cdxaparse
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-coloreffects
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-coloreffects
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DATAURISRC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dataurisrc
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dataurisrc
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DCCP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dccp
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dccp
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-debugutils
 else
@@ -315,12 +287,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-gdp
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HDVPARSE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-hdvparse
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-hdvparse
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ID3TAG),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-id3tag
 else
@@ -401,12 +367,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpegpsmux
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MVE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-mve
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-mve
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MXF),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-mxf
 else
@@ -419,24 +379,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-netsim
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-nuvdemux
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-nuvdemux
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ONVIF),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-onvif
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-onvif
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PATCHDETECT),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-patchdetect
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-patchdetect
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-pcapparse
 else
@@ -468,12 +416,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtmp
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdi
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-sdi
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDP),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdp
 else
@@ -522,12 +464,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-timecode
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-tta
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-tta
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFILTERS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-videofilters
 else
@@ -540,12 +476,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-videoframe_audiolevel
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-videomeasure
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-videomeasure
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-videoparsers
 else
@@ -578,13 +508,6 @@ endif
 
 # Plugins with dependencies
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-apexsink
-GST1_PLUGINS_BAD_DEPENDENCIES += openssl
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-apexsink
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-assrender
 GST1_PLUGINS_BAD_DEPENDENCIES += libass
@@ -765,14 +688,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-sbc
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL),y)
-GST1_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdl
-GST1_PLUGINS_BAD_DEPENDENCIES += sdl
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-sdl
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-shm
 else
@@ -813,11 +728,11 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-webp
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtcdsp
 GST1_PLUGINS_BAD_DEPENDENCIES += webrtc-audio-processing
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtcdsp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
-- 
2.10.2
