Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8260FCAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A0C608C5;
	Sun,  5 Oct 2025 13:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osMQzijUvi5v; Sun,  5 Oct 2025 13:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52F7460E07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F7460E07;
	Sun,  5 Oct 2025 13:49:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D601226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63F5C40BA6
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLVoyKqMZpxb for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:49:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08EE640A04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08EE640A04
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08EE640A04
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:49:54 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -654664835; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 13:49:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1v5P7X-00GodB-24;
 Sun, 05 Oct 2025 15:49:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  5 Oct 2025 15:49:49 +0200
Message-Id: <20251005134950.4007861-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hcUFXWhB1Fi0QXZg8DRANahNhpnkJrTeKhrun+r1zGok2Pd/PZTcaKbTODKInklgrc0b/5EJawuIjUnmM3XUyJzlzNemE/E+5uHePWMJPAdujl/HGsPc51eTRap4gD7Mjt6Mgut7+GYzyDQMOi+q7guP/DsQ+8SKcKQrVvNGn53ufLB0Eb589Qv4BpMAKFA6QHh6WfvaXxlJ3ZQp9/D6ZfETTX3tiNM9DVhvTtUizVMSH9L2G14OEqim+Mz35GVCvPB7Um6g9BVQ62nVfP8l0u5yjU9UmF79gyn6yMHzKcmzELL+DjteGGVdkzuLEKPn37C5Jsi7kJ0yxExWfaZ4hA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=+BX7C/cstDVzc8wheivVyRJV/kBu3n9mSts/JChNx0s=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=hcUFXWhB
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] boot/s500-bootloader: drop package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the removal of the roseapplepi defconfig in commit 56091a581854a
("configs/roseapplepi: remove defconfig, broken") there are no (in-tree)
users of the s500-bootloader binary blob package, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                          |  6 ++++
 boot/Config.in                            |  1 -
 boot/s500-bootloader/Config.in            | 17 ------------
 boot/s500-bootloader/s500-bootloader.hash |  2 --
 boot/s500-bootloader/s500-bootloader.mk   | 34 -----------------------
 utils/genrandconfig                       |  5 ----
 6 files changed, 6 insertions(+), 59 deletions(-)
 delete mode 100644 boot/s500-bootloader/Config.in
 delete mode 100644 boot/s500-bootloader/s500-bootloader.hash
 delete mode 100644 boot/s500-bootloader/s500-bootloader.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 2c5b389dc8..3d57df2af0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_TARGET_S500_BOOTLOADER
+	bool "s500-bootloader"
+	select BR2_LEGACY
+	help
+	  s500-bootloader package has been removed
+
 config BR2_PACKAGE_LIBBSON
 	bool "libbson has been removed"
 	select BR2_LEGACY
diff --git a/boot/Config.in b/boot/Config.in
index 08a6c8353d..15b14a60a5 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,7 +20,6 @@ source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
-source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
diff --git a/boot/s500-bootloader/Config.in b/boot/s500-bootloader/Config.in
deleted file mode 100644
index 7bb689f305..0000000000
--- a/boot/s500-bootloader/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_TARGET_S500_BOOTLOADER
-	bool "s500-bootloader"
-	depends on BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	help
-	  1st level bootloader for Actions Semiconductor S500 SoC.
-
-	  https://github.com/xapp-le/owl
-
-config BR2_TARGET_S500_BOOTLOADER_BOARD
-	string "board to configure for"
-	depends on BR2_TARGET_S500_BOOTLOADER
-	help
-	  Specify the board to configure the bootloader for.
-	  This should be the name of a directory under s500/boards
-	  containing a suitable bootloader.ini file.
diff --git a/boot/s500-bootloader/s500-bootloader.hash b/boot/s500-bootloader/s500-bootloader.hash
deleted file mode 100644
index 2ebd933e52..0000000000
--- a/boot/s500-bootloader/s500-bootloader.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  b183024ac69f51ea7befd28d03b2ec35a7280e270405600fb4f37aa91d9c9571  s500-bootloader-a8d7fa1d9a7f353ec4613febf30f4ca99a10a106.tar.gz
diff --git a/boot/s500-bootloader/s500-bootloader.mk b/boot/s500-bootloader/s500-bootloader.mk
deleted file mode 100644
index bc87b091c7..0000000000
--- a/boot/s500-bootloader/s500-bootloader.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# s500-bootloader
-#
-################################################################################
-
-S500_BOOTLOADER_VERSION = a8d7fa1d9a7f353ec4613febf30f4ca99a10a106
-S500_BOOTLOADER_SITE = $(call github,xapp-le,owl,$(S500_BOOTLOADER_VERSION))
-S500_BOOTLOADER_LICENSE = PROPRIETARY
-S500_BOOTLOADER_INSTALL_TARGET = NO
-S500_BOOTLOADER_INSTALL_IMAGES = YES
-
-S500_BOOTLOADER_BOARD = $(call qstrip,$(BR2_TARGET_S500_BOOTLOADER_BOARD))
-
-define S500_BOOTLOADER_BUILD_CMDS
-	cd $(@D) && ./tools/utils/bootloader_pack \
-		s500/bootloader/bootloader.bin \
-		s500/boards/$(S500_BOOTLOADER_BOARD)/bootloader.ini \
-		s500-bootloader.bin
-endef
-
-define S500_BOOTLOADER_INSTALL_IMAGES_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/s500-bootloader.bin \
-		$(BINARIES_DIR)/s500-bootloader.bin
-endef
-
-$(eval $(generic-package))
-
-ifeq ($(BR2_TARGET_S500_BOOTLOADER)$(BR_BUILDING),yy)
-# we NEED a board name
-ifeq ($(S500_BOOTLOADER_BOARD),)
-$(error No s500-bootloader board specified. Check your BR2_TARGET_S500_BOOTLOADER settings)
-endif
-endif
diff --git a/utils/genrandconfig b/utils/genrandconfig
index ac80982f63..5ebd552a1d 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -362,11 +362,6 @@ async def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y\n')
         configlines.remove('BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE=""\n')
 
-    if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
-       'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
-        configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
-        configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
-
     if 'BR2_TARGET_TI_K3_R5_LOADER=y\n' in configlines and \
        'BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG=y\n' in configlines and \
        'BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=""\n' in configlines:
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
