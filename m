From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 22 Jun 2012 14:42:07 +0200
Subject: [Buildroot] [PATCH] Add some support for device tree kernels with
	appended trees
Message-ID: <1340368927-31968-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 linux/Config.in |   55 ++++++++++++++++++++++++++++++++++++++++++-------
 linux/linux.mk  |   61 ++++++++++++++++++++++++++++++++++++++++---------------
 2 files changed, 93 insertions(+), 23 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4562b1b..5618629 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -124,24 +124,53 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	help
 	  Path to the kernel configuration file
 
+config BR2_LINUX_KERNEL_DTS_SUPPORT
+       bool "Device Tree Support"
+
+config BR2_LINUX_KERNEL_APPENDED_DTB
+       bool "Append the Device Tree binary to the kernel"
+       depends on BR2_LINUX_KERNEL_DTS_SUPPORT
+
+choice
+	prompt "Device Tree choice"
+	depends on BR2_LINUX_KERNEL_DTS_SUPPORT
+	default BR2_LINUX_KERNEL_USE_DEFAULT_DTS
+
+config BR2_LINUX_KERNEL_USE_DEFAULT_DTS
+	bool "Using a device tree present in the kernel"
+
+config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
+	bool "Using a custom device tree file"
+
+endchoice
+
 config BR2_LINUX_KERNEL_DTS_FILE
-    string "Device Tree dts file location"
-    depends on BR2_microblaze
-    help
-      Path from where the dts file has to be copied
-      The final "custom target" name depends on the
-      dts file name:
-          <name>.dts --> simpleImage.<name>
+	string "DTS name"
+	depends on BR2_LINUX_KERNEL_USE_DEFAULT_DTS
+	help
+	 Name of the default device tree, without the
+	 trailing .dts
+
+config BR2_LINUX_KERNEL_CUSTOM_DTS_FILE
+	string "Device tree file path"
+	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
+	help
+	  Path to the kernel configuration file
+
 #
 # Binary format
 #
 
+config BR2_LINUX_KERNEL_UBOOT_IMAGE
+       bool
+
 choice
 	prompt "Kernel binary format"
 
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
 config BR2_LINUX_KERNEL_BZIMAGE
 	bool "bzImage"
@@ -151,6 +180,18 @@ config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
 	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc || BR2_sh || BR2_sh64 || BR2_xtensa
 
+config BR2_LINUX_KERNEL_CUIMAGE
+	bool "cuImage"
+	depends on BR2_LINUX_KERNEL_DTS_SUPPORT
+	depends on BR2_powerpc
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+
+config BR2_LINUX_KERNEL_SIMPLEIMAGE
+	bool "simpleImage"
+	depends on BR2_LINUX_KERNEL_DTS_SUPPORT
+	depends on BR2_microblaze
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+
 config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
 	depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
diff --git a/linux/linux.mk b/linux/linux.mk
index 34f8623..b3b60bc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -34,6 +34,10 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES  += host-module-init-tools
 
+ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
+	LINUX_DEPENDENCIES+=host-uboot-tools
+endif
+
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
@@ -46,6 +50,12 @@ LINUX_MAKE_FLAGS = \
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
 
+ifeq ($(BR2_LINUX_KERNEL_USE_DEFAULT_DTS),y)
+KERNEL_DTS_NAME = $(BR2_LINUX_KERNEL_DTS_FILE)
+else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
+KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_FILE)))
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
@@ -56,11 +66,14 @@ LINUX_IMAGE_NAME=vmImage
 else
 LINUX_IMAGE_NAME=uImage
 endif
-LINUX_DEPENDENCIES+=host-uboot-tools
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX_IMAGE_NAME=bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
 LINUX_IMAGE_NAME=zImage
+else ifeq ($(BR2_LINUX_KERNEL_CUIMAGE),y)
+LINUX_IMAGE_NAME=cuImage.$(KERNEL_DTS_NAME)
+else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
+LINUX_IMAGE_NAME=simpleImage.$(KERNEL_DTS_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX_IMAGE_NAME=vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
@@ -117,19 +130,6 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
-ifeq ($(KERNEL_ARCH),microblaze)
-# on microblaze, we always want mkimage
-LINUX_DEPENDENCIES+=host-uboot-tools
-
-define LINUX_COPY_DTS
-    if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
-        cp $(BR2_LINUX_KERNEL_DTS_FILE) $(@D)/arch/microblaze/boot/dts ; \
-    else \
-        echo "Cannot copy dts file!" ; \
-    fi
-endef
-endif
-
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
@@ -140,11 +140,12 @@ define LINUX_CONFIGURE_CMDS
 	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	$(if $(BR2_LINUX_KERNEL_DTS_SUPPORT),
+		$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
+			cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_FILE) $(KERNEL_ARCH_PATH)/boot/dts/))
 	$(if $(BR2_ARM_EABI),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
-    $(if $(BR2_microblaze),
-        $(call LINUX_COPY_DTS))
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake cpio file. It'll be
 	# replaced later by the real cpio archive, and the kernel will be
@@ -164,9 +165,34 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
+	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
 
+ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
+define LINUX_BUILD_DTB
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
+endef
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
+ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE), y)
+define LINUX_APPEND_DTB
+	cat $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb > $(KERNEL_ARCH_PATH)/boot/zImage_dtb
+	mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb $(KERNEL_ARCH_PATH)/boot/zImage
+	LOAD=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Load Address: \([0-9]*\)/\1/p'`; \
+	ENTRY=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Entry Point: \([0-9]*\)/\1/p'`; \
+	$(MKIMAGE) -A $(KERNEL_ARCH) -O linux -T kernel -C none -a $${LOAD} -e $${ENTRY} -n 'Linux Buildroot' \
+		-d $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(KERNEL_IMAGE_NAME)
+endef
+else
+define LINUX_APPEND_DTB
+	cat $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb > $(KERNEL_ARCH_PATH)/boot/zImage_dtb
+	mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb $(KERNEL_ARCH_PATH)/boot/zImage
+endef
+endif
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
@@ -174,6 +200,9 @@ define LINUX_BUILD_CMDS
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
+	$(if $(BR2_LINUX_KERNEL_DTS_SUPPORT),
+		$(LINUX_BUILD_DTB)
+		$(LINUX_APPEND_DTB))
 endef
 
 
-- 
1.7.9.5
