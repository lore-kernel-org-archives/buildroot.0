From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri,  6 Mar 2020 08:14:34 +0100
Subject: [Buildroot] [PATCH 1/7] package/sunxi-mali-utgard: rename from
 sunxi-mali-mainline
In-Reply-To: <20200306071440.30433-1-miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
Message-ID: <20200306071440.30433-2-miquel.raynal@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides Mali libraries for Sunxi Mali Utgard GPUs. The
trailing -mainline is historical and was used at a time when there was
two packages providing these libraries. The "non-upstream" package has
been removed some time ago so before adding new packages bringing
support for other ARM Mali GPU versions or implementations, rename
sunxi-mali-mainline into sunxi-mali-utgard.

Add a legacy entry.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Config.in.legacy                              | 30 ++++++++++++
 DEVELOPERS                                    |  2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig  |  2 +-
 configs/olimex_a20_olinuxino_lime_defconfig   |  2 +-
 docs/manual/adding-packages-virtual.txt       |  2 +-
 package/Config.in                             |  2 +-
 package/glslsandbox-player/Config.in          |  4 +-
 .../glslsandbox-player/glslsandbox-player.mk  |  2 +-
 package/qt5/qt5base/qt5base.mk                |  2 +-
 package/sunxi-mali-mainline/Config.in         | 42 ----------------
 .../sunxi-mali-mainline.mk                    | 49 -------------------
 package/sunxi-mali-utgard/Config.in           | 43 ++++++++++++++++
 .../egl.pc                                    |  0
 .../glesv2.pc                                 |  0
 .../sunxi-mali-utgard.hash}                   |  2 +-
 .../sunxi-mali-utgard/sunxi-mali-utgard.mk    | 49 +++++++++++++++++++
 16 files changed, 132 insertions(+), 101 deletions(-)
 delete mode 100644 package/sunxi-mali-mainline/Config.in
 delete mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk
 create mode 100644 package/sunxi-mali-utgard/Config.in
 rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/egl.pc (100%)
 rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/glesv2.pc (100%)
 rename package/{sunxi-mali-mainline/sunxi-mali-mainline.hash => sunxi-mali-utgard/sunxi-mali-utgard.hash} (70%)
 create mode 100644 package/sunxi-mali-utgard/sunxi-mali-utgard.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 6a33ce9e1c..295b1c6003 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,36 @@ endif
 
 ###############################################################################
 
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	bool "sunxi-mali-mainline package was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD
+	help
+	  Since the removal of the sunxi-mali package, the
+	  sunxi-mali-mainline package that coexisted became the only
+	  package to provide Mali blobs. The "-mainline" suffix being
+	  undescriptive nowadays and before adding new packages bringing
+	  Mali support for other SoCs/GPU flavors, it is clearer to
+	  rename it SUNXI_MALI_UTGARD.
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
+	bool "sunxi-mali-mainline-r6p2 was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	help
+	  The sunxi-mali-mainline package has been renamed
+	  sunxi-mali-utgard, the suboptions of this package have also
+	  been renamed accordingly.
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
+	bool "sunxi-mali-mainline-r8p1 was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
+	help
+	  The sunxi-mali-mainline package has been renamed
+	  sunxi-mali-utgard, the suboptions of this package have also
+	  been renamed accordingly.
+
 comment "Legacy options removed in 2020.02"
 
 config BR2_PACKAGE_QT5_VERSION_5_6
diff --git a/DEVELOPERS b/DEVELOPERS
index dd44331b85..289fa9077d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1013,7 +1013,7 @@ F:	package/libnspr/
 F:	package/libnss/
 F:	package/minicom/
 F:	package/nfs-utils/
-F:	package/sunxi-mali-mainline/
+F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-mainline-driver/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 21b681a1fb..02865d3c8c 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -27,7 +27,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
 
 # Filesystem
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 029f9ebad3..58a468aabf 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -27,7 +27,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
 
 # Filesystem
diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
index 6326bb5455..722e6e3771 100644
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -13,7 +13,7 @@ the provider used in the rootfs.
 For example, 'OpenGL ES' is an API for 2D and 3D graphics on embedded systems.
 The implementation of this API is different for the 'Allwinner Tech Sunxi' and
 the 'Texas Instruments OMAP35xx' platforms. So +libgles+ will be a virtual
