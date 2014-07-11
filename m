From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 11 Jul 2014 14:49:22 +0200
Subject: [Buildroot] [PATCHv3 1/2] linux: add option to explicitly specify
 the kernel image name
Message-ID: <20140711124922.GA25220@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For example the upcoming qemu-xtensa patch is using this feature,
where the target is called "zImage", but the resulting kernel name
is "Image.elf".

---
Changes v2 -> v3:
  - improve subject (suggested by Thomas P.)
  - LINUX_IMAGE_NAME defaults to LINUX_TARGET_NAME (suggested by Yann)
  - improve help text (suggested by Yann)
Changes v1 -> v2:
  - add comment about default value (suggested by Arnout)
  - reorder default value for LINUX_TARGET_NAME (suggested by Arnout)

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 linux/Config.in |   10 ++++++++++
 linux/linux.mk  |   10 +++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0a13b13..c13b929 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -244,6 +244,16 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	  Specify the kernel make target to build the kernel that you
 	  need.
 
+config BR2_LINUX_KERNEL_IMAGE_NAME
+	string "Kernel image name"
+	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
+	help
+	  The filename of the kernel image, if it is different from the
+	  make target (above). Only Xtensa uses a filename different from
+	  the make target. Defaults to BR2_LINUX_KERNEL_IMAGE_TARGET_NAME.
+
+	  If unsure, leave it empty.
+
 config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
 	string "load address (for 3.7+ multi-platform image)"
 	depends on BR2_arm || BR2_armeb
diff --git a/linux/linux.mk b/linux/linux.mk
index bd3f2ac..d7e8390 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -80,7 +80,8 @@ endif
 KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
-LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
+LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
+LINUX_TARGET_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 LINUX_IMAGE_NAME = uImage
@@ -106,6 +107,9 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_NAME = vmlinuz
 endif
 endif
+ifeq ($(LINUX_IMAGE_NAME),)
+LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
+endif
 
 LINUX_KERNEL_UIMAGE_LOADADDR=$(call qstrip,$(BR2_LINUX_KERNEL_UIMAGE_LOADADDR))
 ifneq ($(LINUX_KERNEL_UIMAGE_LOADADDR),)
@@ -259,7 +263,7 @@ endif
 define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_PATH)/boot/dts/)
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
@@ -332,7 +336,7 @@ endif
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	$(LINUX_APPEND_DTB)
 	# Copy the kernel image to its final destination
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
-- 
1.7.10.4
