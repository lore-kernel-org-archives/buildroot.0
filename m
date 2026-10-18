Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE94FCCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 837D96061B;
	Sun, 18 Oct 2026 13:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpplDHc-cwlm; Sun, 18 Oct 2026 13:39:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6698A606A9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792330792;
	b=TbaZr6sBN35McNwW5WycQT23IIogXaSMlo0kendkY9djyo+Xx2SU1cVS2l0fhLJWNGRl
	 rSD3RcGhCfTum/NLGtk//4ka758P4t9DSomradmy3pjk63bdhhcRTJ1n7lJFJjlllIIWL
	 G5Ew7YbEhtRGy6xjciwYSncKp4S6EAGZeIXppajE7HsN+zGBpgs54LBMwzLiBhvn+bUJP
	 cFCam5yf35+waKiDldjGI7biIV1HWH7p8qq3XxfMkoPL8YnT7FNJvMcA5uK0il9T5ntp+
	 DXmTBeIBGJxWCKPeJWFSWp1Zxv+88CWRHgxsCrI4aP2jjcf4XFKlc12Jb2MDiS2dMQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792330792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=S3pBkzztI0MVaRIA8M4yl+mlvL4Gn7BErxe7wmpTb6s=;
	b=G+zpA5uNECO323F3xB5ifgPf/27cYege3PSC98+/Z0GmvbdtD7ohLXHVv2YzJJx8JRDl
	 NXoMMssefkZdjXpCmjW+vGnyVDw/OONzm4IX4XMhIHPWlucKDZM6jReeo/lc1f3n0D/FB
	 c2tyavd15JIuyYDH81lYmbRzWm5+kp20wSJ/wmUzEMJpnWA8PLJrS80vV2bs92M6/FUh/
	 wem1hiRPIIkkjMie5NRomNjMOAvP4CI/HNW8Iu74eZuf00xCp/y9ku2xA1QOme/mWdHeI
	 VeW2Px67BK/7SARESCR/K2RyBHzRDApjCsvvXRv8a6s7SjV/gcc8NJFGhgyl3axk7vg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792330792;
	bh=S3pBkzztI0MVaRIA8M4yl+mlvL4Gn7BErxe7wmpTb6s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ig+ie8+UcZQ5lLGjajXJs6BdPKfgiR2/Xh/uziO64Gvn9vDEP68Mp5nTCJyySi3FL
	 Vc1Tj8MjCGYIadCB0QNkmyuP/pacX8m32sQnk0SuVynxa2PnGMiA/mvy/FOyNuABFT
	 GGG0bAh80UPvjkmA34OsyNJM2GNoSyy+BpXwEXAmFZSiYqs6ShAuPau4g7ut2xcQzc
	 suP6yiNu2MNumNJ6w71aSmVOvtEnv+BBNSKJ9QNRY5qGUJggIObun5LbhYPmuZ4/4U
	 lW4p8Eh/ToQZLibJUoD4DeZirij07yk/8IxGhwqr09d6zQ9CGzEV1MzT4ckkCQK0u+
	 ATIjQ8K/sw5xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6698A606A9;
	Sun, 18 Oct 2026 13:39:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E169D61
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7EAE400BE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKh4se4jLYXW for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:39:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 011784005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792330787;
 b=i9PEmb+KVOcaPuwxHlwvDqJf2Sw0aMsoSJ7VhlNKIRwnSyxqiVi8Uuujp15Bgufv4x9U
 utQg5UNKSaj0wkIWf8RRwADHcgWiTS1AaEuv5w1GeT6Lfz3cMvzTd05Bi3YeEAbfbIFMs
 YWSbzq9OFleQl8d5Yam726W60E6rLWhaLsyKmeBloBvBWetdUZ0phlFozwefIz7KGdslP
 CMfrOUrQ/u2nnOnAP76lIe23tNZt3wgEMlISdha92HxQX0ogNUdHLt/N91P436eF0FaBI
 Px8a+AZw/tNb1OWsJOErOl0+0OmLTbCkfGr+m7BA3ebyMsSC1Pau958a7207N8qXrvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792330787;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZXYsOJ665WrUky+2fhRJraRdIU2Pe/+baDN9Prd3pQ0=;
 b=aE86FiPQriAM7APgkXGC7UMhzPOMPfqxinAo4b/pShUFc667jFvM679tz5YriSoqWhzZ
 rX64Ew6xTe7L3OP2tFywXpfRijMG6JEmR2PJ31bXetsSidXOzWG7OmGVRaW2wIXXKdUqh
 cZLGMB+FNVJBT+h80v8zLckSaQBni1f9uz8ensPO874B30IJ6elithxD9KQl7LotT0CHK
 HpuJ5Tu2wEwlRarhdingVGz9Utjtq51iQq20otubuim513dDJu86ZeCvhQeNeutxs3bEH
 GI/PyNCYBwAYYm03/fqX06iBRzxNNv477hZODCMlJmQq5j50YftWzEajcZGxh+WLBsw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 011784005F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8E6F9769B; Sun, 18 Oct 2026 13:38:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:37:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f3fbc351fafc7fefb080b2a4c68d2d0c15e01ba
X-Git-Newrev: b15dbb532608a0a6f247cc7079d47fda283d6356
X-Patchwork-Hint: ignore
Message-Id: <20261018133824.D8E6F9769B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32mp1*_dk*: bump Linux to
 6.12.112 and U-Boot to 2026.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b15dbb532608a0a6f247cc7079d47fda283d6356
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 6.12.112 and U-Boot to
version 2026.10 for

- stm32mp135f_dk_defconfig
- stm32mp157a_dk1_defconfig
- stm32mp157c_dk2_defconfig

The removed patches are contained in the new U-Boot version.

Tested on STM32MP157C-DK2 Discovery Board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash | 2 +-
 board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash | 2 +-
 configs/stm32mp135f_dk_defconfig                                    | 4 ++--
 configs/stm32mp157a_dk1_defconfig                                   | 4 ++--
 configs/stm32mp157c_dk2_defconfig                                   | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
index 08483293cf..e3e6d39133 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a9e8c51fcb1e695d1d35dde5886cba579cb6f29c9646c5889f39d63841d4b9f6  linux-6.12.95.tar.xz
+sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
index ff6e4ed2e2..66c72d3afd 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index bd1c6ca00a..cc72d397f3 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -42,7 +42,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 7f4143fa32..464b34e0b0 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,7 +32,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 10638f2260..2cac66a944 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,7 +32,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
