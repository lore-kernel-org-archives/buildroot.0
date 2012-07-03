From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue,  3 Jul 2012 12:01:14 +0200
Subject: [Buildroot] [PATCH 2/4] Add support for appended device tree blobs
	for arm
In-Reply-To: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1341309676-18681-3-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 linux/Config.in |    8 ++++++++
 linux/linux.mk  |   38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6f704b0..46b9756 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -132,6 +132,14 @@ config BR2_LINUX_KERNEL_DTS_SUPPORT
 
 if BR2_LINUX_KERNEL_DTS_SUPPORT
 
+config BR2_LINUX_KERNEL_APPENDED_DTB
+	bool "Append the Device Tree binary to the kernel"
+	depends on BR2_arm || BR2_armeb
+	help
+	  After building the device tree blob, append it to the
+	  kernel image. If necessary generates a uImage from that
+	  new kernel image afterward.
+
 choice
 	prompt "Device tree source"
 	default BR2_LINUX_KERNEL_USE_DEFAULT_DTS
diff --git a/linux/linux.mk b/linux/linux.mk
index 0540aeb..483974c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -52,6 +52,13 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_FILE)))
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
+ifneq ($(words $(KERNEL_DTS_NAME)),1)
+$(error Kernel with appended device tree needs exactly one DTS source.\
+  Check BR2_LINUX_KERNEL_DTS_FILE or BR2_LINUX_KERNEL_CUSTOM_DTS_FILE.)
+endif
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
@@ -76,6 +83,12 @@ LINUX_IMAGE_NAME=vmlinuz
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
@@ -155,6 +168,8 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
+	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
 
@@ -164,17 +179,38 @@ define LINUX_BUILD_DTB
 endef
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
+ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
+define LINUX_APPEND_DTB
+	cat $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb > $(KERNEL_ARCH_PATH)/boot/zImage_dtb
+	mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb $(KERNEL_ARCH_PATH)/boot/zImage
+	LOAD=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Load Address: \([0-9]*\)/\1/p'`; \
+	ENTRY=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Entry Point: \([0-9]*\)/\1/p'`; \
+	$(MKIMAGE) -A $(KERNEL_ARCH) -O linux -T kernel -C none -a $${LOAD} -e $${ENTRY} -n 'Linux Buildroot' \
+		-d $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
+endef
+else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
+define LINUX_APPEND_DTB
+	cat $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb > $(KERNEL_ARCH_PATH)/boot/zImage_dtb
+	mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb $(KERNEL_ARCH_PATH)/boot/zImage
+endef
+else
+$(error Appending DTB to the kernel image is only possible for u-boot images and zImage.)
+endif
+endif
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		mkdir $(KERNEL_ARCH_PATH)/boot/dts
 		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_FILE) $(KERNEL_ARCH_PATH)/boot/dts/)
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
