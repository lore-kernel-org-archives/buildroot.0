From: FanChengPing <vancepym@outlook.com>
Date: Mon, 13 Jul 2015 22:14:05 +0800
Subject: [Buildroot] [PATCH 2/3] xdriver_xf86-video-fbturbo: new package
In-Reply-To: <1436796846-9358-1-git-send-email-fancp2007@gmail.com>
References: <1436796846-9358-1-git-send-email-fancp2007@gmail.com>
Message-ID: <BLU437-SMTP105D7F60E35A7E07E665978C79C0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the fbturbo video driver, which is based on xf86-video-fbdev (with
none of the original features stripped), primarily optimized for the
devices powered by the Allwinner SoC (A10, A13, A20).

https://github.com/ssvb/xf86-video-fbturbo/

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-fbturbo/Config.in | 57 ++++++++++++++++++++++
 .../xdriver_xf86-video-fbturbo.mk                  | 19 ++++++++
 3 files changed, 77 insertions(+)
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
index 0000000..748403f
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
@@ -0,0 +1,57 @@
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
+	  And because this driver is based on xf86-video-fbdev (with none of the
+	  original features stripped), it actually supports all the same hardware
+	  as xf86-video-fbdev. Essentially, xf86-video-fbturbo can be just used as
+	  a drop-in replacement and run on practically any Linux system. There will
+	  be no real difference on x86, but any ARM based system should see better
+	  performance thanks to some additional optimizations (the elimination of
+	  ShadowFB layer, ARM NEON/VFP code for dealing with uncached framebuffer
+	  reads, automatic backing store management for faster window moves).
+
+	  == 2D graphics acceleration features ==
+
+	  Hardware accelerated window moving/scrolling on Allwinner A10/A20 (using the
+	  G2D Mixer Processor).
+
+	  Hardware accelerated window moving/scrolling on Raspberry Pi (using the BCM2835
+	  DMA Controller)
+
+	  == 3D graphics acceleration features ==
+
+	  First a disclaimer to prevent any possible misunderstanding. The Xorg DDX
+	  drivers (neither this one, nor the others) do not do any actual 3D acceleration
+	  by themselves. They are nothing else but just a glue between the 3D drivers
+	  and the X11 window system. Still a poorly implemented glue can easily become
+	  the source of major performance problems. So it's important to do it right.
+
+	  This DDX driver provides integration for Mali 400 GPU into Xorg. Any device
+	  with Mali 400 should have a properly working OpenGL ES 2.0 acceleration if
+	  it has Mali/UMP modules in the Linux kernel and libMali.so proprietary
+	  binary blob installed in the system. Additionally, the hardware overlay
+	  feature of Allwinner A10/A13/A20 display controller allows to support
+	  zero-copy OpenGL ES buffer flipping without tearing. The rest of the
+	  devices with Mali 400 hardware (Exynos4, Rockchip, ...) are expected to
+	  have roughly the same 3D performance as when using the reference vendor
+	  provided Xorg DDX driver xf86-video-mali.
+
+	  == Video acceleration features ==
+
+	  XV overlay is supported on Allwinner A10/A13/A20.
+
+	  == Installation instructions ==
+
+	  https://github.com/ssvb/xf86-video-fbturbo/wiki/Installation
+
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
new file mode 100644
index 0000000..95a8e86
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
@@ -0,0 +1,19 @@
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
+XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto xproto_xf86driproto libdri2
+
+define XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
+        $(INSTALL) -m 0644 -D $(@D)/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
+endef
+
+XDRIVER_XF86_VIDEO_FBTURBO_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
+
+$(eval $(autotools-package))
-- 
2.4.5
