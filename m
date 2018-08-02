From: =?UTF-8?q?I=C3=B1igo=20Huguet?= <inigohuguet@fanamoel.com>
Date: Thu,  2 Aug 2018 13:11:01 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-good: add option for qmlgl
 plugin (qt5 plugin)
In-Reply-To: <4a3746f6-f635-e3a2-0d09-deff9c106b70@mind.be>
References: <4a3746f6-f635-e3a2-0d09-deff9c106b70@mind.be>
Message-ID: <1533208261-13853-1-git-send-email-inigohuguet@fanamoel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst1-plugins-good is built with --disable-qt option, so qmlgl plugin
is disabled. Added option to enable it, allowing to use elements
qmlglsrc and qmlglsink.

Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in           | 16 ++++++++++++++++
 .../gstreamer1/gst1-plugins-good/gst1-plugins-good.mk    | 13 +++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index afb9a41..62ac07b 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -283,6 +283,22 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS4
 	help
 	  Open Sound System (OSS) version 4 support for GStreamer
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
+	bool "qmlgl (qt5)"
+	depends on BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative-quick
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	select BR2_PACKAGE_QT5X11EXTRAS if BR2_PACKAGE_QT5BASE_XCB
+	help
+	  QT5 plugin which includes elements qmlglsrc and qmlglsink
+	
+comment "qmlgl (qt5) plugin needs an OpenGL-capable Qt5 backend"
+	depends on BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
 	bool "v4l2"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # multi planar api
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index c1ed039..ef28f2d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -20,8 +20,7 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
 	--disable-osx_video \
 	--disable-aalib \
 	--disable-aalibtest \
-	--disable-libcaca \
-	--disable-qt
+	--disable-libcaca
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_GOOD_CONF_OPTS += \
@@ -328,6 +327,16 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += --disable-oss4
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-qt
+GST1_PLUGINS_GOOD_DEPENDENCIES += qt5declarative
+ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
+GST1_PLUGINS_GOOD_DEPENDENCIES += qt5x11extras
+endif
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-qt
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += --enable-gst_v4l2
 else
-- 
2.7.4
