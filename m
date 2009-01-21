From: laird at uclibc.org <laird@uclibc.org>
Date: Wed, 21 Jan 2009 13:33:21 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
Message-ID: <20090121133322.0FFA4770FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-21 13:33:21 +0000 (Wed, 21 Jan 2009)
New Revision: 24937

Log:
package/multimedia/gst-plugins-good/gst-plugins-good.mk
package/multimedia/gst-plugins-good/Config.in

gst-plugins-good does not build unless some package dependencies are forced.
This patch allows you to turn off some of the plugins with these dependencies and hides
others that require some packages (like PNG/JPEG)

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
   trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2009-01-21 07:09:41 UTC (rev 24936)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2009-01-21 13:33:21 UTC (rev 24937)
@@ -72,6 +72,7 @@
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
 	bool "matroska"
+	depends on BR2_PACKAGE_BZIP2 && BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE
 	bool "monoscope"
@@ -119,4 +120,25 @@
 	bool "wavparse (*.wav audio)"
 	default y
 
+comment "plugins with external dependencies (more to come)"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX
+	bool "annodex (XML Library)"
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ESD
+	bool "esdsink (ESounD sound daemon)"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_JPEG
+	bool "jpeg (JPEG support)"
+	depends on BR2_PACKAGE_JPEG
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
+	bool "ossaudio (OSS audio)"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PNG
+	bool "png (PNG support)"
+	depends on BR2_PACKAGE_LIBPNG
+	default y
 endif

Modified: trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-01-21 07:09:41 UTC (rev 24936)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-01-21 13:33:21 UTC (rev 24937)
@@ -142,6 +142,7 @@
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-matroska
+GST_PLUGINS_GOOD_DEPENDENCIES += zlib bzip2
 else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-matroska
 endif
@@ -236,4 +237,36 @@
 GST_PLUGINS_GOOD_CONF_OPT += --disable-wavparse
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-annodex
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-annodex
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ESD),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-esd
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-esd
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_JPEG),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
+GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-oss
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-oss
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PNG),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-png
+GST_PLUGINS_GOOD_DEPENDENCIES += libpng
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-png
+endif
+
 $(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-good))
