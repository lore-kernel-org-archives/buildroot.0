Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C1FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:36:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C37D361058
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C37D361058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B8BC4011A;
	Mon, 27 Sep 2021 20:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drG5AXbhUmiN; Mon, 27 Sep 2021 20:36:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78D15402BE;
	Mon, 27 Sep 2021 20:36:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79AB81BF239
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 669B4606F3
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDrNvZ9B8wva for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 20:36:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97714606E8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 20:36:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BBAEF8D3BD; Mon, 27 Sep 2021 20:33:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:35:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b68810e70cbda70ec4e1a267a7d1d3e935c5718b
X-Git-Newrev: 179ae068eb7035e3a3da0e4a936bc4e0be8acbb1
X-Patchwork-Hint: ignore
Message-Id: <20210927203348.BBAEF8D3BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/iso9660: add support to Grub EFI
 bootloader in the image
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=179ae068eb7035e3a3da0e4a936bc4e0be8acbb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support to boot the Grub bootloader from an EFI BIOS in the ISO9660
image.
For that we need to create EFI System Partition (ESP). The ESP is a vfat
partition which contain the Grub2 binary at the /EFI/BOOT/ location.
xorriso command will generate the iso image including the ESP.

We notice Grub can not read and mount the ESP, therefore we place the Grub
configuration file in the ISO9660 partition. A Grub2 builtin configuration
need to be used to tell Grub2 to search automatically its configuration
file in the ISO9660 partition. Use 'set root=(cd0)' in the configuration
file passed to BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[yann.morin.1998@free.fr: fix timestamp fixup hook]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/iso9660/Config.in  | 29 ++++++++++++++++++++++-------
 fs/iso9660/iso9660.mk | 46 +++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 6f001c0640..f8f577506d 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -2,8 +2,7 @@ config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_TARGET_GRUB2_I386_PC || \
-		BR2_TARGET_SYSLINUX_ISOLINUX
+	depends on BR2_TARGET_GRUB2 || BR2_TARGET_SYSLINUX_ISOLINUX
 	select BR2_LINUX_KERNEL_INSTALL_TARGET \
 	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
 	help
@@ -27,12 +26,15 @@ choice
 
 config BR2_TARGET_ROOTFS_ISO9660_GRUB2
 	bool "grub2"
-	depends on BR2_TARGET_GRUB2_I386_PC
+	depends on BR2_TARGET_GRUB2
 	help
 	  Use Grub 2 as the bootloader for the ISO9660 image. Make
 	  sure to enable the 'iso9660' module in
-	  BR2_TARGET_GRUB2_BUILTIN_MODULES and to use 'cd' as the boot
-	  partition in BR2_TARGET_GRUB2_BOOT_PARTITION=.
+	  BR2_TARGET_GRUB2_BUILTIN_MODULES_PC or
+	  BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI. Use 'cd' as the boot
+	  partition in BR2_TARGET_GRUB2_BOOT_PARTITION= for GRUB on BIOS
+	  or 'set root=(cd0)' in the configuration file passed to
+	  BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI for GRUB on EFI.
 
 config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 	bool "isolinux"
@@ -40,6 +42,19 @@ config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 
 endchoice
 
+choice
+	prompt "Boot payload"
+
+config BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER
+	bool "legacy bios"
+	depends on BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+
+config BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER
+	bool "UEFI"
+	depends on BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI
+
+endchoice
+
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu config file"
 	default "fs/iso9660/grub.cfg" if BR2_TARGET_ROOTFS_ISO9660_GRUB2
@@ -83,7 +98,7 @@ config BR2_TARGET_ROOTFS_ISO9660_HYBRID
 
 endif
 
-comment "iso image needs a Linux kernel and either grub2 i386-pc or isolinux to be built"
+comment "iso image needs a Linux kernel and either grub2 or isolinux to be built"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_LINUX_KERNEL || \
-		!(BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_SYSLINUX_ISOLINUX)
+		!(BR2_TARGET_GRUB2 || BR2_TARGET_SYSLINUX_ISOLINUX)
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 23421a9a5c..27319b024b 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -57,7 +57,14 @@ else
 ROOTFS_ISO9660_TMP_TARGET_DIR = $(TARGET_DIR)
 endif
 
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2),y)
+ifeq ($(BR2_REPRODUCIBLE),y)
+ROOTFS_ISO9660_VFAT_OPTS = --invariant
+ROOTFS_ISO9660_FIX_TIME = touch -d @$(SOURCE_DATE_EPOCH)
+else
+ROOTFS_ISO9660_FIX_TIME = @:
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2)$(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),yy)
 ROOTFS_ISO9660_DEPENDENCIES += grub2
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
 	$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/grub/grub.cfg
@@ -66,6 +73,23 @@ define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/grub-eltorito.img \
 		$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/grub/grub-eltorito.img
 endef
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2)$(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),yy)
+ROOTFS_ISO9660_DEPENDENCIES += grub2 host-dosfstools host-mtools
+ROOTFS_ISO9660_EFI_PARTITION = boot/fat.efi
+ROOTFS_ISO9660_EFI_PARTITION_PATH = $(ROOTFS_ISO9660_TMP_TARGET_DIR)/$(ROOTFS_ISO9660_EFI_PARTITION)
+ROOTFS_ISO9660_EFI_PARTITION_CONTENT = $(BINARIES_DIR)/efi-part
+ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
+	$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/grub/grub.cfg
+define ROOTFS_ISO9660_INSTALL_BOOTLOADER
+	rm -rf $(ROOTFS_ISO9660_EFI_PARTITION_PATH)
+	mkdir -p $(dir $(ROOTFS_ISO9660_EFI_PARTITION_PATH))
+	dd if=/dev/zero of=$(ROOTFS_ISO9660_EFI_PARTITION_PATH) bs=1M count=1
+	$(HOST_DIR)/sbin/mkfs.vfat $(ROOTFS_ISO9660_VFAT_OPTS) $(ROOTFS_ISO9660_EFI_PARTITION_PATH)
+	$(ROOTFS_ISO9660_FIX_TIME) $(ROOTFS_ISO9660_EFI_PARTITION_CONTENT)/*
+	$(HOST_DIR)/bin/mcopy -p -m -i $(ROOTFS_ISO9660_EFI_PARTITION_PATH) -s \
+		$(ROOTFS_ISO9660_EFI_PARTITION_CONTENT)/* ::/
+	$(ROOTFS_ISO9660_FIX_TIME) $(ROOTFS_ISO9660_EFI_PARTITION_PATH)
+endef
 else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
 ROOTFS_ISO9660_DEPENDENCIES += syslinux
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
@@ -128,9 +152,25 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 
 endif # ROOTFS_ISO9660_USE_INITRD
 
+ROOTFS_ISO9660_OPTS += \
+	-J \
+	-R \
+	-no-emul-boot
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),y)
+ROOTFS_ISO9660_OPTS += \
+	-boot-load-size 4 \
+	-boot-info-table \
+	-b $(ROOTFS_ISO9660_BOOT_IMAGE)
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),y)
+ROOTFS_ISO9660_OPTS += \
+	--efi-boot $(ROOTFS_ISO9660_EFI_PARTITION)
+endif
+
 define ROOTFS_ISO9660_CMD
-	$(HOST_DIR)/bin/xorriso -as mkisofs -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
-		-no-emul-boot -boot-load-size 4 -boot-info-table \
+	$(HOST_DIR)/bin/xorriso -as mkisofs \
 		$(ROOTFS_ISO9660_OPTS) \
 		-o $@ $(ROOTFS_ISO9660_TMP_TARGET_DIR)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
