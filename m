From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri,  7 Jun 2013 18:18:56 -0500
Subject: [Buildroot] [PATCH v10 11/13] gst1-plugins-ugly: add gstreamer1
	ugly plugins
In-Reply-To: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370647138-26623-12-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds gstreamer 1.X ugly plugins
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst1-plugins-ugly/Config.in     |   49 +++++++++
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  104 ++++++++++++++++++++
 3 files changed, 154 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst1-plugins-ugly/Config.in
 create mode 100644 package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index ca40e57..a0927e9 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -18,6 +18,7 @@ source "package/multimedia/gst1-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst1-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
+source "package/multimedia/gst1-plugins-ugly/Config.in"
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/libvpx/Config.in"
 source "package/multimedia/madplay/Config.in"
diff --git a/package/multimedia/gst1-plugins-ugly/Config.in b/package/multimedia/gst1-plugins-ugly/Config.in
new file mode 100644
index 0000000..c4a3c87
--- /dev/null
+++ b/package/multimedia/gst1-plugins-ugly/Config.in
@@ -0,0 +1,49 @@
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
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC
+	bool "dvdlpcmdec"
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDSUB
+	bool "dvdsub"
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX
+	bool "xingmux"
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA
+	bool "realmedia"
+
+comment "plugins with external dependencies (there may be more available)"
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
+	bool "lame (*.mp3 audio encoder)"
+	select BR2_PACKAGE_LAME
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD
+	bool "dvdread"
+	select BR2_PACKAGE_LIBDVDREAD
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD
+	bool "mad (*.mp3 audio)"
+	select BR2_PACKAGE_LIBID3TAG
+	select BR2_PACKAGE_LIBMAD
+
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC
+	bool "mpeg2dec"
+	select BR2_PACKAGE_LIBMPEG2
+
+endif
diff --git a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
new file mode 100644
index 0000000..f30a8d6
--- /dev/null
+++ b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -0,0 +1,104 @@
+###############################################################################
+#
+# gst1-plugins-ugly
+#
+###############################################################################
+
+GST1_PLUGINS_UGLY_VERSION = 1.1.1
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
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME),y)
+GST1_PLUGINS_UGLY_CONF_OPT += --enable-lame
+GST1_PLUGINS_UGLY_DEPENDENCIES += lame
+else
+GST1_PLUGINS_UGLY_CONF_OPT += --disable-lame
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
-- 
1.7.1
