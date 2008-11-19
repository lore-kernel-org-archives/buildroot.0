From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 19 Nov 2008 02:52:50 +0100
Subject: [Buildroot] [PATCH 6/7] package/multimedia: add gst-plugins-ugly
	package
In-Reply-To: <200811190244.44817.markus.heidelberg@web.de>
References: <200811190244.44817.markus.heidelberg@web.de>
Message-ID: <200811190252.51041.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A set of well-supported plug-ins for GStreamer, but might pose problems
for distributors.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-plugins-ugly/Config.in      |   50 ++++++++++++
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |   81 ++++++++++++++++++++
 3 files changed, 132 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst-plugins-ugly/Config.in
 create mode 100644 package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 7f7e9e8..52638d2 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -6,6 +6,7 @@ source "package/multimedia/aumix/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
+source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libogg/Config.in"
diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/multimedia/gst-plugins-ugly/Config.in
new file mode 100644
index 0000000..190c4d8
--- /dev/null
+++ b/package/multimedia/gst-plugins-ugly/Config.in
@@ -0,0 +1,50 @@
+menuconfig BR2_PACKAGE_GST_PLUGINS_UGLY
+	bool "gst-plugins-ugly"
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	help
+	  A set of well-supported plug-ins for GStreamer, but might pose
+	  problems for distributors.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST_PLUGINS_UGLY
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ASFDEMUX
+	bool "asfdemux"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC
+	bool "dvdlpcmdec"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDSUB
+	bool "dvdsub"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_IEC958
+	bool "iec958"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGAUDIOPARSE
+	bool "mpegaudioparse"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGSTREAM
+	bool "mpegstream"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_REALMEDIA
+	bool "realmedia"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_SYNAESTHESIA
+	bool "synaesthesia"
+
+comment "plugins with external dependencies (there may be more available)"
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ID3TAG
+	bool "id3tag"
+	select BR2_PACKAGE_LIBID3TAG
+
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD
+	bool "mad (*.mp3 audio)"
+	select BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ID3TAG
+	select BR2_PACKAGE_LIBMAD
+
+endif
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
new file mode 100644
index 0000000..eadf73b
--- /dev/null
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -0,0 +1,81 @@
+#############################################################
+#
+# gst-plugins-ugly
+#
+#############################################################
+GST_PLUGINS_UGLY_VERSION = 0.10.9
+GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
+GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
+GST_PLUGINS_UGLY_AUTORECONF = NO
+GST_PLUGINS_UGLY_INSTALL_STAGING = NO
+GST_PLUGINS_UGLY_INSTALL_TARGET = YES
+
+GST_PLUGINS_UGLY_CONF_OPT = \
+		$(DISABLE_NLS) \
+		--disable-examples
+
+GST_PLUGINS_UGLY_DEPENDENCIES = uclibc gstreamer gst-plugins-base
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ASFDEMUX),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-asfdemux
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-asfdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-dvdlpcmdec
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-dvdlpcmdec
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDSUB),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-dvdsub
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-dvdsub
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_IEC958),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-iec958
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-iec958
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGAUDIOPARSE),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-mpegaudioparse
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-mpegaudioparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGSTREAM),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-mpegstream
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-mpegstream
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-realmedia
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-realmedia
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_SYNAESTHESIA),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-synaesthesia
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-synaesthesia
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ID3TAG),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-id3tag
+GST_PLUGINS_UGLY_DEPENDENCIES += libid3tag
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-id3tag
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-mad
+GST_PLUGINS_UGLY_DEPENDENCIES += libmad
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-mad
+endif
+
+$(eval $(call AUTOTARGETS,package,gst-plugins-ugly))
-- 
1.6.0.4.762.g0567f
