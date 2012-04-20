From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 20 Apr 2012 18:18:05 +0200
Subject: [Buildroot] [PATCH] Microblaze: Improvements in the build system
Message-ID: <4F918C3D.2010105@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1. Added BR2_LINUX_KERNEL_SIMPLEIMAGE
2. Removed DTS dependence from Microblaze
3. Updated defconfig files

Signed-off by: Stephan Hoffmann <sho@relinux.de>
---

I already mailed this patch on April 8, but it obviously did not get over the list;-(


 configs/qemu_microblazebe_mmu_defconfig |    6 -----
 configs/qemu_microblazeel_mmu_defconfig |    7 ------
 configs/s6lx9_microboard_defconfig      |   10 +--------
 linux/Config.in                         |   14 ++++++++---
 linux/linux.mk                          |   35 +++++++++++++++++++-----------
 5 files changed, 33 insertions(+), 39 deletions(-)

diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 378e972..3bac1ea 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -1,10 +1,4 @@
-BR2_microblaze=y
 BR2_microblazebe=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 61420b4..9d8ec8b 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -1,11 +1,4 @@
-BR2_microblaze=y
 BR2_microblazeel=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
index 5011766..35d12eb 100644
--- a/configs/s6lx9_microboard_defconfig
+++ b/configs/s6lx9_microboard_defconfig
@@ -1,11 +1,4 @@
-BR2_microblaze=y
 BR2_microblazeel=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
@@ -13,5 +6,4 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/avnet/s6lx9_microboard/lx9_mmu_defconfig"
 BR2_LINUX_KERNEL_DTS_FILE="board/avnet/s6lx9_microboard/lx9_mmu.dts"
-BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="simpleImage.lx9_mmu"
+BR2_LINUX_KERNEL_SIMPLEIMAGE=y
diff --git a/linux/Config.in b/linux/Config.in
index 5a2d287..e69451b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,12 +122,8 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 
 config BR2_LINUX_KERNEL_DTS_FILE
     string "Device Tree dts file location"
-    depends on BR2_microblaze
     help
       Path from where the dts file has to be copied
-      The final "custom target" name depends on the
-      dts file name:
-          <name>.dts --> simpleImage.<name>
 #
 # Binary format
 #
@@ -158,6 +154,16 @@ config BR2_LINUX_KERNEL_VMLINUZ
 	bool "vmlinuz"
 	depends on BR2_mips || BR2_mipsel
 
+config BR2_LINUX_KERNEL_SIMPLEIMAGE
+	bool "simpleImage"
+	help
+	  simpleImage is the image format used for the
+	  Microblaze softcore processor.
+
+	  The final image name depends on the
+	  dts file name:
+	    <name>.dts --> simpleImage.<name>
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 16f9916..3e22f5e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -46,6 +46,18 @@ LINUX_MAKE_FLAGS = \
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
 
+# Copy the DTS file into the kernel's dts directory
+# This is at least needed for Microblaze since the kernel build system links it into the kernel image
+ifneq ($(BR2_LINUX_KERNEL_DTS_FILE),)
+  LINUX_KERNEL_CUSTOM_DTS = $(call qstrip, $(BR2_LINUX_KERNEL_DTS_FILE))
+  DTS_NAME = $(shell export file=`basename $(LINUX_KERNEL_CUSTOM_DTS)` && echo $${file%.*})
+  define LINUX_COPY_DTS
+    echo "LINUX_KERNEL_CUSTOM_DTS=$(LINUX_KERNEL_CUSTOM_DTS) and DTS_NAME=$(DTS_NAME)" && \
+	mkdir -p $(KERNEL_ARCH_PATH)/boot/dts && \
+	cp $(BR2_LINUX_KERNEL_DTS_FILE) $(KERNEL_ARCH_PATH)/boot/dts/ 
+  endef
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
@@ -57,6 +69,9 @@ else
 LINUX_IMAGE_NAME=uImage
 endif
 LINUX_DEPENDENCIES+=host-uboot-tools
+else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
+LINUX_IMAGE_NAME=simpleImage.$(DTS_NAME)
+LINUX_DEPENDENCIES+=host-uboot-tools
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX_IMAGE_NAME=bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
@@ -90,10 +105,15 @@ else
 ifeq ($(KERNEL_ARCH),avr32)
 LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/images/$(LINUX_IMAGE_NAME)
 else
+ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
+LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME).ub
+else
 LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
 endif
+endif
 endif # BR2_LINUX_KERNEL_VMLINUX
 
+
 define LINUX_DOWNLOAD_PATCHES
 	$(if $(LINUX_PATCHES),
 		@$(call MESSAGE,"Download additional patches"))
@@ -117,17 +137,9 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
+# The microblaze build system always wants mkimage
 ifeq ($(KERNEL_ARCH),microblaze)
-# on microblaze, we always want mkimage
 LINUX_DEPENDENCIES+=host-uboot-tools
-
-define LINUX_COPY_DTS
-    if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
-        cp $(BR2_LINUX_KERNEL_DTS_FILE) $(@D)/arch/microblaze/boot/dts ; \
-    else \
-        echo "Cannot copy dts file!" ; \
-    fi
-endef
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
@@ -143,8 +155,7 @@ define LINUX_CONFIGURE_CMDS
 	$(if $(BR2_ARM_EABI),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
-    $(if $(BR2_microblaze),
-        $(call LINUX_COPY_DTS))
+        $(call LINUX_COPY_DTS)
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake cpio file. It'll be
 	# replaced later by the real cpio archive, and the kernel will be
@@ -231,8 +242,6 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
 	# Copy the kernel image to its final destination
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
-	# If there is a .ub file copy it to the final destination
-	test ! -f $(LINUX_IMAGE_PATH).ub || cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
 	$(Q)touch $@
 
 # The initramfs building code must make sure this target gets called
-- 
1.7.0.4



-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
