From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 25 Nov 2017 23:22:49 +0100
Subject: [Buildroot] [PATCH 2/2] sunxi-mali-mainline: new package
In-Reply-To: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
References: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <1511648569-18855-2-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Allwinner Mali openGL userspace driver r6p2.
Used combined with kernelspace Mali driver,
it gives possibility to use 3D openGL SoC acceleration.
It provides fbdev libraries and headers.
It is compatible with Linux >= 4.4 as sunxi-mali-driver-mainline.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/sunxi-mali-mainline/Config.in              | 36 ++++++++++++++++++++++
 package/sunxi-mali-mainline/egl.pc                 | 12 ++++++++
 package/sunxi-mali-mainline/glesv2.pc              | 12 ++++++++
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 33 ++++++++++++++++++++
 6 files changed, 95 insertions(+)
 create mode 100644 package/sunxi-mali-mainline/Config.in
 create mode 100644 package/sunxi-mali-mainline/egl.pc
 create mode 100644 package/sunxi-mali-mainline/glesv2.pc
 create mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 60a934e..b26706b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -700,6 +700,7 @@ F:	package/webp/
 
 N:	Giulio Benetti <giulio.benetti@micronovasrl.com>
 F:	package/sunxi-mali-driver-mainline/
+F:	package/sunxi-mali-mainline/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
diff --git a/package/Config.in b/package/Config.in
index e619992..dc0d8d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -497,6 +497,7 @@ endmenu
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali/Config.in"
+	source "package/sunxi-mali-mainline/Config.in"
 	source "package/sunxi-mali-driver-mainline/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
new file mode 100644
index 0000000..3bf5a8d
--- /dev/null
+++ b/package/sunxi-mali-mainline/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	bool "sunxi-mali-mainline"
+	depends on BR2_arm
+	depends on BR2_ARM_EABIHF
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	help
+	  Install userspace Allwinner OpenGL libraries.
+	
+	  https://github.com/free-electrons/mali-blobs
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
+	  Select the version of the userspace module.
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
index 0000000..1f7c05c
--- /dev/null
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -0,0 +1,33 @@
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
+
+define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
+	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/fbdev/lib/lib_fb_dev/* \
+		$(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
