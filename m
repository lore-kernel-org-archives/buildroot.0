Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C53C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:28:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 490EE61131
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 490EE61131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2687083372;
	Tue, 21 Sep 2021 13:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5BdIsiHL2nN; Tue, 21 Sep 2021 13:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F3E08350D;
	Tue, 21 Sep 2021 13:28:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C86B1BF2F5
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C6EA6068A
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qh6XRQdClpsT for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:28:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9CB46067D
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:28:32 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F3240240010;
 Tue, 21 Sep 2021 13:28:30 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 15:28:25 +0200
Message-Id: <20210921132829.56405-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921132829.56405-1-kory.maincent@bootlin.com>
References: <20210921132829.56405-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/6] fs/iso9660: add support to Grub EFI
 bootloader in the image
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

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
---

Changes in v2:
Following the review from Yann E. Morin:
- Add parameter to mkfs and mcopy to allow reproducible builds
- Fix typos and variable multi-line assignement

 fs/iso9660/Config.in  | 30 ++++++++++++++++++++++++------
 fs/iso9660/iso9660.mk | 38 +++++++++++++++++++++++++++++++++++---
 2 files changed, 59 insertions(+), 9 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 6f001c0640..4fc96db28c 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -3,6 +3,7 @@ config BR2_TARGET_ROOTFS_ISO9660
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_TARGET_GRUB2_I386_PC || \
+		BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI || \
 		BR2_TARGET_SYSLINUX_ISOLINUX
 	select BR2_LINUX_KERNEL_INSTALL_TARGET \
 	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
@@ -27,22 +28,38 @@ choice
 
 config BR2_TARGET_ROOTFS_ISO9660_GRUB2
 	bool "grub2"
-	depends on BR2_TARGET_GRUB2_I386_PC
+	depends on BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_I386_EFI || \
+		BR2_TARGET_GRUB2_X86_64_EFI
+	select BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER \
+	       if BR2_TARGET_GRUB2_I386_PC
+	select BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER \
+	       if (BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI)
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
 	depends on BR2_TARGET_SYSLINUX_ISOLINUX
+	select BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER
 
 endchoice
 
+config BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER
+	bool
+
+config BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER
+	bool
+
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu config file"
-	default "fs/iso9660/grub.cfg" if BR2_TARGET_ROOTFS_ISO9660_GRUB2
+	default "fs/iso9660/grub.cfg" if BR2_TARGET_ROOTFS_ISO9660_GRUB2_PC || \
+					BR2_TARGET_ROOTFS_ISO9660_GRUB2_EFI
 	default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 	help
 	  Use this option to provide a custom bootloader configuration
@@ -83,7 +100,8 @@ config BR2_TARGET_ROOTFS_ISO9660_HYBRID
 
 endif
 
-comment "iso image needs a Linux kernel and either grub2 i386-pc or isolinux to be built"
+comment "iso image needs a Linux kernel and either grub2 or isolinux to be built"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_LINUX_KERNEL || \
-		!(BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_SYSLINUX_ISOLINUX)
+		!(BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_I386_EFI || \
+		BR2_TARGET_GRUB2_X86_64_EFI || BR2_TARGET_SYSLINUX_ISOLINUX)
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 23421a9a5c..d46aec002b 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -57,7 +57,11 @@ else
 ROOTFS_ISO9660_TMP_TARGET_DIR = $(TARGET_DIR)
 endif
 
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2),y)
+ifeq ($(BR2_REPRODUCIBLE),y)
+ROOTFS_ISO9660_MKFS_OPTS = --invariant
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2)$(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),yy)
 ROOTFS_ISO9660_DEPENDENCIES += grub2
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
 	$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/grub/grub.cfg
@@ -66,6 +70,21 @@ define ROOTFS_ISO9660_INSTALL_BOOTLOADER
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
+	$(HOST_DIR)/sbin/mkfs.vfat $(ROOTFS_ISO9660_MKFS_OPTS) $(ROOTFS_ISO9660_EFI_PARTITION_PATH)
+	$(HOST_DIR)/bin/mcopy -p -m -i $(ROOTFS_ISO9660_EFI_PARTITION_PATH) -s \
+		$(ROOTFS_ISO9660_EFI_PARTITION_CONTENT)/* ::/
+endef
 else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
 ROOTFS_ISO9660_DEPENDENCIES += syslinux
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
@@ -128,9 +147,22 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 
 endif # ROOTFS_ISO9660_USE_INITRD
 
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),y)
+ROOTFS_ISO9660_OPTS += \
+	-J \
+	-R \
+	-boot-load-size 4 \
+	-boot-info-table \
+	-no-emul-boot \
+	-b $(ROOTFS_ISO9660_BOOT_IMAGE)
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),y)
+ROOTFS_ISO9660_OPTS += \
+	--efi-boot $(ROOTFS_ISO9660_EFI_PARTITION) \
+	-no-emul-boot
+endif
+
 define ROOTFS_ISO9660_CMD
-	$(HOST_DIR)/bin/xorriso -as mkisofs -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
-		-no-emul-boot -boot-load-size 4 -boot-info-table \
+	$(HOST_DIR)/bin/xorriso -as mkisofs \
 		$(ROOTFS_ISO9660_OPTS) \
 		-o $@ $(ROOTFS_ISO9660_TMP_TARGET_DIR)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
