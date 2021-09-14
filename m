Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78C4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29026604AC
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29026604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2D6780D71;
	Tue, 14 Sep 2021 09:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjCaKRAdwkNp; Tue, 14 Sep 2021 09:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C66F80D76;
	Tue, 14 Sep 2021 09:35:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E2F21BF989
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D38160761
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OU4yM3cOGmrf for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 09:35:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95972605C0
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 09:35:01 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AE701FF813;
 Tue, 14 Sep 2021 09:34:59 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 11:34:54 +0200
Message-Id: <20210914093457.1389174-6-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914093457.1389174-1-kory.maincent@bootlin.com>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/8] fs/iso9660: add support for hybrid image
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
Cc: thomas.petazzoni@bootlin.com
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
 fs/iso9660/iso9660.mk | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 4e4c5de1d0..d1ce2a1a3f 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -62,19 +62,21 @@ ROOTFS_ISO9660_DEPENDENCIES += grub2
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
 	$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/grub/grub.cfg
 ROOTFS_ISO9660_BOOT_IMAGE = boot/grub/grub-eltorito.img
-define ROOTFS_ISO9660_INSTALL_BOOTLOADER
+define ROOTFS_ISO9660_INSTALL_BOOTLOADER_BIOS
 	mkdir -p $(dir ROOTFS_ISO9660_BOOT_IMAGE)
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
@@ -82,12 +84,14 @@ define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(HOST_DIR)/bin/mcopy -i $(ROOTFS_ISO9660_EFI_PARTITION_PATH) -s \
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
@@ -100,7 +104,8 @@ define ROOTFS_ISO9660_PREPARATION
 		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 	$(SED) "s%__KERNEL_PATH__%/boot/$(LINUX_IMAGE_NAME)%" \
 		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
-	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER)
+	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER_BIOS)
+	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER_EFI)
 endef
 
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
@@ -144,15 +149,22 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 
 endif # ROOTFS_ISO9660_USE_INITRD
 
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),y)
-ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS = \
+ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS_BIOS = \
 	-J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
-	$(ROOTFS_ISO9660_XORRISO_BOOTLOADER_COMMON_OPTS) \
 	-boot-load-size 4 -boot-info-table -no-emul-boot
-else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),y)
-ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS = \
+
+ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS_EFI = \
 	--efi-boot $(ROOTFS_ISO9660_EFI_PARTITION) \
 	-no-emul-boot
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER)$(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),yy)
+ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS = $(ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS_BIOS)
+ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS += -eltorito-alt-boot
+ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS += $(ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS_EFI)
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),y)
+ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS = $(ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS_BIOS)
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),y)
+ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS = $(ROOTFS_ISO9660_XORRISO_BOOTLOADER_OPTS_EFI)
 endif
 
 define ROOTFS_ISO9660_CMD
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
