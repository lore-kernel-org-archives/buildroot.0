From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  9 May 2013 15:51:16 -0500
Subject: [Buildroot] [PATCH v2 5/6] gst-plugins-ugly1: add gstreamer1 ugly
	plugins
In-Reply-To: <1368132677-1261-1-git-send-email-spenser@gillilanding.com>
References: <1368132677-1261-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368132677-1261-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds gstreamer 1.X ugly plugins

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-plugins-ugly1/Config.in     |   49 +++++++++++
 .../gst-plugins-ugly1/gst-plugins-ugly1.mk         |   89 ++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 package/multimedia/gst-plugins-ugly1/Config.in
 create mode 100644 package/multimedia/gst-plugins-ugly1/gst-plugins-ugly1.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 8d5726e..99d7f50 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -18,6 +18,7 @@ source "package/multimedia/gst-plugins-good1/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-bad1/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
+source "package/multimedia/gst-plugins-ugly1/Config.in"
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpd/Config.in"
diff --git a/package/multimedia/gst-plugins-ugly1/Config.in b/package/multimedia/gst-plugins-ugly1/Config.in
new file mode 100644
index 0000000..c310e50
--- /dev/null
+++ b/package/multimedia/gst-plugins-ugly1/Config.in
@@ -0,0 +1,49 @@
+menuconfig BR2_PACKAGE_GST_PLUGINS_UGLY1
+	bool "gst-plugins-ugly1"
+	depends on BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST_PLUGINS_BASE1
+	help
+	  A set of well-supported plug-ins for GStreamer, but might pose
+	  problems for distributors.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST_PLUGINS_UGLY1
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_ASFDEMUX
+	bool "asfdemux"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_DVDLPCMDEC
+	bool "dvdlpcmdec"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_DVDSUB
+	bool "dvdsub"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_XINGMUX
+	bool "xingmux"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_REALMEDIA
+	bool "realmedia"
+
+comment "plugins with external dependencies (there may be more available)"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_LAME
+	bool "lame (*.mp3 audio encoder)"
+	select BR2_PACKAGE_LAME
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_DVDREAD
+	bool "dvdread"
+	select BR2_PACKAGE_LIBDVDREAD
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_MAD
+	bool "mad (*.mp3 audio)"
+	select BR2_PACKAGE_LIBID3TAG
+	select BR2_PACKAGE_LIBMAD
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_MPEG2DEC
+	bool "mpeg2dec"
+	select BR2_PACKAGE_LIBMPEG2
+
+endif
diff --git a/package/multimedia/gst-plugins-ugly1/gst-plugins-ugly1.mk b/package/multimedia/gst-plugins-ugly1/gst-plugins-ugly1.mk
new file mode 100644
index 0000000..269abba
--- /dev/null
+++ b/package/multimedia/gst-plugins-ugly1/gst-plugins-ugly1.mk
@@ -0,0 +1,89 @@
+#############################################################
+#
+# gst-plugins-ugly1
+#
+#############################################################
+GST_PLUGINS_UGLY1_VERSION = 1.0.7
+GST_PLUGINS_UGLY1_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY1_VERSION).tar.xz
+GST_PLUGINS_UGLY1_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
+
+GST_PLUGINS_UGLY1_CONF_OPT = \
+		--disable-examples \
+		--disable-debug \
+		--disable-valgrind
+
+GST_PLUGINS_BAD1_CONF_OPT += \
+		--disable-a52dec \
+		--disable-amrnb \
+		--disable-amrwb \
+		--disable-cdio \
+		--disable-sidplay \
+		--disable-twolame \
+		--disable-x264
+
+GST_PLUGINS_UGLY1_DEPENDENCIES = gstreamer1 gst-plugins-base1
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST_PLUGINS_UGLY1_CONF_OPT += --enable-orc
+GST_PLUGINS_UGLY1_DEPENDENCIES += orc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_ASFDEMUX),y)
+GST_PLUGINS_UGLY1_CONF_OPT += --enable-asfdemux
+else
+GST_PLUGINS_UGLY1_CONF_OPT += --disable-asfdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_DVDLPCMDEC),y)
+GST_PLUGINS_UGLY1_CONF_OPT += --enable-dvdlpcmdec
+else
+GST_PLUGINS_UGLY1_CONF_OPT += --disable-dvdlpcmdec
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_DVDSUB),y)
+GST_PLUGINS_UGLY1_CONF_OPT += --enable-dvdsub
+else
+GST_PLUGINS_UGLY1_CONF_OPT += --disable-dvdsub
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGL1_PLUGIN_XINGMUX),y)
+GST_PLUGINS_UGLY1_CONF_OPT += --enable-xingmux
+else
+GST_PLUGINS_UGLY1_CONF_OPT += --disable-xingmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_REALMEDIA),y)
+GST_PLUGINS_UGLY1_CONF_OPT += --enable-realmedia
+else
+GST_PLUGINS_UGLY1_CONF_OPT += --disable-realmedia
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_LAME),y)
+GST_PLUGINS_UGLY1_CONF_OPT += --enable-lame
+GST_PLUGINS_UGLY1_DEPENDENCIES += lame
+else
+GST_PLUGINS_UGLY1_CONF_OPT += --disable-lame
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_DVDREAD),y)
+GST_PLUGINS_UGLY1_CONF_OPT += --enable-dvdread
+GST_PLUGINS_UGLY1_DEPENDENCIES += libdvdread
+else
+GST_PLUGINS_UGLY1_CONF_OPT += --disable-dvdread
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_MAD),y)
+GST_PLUGINS_UGLY1_CONF_OPT += --enable-mad
+GST_PLUGINS_UGLY1_DEPENDENCIES += libid3tag libmad
+else
+GST_PLUGINS_UGLY1_CONF_OPT += --disable-mad
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY1_PLUGIN_MPEG2DEC),y)
+GST_PLUGINS_UGLY1_CONF_OPT += --enable-mpeg2dec
+GST_PLUGINS_UGLY1_DEPENDENCIES += libmpeg2
+else
+GST_PLUGINS_UGLY1_CONF_OPT += --disable-mpeg2dec
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
