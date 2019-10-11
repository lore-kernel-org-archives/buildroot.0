From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2019 23:58:41 +0200
Subject: [Buildroot] [git commit] package/gstreamer1: gl enabled when either
 GL or GLES2 is present
Message-ID: <20191011215817.D54748D4E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4164d31e058345949ab759fb08beaf63f18888e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building gst1-plugins-base with GL support on the rpi3 (which
supports only GLES2, not full desktop GL), GStreamer was being asked to
disable its GL support completely. This isn't correct since it can be
used with either GL or GLES2. There is already a Config.in symbol to
indicate that either of them is enabled:
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API. So use that to
determine if gl should be enabled or disabled.

While we're at it, also move the GL/GLES handling under the same API
condition. This makes it clearer that they belong together.

Signed-off-by: Charlie Turner <cturner@igalia.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
[Arnout: refactor using
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 91b5637316..21a29cbea2 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -38,18 +38,19 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dorc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
 GST1_PLUGINS_BASE_GL_API_LIST = opengl
-GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
 GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
-else
-GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
 endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
 GST1_PLUGINS_BASE_GL_API_LIST += gles2
 GST1_PLUGINS_BASE_DEPENDENCIES += libgles
 endif
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
+endif
 GST1_PLUGINS_BASE_CONF_OPTS += -Dgl_api='$(subst $(space),$(comma),$(GST1_PLUGINS_BASE_GL_API_LIST))'
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX),y)
