From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 17 Jul 2012 14:27:20 +0200
Subject: [Buildroot] [PATCH 4/6] Add support for appended device tree blobs
	for arm
In-Reply-To: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1342528042-10038-5-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the ARM-only appended device tree
mechanism present in the kernel.

This option allows to add at the end of the kernel image the
device tree blob so that we can still boot device tree enabled
kernels with old bootloaders.

This patch also adds the needed logic to genereate such an image
when building zImages or uImages, also adding the necessary parts
to rebuild the uImage.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 linux/Config.in |   17 ++++++++++++++++-
 linux/linux.mk  |   43 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6da50f5..606bf8e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -149,6 +149,9 @@ if BR2_LINUX_KERNEL_DTS_SUPPORT
 config BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
        bool
 
+config BR2_LINUX_KERNEL_APPENDED_DTB
+	bool
+
 choice
 	prompt "Device tree source"
 	default BR2_LINUX_KERNEL_USE_INTREE_DTS
@@ -180,7 +183,6 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
 	help
 	  Path to the device tree source file
-
 endif
 
 #
@@ -198,6 +200,13 @@ config BR2_LINUX_KERNEL_UIMAGE
 	depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
+config BR2_LINUX_KERNEL_APPENDED_UIMAGE
+	bool "uImage with appended DT"
+	depends on BR2_arm || BR2_armeb
+	select BR2_LINUX_KERNEL_DTS_SUPPORT
+	select BR2_LINUX_KERNEL_APPENDED_DTB
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+
 config BR2_LINUX_KERNEL_BZIMAGE
 	bool "bzImage"
 	depends on BR2_i386 || BR2_x86_64
@@ -206,6 +215,12 @@ config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
 	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc || BR2_sh || BR2_sh64 || BR2_xtensa
 
+config BR2_LINUX_KERNEL_APPENDED_ZIMAGE
+	bool "zImage with appended DT"
+	depends on BR2_arm || BR2_armeb
+	select BR2_LINUX_KERNEL_DTS_SUPPORT
+	select BR2_LINUX_KERNEL_APPENDED_DTB
+
 config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
 	depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
diff --git a/linux/linux.mk b/linux/linux.mk
index 7d632f6..011474e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -56,6 +56,13 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
+ifneq ($(words $(KERNEL_DTS_NAME)),1)
+$(error Kernel with appended device tree needs exactly one DTS source.\
+  Check BR2_LINUX_KERNEL_INTREE_DTS_NAME or BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.)
+endif
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
@@ -66,10 +73,14 @@ LINUX_IMAGE_NAME=vmImage
 else
 LINUX_IMAGE_NAME=uImage
 endif
+else ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
+LINUX_IMAGE_NAME=uImage
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX_IMAGE_NAME=bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
 LINUX_IMAGE_NAME=zImage
+else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
+LINUX_IMAGE_NAME=zImage
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX_IMAGE_NAME=vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
@@ -79,6 +90,12 @@ LINUX_IMAGE_NAME=vmlinuz
 endif
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
+LINUX_IMAGE_TARGET=zImage
+else
+LINUX_IMAGE_TARGET=$(LINUX_IMAGE_NAME)
+endif
+
 # Compute the arch path, since i386 and x86_64 are in arch/x86 and not
 # in arch/$(KERNEL_ARCH). Even if the kernel creates symbolic links
 # for bzImage, arch/i386 and arch/x86_64 do not exist when copying the
@@ -159,6 +176,8 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
+	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
 
@@ -173,16 +192,38 @@ endef
 endif
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
+define LINUX_APPEND_DTB
+	cat $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb > $(KERNEL_ARCH_PATH)/boot/zImage_dtb
+	mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb $(KERNEL_ARCH_PATH)/boot/zImage
+	# We need to generate a new u-boot image that takes into
+	# account the extra-size added by the device tree at the end
+	# of the image. To do so, we first need to retrieve both load
+	# address and entry point for the kernel from the already
+	# generate uboot image before using mkimage -l.
+	LOAD=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Load Address: \([0-9]*\)/\1/p'`; \
+	ENTRY=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Entry Point: \([0-9]*\)/\1/p'`; \
+	$(MKIMAGE) -A $(KERNEL_ARCH) -O linux -T kernel -C none -a $${LOAD} -e $${ENTRY} -n 'Linux Buildroot' \
+		-d $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
+endef
+else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
+define LINUX_APPEND_DTB
+	cat $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb > $(KERNEL_ARCH_PATH)/boot/zImage_dtb
+	mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb $(KERNEL_ARCH_PATH)/boot/zImage
+endef
+endif
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_PATH)/boot/dts/)
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_TARGET)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
 	$(LINUX_BUILD_DTB)
+	$(LINUX_APPEND_DTB)
 endef
 
 
-- 
1.7.9.5
