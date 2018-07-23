From: =?UTF-8?q?I=C3=B1igo=20Huguet?= <inigohuguet@fanamoel.com>
Date: Mon, 23 Jul 2018 10:55:35 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-good: add option for qmlgl
 plugin (qt5 plugin)
In-Reply-To: <CADujc4qKisW=6QyDZjDSUo50Yj+_H4-+7V=2KW32cAzRB_d2Qw@mail.gmail.com>
References: <CADujc4qKisW=6QyDZjDSUo50Yj+_H4-+7V=2KW32cAzRB_d2Qw@mail.gmail.com>
Message-ID: <1532336135-10609-1-git-send-email-inigohuguet@fanamoel.com>
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
 package/gstreamer1/gst1-plugins-good/Config.in            | 10 ++++++++++
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 13 +++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 3bb98a4..d55b445 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -283,6 +283,16 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS4
 	help
 	  Open Sound System (OSS) version 4 support for GStreamer
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
+	bool "qmlgl (qt5)"
+	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	select BR2_PACKAGE_QT5X11EXTRAS if BR2_PACKAGE_QT5BASE_XCB
+	help
+	  QT5 plugin which includes elements qmlglsrc and qmlglsink
+	
+comment "qmlgl (qt5) plugin depends on QT5 declarative with Quick module"
+	depends on !BR2_PACKAGE_QT5DECLARATIVE_QUICK
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
 	bool "v4l2"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # multi planar api
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 6fa989d..bc8242d 100644
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
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-qt
+endif
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL)$(BR2_PACKAGE_QT5BASE_XCB),yy)
+GST1_PLUGINS_GOOD_DEPENDENCIES += qt5x11extras
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += --enable-gst_v4l2
 else
-- 
2.7.4
