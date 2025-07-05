Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B340C8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3294F6105D;
	Sat,  5 Jul 2025 17:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffQggkRnnbik; Sat,  5 Jul 2025 17:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CC8560EE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC8560EE1;
	Sat,  5 Jul 2025 17:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B74E012E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A977660AAC
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7KbPFZdP8lm for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED8B1608AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED8B1608AA
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCB0A85615; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 677047d200a5584ec245031ec60b41ad78b5fd45
X-Git-Newrev: c4a4b8552f80c1ce8b0e70fcfae58c74091fbb63
X-Patchwork-Hint: ignore
Message-Id: <20250705174708.DCB0A85615@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: Introduce loongarch64-efi
 target
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4a4b8552f80c1ce8b0e70fcfae58c74091fbb63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

loongarch64-efi target presents in GRUB can be utilised
by any EFI compatible LoongArch64 machine to boot kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/grub2/Config.in | 10 ++++++++++
 boot/grub2/grub2.mk  |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index ecee9ef74c..3a50ec0ad7 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -5,6 +5,7 @@ config BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_aarch64
 	default y if BR2_RISCV_64
+	default y if BR2_loongarch64
 	depends on BR2_USE_MMU
 
 menuconfig BR2_TARGET_GRUB2
@@ -112,6 +113,15 @@ config BR2_TARGET_GRUB2_RISCV64_EFI
 	  64bit RISC-V platform and you want to boot Grub 2 as an EFI
 	  application.
 
+config BR2_TARGET_GRUB2_LOONGARCH64_EFI
+	bool "loongarch64-efi"
+	depends on BR2_loongarch64
+	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
+	help
+	  Select this option if the platform you're targetting is a
+	  64bit LoongArch platform and you want to boot Grub 2 as an EFI
+	  application.
+
 if BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 
 comment "Options for the x86 legacy BIOS or ARM U-Boot support"
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 22d609c004..4562e57a4f 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -102,6 +102,15 @@ GRUB2_BUILTIN_CONFIG_riscv64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
 GRUB2_BUILTIN_MODULES_riscv64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
 GRUB2_TUPLES-$(BR2_TARGET_GRUB2_RISCV64_EFI) += riscv64-efi
 
+GRUB2_IMAGE_loongarch64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootloongarch64.efi
+GRUB2_CFG_loongarch64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX_loongarch64-efi = /EFI/BOOT
+GRUB2_TARGET_loongarch64-efi = loongarch64
+GRUB2_PLATFORM_loongarch64-efi = efi
+GRUB2_BUILTIN_CONFIG_loongarch64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
+GRUB2_BUILTIN_MODULES_loongarch64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
+GRUB2_TUPLES-$(BR2_TARGET_GRUB2_LOONGARCH64_EFI) += loongarch64-efi
+
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the host programs and uses TARGET_CC, TARGET_CFLAGS,
 # TARGET_CPPFLAGS, TARGET_LDFLAGS to build the bootloader itself.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
