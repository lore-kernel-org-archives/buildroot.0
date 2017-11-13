From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 13 Nov 2017 19:48:58 +0100
Subject: [Buildroot] [PATCH v3 1/1] sunxi-mali-mainline: new package
Message-ID: <1510598938-29999-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Allwinner Mali openGL userspace driver r6p2.
Used combined with kernelspace Mali driver,
it gives possibility to use 3D openGL SoC acceleration.
It provides both fbdev and X11 libraries and headers.
It is compatible with Linux >= 4.4 as sunxi-mali-driver-mainline.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes v2 -> v3:
* added package into package/Config.in
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/sunxi-mali-mainline/Config.in              | 43 +++++++++++++++
 package/sunxi-mali-mainline/egl.pc                 | 12 +++++
 package/sunxi-mali-mainline/glesv2.pc              | 12 +++++
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 62 ++++++++++++++++++++++
 6 files changed, 131 insertions(+)
 create mode 100644 package/sunxi-mali-mainline/Config.in
 create mode 100644 package/sunxi-mali-mainline/egl.pc
 create mode 100644 package/sunxi-mali-mainline/glesv2.pc
 create mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2fe95c8..1a751b8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -697,6 +697,7 @@ F:	package/webp/
 
 N:	Giulio Benetti <giulio.benetti@micronovasrl.com>
 F:	package/sunxi-mali-driver-mainline/
+F:	package/sunxi-mali-mainline/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
diff --git a/package/Config.in b/package/Config.in
index 8de2227..041c6f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -497,6 +497,7 @@ endmenu
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali-driver-mainline/Config.in"
+	source "package/sunxi-mali-mainline/Config.in"
 	source "package/sunxi-mali/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
new file mode 100644
index 0000000..652cbc5
--- /dev/null
+++ b/package/sunxi-mali-mainline/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	bool "sunxi-mali-mainline"
+	depends on BR2_arm
+	depends on BR2_ARM_EABIHF
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
+	help
+	  Install the ARM Mali drivers for sunxi based systems (i.e
+	  systems based on ARM Allwinner SoCs). This driver requires
+	  either the sunxi-kernel with the ARM Mali driver enabled or
+	  the installation of the ARM Mali drivers as an external
+	  module.
+
+if BR2_PACKAGE_SUNXI_MALI_MAINLINE
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "sunxi-mali-mainline"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "sunxi-mali-mainline"
+
+choice
+	prompt "Version"
+	default BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
+	help
+	  Select the version of the kernel module.
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
+	bool "r6p2"
+
+endchoice
+
+endif
+
+comment "sunxi-mali needs an EABIhf glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/sunxi-mali-mainline/egl.pc b/package/sunxi-mali-mainline/egl.pc
new file mode 100644
index 0000000..3854e5f
--- /dev/null
+++ b/package/sunxi-mali-mainline/egl.pc
@@ -0,0 +1,12 @@
+prefix=/usr/
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: egl
+Description: ARM Mali implementation of EGL
+Version: 1.4
+Requires:
+Libs: -L${libdir} -lEGL -lGLESv2
+Cflags: -I${includedir}
+
diff --git a/package/sunxi-mali-mainline/glesv2.pc b/package/sunxi-mali-mainline/glesv2.pc
new file mode 100644
index 0000000..6910b46
--- /dev/null
+++ b/package/sunxi-mali-mainline/glesv2.pc
@@ -0,0 +1,12 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: glesv2
+Description: ARM Mali implementation of OpenGL ESv2
+Version: 2.0
+Requires:
+Libs: -L${libdir} -lGLESv2 -lGLESv1_CM
+Cflags: -I${includedir}
+
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
new file mode 100644
index 0000000..6540b2c
--- /dev/null
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# sunxi-mali-mainline
+#
+################################################################################
+
+SUNXI_MALI_MAINLINE_VERSION = cb3e8ece9b2c3a70cbeb3204cd6f30eceaa32023
+SUNXI_MALI_MAINLINE_SITE = $(call github,free-electrons,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
+SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
+SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
+
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2),y)
+SUNXI_MALI_LIB_VER=r6p2
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+SUNXI_MALI_MAINLINE_DEPENDENCIES += xlib_libX11 xlib_libXfixes \
+				    xlib_libXext xlib_libXdamage libdrm
+endif
+
+define SUNXI_MALI_MAINLINE_BUILD_CMDS
+endef
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
+	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/x11_dma_buf/lib_x11_dma_buf/* \
+		$(STAGING_DIR)/usr/lib
+	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/x11_ump/include/* \
+		$(STAGING_DIR)/usr/include/
+
+	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+endef
+else
+define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
+	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/fbdev/lib/lib_fb_dev/* \
+		$(STAGING_DIR)/usr/lib/
+	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/fbdev/include/* \
+		$(STAGING_DIR)/usr/include/
+
+	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
+	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/x11_dma_buf/lib_x11_dma_buf/* \
+		$(TARGET_DIR)/usr/lib
+endef
+else
+define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
+	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/fbdev/lib/lib_fb_dev/* \
+		$(TARGET_DIR)/usr/lib/
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.7.4
