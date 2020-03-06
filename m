From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri,  6 Mar 2020 08:14:35 +0100
Subject: [Buildroot] [PATCH 2/7] package/sunxi-mali-utgard-driver: rename
 from sunxi-mali-mainline-driver
In-Reply-To: <20200306071440.30433-1-miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
Message-ID: <20200306071440.30433-3-miquel.raynal@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides a Mali kernel driver for Sunxi Mali Utgard GPUs. The
trailing -mainline is historical and was used at a time when there was
two packages providing this driver. The "non-upstream" package has
been removed some time ago so before adding new packages bringing
support for other ARM Mali GPU versions or implementations, rename
sunxi-mali-mainline-driver into sunxi-mali-utgard-driver.

Add a legacy entry.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Config.in.legacy                              | 18 +++++-----
 DEVELOPERS                                    |  2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig  |  2 +-
 configs/olimex_a20_olinuxino_lime_defconfig   |  2 +-
 linux/linux.mk                                |  2 +-
 package/Config.in                             |  2 +-
 package/sunxi-mali-mainline-driver/Config.in  | 25 -------------
 .../sunxi-mali-mainline-driver.mk             | 35 -------------------
 package/sunxi-mali-utgard-driver/Config.in    | 25 +++++++++++++
 .../sunxi-mali-utgard-driver.hash}            |  2 +-
 .../sunxi-mali-utgard-driver.mk               | 35 +++++++++++++++++++
 11 files changed, 75 insertions(+), 75 deletions(-)
 delete mode 100644 package/sunxi-mali-mainline-driver/Config.in
 delete mode 100644 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
 create mode 100644 package/sunxi-mali-utgard-driver/Config.in
 rename package/{sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash => sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash} (66%)
 create mode 100644 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 295b1c6003..c9a044c68b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,17 +144,17 @@ endif
 
 ###############################################################################
 
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE
-	bool "sunxi-mali-mainline package was renamed"
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
+	bool "sunxi-mali-mainline-driver package was renamed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_SUNXI_MALI_UTGARD
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER
 	help
-	  Since the removal of the sunxi-mali package, the
-	  sunxi-mali-mainline package that coexisted became the only
-	  package to provide Mali blobs. The "-mainline" suffix being
-	  undescriptive nowadays and before adding new packages bringing
-	  Mali support for other SoCs/GPU flavors, it is clearer to
-	  rename it SUNXI_MALI_UTGARD.
+	  Since the removal of the sunxi-mali-driver package, the
+	  sunxi-mali-mainline-driver package that coexisted became the
+	  only package to provide the Suxy Mali driver. The "-mainline"
+	  suffix being undescriptive nowadays and before adding new
+	  packages bringing Mali support for other SoCs/GPU flavors, it
+	  is clearer to rename it SUNXI_MALI_UTGARD_DRIVER.
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
 	bool "sunxi-mali-mainline-r6p2 was renamed"
diff --git a/DEVELOPERS b/DEVELOPERS
index 289fa9077d..f8d8bb360d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1014,7 +1014,7 @@ F:	package/libnss/
 F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/sunxi-mali-utgard/
-F:	package/sunxi-mali-mainline-driver/
+F:	package/sunxi-mali-utgard-driver/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 02865d3c8c..9a840c7803 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -28,7 +28,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
 BR2_PACKAGE_SUNXI_MALI_UTGARD=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 58a468aabf..974fb99d7d 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -28,7 +28,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
 BR2_PACKAGE_SUNXI_MALI_UTGARD=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/linux/linux.mk b/linux/linux.mk
