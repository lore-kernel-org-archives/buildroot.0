Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9FDC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 223D440018;
	Sun, 24 Dec 2023 16:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 223D440018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hxv3-rN8fz4f; Sun, 24 Dec 2023 16:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C7E14056E;
	Sun, 24 Dec 2023 16:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C7E14056E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E88F1BF304
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8518460C0F
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8518460C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdl5L4JjitJT for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:56:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9A1260BB6
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9A1260BB6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A142482751; Sun, 24 Dec 2023 16:56:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 17:55:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adf58f26be60462b5d55d4296419d724ba30c014
X-Git-Newrev: f439b47ed6e987306c7de6d9c3be11de04935377
X-Patchwork-Hint: ignore
Message-Id: <20231224165609.A142482751@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: add RISC-V 64bit EFI support
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

commit: https://git.buildroot.net/buildroot/commit/?id=f439b47ed6e987306c7de6d9c3be11de04935377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Grub can be built as a RISC-V UEFI application since commit [1]. This
commit was first included in grub version 2.04.

This commit enables this support.

[1] https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=f1957dc8a3347278a095bc8f44197662559a8ba3

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
index 4430aebd59..6d0d71c47d 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