-package and +sunxi-mali+ and +ti-gfx+ will be the providers.
+package and +sunxi-mali-utgard+ and +ti-gfx+ will be the providers.
 
 ==== +virtual-package+ tutorial
 
diff --git a/package/Config.in b/package/Config.in
index dfa3f34b9d..aa57d34f96 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -538,8 +538,8 @@ endmenu
 	source "package/statserial/Config.in"
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
-	source "package/sunxi-mali-mainline/Config.in"
 	source "package/sunxi-mali-mainline-driver/Config.in"
+	source "package/sunxi-mali-utgard/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index dc0d2c07f1..ebd59521fc 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -55,7 +55,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 
 choice
 	prompt "Native windowing system"
-	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_UTGARD
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX if BR2_PACKAGE_TI_SGX_UM
@@ -71,7 +71,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
 
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
 	bool "Allwinner ARM/Mali Frame Buffer"
-	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD
 
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI
 	bool "RaspberryPI Frame Buffer"
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 5ace69d7dd..9b06ee4f05 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -42,7 +42,7 @@ ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
-GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-mainline
+GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-utgard
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=mali
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += rpi-userland
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 774c771bc9..72d18b87da 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -312,7 +312,7 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
-else ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
+else ifeq ($(BR2_PACKAGE_SUNXI_MALI_UTGARD),y)
 # use mali backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
 endif
diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
deleted file mode 100644
index a2fb95bd79..0000000000
--- a/package/sunxi-mali-mainline/Config.in
+++ /dev/null
@@ -1,42 +0,0 @@
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE
-	bool "sunxi-mali-mainline"
-	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	help
-	  Install userspace Allwinner OpenGL libraries.
-
-	  https://github.com/bootlin/mali-blobs
-
-if BR2_PACKAGE_SUNXI_MALI_MAINLINE
-
-config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "sunxi-mali-mainline"
-
-config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "sunxi-mali-mainline"
-
-choice
-	prompt "Version"
-	default BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
-	help
-	  Select the version of the userspace module.
-
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
-	bool "r6p2"
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
-	bool "r8p1"
-
-endchoice
-
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION
-	string
-	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
-	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
-
-endif
-
-comment "sunxi-mali needs an EABIhf glibc toolchain"
-	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
deleted file mode 100644
index 701a1fbbb4..0000000000
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ /dev/null
@@ -1,49 +0,0 @@
-################################################################################
-#
-# sunxi-mali-mainline
-#
-################################################################################
-
-SUNXI_MALI_MAINLINE_VERSION = d691cb93884ca8ac67860502117bbec283dc19aa
-SUNXI_MALI_MAINLINE_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
-SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
-SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
-SUNXI_MALI_MAINLINE_LICENSE = Allwinner End User Licence Agreement
-SUNXI_MALI_MAINLINE_EULA_ORIGINAL = EULA\ for\ Mali\ 400MP\ _AW.pdf
-SUNXI_MALI_MAINLINE_EULA_NO_SPACES = EULA_for_Mali_400MP_AW.pdf
-SUNXI_MALI_MAINLINE_LICENSE_FILES = $(SUNXI_MALI_MAINLINE_EULA_NO_SPACES)
-
-SUNXI_MALI_MAINLINE_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION))
-
-ifeq ($(BR2_arm),y)
-SUNXI_MALI_MAINLINE_ARCH=arm
-else ifeq ($(BR2_aarch64),y)
-SUNXI_MALI_MAINLINE_ARCH=arm64
-endif
-
-define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
-
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
-		$(STAGING_DIR)/usr/lib/
-	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
-
-	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
-	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
-endef
-
-define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
-		$(TARGET_DIR)/usr/lib/
-endef
-
-define SUNXI_MALI_MAINLINE_FIXUP_LICENSE_FILE
-	mv $(@D)/$(SUNXI_MALI_MAINLINE_EULA_ORIGINAL) $(@D)/$(SUNXI_MALI_MAINLINE_EULA_NO_SPACES)
-endef
-
-SUNXI_MALI_MAINLINE_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_FIXUP_LICENSE_FILE
-
-$(eval $(generic-package))
diff --git a/package/sunxi-mali-utgard/Config.in b/package/sunxi-mali-utgard/Config.in
new file mode 100644
index 0000000000..ff49ea03f1
--- /dev/null
+++ b/package/sunxi-mali-utgard/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_SUNXI_MALI_UTGARD
+	bool "sunxi-mali-utgard"
+	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	help
+	  Install userspace Allwinner OpenGL libraries for Mali
+	  Utgard GPUs.
+
+	  https://github.com/bootlin/mali-blobs
+
+if BR2_PACKAGE_SUNXI_MALI_UTGARD
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "sunxi-mali-utgard"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "sunxi-mali-utgard"
+
+choice
+	prompt "Version"
+	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	help
+	  Select the version of the userspace module.
+
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	bool "r6p2"
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
+	bool "r8p1"
+
+endchoice
+
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION
+	string
+	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
+
+endif
+
+comment "sunxi-mali-utgard needs an EABIhf glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/sunxi-mali-mainline/egl.pc b/package/sunxi-mali-utgard/egl.pc
similarity index 100%
rename from package/sunxi-mali-mainline/egl.pc
rename to package/sunxi-mali-utgard/egl.pc
diff --git a/package/sunxi-mali-mainline/glesv2.pc b/package/sunxi-mali-utgard/glesv2.pc
similarity index 100%
rename from package/sunxi-mali-mainline/glesv2.pc
rename to package/sunxi-mali-utgard/glesv2.pc
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash b/package/sunxi-mali-utgard/sunxi-mali-utgard.hash
similarity index 70%
rename from package/sunxi-mali-mainline/sunxi-mali-mainline.hash
rename to package/sunxi-mali-utgard/sunxi-mali-utgard.hash
index 978be01024..528699126e 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
+++ b/package/sunxi-mali-utgard/sunxi-mali-utgard.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 72969ecf470b9e5ce787c2f8f36242926e1e892af0891924ee59a2cd206de39f  sunxi-mali-mainline-d691cb93884ca8ac67860502117bbec283dc19aa.tar.gz
+sha256 72969ecf470b9e5ce787c2f8f36242926e1e892af0891924ee59a2cd206de39f  sunxi-mali-utgard-d691cb93884ca8ac67860502117bbec283dc19aa.tar.gz
 sha256 8a06bcae44a41a886f339b4338422415a786787f113e9ed6456ae117104a0b6a  EULA_for_Mali_400MP_AW.pdf
