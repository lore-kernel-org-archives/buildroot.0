From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:08:28 +0200
Subject: [Buildroot] [git commit branch/next] Add support for appended
	device tree blobs for arm
Message-ID: <20120802195304.1F2BB827F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=978928e4acb0ee4e335eaf4bf8feca895f372418
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds support for the ARM-only appended device tree
mechanism present in the kernel.

This option allows to add at the end of the kernel image the
device tree blob so that we can still boot device tree enabled
kernels with old bootloaders.

This patch also adds the needed logic to genereate such an image
when building zImages or uImages, also adding the necessary parts
to rebuild the uImage.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |   33 +++++++++++++++++++++++++++++++++
 linux/linux.mk  |   37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 84fae91..553aa39 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -140,6 +140,13 @@ config BR2_LINUX_KERNEL_UIMAGE
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
@@ -148,6 +155,12 @@ config BR2_LINUX_KERNEL_ZIMAGE
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
@@ -187,6 +200,26 @@ config BR2_LINUX_KERNEL_DTS_SUPPORT
 
 if BR2_LINUX_KERNEL_DTS_SUPPORT
 
+# We have mainly three cases when it comes to device tree support:
+#   1) We don't want any support at all. Then the ..DTS_SUPPORT
+#      variable won't be set
+#   2) We want device tree support, so we need the user to enter
+#      the device tree name or the the path to the custom device
+#      he uses, but the kernel abstracts this from us and only
+#      build an image that looks like a regular kernel image. In
+#      this case, we only need to derive the kernel image name from
+#      the given device tree name, and all the rest is as usual
+#   3) We want device tree support, but the kernel requires us to
+#      build the device tree blob separately. In this case, some
+#      more logic will be needed.
+# The variable below address the second case, were you only want
+# limited actions from buildroot.
+config BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
+	bool
+
+config BR2_LINUX_KERNEL_APPENDED_DTB
+	bool
+
 choice
 	prompt "Device tree source"
 	default BR2_LINUX_KERNEL_USE_INTREE_DTS
diff --git a/linux/linux.mk b/linux/linux.mk
index 844ce55..d466228 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -58,6 +58,13 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
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
@@ -68,10 +75,14 @@ LINUX_IMAGE_NAME=vmImage
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
@@ -81,6 +92,12 @@ LINUX_IMAGE_NAME=vmlinuz
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
@@ -161,10 +178,13 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
+	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
+ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
 endef
@@ -172,17 +192,32 @@ define LINUX_INSTALL_DTB
 	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
 endef
 endif
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
+define LINUX_APPEND_DTB
+	cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb >> $(KERNEL_ARCH_PATH)/boot/zImage
+	# We need to generate the uImage here after that so that the uImage is
+	# generated with the right image size.
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) uImage
+endef
+else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
+define LINUX_APPEND_DTB
+	cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb >> $(KERNEL_ARCH_PATH)/boot/zImage
+endef
+endif
 
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
 
 
