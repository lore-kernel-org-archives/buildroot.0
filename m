From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  9 May 2013 23:02:33 -0500
Subject: [Buildroot] [PATCH v3 2/7] gst1-plugins-base: add gstreamer1 base
	plugins
In-Reply-To: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
References: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368158558-6069-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds gstreamer 1.X base plugins.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst1-plugins-base/Config.in     |  106 +++++++++++
 .../gst1-plugins-base/gst1-plugins-base.mk         |  201 ++++++++++++++++++++
 3 files changed, 308 insertions(+)
 create mode 100644 package/multimedia/gst1-plugins-base/Config.in
 create mode 100644 package/multimedia/gst1-plugins-base/gst1-plugins-base.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index f6a5fd7..e851187 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -12,6 +12,7 @@ source "package/multimedia/gst-dsp/Config.in"
 source "package/multimedia/gst-fsl-plugins/Config.in"
 source "package/multimedia/gst-omapfb/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
+source "package/multimedia/gst1-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
diff --git a/package/multimedia/gst1-plugins-base/Config.in b/package/multimedia/gst1-plugins-base/Config.in
new file mode 100644
index 0000000..2a95846
--- /dev/null
+++ b/package/multimedia/gst1-plugins-base/Config.in
@@ -0,0 +1,106 @@
+menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
+	bool "gst1-plugins-base"
+	depends on BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXV if BR2_PACKAGE_XORG7
+	help
+	  A basic set of well-supported plug-ins for GStreamer.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST1_PLUGINS_BASE
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER
+	bool "adder"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	bool "app"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
+	bool "audioconvert (mandatory for audio playback)"
+	default y
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE
+	bool "audiorate"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
+	bool "audioresample (mandatory for audio playback)"
+	default y
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC
+	bool "audiotestsrc"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING
+	bool "encoding"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO
+	bool "gio"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
+	bool "playback"
+	default y
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE
+	bool "subparse"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TCP
+	bool "tcp"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND
+	bool "typefind"
+	default y
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
+	bool "videoconvert"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC
+	bool "videotestsrc"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE
+	bool "videorate"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	bool "videoscale (mandatory for video playback)"
+	default y
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
+	bool "volume (mandatory for audio playback)"
+	default y
+
+comment "plugins with external dependencies (there may be more available)"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
+	bool "alsa (mandatory for audio playback)"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER
+	select BR2_PACKAGE_ALSA_LIB_PCM
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG
+	bool "ogg (*.ogg audio/video)"
+	select BR2_PACKAGE_LIBOGG
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
+	bool "pango font renderer"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PANGO
+
+comment "pango plugin requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
+	bool "theora (*.ogg video)"
+	select BR2_PACKAGE_LIBTHEORA
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR
+	bool "tremor"
+	select BR2_PACKAGE_TREMOR
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS
+	bool "vorbis (*.ogg audio)"
+	select BR2_PACKAGE_LIBVORBIS
+
+endif
+
diff --git a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
new file mode 100644
index 0000000..22676d6
--- /dev/null
+++ b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
@@ -0,0 +1,201 @@
+#############################################################
+#
+# gst1-plugins-base
+#
+#############################################################
+GST1_PLUGINS_BASE_VERSION = 1.0.7
+GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
+GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
+GST1_PLUGINS_BASE_INSTALL_STAGING = YES
+
+# freetype is only used by examples, but if it is not found
+# and the host has a freetype-config script, then the host
+# include dirs are added to the search path causing trouble
+GST1_PLUGINS_BASE_CONF_ENV =
+		FT2_CONFIG=/bin/false \
+		ac_cv_header_stdint_t="stdint.h"
+
+GST1_PLUGINS_BASE_CONF_OPT = \
+		--disable-examples \
+		--disable-oggtest \
+		--disable-vorbistest \
+		--disable-freetypetest \
+		--disable-valgrind \
+		--disable-debug
+
+# Options which require currently unpackaged libraries
+GST1_PLUGINS_BASE_CONF_OPT += \
+		--disable-cdparanoia \
+		--disable-libvisual \
+		--disable-iso-codes
+
+GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GST1_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
+GST1_PLUGINS_BASE_CONF_OPT += \
+	--enable-x \
+	--enable-xshm \
+	--enable-xvideo
+else
+GST1_PLUGINS_BASE_CONF_OPT += \
+	--disable-x \
+	--disable-xshm \
+	--disable-xvideo
+endif
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST1_PLUGINS_BASE_DEPENDENCIES += orc
+GST1_PLUGINS_BASE_CONF_OPT += --enable-orc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA),y)
+GST1_PLUGINS_BASE_DEPENDENCIES += alsa-lib
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-adder
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-adder
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-app
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-app
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-audioconvert
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-audioconvert
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-audiorate
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-audiorate
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-audioresample
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-audioresample
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-audiotestsrc
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-audiotestsrc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-encoding
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-encoding
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-videoconvert
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-videoconvert
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-gio
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-gio
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-playback
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-playback
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-subparse
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-subparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TCP),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-tcp
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-tcp
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-typefind
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-typefind
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-videotestsrc
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-videotestsrc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-videorate
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-videorate
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-videoscale
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-videoscale
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-volume
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-volume
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-ogg
+GST1_PLUGINS_BASE_DEPENDENCIES += libogg
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-ogg
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-pango
+GST1_PLUGINS_BASE_DEPENDENCIES += pango
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-pango
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-theora
+GST1_PLUGINS_BASE_DEPENDENCIES += libtheora
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-theora
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-ivorbis
+GST1_PLUGINS_BASE_DEPENDENCIES += tremor
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-ivorbis
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-vorbis
+GST1_PLUGINS_BASE_DEPENDENCIES += libvorbis
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-vorbis
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GST1_PLUGINS_BASE_DEPENDENCIES += zlib
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-zlib
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
