Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39F8CC6B3A
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 16:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F7B607D3;
	Thu, 15 Oct 2026 16:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yss_TTF0l_rW; Thu, 15 Oct 2026 16:02:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 226E9608C0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792080167;
	b=PywjUEAhbRPWdHwZRXArNmX3JQlUQ/rU9VKUYj4vqZzdIkxnziu08QEF5hT4L/rc5rTA
	 KhSY5nsGAUzl08eDW9+wkzk/RhmAzX7bBNwj2tRH5TVN7+NuLqquodkDaKfqwOM4WTMGy
	 8mjX2uRf5mm/NLanIpWa+R5GDCI0nr5OQStm+YFsNrrjUNAb9bF/uKverKw/Ust9OXR7y
	 4ctRi/dRjfPoVxI2XywVAHnaVPakwxQ/teL//Ef4pWb7kOtEZrdJbltHdNX+OwKdgo0C8
	 QTLXAJbyfKcFLB1nFImidQBzus94SIK+T0OJbIE1859gIo8Tz0AsppZ1dokIf1hlXIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792080167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=utbJDpQKywgG3FEREdPNfE3D1GgNesMPQpeshvGSx/A=;
	b=V/xK6R74lJHpqK7uSaux1Uxzk9cqmgGZ37ti2NuCKIeTS2g4F+FBc8VxxoUlaaom4Sic
	 0f6wI/2aONIsAx4yjjbcxcQrCLRjOLnmEr2fkJkwwDxpIjH6ihmFQBgvKqBG0I5fODywX
	 NzYaRE4KfMZCnHWKuyhsRFUSvlrAppn5QM7SGNt6EQqFwHxyOusIRTXYA9KoTSWafwnEA
	 LSuBr50snCUyBcQZTQsyMgQ0WJpeqPwtAnhw19dDVrdnnlNBr26iBdIp9sc+8yoLWmjSc
	 +Mja5ukXMnYALNDR4LjiuTaQG+QMTY7t7f2+WT5cthcWWEY3KmSPnUZ67EoTiDUy8Lw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792080167;
	bh=utbJDpQKywgG3FEREdPNfE3D1GgNesMPQpeshvGSx/A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lrqDKmr9NvK+TMVYOFBApk+nradtVpv4qyDQGBScrfz1Q4T/2jkkOIVLdWE5arq1h
	 ITWnr1lbqC8Fyw5E7DrGt4wB1cl9ZuwMMoQj+WjnQ+bF00SgAXjNEWVeOcz4a9I+xC
	 VoDhtMg2SSltUdMFuSpZwRLwqfDhck1zJINJNhWNN9Qa09AvVFGn4SgBv3+rZYi1Cr
	 3S9gwCWxBAo1vLfkWOFIR+89kLFOCVu2O953SAC7cLQPWv/rdccwZqkY+YWy5bwIZw
	 754fWdCPHDmrpPlQ9WMtzNheIXUIhA5ZMj56xSWN/2GFDls3ZW8kn8b6XkBf+w+EN7
	 g7T/xBktadnrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 226E9608C0;
	Thu, 15 Oct 2026 16:02:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FDE2263
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0621E40775
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LurwuaFDpPUJ for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 16:02:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1018040711
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792080164;
 b=G/im3nFaX0mCr5lvv+zDw1Amhy9AzrdvaA/RYb2ynXLFWr8g2EpjeFmtYiaQRkz14171
 M40jXFnH6HWYfzRy6SOEzb7Tm5kxIKP4KeDJC6dIlUVtx21ZWzG92zVBixrOEKWw15nUu
 fiG8cldZmengLdk7PthC1D16aPwSKXSZ8ffnxvyux7GUaPQcgPAMPDE6D9F8qlCKqvf6P
 uJNaHV+fNDKA4Yjo/ocr1sNJLc5P8LlhBOta7vCZRjAaXQ27BBTu56LRguE9NpXO9AdX8
 uIL/bSkzAoxabch71SdIQSVXgnWmD6UZwF55MthDHf3cgiXrrJsIeD0kNw6soV9LA9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792080164;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HacoKYC+14GoolZMHPHzOj8gGU/CDXJ+T4chAqnsOEY=;
 b=lpUWzBRW8GwxUg1NC36Ts3haRoltOxvQSc+mYeZMEdbc3Cv4V86Zuytso5RghlEs3DVa
 Pd23qpPxr7i/Y/MSIRpk2NIy7/ZdoIGR0En9PoEkhF7A2YbD8zDG5TG7v7TNpOAhGuahY
 35FXpnukCvxip5TvDQlRLqLshDdGzorWXdzk1Dy6X0uWzsNXiLmTVajSCrvZVDU7iB0+d
 +VtEmmxov7w1Q/o1rkhyUrfvm7lA9jq698Jw9cFMvmmRr63XAW2r4yWtf3ksCSpHT0adI
 wfigfc5Nyh0aKqpRRW3co4rq59K3H+8R/TrbXT7oJ3/Y0M1AIaLXIcTu3aWAjGalZaw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1018040711
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:02:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59B0A95336; Thu, 15 Oct 2026 16:01:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 18:01:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98a583e982420334c9ab24ec9e54826dc09c36cd
X-Git-Newrev: 529b876a850e90266eeb09b20ae4a82b7ad841fa
X-Patchwork-Hint: ignore
Message-Id: <20261015160123.59B0A95336@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.222
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/529b876a850e90266eeb09b20ae4a82b7ad841fa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 5.15.222 and, for the SD
configuration, also updates U-Boot to version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash | 2 +-
 board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash | 2 +-
 configs/stm32f469_disco_sd_defconfig                              | 4 ++--
 configs/stm32f469_disco_xip_defconfig                             | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
index b4a6bbd3f7..20f03bc1d4 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
+sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index ff6e4ed2e2..66c72d3afd 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 70a214a108..af3782dd40 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.222"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 578cecadbe..605f7afdef 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.222"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
