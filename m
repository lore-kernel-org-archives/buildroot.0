From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 31 Jul 2015 00:59:07 +0200
Subject: [Buildroot] [PATCH 3/3 v2] xdriver_xf86-video-fbturbo: new package
In-Reply-To: <cover.1438297123.git.yann.morin.1998@free.fr>
References: <cover.1438297123.git.yann.morin.1998@free.fr>
Message-ID: <1717e338b9d4e5998366a2d5f11897749a546ca1.1438297123.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Scott Fan <fancp2007@gmail.com>

Add the fbturbo video driver, which is based on xf86-video-fbdev (with
none of the original features stripped), primarily optimized for the
devices powered by the Allwinner SoC (A10, A13, A20).

https://github.com/ssvb/xf86-video-fbturbo/

Signed-off-by: Scott Fan <fancp2007@gmail.com>
[yann.morin.1998 at free.fr: strip help text to the basics only]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/Config.in                             |  1 +
 package/x11r7/xdriver_xf86-video-fbturbo/Config.in  | 16 ++++++++++++++++
 .../xdriver_xf86-video-fbturbo.mk                   | 21 +++++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-fbturbo/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk

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
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/Config.in b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
new file mode 100644
index 0000000..cab12d2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBTURBO
+	bool "xf86-video-fbturbo"
+	select BR2_PACKAGE_LIBDRI2
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
+
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
new file mode 100644
index 0000000..18f80d5
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
@@ -0,0 +1,21 @@
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
+XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
+
+XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES += xproto_xf86driproto libdri2
+
+define XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
+        $(INSTALL) -m 0644 -D $(@D)/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
+endef
+
+XDRIVER_XF86_VIDEO_FBTURBO_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
+
+$(eval $(autotools-package))
-- 
1.9.1