diff --git a/package/sunxi-mali-utgard/sunxi-mali-utgard.mk b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
new file mode 100644
index 0000000000..edbe81e62c
--- /dev/null
+++ b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# sunxi-mali-utgard
+#
+################################################################################
+
+SUNXI_MALI_UTGARD_VERSION = d691cb93884ca8ac67860502117bbec283dc19aa
+SUNXI_MALI_UTGARD_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_UTGARD_VERSION))
+SUNXI_MALI_UTGARD_INSTALL_STAGING = YES
+SUNXI_MALI_UTGARD_PROVIDES = libegl libgles
+SUNXI_MALI_UTGARD_LICENSE = Allwinner End User Licence Agreement
+SUNXI_MALI_UTGARD_EULA_ORIGINAL = EULA\ for\ Mali\ 400MP\ _AW.pdf
+SUNXI_MALI_UTGARD_EULA_NO_SPACES = EULA_for_Mali_400MP_AW.pdf
+SUNXI_MALI_UTGARD_LICENSE_FILES = $(SUNXI_MALI_UTGARD_EULA_NO_SPACES)
+
+SUNXI_MALI_UTGARD_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION))
+
+ifeq ($(BR2_arm),y)
+SUNXI_MALI_UTGARD_ARCH=arm
+else ifeq ($(BR2_aarch64),y)
+SUNXI_MALI_UTGARD_ARCH=arm64
+endif
+
+define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
+
+	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
+		$(STAGING_DIR)/usr/lib/
+	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
+
+	$(INSTALL) -D -m 0644 package/sunxi-mali-utgard/egl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 package/sunxi-mali-utgard/glesv2.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+endef
+
+define SUNXI_MALI_UTGARD_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
+		$(TARGET_DIR)/usr/lib/
+endef
+
+define SUNXI_MALI_UTGARD_FIXUP_LICENSE_FILE
+	mv $(@D)/$(SUNXI_MALI_UTGARD_EULA_ORIGINAL) $(@D)/$(SUNXI_MALI_UTGARD_EULA_NO_SPACES)
+endef
+
+SUNXI_MALI_UTGARD_POST_PATCH_HOOKS += SUNXI_MALI_UTGARD_FIXUP_LICENSE_FILE
+
+$(eval $(generic-package))
-- 
2.20.1
