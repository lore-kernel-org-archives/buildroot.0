From: laird at uclibc.org <laird@uclibc.org>
Date: Thu, 22 Jan 2009 11:01:59 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
Message-ID: <20090122110159.E9877765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-22 11:01:56 +0000 (Thu, 22 Jan 2009)
New Revision: 24960

Log:
package/multimedia/gst-plugins-good/Config.in
package/multimedia/gst-plugins-good/gst-plugins-good.mk

Always disable ESD
Move JPEG/PNG
Add BZIP2/ZLIB options as posted by Markus
Add LIBXML2 dependency for annodex

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
   trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2009-01-22 10:15:46 UTC (rev 24959)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2009-01-22 11:01:56 UTC (rev 24960)
@@ -10,6 +10,30 @@
 
 if BR2_PACKAGE_GST_PLUGINS_GOOD
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG
+	bool "jpeg (JPEG support)"
+	select BR2_PACKAGE_JPEG
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PNG
+	bool "png (PNG support)"
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_BZ2
+	bool "bz2 support"
+	depends on BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bz2 support for the following plugins:
+	  matroska
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_ZLIB
+	bool "zlib support"
+	depends on BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_QTDEMUX || BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX || BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable zlib support for the following plugins:
+	  id3demux, qtdemux, matroska
+
 comment "dependency-less plugins"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER
@@ -72,8 +96,6 @@
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
 	bool "matroska"
-	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE
 	bool "monoscope"
@@ -121,25 +143,13 @@
 	bool "wavparse (*.wav audio)"
 	default y
 
-comment "plugins with external dependencies (more to come)"
+comment "plugins with external dependencies"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX
 	bool "annodex (XML Library)"
-	default y
+	select BR2_PACKAGE_LIBXML2
 
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ESD
-	bool "esdsink (ESounD sound daemon)"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_JPEG
-	bool "jpeg (JPEG support)"
-	select BR2_PACKAGE_JPEG
-	default y
-
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
 	bool "ossaudio (OSS audio)"
 
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PNG
-	bool "png (PNG support)"
-	select BR2_PACKAGE_LIBPNG
-	default y
 endif

Modified: trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-01-22 10:15:46 UTC (rev 24959)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-01-22 11:01:56 UTC (rev 24960)
@@ -22,10 +22,39 @@
 		--disable-aalibtest \
 		--disable-esdtest \
 		--disable-shout2 \
-		--disable-shout2test
+		--disable-shout2test \
+		--disable-esd 
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_BZ2),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-bz2
+GST_PLUGINS_GOOD_DEPENDENCIES += bzip2
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-bz2
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_ZLIB),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-zlib
+GST_PLUGINS_GOOD_DEPENDENCIES += zlib
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
+GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PNG),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-png
+GST_PLUGINS_GOOD_DEPENDENCIES += libpng
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-png
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-videofilter
 else
@@ -239,34 +268,15 @@
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-annodex
+GST_PLUGINS_GOOD_DEPENDENCIES += libxml2
 else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-annodex
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ESD),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-esd
-else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-esd
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_JPEG),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
-GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
-else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-jpeg
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-oss
 else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-oss
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PNG),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-png
-GST_PLUGINS_GOOD_DEPENDENCIES += libpng
-else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-png
-endif
-
 $(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-good))
