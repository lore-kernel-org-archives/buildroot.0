From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Feb 2020 16:26:29 +0100
Subject: [Buildroot] [git commit] package/webkitgtk: fix gstreamer-gl
 dependency
Message-ID: <20200205151530.A0EB18CA08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b70e999e8427e45c017dc047327db576d17c0213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gstreamer1 opengl plugin was moved from gst1-plugins-bad to
gst1-plugins-base so we need to update webkitgtk to depend on the
correct package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/webkitgtk/Config.in    | 3 +--
 package/webkitgtk/webkitgtk.mk | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 3ac76f9886..4f10466c1f 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -108,8 +108,7 @@ if BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 config BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL
 	bool "use gstreamer-gl"
 	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
 	help
 	  Use the GStreamer GL elements for handling video content.
 	  This is recommended as it improves performance of video
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 389c16de4a..e5d591fcd2 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -100,7 +100,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL),y)
 WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
-WEBKITGTK_DEPENDENCIES += gst1-plugins-bad
 else
 WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
 endif
