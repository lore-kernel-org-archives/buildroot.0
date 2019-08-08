From: Charlie Turner <cturner@igalia.com>
Date: Thu,  8 Aug 2019 12:36:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: gl enabled when either
 GL or GLES2 is present
Message-ID: <20190808113631.21408-1-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building gst1-plugins-base with GL support on the rpi3 (which
supports only GLES2, not full desktop GL), GStreamer was being asked to
disable its GL support completely. This isn't correct since it can be
used with either GL or GLES2.

Signed-off-by: Charlie Turner <cturner@igalia.com>
---
 .../gstreamer1/gst1-plugins-base/gst1-plugins-base.mk    | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 66c136c36c..e80b301b82 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -38,12 +38,15 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dorc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL)$(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
 GST1_PLUGINS_BASE_GL_API_LIST = opengl
-GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
 GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
-else
-GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
-- 
2.17.1