index 4b60f33ff3..e6346b7274 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -379,7 +379,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK,$(@D)/.config))
-	$(if $(BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER),
+	$(if $(BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CMA,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DMA_CMA,$(@D)/.config))
 	$(if $(BR2_PACKAGE_IPTABLES),
diff --git a/package/Config.in b/package/Config.in
index aa57d34f96..2137aa88ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -538,8 +538,8 @@ endmenu
 	source "package/statserial/Config.in"
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
-	source "package/sunxi-mali-mainline-driver/Config.in"
 	source "package/sunxi-mali-utgard/Config.in"
+	source "package/sunxi-mali-utgard-driver/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-mainline-driver/Config.in
deleted file mode 100644
index 057f20db66..0000000000
--- a/package/sunxi-mali-mainline-driver/Config.in
+++ /dev/null
@@ -1,25 +0,0 @@
-comment "sunxi-mali-mainline-driver needs a Linux kernel to be built"
-	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
-	depends on !BR2_LINUX_KERNEL
-
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
-	bool "sunxi-mali-mainline-driver"
-	default y
-	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE # runtime
-	depends on BR2_LINUX_KERNEL
-	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
-	help
-	  This package builds and installs the Linux kernel driver for
-	  the Mali GPU on Allwinner platforms, compatible with recent
-	  Linux kernels (>= 4.4). Note that it should be installed
-	  together with the corresponding userspace OpenGL libraries,
-	  which are provided as binaries only at:
-	  https://github.com/bootlin/mali-blobs
-
-	  sunxi-mali-mainline-driver requires a Linux kernel >= 4.4
-	  with the following options enabled:
-
-	  - CONFIG_CMA
-	  - CONFIG_DMA_CMA
-
-	  https://github.com/mripard/sunxi-mali/blob/master/README.md
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
deleted file mode 100644
index 0edcdee4d6..0000000000
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ /dev/null
@@ -1,35 +0,0 @@
-################################################################################
-#
-# sunxi-mali-mainline-driver
-#
-################################################################################
-
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2
-SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
-SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
-SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
-SUNXI_MALI_MAINLINE_DRIVER_LICENSE_FILES = LICENSE
-
-SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
-	$(LINUX_MAKE_FLAGS) \
-	KDIR=$(LINUX_DIR)
-
-define SUNXI_MALI_MAINLINE_DRIVER_USE_APPLY_PATCHES
-	ln -sf $(SUNXI_MALI_MAINLINE_REV)/series $(@D)/patches
-	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
-		$(@D)/build.sh
-endef
-
-SUNXI_MALI_MAINLINE_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_DRIVER_USE_APPLY_PATCHES
-
-define SUNXI_MALI_MAINLINE_DRIVER_BUILD_CMDS
-	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
-		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -j $(PARALLEL_JOBS) -b
-endef
-
-define SUNXI_MALI_MAINLINE_DRIVER_INSTALL_TARGET_CMDS
-	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
-		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -j $(PARALLEL_JOBS) -i
-endef
-
-$(eval $(generic-package))
diff --git a/package/sunxi-mali-utgard-driver/Config.in b/package/sunxi-mali-utgard-driver/Config.in
new file mode 100644
index 0000000000..d27fc4e755
--- /dev/null
+++ b/package/sunxi-mali-utgard-driver/Config.in
@@ -0,0 +1,25 @@
+comment "sunxi-mali-utgard-driver needs a Linux kernel to be built"
+	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER
+	bool "sunxi-mali-utgard-driver"
+	default y
+	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD # runtime
+	depends on BR2_LINUX_KERNEL
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
+	help
+	  This package builds and installs the Linux kernel driver for
+	  the Mali Utgard GPU on Allwinner platforms, compatible with
+	  recent Linux kernels (>= 4.4). Note that it should be
+	  installed together with the corresponding userspace OpenGL
+	  libraries, which are provided as binaries only at:
+	  https://github.com/bootlin/mali-blobs
+
+	  sunxi-mali-utgard-driver requires a Linux kernel >= 4.4
+	  with the following options enabled:
+
+	  - CONFIG_CMA
+	  - CONFIG_DMA_CMA
+
+	  https://github.com/mripard/sunxi-mali/blob/master/README.md
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
similarity index 66%
rename from package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
rename to package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index 7c01d07d20..1d259987ea 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 98abeb8ff2e7e824ec89c7be9984ff298db1f35e48d79092238799ff5a239e91  sunxi-mali-mainline-driver-ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2.tar.gz
+sha256 98abeb8ff2e7e824ec89c7be9984ff298db1f35e48d79092238799ff5a239e91  sunxi-mali-utgard-driver-ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
new file mode 100644
index 0000000000..e61a1f86ff
--- /dev/null
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# sunxi-mali-utgard-driver
+#
+################################################################################
+
+SUNXI_MALI_UTGARD_DRIVER_VERSION = ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2
+SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
+SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
+SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
+SUNXI_MALI_UTGARD_DRIVER_LICENSE_FILES = LICENSE
+
+SUNXI_MALI_UTGARD_DRIVER_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	KDIR=$(LINUX_DIR)
+
+define SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
+	ln -sf $(SUNXI_MALI_UTGARD_REV)/series $(@D)/patches
+	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
+		$(@D)/build.sh
+endef
+
+SUNXI_MALI_UTGARD_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
+
+define SUNXI_MALI_UTGARD_DRIVER_BUILD_CMDS
+	cd $(@D) && $(SUNXI_MALI_UTGARD_DRIVER_MAKE_OPTS) \
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_UTGARD_REV) -j $(PARALLEL_JOBS) -b
+endef
+
+define SUNXI_MALI_UTGARD_DRIVER_INSTALL_TARGET_CMDS
+	cd $(@D) && $(SUNXI_MALI_UTGARD_DRIVER_MAKE_OPTS) \
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_UTGARD_REV) -j $(PARALLEL_JOBS) -i
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
