From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  6 Aug 2019 22:45:11 -0600
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: fix gstreamer-gl
 dependency
Message-ID: <20190807044511.71248-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gstreamer1 opengl plugin was moved from gst1-plugins-bad to
gst1-plugins-base so we need to update wpewebkit to depend on the
correct package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wpewebkit/Config.in    | 3 +--
 package/wpewebkit/wpewebkit.mk | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 2808a3c8b3..5f3e237c53 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -93,8 +93,7 @@ if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
 	bool "use gstreamer-gl"
 	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
 	help
 	  Use the GStreamer GL elements for handling video content.
 	  This is recommended as it improves performance of video
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 4dc4a29064..f6cc7a23ce 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -34,6 +34,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
+WPEWEBKIT_DEPENDENCIES += gst1-plugins-base
 else
 WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
 endif
-- 
2.20.1
