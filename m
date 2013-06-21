From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Jun 2013 15:58:33 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: add gstreamer1 base
	plugins
Message-ID: <20130621143539.E980F9AF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8e7fdcd36d56fd772a0d48df2a778e831233ac7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds gstreamer 1.X base plugins.

[Peter: strip trailing newlines in Config.in]
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst1-plugins-base/Config.in     |  152 ++++++++++++++
 .../gst1-plugins-base/gst1-plugins-base.mk         |  206 ++++++++++++++++++++
 3 files changed, 359 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 1427a27..6e21fc6 100644
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
index 0000000..10561c1
--- /dev/null
+++ b/package/multimedia/gst1-plugins-base/Config.in
@@ -0,0 +1,152 @@
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
+	help
+	  Adds multiple streams
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	bool "app"
+	help
+	  Elements used to communicate with applications
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
+	bool "audioconvert (mandatory for audio playback)"
+	default y
+	help
+	  Convert audio to different formats
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE
+	bool "audiorate"
+	help
+	  Adjusts audio frames
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC
+	bool "audiotestsrc"
+	help
+	  Creates audio test signals of given frequency and volume
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING
+	bool "encoding"
+	help
+	  various encoding-related elements
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
+	bool "videoconvert"
+	help
+	  Colorspace conversion
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO
+	bool "gio"
+	help
+	  GIO elements
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND
+	bool "playback"
+	default y
+	help
+	  various playback elements
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
+	bool "audioresample (mandatory for audio playback)"
+	default y
+	help
+	  Resamples audio
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE
+	bool "subparse"
+	help
+	  Subtitle parsing
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TCP
+	bool "tcp"
+	help
+	  transfer data over the network via TCP
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND
+	bool "typefind"
+	default y
+	help
+	  default typefind functions
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC
+	bool "videotestsrc"
+	help
+	  Creates a test video stream
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE
+	bool "videorate"
+	help
+	  Adjusts video frames
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	bool "videoscale (mandatory for video playback)"
+	default y
+	help
+	  Resizes video
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
+	bool "volume (mandatory for audio playback)"
+	default y
+	help
+	  plugin for controlling audio volume
+
+comment "plugins with external dependencies"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
+	bool "alsa (mandatory for audio playback)"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER
+	select BR2_PACKAGE_ALSA_LIB_PCM
+	help
+	  ALSA plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR
+	bool "tremor"
+	select BR2_PACKAGE_TREMOR
+	help
+	  Vorbis Tremor decoder
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG
+	bool "ogg (*.ogg audio/video)"
+	select BR2_PACKAGE_LIBOGG
+	help
+	  ogg stream manipulation (info about ogg: http://xiph.org)
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
+	bool "pango font renderer"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PANGO
+	help
+	  Pango-based text rendering and overlay
+
+comment "pango plugin requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
+	bool "theora (*.ogg video)"
+	select BR2_PACKAGE_LIBTHEORA
+	help
+	  Theora plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS
+	bool "vorbis (*.ogg audio)"
+	select BR2_PACKAGE_LIBVORBIS
+	help
+	  Vorbis plugin library
+
+endif
diff --git a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
new file mode 100644
index 0000000..1ab6f1e
--- /dev/null
+++ b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
@@ -0,0 +1,206 @@
+################################################################################
+#
+# gst1-plugins-base
+#
+################################################################################
+
+GST1_PLUGINS_BASE_VERSION = 1.0.7
+GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
+GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
+GST1_PLUGINS_BASE_INSTALL_STAGING = YES
+GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
+GST1_PLUGINS_BASE_LICENSE = LGPLv2+ LGPLv2.1+
+
+# freetype is only used by examples, but if it is not found
+# and the host has a freetype-config script, then the host
+# include dirs are added to the search path causing trouble
+GST1_PLUGINS_BASE_CONF_ENV =
+	FT2_CONFIG=/bin/false \
+	ac_cv_header_stdint_t="stdint.h"
+
+GST1_PLUGINS_BASE_CONF_OPT = \
+	--disable-examples \
+	--disable-oggtest \
+	--disable-vorbistest \
+	--disable-freetypetest \
+	--disable-valgrind \
+	--disable-debug
+
+# Options which require currently unpackaged libraries
+GST1_PLUGINS_BASE_CONF_OPT += \
+	--disable-cdparanoia \
+	--disable-libvisual \
+	--disable-iso-codes
+
+GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1
+
+# These plugins are liste in the order from ./configure --help
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST1_PLUGINS_BASE_DEPENDENCIES += orc
+GST1_PLUGINS_BASE_CONF_OPT += --enable-orc
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
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-audioresample
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-audioresample
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
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GST1_PLUGINS_BASE_DEPENDENCIES += zlib
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-zlib
+endif
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
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA),y)
+GST1_PLUGINS_BASE_DEPENDENCIES += alsa-lib
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-ivorbis
+GST1_PLUGINS_BASE_DEPENDENCIES += tremor
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-ivorbis
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
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS),y)
+GST1_PLUGINS_BASE_CONF_OPT += --enable-vorbis
+GST1_PLUGINS_BASE_DEPENDENCIES += libvorbis
+else
+GST1_PLUGINS_BASE_CONF_OPT += --disable-vorbis
+endif
+
+$(eval $(autotools-package))
