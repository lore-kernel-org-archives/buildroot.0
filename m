From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Nov 2019 20:37:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-base: gl
 needs api, platform and window
Message-ID: <20191112193756.32212-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build will fail if gl is enabled without an api, a platform and a
window:

Message: No OpenGL Platforms found or requested
Message: No OpenGL Window systems found or requested

gst-libs/gst/gl/meson.build:948:2: ERROR: Problem encountered: GStreamer OpenGL integration required via options, but needed dependencies not found.

This requirement is already specified in Config.in through a simple
comment:

comment "The opengl library needs an API, a platform and a window system"
	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL

Fixes:
 - http://autobuild.buildroot.org/results/d171059801adf8dea1a2116d7c729a2aa5767ac8
 - http://autobuild.buildroot.org/results/b1bfa505bba534440d331c4948eea5eb2d165c97

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 21a29cbea2..108a19d7b0 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -38,19 +38,22 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dorc=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API),y)
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API)$(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM)$(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW),yyy)
 GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
 GST1_PLUGINS_BASE_GL_API_LIST = opengl
 GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
 endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
 GST1_PLUGINS_BASE_GL_API_LIST += gles2
 GST1_PLUGINS_BASE_DEPENDENCIES += libgles
 endif
-else
-GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
-endif
+
 GST1_PLUGINS_BASE_CONF_OPTS += -Dgl_api='$(subst $(space),$(comma),$(GST1_PLUGINS_BASE_GL_API_LIST))'
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX),y)
-- 
2.23.0
