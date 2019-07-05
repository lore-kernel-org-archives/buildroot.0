From: Arnold Bloemert <abloemert@gmail.com>
Date: Fri,  5 Jul 2019 23:50:38 +0200
Subject: [Buildroot] [PATCH v2] package/gst1-plugins-good: add shout2 plugin
 option
In-Reply-To: <20190705065015.29773-1-abloemert@gmail.com>
References: <20190705065015.29773-1-abloemert@gmail.com>
Message-ID: <20190705215038.12927-1-abloemert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnold Bloemert <abloemert@gmail.com>

---
Changes v1 -> v2:
  - add dependency to .mk file and simplify commit message (suggested by Peter Seiderer)

Signed-off-by: Arnold Bloemert <abloemert@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in         |  6 ++++++
 .../gstreamer1/gst1-plugins-good/gst1-plugins-good.mk  | 10 ++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 433084fd6b..ce85388eb0 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -300,6 +300,12 @@ comment "qmlgl (qt5) plugin needs an OpenGL-capable Qt5 backend"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2
+        bool "shout2"
+        select BR2_PACKAGE_LIBSHOUT
+        help
+          Elements to send data to an icecast server using libshout2
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
-- 
2.22.0
