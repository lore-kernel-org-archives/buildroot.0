From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri,  8 Jul 2011 15:12:56 +0200
Subject: [Buildroot] [PATCH 4/6] gst-plugins-ugly: add option dependency on
	orc package
In-Reply-To: <1310130778-6359-1-git-send-email-s.neumann@raumfeld.com>
References: <1310130778-6359-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1310130778-6359-5-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove the option for the libid3tag plug-in as is not any
longer found in gst-plugins-ugly.
---
 package/multimedia/gst-plugins-ugly/Config.in      |    4 ----
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |   11 ++++-------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/multimedia/gst-plugins-ugly/Config.in
index 9f738cf..e20426f 100644
--- a/package/multimedia/gst-plugins-ugly/Config.in
+++ b/package/multimedia/gst-plugins-ugly/Config.in
@@ -38,10 +38,6 @@ config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_SYNAESTHESIA
 
 comment "plugins with external dependencies (there may be more available)"
 
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ID3TAG
-	bool "id3tag"
-	select BR2_PACKAGE_LIBID3TAG
-
 config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD
 	bool "mad (*.mp3 audio)"
 	select BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ID3TAG
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index a173df1..0d8d32d 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -12,6 +12,10 @@ GST_PLUGINS_UGLY_CONF_OPT = \
 
 GST_PLUGINS_UGLY_DEPENDENCIES = gstreamer gst-plugins-base
 
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST_PLUGINS_UGLY_DEPENDENCIES += orc
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ASFDEMUX),y)
 GST_PLUGINS_UGLY_CONF_OPT += --enable-asfdemux
 else
@@ -60,13 +64,6 @@ else
 GST_PLUGINS_UGLY_CONF_OPT += --disable-synaesthesia
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ID3TAG),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-id3tag
-GST_PLUGINS_UGLY_DEPENDENCIES += libid3tag
-else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-id3tag
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD),y)
 GST_PLUGINS_UGLY_CONF_OPT += --enable-mad
 GST_PLUGINS_UGLY_DEPENDENCIES += libmad
-- 
1.7.1
