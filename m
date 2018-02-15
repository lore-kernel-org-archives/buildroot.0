From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 21:33:32 +0100
Subject: [Buildroot] [git commit branch/next] sunxi-mali-mainline: new
 package
Message-ID: <20180215210545.26F1887429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e469bb64641e510f7ebae4b31e537e3997fa6ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add Allwinner Mali openGL userspace driver r6p2.
Used combined with kernelspace Mali driver,
it gives possibility to use 3D openGL SoC acceleration.
It provides fbdev libraries and headers.
It is compatible with Linux >= 4.4 as sunxi-mali-driver-mainline.

[Peter: Move version logic to Config.in, ensure directories exists]
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Reviewed-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 package/sunxi-mali-mainline/Config.in              | 40 ++++++++++++++++++++++
 package/sunxi-mali-mainline/egl.pc                 | 12 +++++++
 package/sunxi-mali-mainline/glesv2.pc              | 12 +++++++
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 34 ++++++++++++++++++
 6 files changed, 102 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 293bd73797..1b14927228 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -730,6 +730,9 @@ F:	package/ocrad/
 F:	package/tesseract-ocr/
 F:	package/webp/
 
+N:	Giulio Benetti <giulio.benetti@micronovasrl.com>
+F:	package/sunxi-mali-mainline/
+
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
 F:	package/gengetopt/
diff --git a/package/Config.in b/package/Config.in
index 19dda8aad9..87c55e227b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -504,6 +504,7 @@ endmenu
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali/Config.in"
+	source "package/sunxi-mali-mainline/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
new file mode 100644
index 0000000000..759bed86ba
--- /dev/null
+++ b/package/sunxi-mali-mainline/Config.in
@@ -0,0 +1,40 @@
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
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION
+	string
+	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
+
+endif
+
+comment "sunxi-mali needs an EABIhf glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/sunxi-mali-mainline/egl.pc b/package/sunxi-mali-mainline/egl.pc
new file mode 100644
index 0000000000..3854e5ff58
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
index 0000000000..6910b46a70
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
index 0000000000..933e2beb0d
--- /dev/null
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -0,0 +1,34 @@
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
+SUNXI_MALI_MAINLINE_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION))
+
+define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
+
+	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/fbdev/lib/lib_fb_dev/* \
+		$(STAGING_DIR)/usr/lib/
+	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/fbdev/include/* \
+		$(STAGING_DIR)/usr/include/
+
+	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+endef
+
+define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/fbdev/lib/lib_fb_dev/* \
+		$(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
