From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 21:06:30 +0200
Subject: [Buildroot] [git commit] uboot: add support for Freescale .sb
	format to uboot
Message-ID: <20130729190649.603B49AE89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51fc2776b7f4efbd6c221f48690b568d143db8e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: update to recent Buildroot, add missing dependency on
host-elftosb.]

Signed-off-by: Gary Coulbourne <bear@bears.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |    4 ++++
 boot/uboot/uboot.mk  |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f5806e7..2e37856 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -101,6 +101,10 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
 config BR2_TARGET_UBOOT_FORMAT_ELF
 	bool "u-boot.elf"
 
+config BR2_TARGET_UBOOT_FORMAT_SB
+	depends on BR2_arm
+	bool "u-boot.sb"
+
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	bool "Custom (specify below)"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 3904b8b..631da6b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -40,6 +40,10 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN          = u-boot-nand.bin
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
 UBOOT_BIN          = u-boot.img
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
+UBOOT_BIN          = u-boot.sb
+UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
+UBOOT_DEPENDENCIES += host-elftosb
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BIN          = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 else
