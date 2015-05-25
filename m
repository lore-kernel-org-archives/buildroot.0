From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 25 May 2015 12:11:17 +0200
Subject: [Buildroot] [PATCH 1/1] linux: Add support for FIT image
Message-ID: <1432548677-5194-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The FIT (Flattened Image Tree) image format is a much more advanced and
flexible format compared to regular uImage, let alone zImage.

The FIT image format allows for storing multiple kernel images, multiple
device tree blobs and even multiple configurations for their combinations
in a single image.

Furthermore, it enhances integrity protection of images with sha1, sha256
and md5 checksums as well as signature verification against a public key.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 linux/Config.in | 13 +++++++++++++
 linux/linux.mk  | 15 ++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 457ada6..03ce8cf 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -174,6 +174,13 @@ config BR2_LINUX_KERNEL_UBOOT_IMAGE
 choice
 	prompt "Kernel binary format"
 
+config BR2_LINUX_KERNEL_FITIMAGE
+	bool "fitImage"
+	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
+		   BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64 || \
+		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
@@ -248,6 +255,12 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 
 endchoice
 
+config BR2_LINUX_KERNEL_FITIMAGE_ITS_FILE
+	string "FIT image device tree descriptor file path"
+	depends on BR2_LINUX_KERNEL_FITIMAGE
+	help
+	  Path to the FIT image device tree descriptor.
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	string "Kernel image target name"
 	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
diff --git a/linux/linux.mk b/linux/linux.mk
index c765954..6c48fe8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -108,6 +108,9 @@ LINUX_TARGET_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 ifeq ($(LINUX_IMAGE_NAME),)
 LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
 endif
+else ifeq ($(BR2_LINUX_KERNEL_FITIMAGE),y)
+LINUX_IMAGE_NAME = fitImage
+LINUX_TARGET_NAME = zImage
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 LINUX_IMAGE_NAME = uImage
@@ -155,7 +158,9 @@ else
 KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
+ifeq ($(BR2_LINUX_KERNEL_FITIMAGE),y)
+LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
@@ -277,6 +282,13 @@ LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) |\
 endif
 endif
 
+define LINUX_BUILD_FITIMAGE
+	$(LINUX_INSTALL_HOST_TOOLS)
+	cp $(call qstrip,$(BR2_LINUX_KERNEL_FITIMAGE_ITS_FILE)) $(@D)/fit-image.its
+	$(TARGET_MAKE_ENV) $(MKIMAGE) -f $(@D)/fit-image.its $(@D)/$(LINUX_IMAGE_NAME)
+	rm $(@D)/fit-image.its
+endef
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
@@ -286,6 +298,7 @@ define LINUX_BUILD_CMDS
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
+	$(if $(BR2_LINUX_KERNEL_FITIMAGE), $(LINUX_BUILD_FITIMAGE))
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
 endef
-- 
2.4.1
