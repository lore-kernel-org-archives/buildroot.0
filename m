From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:20 +0100
Subject: [Buildroot] [RFC v1 11/14] linux: support out of tree build
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supporting out of tree build in the Linux package requires a few
changes:

 * A clarification of KERNEL_ARCH_PATH, which used to point to
   $(O)/build/linux-<version>/arch/<architecture>/. Instead, we now
   have KERNEL_ARCH_SRCDIR (pointing to the architecture directory in
   the sources) and KERNEL_ARCH_BUILDDIR (pointing to the architectire
   directory in the build directory)

 * The custom Device Tree source file (if any) is now copied through a
   post-patch hook, rather than during the build step. This is needed
   because copying a Device Tree source file in the source tree
   requires the source tree to be writable, which is no longer the
   case after the patch step. And copying something into the source
   tree *is* a patching action, so doing this in the patch step looks
   like the right thing to do. The only consequence of this is that
   this action will no longer be done if LINUX_OVERRIDE_SRCDIR is
   defined, because the extract/patch steps are not done on packages
   for which the source directory is overriden. But it doesn't seem
   like a big issue since, if the user has overriden the kernel source
   directory, we assume that (s)he can store the Device Tree source
   file in the kernel source directory itself.

 * We no longer use the trick of creating a buildroot_defconfig, since
   this requires creating a buildroot_defconfig file in the source
   tree during the configure step. And it doesn't work with
   out-of-tree because the source tree is read only during the
   configure step (and onwards). So instead, we copy the defconfig to
   .config, and run a silent oldconfig on it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   47 ++++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 91a9f50..f7adffd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -35,6 +35,7 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES  += host-module-init-tools
+LINUX_SUPPORTS_OUT_OF_TREE = YES
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 	LINUX_DEPENDENCIES += host-uboot-tools
@@ -106,22 +107,25 @@ endif
 # for bzImage, arch/i386 and arch/x86_64 do not exist when copying the
 # defconfig file.
 ifeq ($(KERNEL_ARCH),i386)
-KERNEL_ARCH_PATH=$(LINUX_DIR)/arch/x86
+KERNEL_ARCH_SUBDIR=arch/x86
 else ifeq ($(KERNEL_ARCH),x86_64)
-KERNEL_ARCH_PATH=$(LINUX_DIR)/arch/x86
+KERNEL_ARCH_SUBDIR=arch/x86
 else
-KERNEL_ARCH_PATH=$(LINUX_DIR)/arch/$(KERNEL_ARCH)
+KERNEL_ARCH_SUBDIR=arch/$(KERNEL_ARCH)
 endif
 
+KERNEL_ARCH_SRCDIR=$(LINUX_SRCDIR)/$(KERNEL_ARCH_SUBDIR)
+KERNEL_ARCH_BUILDDIR=$(LINUX_BUILDDIR)/$(KERNEL_ARCH_SUBDIR)
+
 ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
-LINUX_IMAGE_PATH=$(LINUX_DIR)/$(LINUX_IMAGE_NAME)
+LINUX_IMAGE_PATH=$(LINUX_BUILDDIR)/$(LINUX_IMAGE_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
-LINUX_IMAGE_PATH=$(LINUX_DIR)/$(LINUX_IMAGE_NAME)
+LINUX_IMAGE_PATH=$(LINUX_BUILDDIR)/$(LINUX_IMAGE_NAME)
 else
 ifeq ($(KERNEL_ARCH),avr32)
-LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/images/$(LINUX_IMAGE_NAME)
+LINUX_IMAGE_PATH=$(KERNEL_ARCH_BUILDDIR)/boot/images/$(LINUX_IMAGE_NAME)
 else
-LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
+LINUX_IMAGE_PATH=$(KERNEL_ARCH_BUILDDIR)/boot/$(LINUX_IMAGE_NAME)
 endif
 endif # BR2_LINUX_KERNEL_VMLINUX
 
@@ -150,15 +154,22 @@ LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_SRCDIR)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
+define LINUX_COPY_DTS
+	cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_SRCDIR)/boot/dts/)
+endef
+
+ifneq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),)
+LINUX_POST_PATCH_HOOKS += LINUX_COPY_DTS
+endif
+
 define LINUX_CONFIGURE_CMDS
-	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
-	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
-	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	cp $(KERNEL_SOURCE_CONFIG) $(@D)/.config
+	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(LINUX_SRCDIR) O=$(@D) oldconfig
 	$(if $(BR2_ARM_EABI),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
@@ -194,8 +205,8 @@ endef
 define LINUX_INSTALL_DTB
 	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
 	cp $(addprefix \
-		$(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
-		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
+		$(KERNEL_ARCH_BUILDDIR)/boot/$(if $(wildcard \
+		$(addprefix $(KERNEL_ARCH_BUILDDIR)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
 		$(BINARIES_DIR)/
 endef
 endif
@@ -204,11 +215,11 @@ endif
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 # dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
 define LINUX_APPEND_DTB
-	if [ -e $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb ]; then \
-		cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb; \
+	if [ -e $(KERNEL_ARCH_BUILDDIR)/boot/$(KERNEL_DTS_NAME).dtb ]; then \
+		cat $(KERNEL_ARCH_BUILDDIR)/boot/$(KERNEL_DTS_NAME).dtb; \
 	else \
-		cat $(KERNEL_ARCH_PATH)/boot/dts/$(KERNEL_DTS_NAME).dtb; \
-	fi >> $(KERNEL_ARCH_PATH)/boot/zImage
+		cat $(KERNEL_ARCH_BUILDDIR)/boot/dts/$(KERNEL_DTS_NAME).dtb; \
+	fi >> $(KERNEL_ARCH_BUILDDIR)/boot/zImage
 endef
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 # We need to generate the uImage here after that so that the uImage is
@@ -220,8 +231,6 @@ endif
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
-	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
-		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_TARGET)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
-- 
1.7.9.5
