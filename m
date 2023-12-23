Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB76C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC30E81EA0;
	Sat, 23 Dec 2023 21:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC30E81EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRBaLBFX7EKv; Sat, 23 Dec 2023 21:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D37981EB4;
	Sat, 23 Dec 2023 21:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D37981EB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F2A91BF406
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45A0C41823
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45A0C41823
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaQWIcxfFAih for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:30:08 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09C0D41821
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09C0D41821
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 76E2A13F846;
 Sat, 23 Dec 2023 22:30:01 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 22:29:47 +0100
Message-ID: <20231223212948.2512412-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231223194150.1152752-1-ju.o@free.fr>
References: <20231223194150.1152752-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703367005;
 bh=ZZzkhCYSeUfBqVwG0h2hTiDnMCjWJBFMsRjVULbCyrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dx/l3GzlFXaH3EW+XUMfPFyaA+wVqruSHi/QlE/q3NOm9rgmgC9l4FjIgsBRV5i6U
 7qSKXLcrnrNIcLqje2QuzfvIoarjZJRGG2FRLuWyWCR6N2cyHDj58lPUelTNbLNq/1
 Cm42E0rDlxaxebTkA9+B1qSeGMugYiDti6I/oQHlaTYbSCx9cJaPSfUhazlwmq4EH7
 uP5Uuh9V5z9WlVuKm3yIN9ppbkPjD8vZInY9gaOvzCQ9vmQRo9uanTn0SlMJJSebDy
 P3XpPPvLtM1ZI4N7F/HbHMVjo+rGDT4b9Pd1RBGz5cytuxzWgeDTwdXqdGEJXU+/SB
 jyiDSrSCTFHiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dx/l3Gzl
Subject: [Buildroot] [PATCH v2 1/2] boot/grub2: add RISC-V 64bit EFI support
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Grub can be built as a RISC-V UEFI application since commit [1]. This
commit was first included in grub version 2.04.

This commit enables this support.

[1] https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=f1957dc8a3347278a095bc8f44197662559a8ba3

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/grub2/Config.in | 10 ++++++++++
 boot/grub2/grub2.mk  |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index f05f33ccc7..7c235e96f7 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -4,6 +4,7 @@ config BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	default y if BR2_arm
 	default y if BR2_aarch64
+	default y if BR2_RISCV_64
 	depends on BR2_USE_MMU
 
 config BR2_TARGET_GRUB2
@@ -102,6 +103,15 @@ config BR2_TARGET_GRUB2_ARM64_EFI
 	  Aarch64 platform and you want to boot Grub 2 as an EFI
 	  application.
 
+config BR2_TARGET_GRUB2_RISCV64_EFI
+	bool "riscv64-efi"
+	depends on BR2_RISCV_64
+	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
+	help
+	  Select this option if the platform you're targetting is a
+	  64bit RISC-V platform and you want to boot Grub 2 as an EFI
+	  application.
+
 if BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 
 comment "Options for the x86 legacy BIOS or ARM U-Boot support"
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index b9be826885..679eac5f46 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -93,6 +93,15 @@ GRUB2_BUILTIN_CONFIG_arm64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
 GRUB2_BUILTIN_MODULES_arm64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
 GRUB2_TUPLES-$(BR2_TARGET_GRUB2_ARM64_EFI) += arm64-efi
 
+GRUB2_IMAGE_riscv64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootriscv64.efi
+GRUB2_CFG_riscv64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX_riscv64-efi = /EFI/BOOT
+GRUB2_TARGET_riscv64-efi = riscv64
+GRUB2_PLATFORM_riscv64-efi = efi
+GRUB2_BUILTIN_CONFIG_riscv64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
+GRUB2_BUILTIN_MODULES_riscv64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
+GRUB2_TUPLES-$(BR2_TARGET_GRUB2_RISCV64_EFI) += riscv64-efi
+
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the host programs and uses TARGET_CC, TARGET_CFLAGS,
 # TARGET_CPPFLAGS, TARGET_LDFLAGS to build the bootloader itself.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
