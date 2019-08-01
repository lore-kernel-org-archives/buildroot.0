From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Aug 2019 21:10:52 +0200
Subject: [Buildroot] [git commit] package/gst1-plugins-good: add shout2
 plugin option
Message-ID: <20190801191826.4485F8B904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0453de25d9ad458d5ef4da90f78124da1306424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnold Bloemert <abloemert@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-plugins-good/Config.in            |  6 ++++++
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 10 ++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 433084fd6b..40e21985d9 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -300,6 +300,12 @@ comment "qmlgl (qt5) plugin needs an OpenGL-capable Qt5 backend"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2
+	bool "shout2"
+	select BR2_PACKAGE_LIBSHOUT
+	help
+	  Elements to send data to an icecast server using libshout2
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
 	bool "v4l2"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # multi planar api
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 829d27a2da..3c9f0d5605 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -25,8 +25,7 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_GOOD_CONF_OPTS += \
 	--disable-libdv \
-	--disable-dv1394 \
-	--disable-shout2
+	--disable-dv1394
 
 GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
@@ -343,6 +342,13 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += --disable-qt
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-shout2
+GST1_PLUGINS_GOOD_DEPENDENCIES += libshout
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-shout2
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += --enable-gst_v4l2
 else
