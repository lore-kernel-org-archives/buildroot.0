From: Xavier Roumegue <xroumegue@gmail.com>
Date: Mon,  9 Nov 2020 15:23:03 +0100
Subject: [Buildroot] [PATCH v3 2/8] boot/uboot: Add option to install fw
 files list to uboot build directory
In-Reply-To: <20201107135909.1265116-1-xroumegue@gmail.com>
References: <20201107135909.1265116-1-xroumegue@gmail.com>
Message-ID: <20201109142309.1135596-3-xroumegue@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This copies a list of fw files, which have to be installed by others
packages to BINARIES_DIR to uboot build directory.
Some platforms, such as imx8, require firmware files located in the
build directory to generate a bootable image.

Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
---
 boot/uboot/Config.in | 14 ++++++++++++++
 boot/uboot/uboot.mk  |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index e4a0f48deb..f44a5b4976 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -229,6 +229,20 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
 
 endchoice
 
+config BR2_TARGET_UBOOT_NEEDS_FW
+    bool "U-Boot needs FW files"
+    help
+      Some platforms (such as iMX8) requires subsystem firmware files
+      encapsulated within the u-boot payload such as this configure properly the
+      memory subystem or those later require authentication from boot ROM.
+
+config BR2_TARGET_UBOOT_FW_FILES
+    depends on BR2_TARGET_UBOOT_NEEDS_FW
+    string "Firmware files list"
+    help
+      Specify the list of files to be copied in the u-boot build directory from
+      the binary folder.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 72d5df412d..7a77fdb20b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -428,6 +428,15 @@ define UBOOT_KCONFIG_FIXUP_CMDS
 	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
 endef
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_FW),y)
+define UBOOT_COPY_TARGET_FW
+	$(foreach f,$(BR2_TARGET_UBOOT_FW_FILES), \
+		cp -f $(BINARIES_DIR)/$(call qstrip,$(f)) $(@D)/
+	)
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TARGET_FW
+endif
+
 ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
 
 #
-- 
2.28.0
