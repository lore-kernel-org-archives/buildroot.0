From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Sep 2020 15:30:21 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 package/gstreamer1/gst1-plugins-base: gl needs api, platform and window
Message-ID: <20200925140153.F19668DF79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c6905b14d19f99e6f6fa2e134cae58387121325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 66e484a7514128552543262da7bfb4a7816436b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index fe80f4751c..f0c14bc190 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -51,19 +51,22 @@ else
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
