From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 10:49:22 +0100
Subject: [Buildroot] [git commit] webkitgtk: add an option to control
 USE_GSTREAMER_GL
Message-ID: <20181031095117.895A283807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ac29a8196903f7e88674bb4b2f58c0f29fb122d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This covers the case where GL/GLES is available (so -DENABLE_OPENGL=ON
gets passed), which makes the webkitgtk build system assume GStreamer-GL
is available, while actually it is not.

Also, providing an option to manually disable usage of GStremer-GL can
help with certain target configurations in which using OpenGL for video
handling might result in incorrect rendering.

This fixes some autobuilder failures like the following:

  http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674
  http://autobuild.buildroot.net/results/00c1a8ea23a99728a4f3f4478705f2383414ae41

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in    | 15 +++++++++++++++
 package/webkitgtk/webkitgtk.mk |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index bf0a150251..f1228892af 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -105,6 +105,21 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	  This option pulls in all of the required dependencies
 	  to enable multimedia (video/audio) support.
 
+if BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
+
+config BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL
+	bool "use gstreamer-gl"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
+	help
+	  Use the GStreamer GL elements for handling video content.
+	  This is recommended as it improves performance of video
+	  playback. In some target configurations incorrect rendering
+	  might be produced, and disabling this option may help.
+
+endif
+
 config BR2_PACKAGE_WEBKITGTK_WEBDRIVER
 	bool "WebDriver support"
 	help
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 39d681b1d4..1ba1cb5329 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -95,4 +95,11 @@ WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
+WEBKITGTK_DEPENDENCIES += gst1-plugins-bad
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
+endif
+
 $(eval $(cmake-package))
