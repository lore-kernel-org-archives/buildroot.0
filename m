From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jul 2013 21:18:23 +0200
Subject: [Buildroot] [git commit] u-boot: support custom u-boot.bin name
Message-ID: <20130726191843.97F229A074@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab25903bd7d3f1aa58f96867304114cbd7a6fbad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some platforms, the standard U-Boot binary is not called u-boot.bin,
but u-boot<something>.bin. This is for example the case on the
Cavium-provided u-boot, where the output file is called
u-boot_<boardname>.bin.

This patch adds a 'custom format' choice in the existing u-boot binary
format selection, where this name can be put. In the Cavium example, this
option could be set to:
BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-$(BR2_TARGET_UBOOT_BOARDNAME).bin"

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |   16 ++++++++++++++++
 boot/uboot/uboot.mk  |    2 ++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index aadf757..f5806e7 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -101,8 +101,24 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
 config BR2_TARGET_UBOOT_FORMAT_ELF
 	bool "u-boot.elf"
 
+config BR2_TARGET_UBOOT_FORMAT_CUSTOM
+	bool "Custom (specify below)"
+	help
+	  On some platforms, the standard U-Boot binary is not called
+	  u-boot.bin, but u-boot<something>.bin. If this is your case,
+	  you should select this option and specify the correct name
+	  in BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME.
+
 endchoice
 
+config BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME
+	string "U-Boot binary format: custom name"
+	depends on BR2_TARGET_UBOOT_FORMAT_CUSTOM
+	help
+	  Specify the correct name of the output binary created by
+	  U-Boot, if it is not one of the default names. For example:
+	  u-boot_magic.bin
+
 config BR2_TARGET_UBOOT_OMAP_IFT
 	depends on BR2_TARGET_UBOOT_FORMAT_BIN
 	depends on BR2_arm || BR2_armeb
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b357e0f..3904b8b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -40,6 +40,8 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN          = u-boot-nand.bin
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
 UBOOT_BIN          = u-boot.img
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
+UBOOT_BIN          = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 else
 UBOOT_BIN          = u-boot.bin
 UBOOT_BIN_IFT      = $(UBOOT_BIN).ift
