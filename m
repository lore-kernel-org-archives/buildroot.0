From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Jun 2013 16:05:12 +0200
Subject: [Buildroot] [git commit] gst1-plugins-ugly: add gstreamer1 ugly
	plugins
Message-ID: <20130621143541.051DB9AF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09ed859d5e61f0ac1812340dc471a4dfab8819be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds gstreamer 1.X ugly plugins

[Peter: fix Config.in typo]
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst1-plugins-ugly/Config.in     |   69 +++++++++++++
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  104 ++++++++++++++++++++
 3 files changed, 174 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 318dd74..c87abea 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -18,6 +18,7 @@ source "package/multimedia/gst1-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst1-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
+source "package/multimedia/gst1-plugins-ugly/Config.in"
 source "package/multimedia/gst-plugin-x170/Config.in"
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/libvpx/Config.in"
diff --git a/package/multimedia/gst1-plugins-ugly/Config.in b/package/multimedia/gst1-plugins-ugly/Config.in
new file mode 100644
index 0000000..a6ca387
--- /dev/null
+++ b/package/multimedia/gst1-plugins-ugly/Config.in
@@ -0,0 +1,69 @@
+menuconfig BR2_PACKAGE_GST1_PLUGINS_UGLY
+	bool "gst1-plugins-ugly"
+	depends on BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  A set of well-supported plug-ins for GStreamer, but might pose
+	  problems for distributors.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST1_PLUGINS_UGLY
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_ASFDEMUX
+	bool "asfdemux"
+	help
+	  Demuxes and muxes audio and video in Microsofts ASF format
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC
+	bool "dvdlpcmdec"
+	help
+	  Decode DVD LPCM frames into standard PCM
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDSUB
+	bool "dvdsub"
+	help
+	  DVD subtitle parser and decoder
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX
+	bool "xingmux"
+	help
+	  Add XING tags to mpeg audio files
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA
+	bool "realmedia"
+	help
+	  RealMedia support plugins
+
+comment "plugins with external dependencies (there may be more available)"
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD
+	bool "dvdread"
+	select BR2_PACKAGE_LIBDVDREAD
+	help
+	  Access a DVD with dvdread
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
+	bool "lame (*.mp3 audio encoder)"
+	select BR2_PACKAGE_LAME
+	help
+	  Encode MP3s with LAME
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD
+	bool "mad (*.mp3 audio)"
+	select BR2_PACKAGE_LIBID3TAG
+	select BR2_PACKAGE_LIBMAD
+	help
+	  mp3 decoding based on the mad library
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC
+	bool "mpeg2dec"
+	select BR2_PACKAGE_LIBMPEG2
+	help
+	  LibMpeg2 decoder
+
+# Note: to get descriptions use the following.
+# # find . -name 'plugin-*.xml' | xargs grep -m 1 description
+endif
diff --git a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
new file mode 100644
index 0000000..67761b5
--- /dev/null
+++ b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -0,0 +1,104 @@
+###############################################################################
+#
+# gst1-plugins-ugly
+#
+###############################################################################
+
+GST1_PLUGINS_UGLY_VERSION = 1.0.7
+GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
+GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
+GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
+# GPL licensed plugins will append to GST1_PLUGINS_UGLY_LICENSE if enabled.
+GST1_PLUGINS_UGLY_LICENSE = LGPLv2.1+
+
+GST1_PLUGINS_UGLY_CONF_OPT = \
+	--disable-examples \
+	--disable-debug \
+	--disable-valgrind
+
+GST_PLUGINS_BAD1_CONF_OPT += \
+	--disable-a52dec \
+	--disable-amrnb \
+	--disable-amrwb \
+	--disable-cdio \
+	--disable-sidplay \
+	--disable-twolame \
+	--disable-x264
+
+GST1_PLUGINS_UGLY_DEPENDENCIES = gstreamer1 gst1-plugins-base
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-orc
+GST1_PLUGINS_UGLY_DEPENDENCIES += orc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_ASFDEMUX),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-asfdemux
+else
+GST1_PLUGINS_UGLY_CONF_OPT += --disable-asfdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-dvdlpcmdec
+else
+GST1_PLUGINS_UGLY_CONF_OPT += --disable-dvdlpcmdec
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDSUB),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-dvdsub
+else
+GST1_PLUGINS_UGLY_CONF_OPT += --disable-dvdsub
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGL1_PLUGIN_XINGMUX),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-xingmux
+else
+GST1_PLUGINS_UGLY_CONF_OPT += --disable-xingmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-realmedia
+else
+GST1_PLUGINS_UGLY_CONF_OPT += --disable-realmedia
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-dvdread
+GST1_PLUGINS_UGLY_DEPENDENCIES += libdvdread
+GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
+else
+GST1_PLUGINS_UGLY_CONF_OPT += --disable-dvdread
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-lame
+GST1_PLUGINS_UGLY_DEPENDENCIES += lame
+else
+GST1_PLUGINS_UGLY_CONF_OPT += --disable-lame
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-mad
+GST1_PLUGINS_UGLY_DEPENDENCIES += libid3tag libmad
+GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
+else
+GST1_PLUGINS_UGLY_CONF_OPT += --disable-mad
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-mpeg2dec
+GST1_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
+GST1_PLUGINS_ULGY_HAS_GPL_LICENSE = y
+else
+GST1_PLUGINS_UGLY_CONF_OPT += --disable-mpeg2dec
+endif
+
+# Add GPL license if GPL plugins enabled.
+ifeq ($(GST1_PLUGINS_UGLY_HAS_GPL_LICENSE),y)
+GST1_PLUGINS_UGLY_LICENSE += GPLv2
+endif
+
+# Use the following command to extract license info for plugins.
+# # find . -name 'plugin-*.xml' | xargs grep license
+
+$(eval $(autotools-package))
