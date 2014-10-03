From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  3 Oct 2014 14:43:29 +0200
Subject: [Buildroot] [PATCH 08/11] xdriver_xf86-video-imx-viv: new package
In-Reply-To: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
Message-ID: <1412340212-3089-9-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xorg driver for imx6. Inspired from Yocto project.

I did not find any problem, but notice Yocto project force Xorg xserver
1.14.4 while we use 1.16.

Notice Vivante driver should be able to provide Desktop OpenGL implementation.
However, this feature seems broken for a while. Yocto use Mesa3D/swraster
to provide Desktop OpenGL API.

Tested with:
    subsequent qt5base and libdrm fixes +
    QMX6 board +
    BR2_ARM_EABIHF= both tested
    BR2_ARM_ENABLE_NEON=y
    BR2_ARM_FPU_NEON=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
    BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_GIT=y
    BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
    BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9bafbcba67f7bb2a48a5e05998cecb1165aa444f"
    BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
    BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
    BR2_LINUX_KERNEL_DTS_SUPPORT=y
    BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-qmx6"
    BR2_PACKAGE_QT5=y
    BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
    BR2_PACKAGE_QT5BASE_EXAMPLES=y
    BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
    BR2_PACKAGE_QT5BASE_XCB=y
    BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
    BR2_PACKAGE_QT5BASE_GIF=y
    BR2_PACKAGE_QT5BASE_JPEG=y
    BR2_PACKAGE_QT5BASE_PNG=y
    BR2_PACKAGE_QT5QUICKCONTROLS=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_XSERVER_XORG_SERVER=y
    BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
    BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
    BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV=y
    BR2_PACKAGE_FREESCALE_IMX=y
    BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
    BR2_PACKAGE_GPU_VIV_BIN_MX6Q=y
    BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES=y

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 31 +++++++++++++++++++++
 ...xf86-video-imx-viv-0001-Fix-LoadExtenions.patch | 15 ++++++++++
 .../xdriver_xf86-video-imx-viv.mk                  | 32 ++++++++++++++++++++++
 4 files changed, 79 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-0001-Fix-LoadExtenions.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 1979a13..1e1fa52 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -161,6 +161,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-glide/Config.in
 		source package/x11r7/xdriver_xf86-video-glint/Config.in
 		source package/x11r7/xdriver_xf86-video-i128/Config.in
+		source package/x11r7/xdriver_xf86-video-imx-viv/Config.in
 		source package/x11r7/xdriver_xf86-video-intel/Config.in
 		source package/x11r7/xdriver_xf86-video-mach64/Config.in
 		source package/x11r7/xdriver_xf86-video-mga/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
new file mode 100644
index 0000000..17edb5f
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
@@ -0,0 +1,31 @@
+if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
+	bool "xf86-video-imx-viv"
+	depends on BR2_arm
+	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-viv-bin-m6q
+	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	help
+	  X.Org driver for iMX6 GPU (Vivante)
+
+	  To use this driver, add correct configuration to your
+	  /etc/X11/xorg.conf:
+
+	  Section "Device"
+	    [...]
+	    Driver          "vivante"
+	    Option          "vivante_fbdev" "/dev/fbX"
+	  EndSection
+
+	  Don't forget to load galcore.ko create /dev/galcore before to
+	  use this driver (else, Xorg will exit with an obscur message
+	  like "Segmentation fault at address 0xc").
+
+comment "xf86-video-imx-viv needs an (e)glibc toolchain and gpu-viv-bin-mx6q with X11 output"
+	depends on BR2_arm
+	depends on (!BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11)
+
+endif
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-0001-Fix-LoadExtenions.patch b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-0001-Fix-LoadExtenions.patch
new file mode 100644
index 0000000..3e2d47c
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-0001-Fix-LoadExtenions.patch
@@ -0,0 +1,15 @@
+Fix compilation with Xorg xserver 1.16.
+
+Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+
+--- a/EXA/src/vivante_fbdev/vivante_fbdev_driver.c	2014-07-25 15:38:24.000000000 +0200
++++ b/EXA/src/vivante_fbdev/vivante_fbdev_driver.c	2014-10-02 21:00:58.755409342 +0200
+@@ -261,7 +261,7 @@
+         setupDone = TRUE;
+         xf86AddDriver(&FBDEV, module, HaveDriverFuncs);
+         if(gVivFb)
+-            LoadExtension(&VIVExt, FALSE);
++            LoadExtensionList(&VIVExt, 1, FALSE);
+ 		return (pointer)1;
+     } else {
+         if (errmaj) *errmaj = LDR_ONCEONLY;
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
new file mode 100644
index 0000000..0a62110
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# xdriver_xf86-video-imx-viv
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = $(FREESCALE_IMX_VERSION)
+XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
+XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
+XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = gpu-viv-bin-mx6q xserver_xorg-server \
+	xproto_xproto xproto_xf86driproto
+XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING = YES
+XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD = $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/EXA/src -f makefile.linux
+
+define XDRIVER_XF86_VIDEO_IMX_VIV_BUILD_CMDS
+	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) sysroot=$(STAGING_DIR) \
+		BUSID_HAS_NUMBER=1 BUILD_IN_YOCTO=1 XSERVER_GREATER_THAN_13=1 \
+		CFLAGS+="$(TARGET_CFLAGS) -I$(@D)/DRI_1.10.4/src"
+endef
+
+define XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING_CMDS
+	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) prefix=$(STAGING_DIR)/usr install
+	$(INSTALL) -m 644 $(@D)/EXA/src/vivante_gal/vivante_priv.h $(STAGING_DIR)/usr/include
+	$(INSTALL) -m 644 $(@D)/EXA/src/vivante_gal/vivante_gal.h $(STAGING_DIR)/usr/include
+endef
+
+define XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_TARGET_CMDS
+	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) prefix=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
+
-- 
2.1.0
