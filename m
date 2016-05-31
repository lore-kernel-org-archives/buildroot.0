From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 22:43:08 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-fbturbo:
	needs dri2 for libump
Message-ID: <20160531204336.31DF681926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=509ce3a6ecca3ffb7da6e1d0545a2a88021c542e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xdriver_xf86-video-fbturbo has an optional dependency to libump
currently not handled by buildroot:
https://github.com/ssvb/xf86-video-fbturbo/blob/master/configure.ac#L91

If libump was compiled incidentally before xdriver_xf86-video-fbturbo
sunxi_mali_ump_dri2.c is compiled which depends on dri2:
https://github.com/ssvb/xf86-video-fbturbo/blob/master/src/Makefile.am#L59

This patch adds a dependency for dri2proto to enable dri2 support in
X.org and adds libump as dependency for a reproducable build to fix
http://autobuild.buildroot.net/results/656/656520682a5ac6fe5e1e741e1a92b1eab4245f2d/

[Peter: also add dri2proto to _DEPENDENCIES]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-fbturbo/Config.in                | 1 +
 .../xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk      | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/Config.in b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
index 8fec5c2..7825901 100644
--- a/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBTURBO
 	bool "xf86-video-fbturbo"
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_LIBUMP
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
index b2053d3..15f4cd1 100644
--- a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
@@ -26,6 +26,14 @@ else
 XDRIVER_XF86_VIDEO_FBTURBO_CONF_OPTS += --disable-pciaccess
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUMP),y)
+XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES += libump
+endif
+
+ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
+XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES += xproto_dri2proto
+endif
+
 define XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
 	$(INSTALL) -m 0644 -D $(@D)/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
 endef
