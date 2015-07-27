From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 27 Jul 2015 20:50:03 +0200
Subject: [Buildroot] [PATCH v3 1/1] linux: Add support for FIT image
Message-ID: <1438023003-19533-1-git-send-email-joerg.krause@embedded.rocks>
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
Changes in v3:
[Romain Naour:
  - remove avr32 support
  - factorize setting LINUX_IMAGE_PATH
  - define LINUX_BUILD_FITIMAGE only when BR2_LINUX_KERNEL_FITIMAGE is selected]
[J?rg Krause:
  - add nios2 support
  - add help text
  - git rebase]

Changes in v2:
  - build the device tree blob prior to the FIT image
  - add error message if file path is missing
---
 linux/Config.in | 27 +++++++++++++++++++++++++++
 linux/linux.mk  | 23 ++++++++++++++++++++---
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 74af51d..fa4bab8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -180,6 +180,27 @@ config BR2_LINUX_KERNEL_UBOOT_IMAGE
 choice
 	prompt "Kernel binary format"
 
+config BR2_LINUX_KERNEL_FITIMAGE
+	bool "FIT image"
+	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
+		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		   BR2_sh || BR2_sh64 || BR2_mips || BR2_mipsel || \
+		   BR2_mips64 || BR2_mips64el || BR2_nios2
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	help
+	  The FIT (Flattened Image Tree) image format is a much more advanced
+	  and flexible format compared to regular uImage, let alone zImage.
+
+	  The FIT image format allows for storing multiple kernel images,
+	  multiple device tree blobs and even multiple configurations for
+	  their combinations in a single image.
+
+	  Furthermore, it enhances integrity protection of images with sha1,
+	  sha256 and md5 checksums as well as signature verification against
+	  a public key.
+
+	  http://git.denx.de/?p=u-boot.git;a=tree;f=doc/uImage.FIT
+
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
@@ -254,6 +275,12 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 
 endchoice
 
+config BR2_LINUX_KERNEL_FITIMAGE_ITS_FILE
+	string "FIT image device tree descriptor (*.its) file path"
+	depends on BR2_LINUX_KERNEL_FITIMAGE
+	help
+	  Path to the FIT image device tree descriptor (*.its) file.
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	string "Kernel image target name"
 	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
diff --git a/linux/linux.mk b/linux/linux.mk
index d91dbb2..dd20ebd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -96,6 +96,9 @@ LINUX_TARGET_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 ifeq ($(LINUX_IMAGE_NAME),)
 LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
 endif
+else ifeq ($(BR2_LINUX_KERNEL_FITIMAGE),y)
+LINUX_IMAGE_NAME = fitImage
+LINUX_TARGET_NAME = zImage
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 LINUX_IMAGE_NAME = uImage
@@ -143,9 +146,7 @@ else
 KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
-LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
-else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
+ifeq ($(BR2_LINUX_KERNEL_VMLINUZ)$(BR2_LINUX_KERNEL_VMLINUX)$(BR2_LINUX_KERNEL_FITIMAGE),y)
 LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else
 LINUX_IMAGE_PATH = $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
@@ -266,6 +267,15 @@ LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) |\
 endif
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_FITIMAGE),y)
+define LINUX_BUILD_FITIMAGE
+	$(LINUX_INSTALL_HOST_TOOLS)
+	cp $(call qstrip,$(BR2_LINUX_KERNEL_FITIMAGE_ITS_FILE)) $(@D)/fit-image.its
+	$(TARGET_MAKE_ENV) $(MKIMAGE) -f $(@D)/fit-image.its $(@D)/$(LINUX_IMAGE_NAME)
+	rm $(@D)/fit-image.its
+endef
+endif
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
@@ -277,6 +287,7 @@ define LINUX_BUILD_CMDS
 	fi
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
+	$(LINUX_BUILD_FITIMAGE)
 endef
 
 
@@ -381,6 +392,12 @@ $(error Kernel with appended device tree needs exactly one DTS source. \
 endif
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_FITIMAGE),y)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_FITIMAGE_ITS_FILE)),)
+$(error No FIT image device tree descriptor file (*.its) specified, check your BR2_LINUX_KERNEL_FITIMAGE_ITS_FILE setting)
+endif
+endif
+
 endif # BR_BUILDING
 
 $(eval $(kconfig-package))
-- 
2.4.6
