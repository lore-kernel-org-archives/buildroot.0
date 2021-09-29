Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53801C433FE
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 21:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847A0615E1
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 21:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 847A0615E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55A0C83FA0;
	Wed, 29 Sep 2021 21:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVjJq5OEmPON; Wed, 29 Sep 2021 21:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C39B83F9D;
	Wed, 29 Sep 2021 21:20:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAF5E1BF3DC
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AC5660657
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 21:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EjfnXKLXyMqe for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 21:19:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E9DF60595
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 21:19:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 18D518D6B1; Wed, 29 Sep 2021 21:17:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 22:58:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b1659107d8b0e80e2b19ad83b5fa7e564c411e1
X-Git-Newrev: 5916cc501120aab59452cbe6f99ac8797558e1ca
X-Patchwork-Hint: ignore
Message-Id: <20210929211738.18D518D6B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/iso9660: add support for hybrid image
 using Grub2 on BIOS and EFI
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

commit: https://git.buildroot.net/buildroot/commit/?id=5916cc501120aab59452cbe6f99ac8797558e1ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for building an hybrid ISO9660 image compatible with legacy
and UEFI BIOS. Note that this is not about an (iso)hybrid image, which
can boot from both a CDROM or a USB stick, but really about an image
being bootable from the legay BIOS or EFI; the two are orthognal.

The option -eltorito-alt-boot need to be used in the xorriso command
to generate the hybrid image. That option is a separator, meaning the
previous boot entry is done, and the following boot options define a new
boot entry.

The -no-emul-boot defines the type of the current boot image; that's why
it has to now be repeated in each of the BIOS and EFI options.

Finally, for symetry and consistency between the BIOS and EFI options,
we move the BIOS image option first.

Note: the BIOS boot image options have to be provided before the EFI
ones, or the system won't boot; the underlying reason is not known...

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[yann.morin.1998@free.fr:
  - note about hybrid vs. (iso)hybrid
  - explain -eltorito-alt-boot
  - explain duplication of -no-emul-boot
  - rename the variables
  - note about the BIOS-EFI ordering
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/iso9660/Config.in  | 16 +++++++---------
 fs/iso9660/iso9660.mk | 45 ++++++++++++++++++++++++++++-----------------
 2 files changed, 35 insertions(+), 26 deletions(-)

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
index faa15833c2..0524f94c35 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -69,18 +69,20 @@ ROOTFS_ISO9660_DEPENDENCIES += grub2
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
@@ -90,12 +92,14 @@ define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 		$(ROOTFS_ISO9660_EFI_PARTITION_CONTENT)/* ::/
 	$(ROOTFS_ISO9660_FIX_TIME) $(ROOTFS_ISO9660_EFI_PARTITION_PATH)
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
@@ -108,7 +112,8 @@ define ROOTFS_ISO9660_PREPARATION
 		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 	$(SED) "s%__KERNEL_PATH__%/boot/$(LINUX_IMAGE_NAME)%" \
 		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
-	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER)
+	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER_BIOS)
+	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER_EFI)
 endef
 
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
@@ -152,21 +157,27 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 
 endif # ROOTFS_ISO9660_USE_INITRD
 
-ROOTFS_ISO9660_OPTS += \
-	-J \
-	-R \
-	-no-emul-boot
+ROOTFS_ISO9660_OPTS += -J -R
 
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),y)
-ROOTFS_ISO9660_OPTS += \
+ROOTFS_ISO9660_OPTS_BIOS = \
+	-b $(ROOTFS_ISO9660_BOOT_IMAGE) \
+	-no-emul-boot \
 	-boot-load-size 4 \
-	-boot-info-table \
-	-b $(ROOTFS_ISO9660_BOOT_IMAGE)
-endif
+	-boot-info-table
+
+ROOTFS_ISO9660_OPTS_EFI = \
+	--efi-boot $(ROOTFS_ISO9660_EFI_PARTITION) \
+	-no-emul-boot
 
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),y)
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER)$(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),yy)
 ROOTFS_ISO9660_OPTS += \
-	--efi-boot $(ROOTFS_ISO9660_EFI_PARTITION)
+	$(ROOTFS_ISO9660_OPTS_BIOS) \
+	-eltorito-alt-boot \
+	$(ROOTFS_ISO9660_OPTS_EFI)
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BIOS_BOOTLOADER),y)
+ROOTFS_ISO9660_OPTS += $(ROOTFS_ISO9660_OPTS_BIOS)
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_EFI_BOOTLOADER),y)
+ROOTFS_ISO9660_OPTS += $(ROOTFS_ISO9660_OPTS_EFI)
 endif
 
 define ROOTFS_ISO9660_CMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
