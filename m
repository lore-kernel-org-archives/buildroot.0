From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 19:38:22 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-fbturbo: new package
Message-ID: <20151003173945.E8E9580DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00e7d4089a72bfe1eb5294edb5c7f43a772902d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the fbturbo video driver, which is based on xf86-video-fbdev (with
none of the original features stripped), primarily optimized for the
devices powered by the Allwinner SoC (A10, A13, A20).

https://github.com/ssvb/xf86-video-fbturbo/

Signed-off-by: Scott Fan <fancp2007@gmail.com>
[yann.morin.1998 at free.fr: strip help text to the basics only]
[Peter: needs libdrm/pixman, add patch to drop libdri2 dependency
	reformat and add optional libpciaccess support]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/Config.in                            |    1 +
 ...0001-sunxi_x_g2d-drop-unused-dri2-include.patch |   28 ++++++++++++++++
 package/x11r7/xdriver_xf86-video-fbturbo/Config.in |   16 +++++++++
 .../xdriver_xf86-video-fbturbo.mk                  |   35 ++++++++++++++++++++
 4 files changed, 80 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 859e895..4e996fc 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -162,6 +162,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-cirrus/Config.in
 		source package/x11r7/xdriver_xf86-video-dummy/Config.in
 		source package/x11r7/xdriver_xf86-video-fbdev/Config.in
+		source package/x11r7/xdriver_xf86-video-fbturbo/Config.in
 		source package/x11r7/xdriver_xf86-video-geode/Config.in
 		source package/x11r7/xdriver_xf86-video-glide/Config.in
 		source package/x11r7/xdriver_xf86-video-glint/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/0001-sunxi_x_g2d-drop-unused-dri2-include.patch b/package/x11r7/xdriver_xf86-video-fbturbo/0001-sunxi_x_g2d-drop-unused-dri2-include.patch
new file mode 100644
index 0000000..8b4e817
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/0001-sunxi_x_g2d-drop-unused-dri2-include.patch
@@ -0,0 +1,28 @@
+From 232c5b6924652f65ef5c047754e84b87b5fc6ac8 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sat, 3 Oct 2015 19:01:38 +0200
+Subject: [PATCH] sunxi_x_g2d: drop unused dri2 include
+
+The driver doesn't use DRI for anything.
+
+[Upstream-status: submitted (https://github.com/ssvb/xf86-video-fbturbo/pull/45)]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/sunxi_x_g2d.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/sunxi_x_g2d.c b/src/sunxi_x_g2d.c
+index d826027..8888abe 100644
+--- a/src/sunxi_x_g2d.c
++++ b/src/sunxi_x_g2d.c
+@@ -31,7 +31,6 @@
+ #include "xf86_OSproc.h"
+ #include "xf86.h"
+ #include "xf86drm.h"
+-#include "dri2.h"
+ #include "damage.h"
+ #include "fb.h"
+ #include "gcstruct.h"
+-- 
+2.1.4
+
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/Config.in b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
new file mode 100644
index 0000000..8fec5c2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBTURBO
+	bool "xf86-video-fbturbo"
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	help
+	  video driver, primarily optimized for the devices powered
+	  by the Allwinner SoC (A10, A13, A20). It can use some of
+	  the 2D/3D hardware acceleration features.
+
+	  https://github.com/ssvb/xf86-video-fbturbo
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
new file mode 100644
index 0000000..991b00e
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# xdriver_xf86-video-fbturbo
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_FBTURBO_VERSION = 0.4.0
+XDRIVER_XF86_VIDEO_FBTURBO_SITE = $(call github,ssvb,xf86-video-fbturbo,$(XDRIVER_XF86_VIDEO_FBTURBO_VERSION))
+XDRIVER_XF86_VIDEO_FBTURBO_LICENSE = MIT
+XDRIVER_XF86_VIDEO_FBTURBO_LICENSE_FILES = COPYING
+XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES = \
+	xserver_xorg-server \
+	libdrm \
+	pixman \
+	xproto_fontsproto \
+	xproto_randrproto \
+	xproto_renderproto \
+	xproto_videoproto \
+	xproto_xproto \
+	xproto_xf86driproto
+
+ifeq ($(BR2_PACKAGE_LIBPCIACCESS),y)
+XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES += libpciaccess
+XDRIVER_XF86_VIDEO_FBTURBO_CONF_OPTS += --enable-pciaccess
+else
+XDRIVER_XF86_VIDEO_FBTURBO_CONF_OPTS += --disable-pciaccess
+endif
+
+define XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
+        $(INSTALL) -m 0644 -D $(@D)/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
+endef
+
+XDRIVER_XF86_VIDEO_FBTURBO_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
+
+$(eval $(autotools-package))
