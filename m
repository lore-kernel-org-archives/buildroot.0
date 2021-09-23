Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18289C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 15:58:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF47261019
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 15:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF47261019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B558606A6;
	Thu, 23 Sep 2021 15:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1U_wDlbg-9o9; Thu, 23 Sep 2021 15:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D3360B72;
	Thu, 23 Sep 2021 15:58:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C77C1BF3C4
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 15:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C24BC60692
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 15:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMyDva_L_pnW for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 15:57:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0035606A6
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 15:57:30 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C8864E0006;
 Thu, 23 Sep 2021 15:57:28 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 17:57:23 +0200
Message-Id: <20210923155726.87851-5-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923155726.87851-1-kory.maincent@bootlin.com>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/7] fs/iso9660: add support for hybrid image
 using Grub bootloader on BIOS and EFI
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

Add support for building an hybrid ISO9660 image compatible with legacy
and UEFI BIOS.
The option -eltorito-alt-boot need to be used in the xorriso command
to generate the hybrid image.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Changes in v2:
- Fix typos

Changes in v3:
- Follow changes brougt by modification of the third patch.

 fs/iso9660/Config.in  | 16 +++++++--------
 fs/iso9660/iso9660.mk | 45 ++++++++++++++++++++++++++++---------------
 2 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index f8f577506d..8c4e7badf8 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -27,6 +27,10 @@ choice
 config BR2_TARGET_ROOTFS_ISO9660_GRUB2
 	bool "grub2"
 	depends on BR2_TARGET_GRUB2
+	select BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER \
+		if BR2_TARGET_GRUB2_I386_PC
+	select BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER \
+		if (BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI)
 	help
 	  Use Grub 2 as the bootloader for the ISO9660 image. Make
 	  sure to enable the 'iso9660' module in
@@ -39,21 +43,15 @@ config BR2_TARGET_ROOTFS_ISO9660_GRUB2
 config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 	bool "isolinux"
 	depends on BR2_TARGET_SYSLINUX_ISOLINUX
+	select BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER
 
 endchoice
 
-choice
-	prompt "Boot payload"
-
 config BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER
-	bool "legacy bios"
-	depends on BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+	bool
 
 config BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER
-	bool "UEFI"
-	depends on BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI
-
-endchoice
+	bool
 
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu config file"
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 921efa1b02..9c2535d102 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -67,18 +67,20 @@ ROOTFS_ISO9660_DEPENDENCIES += grub2
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
 	$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/grub/grub.cfg
 ROOTFS_ISO9660_BOOT_IMAGE = boot/grub/grub-eltorito.img
-define ROOTFS_ISO9660_INSTALL_BOOTLOADER
+define ROOTFS_ISO9660_INSTALL_BOOTLOADER_BIOS
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/grub-eltorito.img \
 		$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/grub/grub-eltorito.img
 endef
-else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2)$(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),yy)
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2)$(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),yy)
 ROOTFS_ISO9660_DEPENDENCIES += grub2 host-dosfstools host-mtools
 ROOTFS_ISO9660_EFI_PARTITION = boot/fat.efi
 ROOTFS_ISO9660_EFI_PARTITION_PATH = $(ROOTFS_ISO9660_TMP_TARGET_DIR)/$(ROOTFS_ISO9660_EFI_PARTITION)
 ROOTFS_ISO9660_EFI_PARTITION_CONTENT = $(BINARIES_DIR)/efi-part
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
 	$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/grub/grub.cfg
-define ROOTFS_ISO9660_INSTALL_BOOTLOADER
+define ROOTFS_ISO9660_INSTALL_BOOTLOADER_EFI
 	rm -rf $(ROOTFS_ISO9660_EFI_PARTITION_PATH)
 	mkdir -p $(dir $(ROOTFS_ISO9660_EFI_PARTITION_PATH))
 	dd if=/dev/zero of=$(ROOTFS_ISO9660_EFI_PARTITION_PATH) bs=1M count=1
@@ -87,12 +89,14 @@ define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(HOST_DIR)/bin/mcopy -p -m -i $(ROOTFS_ISO9660_EFI_PARTITION_PATH) -s \
 		$(ROOTFS_ISO9660_EFI_PARTITION_CONTENT)/* ::/
 endef
-else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
 ROOTFS_ISO9660_DEPENDENCIES += syslinux
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
 	$(ROOTFS_ISO9660_TMP_TARGET_DIR)/isolinux/isolinux.cfg
 ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
-define ROOTFS_ISO9660_INSTALL_BOOTLOADER
+define ROOTFS_ISO9660_INSTALL_BOOTLOADER_BIOS
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/* \
 		$(ROOTFS_ISO9660_TMP_TARGET_DIR)/isolinux/
 	$(INSTALL) -D -m 0644 $(HOST_DIR)/share/syslinux/ldlinux.c32 \
@@ -105,7 +109,8 @@ define ROOTFS_ISO9660_PREPARATION
 		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 	$(SED) "s%__KERNEL_PATH__%/boot/$(LINUX_IMAGE_NAME)%" \
 		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
-	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER)
+	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER_BIOS)
+	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER_EFI)
 endef
 
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
@@ -151,24 +156,32 @@ endif # ROOTFS_ISO9660_USE_INITRD
 
 ROOTFS_ISO9660_OPTS += \
 	-J \
-	-R \
-	-no-emul-boot
+	-R
 
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),y)
-ROOTFS_ISO9660_OPTS += \
+ROOTFS_ISO9660_BOOTLOADER_OPTS_BIOS = \
+	-b $(ROOTFS_ISO9660_BOOT_IMAGE) \
+	-no-emul-boot \
 	-boot-load-size 4 \
-	-boot-info-table \
-	-b $(ROOTFS_ISO9660_BOOT_IMAGE)
-endif
+	-boot-info-table
 
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),y)
-ROOTFS_ISO9660_OPTS += \
-	--efi-boot $(ROOTFS_ISO9660_EFI_PARTITION)
+ROOTFS_ISO9660_BOOTLOADER_OPTS_EFI = \
+	--efi-boot $(ROOTFS_ISO9660_EFI_PARTITION) \
+	-no-emul-boot
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER)$(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),yy)
+ROOTFS_ISO9660_BOOTLOADER_OPTS = $(ROOTFS_ISO9660_BOOTLOADER_OPTS_BIOS)
+ROOTFS_ISO9660_BOOTLOADER_OPTS += -eltorito-alt-boot
+ROOTFS_ISO9660_BOOTLOADER_OPTS += $(ROOTFS_ISO9660_BOOTLOADER_OPTS_EFI)
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),y)
+ROOTFS_ISO9660_BOOTLOADER_OPTS = $(ROOTFS_ISO9660_BOOTLOADER_OPTS_BIOS)
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),y)
+ROOTFS_ISO9660_BOOTLOADER_OPTS = $(ROOTFS_ISO9660_BOOTLOADER_OPTS_EFI)
 endif
 
 define ROOTFS_ISO9660_CMD
 	$(HOST_DIR)/bin/xorriso -as mkisofs \
 		$(ROOTFS_ISO9660_OPTS) \
+		$(ROOTFS_ISO9660_BOOTLOADER_OPTS) \
 		-o $@ $(ROOTFS_ISO9660_TMP_TARGET_DIR)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
