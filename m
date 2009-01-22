From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 22 Jan 2009 10:24:34 +0100
Subject: [Buildroot] [PATCH] gst-plugins-good: add config options for zlib
	and bzip2
Message-ID: <200901221024.34673.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now the matroska plugin can be compiled without these two dependencies.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---

This is untested, but shouldn't cause problems. It's ten a clock, I'm
still at home, but should go to work soon.

I'm not sure, maybe the "depends on" in this patch should go away?

 package/multimedia/gst-plugins-good/Config.in      |   18 ++++++++++++++++--
 .../gst-plugins-good/gst-plugins-good.mk           |   14 ++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 9906dbd..752a289 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -10,6 +10,22 @@ menuconfig BR2_PACKAGE_GST_PLUGINS_GOOD
 
 if BR2_PACKAGE_GST_PLUGINS_GOOD
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_ZLIB
+	bool "zlib support"
+	depends on BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_QTDEMUX || BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX || BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable zlib support for the following plugins:
+	  id3demux, qtdemux, matroska
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_BZ2
+	bool "bz2 support"
+	depends on BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bz2 support for the following plugins:
+	  matroska
+
 comment "dependency-less plugins"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER
@@ -72,8 +88,6 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LEVEL
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
 	bool "matroska"
-	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE
 	bool "monoscope"
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index c120edb..c257460 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -26,6 +26,20 @@ GST_PLUGINS_GOOD_CONF_OPT = \
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_ZLIB),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-zlib
+GST_PLUGINS_GOOD_DEPENDENCIES += zlib
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_BZ2),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-bz2
+GST_PLUGINS_GOOD_DEPENDENCIES += bzip2
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-bz2
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-videofilter
 else
-- 
1.6.1.269.gd4c0a
