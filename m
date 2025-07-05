Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC7EC83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ED4A83A0C;
	Sat,  5 Jul 2025 17:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwBfUFWd9d8g; Sat,  5 Jul 2025 17:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 827BD83A45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 827BD83A45;
	Sat,  5 Jul 2025 17:47:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D5CB12E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 882A683A08
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31QMnB4nz0hM for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E008A839BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E008A839BC
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D06E5819F0; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7878ff515d2529c5da6dcd26bcf11bb17e6f1089
X-Git-Newrev: 677047d200a5584ec245031ec60b41ad78b5fd45
X-Patchwork-Hint: ignore
Message-Id: <20250705174708.D06E5819F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: Introduce {vmlinux,
 vmlinuz}.efi kernel binary format
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

commit: https://git.buildroot.net/buildroot/commit/?id=677047d200a5584ec245031ec60b41ad78b5fd45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vmlinux.efi and vmlinuz.efi are standard file names for LoongArch
EFISTUB kernel.

Introduce them to build system.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in | 8 ++++++++
 linux/linux.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 83184363f0..ada39c10a8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -294,6 +294,10 @@ config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
 	depends on BR2_mips || BR2_mipsel || BR2_sh
 
+config BR2_LINUX_KERNEL_VMLINUX_EFI
+	bool "vmlinux.efi"
+	depends on BR2_loongarch64
+
 config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
 
@@ -305,6 +309,10 @@ config BR2_LINUX_KERNEL_VMLINUZ_BIN
 	bool "vmlinuz.bin"
 	depends on BR2_mips || BR2_mipsel
 
+config BR2_LINUX_KERNEL_VMLINUZ_EFI
+	bool "vmlinuz.efi"
+	depends on BR2_loongarch64
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 16762ac2e6..0520394931 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -262,12 +262,16 @@ else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
 LINUX_IMAGE_NAME = linux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX_IMAGE_NAME = vmlinux.bin
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_EFI),y)
+LINUX_IMAGE_NAME = vmlinux.efi
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_NAME = vmlinux
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_NAME = vmlinuz
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ_BIN),y)
 LINUX_IMAGE_NAME = vmlinuz.bin
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ_EFI),y)
+LINUX_IMAGE_NAME = vmlinuz.efi
 endif
 # The if-else blocks above are all the image types we know of, and all
 # come from a Kconfig choice, so we know we have LINUX_IMAGE_NAME set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
