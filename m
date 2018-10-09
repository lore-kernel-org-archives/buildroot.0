From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 10 Oct 2018 01:08:52 +0300
Subject: [Buildroot] [PATCH 4/4] webkitgtk: explicitly set USE_GSTREAMER_GL
 build option
In-Reply-To: <20181009220852.4309-1-aperez@igalia.com>
References: <20181009220852.4309-1-aperez@igalia.com>
Message-ID: <20181009220852.4309-5-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This covers the case where GL/GLES is available (so -DENABLE_OPENGL=ON
gets passed), which makes the webkitgtk build system assume GStreamer-GL
is available, while actually it is not.

Also, use "imply" to select the needed GStreamer-GL component, because
in general it is preferred due to better performance.

This fixes some autobuilder failures like the following:

  http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index bf0a150251..7a83b08b60 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -101,6 +101,7 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
 	select BR2_PACKAGE_GST1_LIBAV
+	imply BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
 	help
 	  This option pulls in all of the required dependencies
 	  to enable multimedia (video/audio) support.
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 39d681b1d4..499715ebfe 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -95,4 +95,11 @@ WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
+WEBKITGTK_DEPENDENCIES += gst1-plugins-bad
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.19.1
