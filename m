From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 15:23:51 +0200
Subject: [Buildroot] [git commit] package/gst1-plugins-good: add option for
 qmlgl plugin (qt5 plugin)
Message-ID: <20190407132105.EEF8D81673@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=086de0847e330adce2ae4f1ada41fad9fe9dc3da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gst1-plugins-good is built with --disable-qt option, so qmlgl plugin
is disabled. Add an option to enable it, allowing to use the qmlglsrc
and qmlglsink GStreamer elements.

Signed-off-by: I??igo Huguet <inigohuguet@fanamoel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in          | 17 +++++++++++++++++
 .../gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 13 +++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index afb9a418d8..30a4876ee7 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -283,6 +283,23 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS4
 	help
 	  Open Sound System (OSS) version 4 support for GStreamer
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
+	bool "qmlgl (qt5)"
+	depends on BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative-quick
+	select BR2_PACKAGE_QT5BASE_WIDGETS
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
index 2e6ac6dbb3..f6a3037be0 100644
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
@@ -334,6 +333,16 @@ else
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
