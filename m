From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  8 Dec 2008 09:57:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia:
	gst-plugins-ugly
Message-ID: <20081208175726.D29F73C6F3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-08 09:57:26 -0800 (Mon, 08 Dec 2008)
New Revision: 24331

Log:
gst-plugins-ugly: add gstreamer ugly plugins

This patch adds the ugly plugins for gstreamer, for more information see
http://gstreamer.freedesktop.org/modules/gst-plugins-ugly.html



Added:
   trunk/buildroot/package/multimedia/gst-plugins-ugly/
   trunk/buildroot/package/multimedia/gst-plugins-ugly/Config.in
   trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk

Modified:
   trunk/buildroot/package/multimedia/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/Config.in	2008-12-08 17:55:29 UTC (rev 24330)
+++ trunk/buildroot/package/multimedia/Config.in	2008-12-08 17:57:26 UTC (rev 24331)
@@ -6,6 +6,7 @@
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
+source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libogg/Config.in"

Added: trunk/buildroot/package/multimedia/gst-plugins-ugly/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-ugly/Config.in	                        (rev 0)
+++ trunk/buildroot/package/multimedia/gst-plugins-ugly/Config.in	2008-12-08 17:57:26 UTC (rev 24331)
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

Added: trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk	                        (rev 0)
+++ trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk	2008-12-08 17:57:26 UTC (rev 24331)
@@ -0,0 +1,78 @@
+#############################################################
+#
+# gst-plugins-ugly
+#
+#############################################################
+GST_PLUGINS_UGLY_VERSION = 0.10.9
+GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
+GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
+
+GST_PLUGINS_UGLY_CONF_OPT = \
+		$(DISABLE_NLS) \
+		--disable-examples
+
+GST_PLUGINS_UGLY_DEPENDENCIES = gstreamer gst-plugins-base
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
+$(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-ugly))
