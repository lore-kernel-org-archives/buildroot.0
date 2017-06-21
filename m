From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 23:41:42 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: add support for generating U-Boot
	boot scripts
Message-ID: <20170621214143.7184-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

More and more of our defconfigs need to generate a U-Boot boot
script. It's a simple call to mkimage, but we already have 12
instances of this logic in board/, and there are patch series waiting
in patchwork adding 3 more boards that need this.

So let's add an option in the U-Boot package to generate such a boot
script image easily.

Note that we assume a single script needs to be generated, and the
output file name is boot.scr. The only platform for which it seems to
not be the case are the Boundary Devices platforms: they generate two
boot scripts, 6x_bootscript and 6x_upgrade, but they are anyway
installed inside TARGET_DIR, not BINARIES_DIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
We could have chosen to create a helper script that can be used as a
post-build or post-image script, ala
support/scripts/genimage.sh. However, I find rather messy how we are
passing arguments to such scripts: we have a single
BR2_ROOTFS_POST_SCRIPT_ARGS, passed to all scripts. Proposals such as
https://patchwork.ozlabs.org/patch/777463/ with:

  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m64/genimage.cfg board/bananapi/bananapi-m64/boot.cmd"

where support/scripts/genimage.sh parses the first two arguments, and
the post-build script generating the U-Boot boot script parses the
last argument, look really really ugly to me.

Retrospectively, I believe the choice of adding such a helper script
for genimage was wrong. Having a proper option would be much
cleaner/nicer IMO.
---
 boot/uboot/Config.in | 16 ++++++++++++++++
 boot/uboot/uboot.mk  | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 547822d..52f3a32 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -407,6 +407,22 @@ config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
 
 endif # BR2_TARGET_UBOOT_ENVIMAGE
 
+config BR2_TARGET_UBOOT_BOOT_SCRIPT
+	bool "Generate a U-Boot boot script"
+	help
+	  Generate a U-Boot boot script, given a file listing U-Boot
+	  commands to be executed at boot time. The generated boot
+	  script will be called 'boot.scr'.
+
+if BR2_TARGET_UBOOT_BOOT_SCRIPT
+
+config BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE
+	string "U-Boot boot script source"
+	help
+	  Source file to generate the U-Boot boot script.
+
+endif
+
 if BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 
 config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 904d45a..0f423a8 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -235,6 +235,10 @@ define UBOOT_INSTALL_IMAGES_CMDS
 			$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
 			$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
 			-o $(BINARIES_DIR)/uboot-env.bin -)
+	$(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
+		$(HOST_DIR)/usr/bin/mkimage -C none -A $(MKIMAGE_ARCH) -T script \
+			-d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
+			$(BINARIES_DIR)/boot.scr)
 endef
 
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
@@ -298,6 +302,15 @@ endif
 UBOOT_DEPENDENCIES += host-uboot-tools
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_BOOT_SCRIPT),y)
+ifeq ($(BR_BUILDING),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)),)
+$(error Please define a source file for Uboot boot script (BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE setting))
+endif
+endif
+UBOOT_DEPENDENCIES += host-uboot-tools
+endif
+
 ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
 
 #
-- 
2.9.4
