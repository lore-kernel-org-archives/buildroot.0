Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70489C83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 429DB610AE;
	Sat,  5 Jul 2025 17:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eM3Kqlgs8_UO; Sat,  5 Jul 2025 17:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D6660F36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D6660F36;
	Sat,  5 Jul 2025 17:47:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7374C12E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3569283955
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyX4yX10SCrZ for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 074C883A08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 074C883A08
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 042E2819F0; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59f661b8faf1ac0892dd46875732b9d5591f1d85
X-Git-Newrev: 269bb5d8bfd29cf031e8943f7881cabe96ba3b46
X-Patchwork-Hint: ignore
Message-Id: <20250705174709.042E2819F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: Add LoongArch64 OVMF support
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

commit: https://git.buildroot.net/buildroot/commit/?id=269bb5d8bfd29cf031e8943f7881cabe96ba3b46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LoongArch64 OVMF target is introduced to EDK2 in edk2-202408.

Enable architecture support here.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/edk2/Config.in | 14 +++++++++++++-
 boot/edk2/edk2.mk   |  6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 635bb0100a..850b9a39de 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -2,6 +2,7 @@ config BR2_TARGET_EDK2_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_RISCV_64
 	default y if BR2_x86_64
 
@@ -21,6 +22,8 @@ if BR2_TARGET_EDK2
 choice
 	prompt "Platform"
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_I386 if BR2_i386
+	default BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64 if \
+		BR2_loongarch64
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV if BR2_RISCV_64
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
 	default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
@@ -31,7 +34,15 @@ config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
 	help
 	  Platform configuration for a generic i386 target.
 	  This platform will boot from flash address 0x0.
-	  It should therefore be used as the first bootloader.
+
+config BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64
+	bool "LoongArch64"
+	depends on BR2_loongarch64
+	help
+	  Platform configuration for LoongArch QEMU targeting the
+	  Virt machine. This platform will only boot from flash
+	  address 0x1c000000. It should therefore be used as the first
+	  bootloader.
 
 config BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV
 	bool "RISC-V"
@@ -125,6 +136,7 @@ config BR2_TARGET_EDK2_FD_NAME
 	default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_X64
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
+	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64
 	default "BL33_AP_UEFI" if BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
 	default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
 	default "ARMADA_EFI" if BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 36bcbfc88b..3612c86fb1 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -123,6 +123,12 @@ EDK2_PACKAGE_NAME = OvmfPkg/RiscVVirt
 EDK2_PLATFORM_NAME = RiscVVirtQemu
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
 
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64),y)
+EDK2_ARCH = LOONGARCH64
+EDK2_PACKAGE_NAME = OvmfPkg/LoongArchVirt
+EDK2_PLATFORM_NAME = LoongArchVirtQemu
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+
 endif
 
 EDK2_BASETOOLS_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
