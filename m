From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2015 22:13:33 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: fix egl detection
Message-ID: <20150622201344.0A8C67FBFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bff865186434554e357ecdf6b2b3da4fd9cc2053
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some egl implementations needs special compiler flags or defines (E.G.
mesa3d for wayland needs to pass -DMESA_EGL_NO_X11_HEADERS to not try to
include X11 headers).  This is correctly included in the .pc file, but the
configure logic doesn't use pkg-config so help it along.

Likewise, some implementations may need to link against other libraries, so
also pass LIBS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index db323b9..faf0e2a 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -118,6 +118,9 @@ endif
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-egl
 GST1_PLUGINS_BAD_DEPENDENCIES += libegl
+GST1_PLUGINS_BAD_CONF_ENV += \
+	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
+	LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)"
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-egl
 endif
