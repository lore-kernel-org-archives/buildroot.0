Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9D1CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 11:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1CC78128A;
	Sun, 18 Oct 2026 11:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXdXfczMdaco; Sun, 18 Oct 2026 11:18:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1417D81285
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792322297;
	b=gPwxk3svhARkI4Jk++gQucZmxKBo4petIDXT1rAaibKked8G5KU0QelWYKllXo8XP5ik
	 orrA3K4vQ6qCxJfszFQyJ3npURr3hIsPkvmoiHZIEJzRumgJhwCxeG8AKuBqmXNLwc5MX
	 7bRYt/x+9ORzKnZcLfO9ZjspkzwTaeuTIn1v/tJ74pwPy7r9RHvEDL1SjkwYFhQUa/apG
	 fOM3KlfMQYA7+zNDQecvlV1ITI1DCqkNG9IwJ1DraVZFAs/ElWstYKn1qyXn1+xSwloWp
	 BWygbAzuy4F3wSrC8k8BlpuK8puBPiUY0vQZ9hjoVkf14WHUCwUtnSGu2zNZ60V+vuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792322297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=idls9LsWWdXPYQEcFumE39MF893l6iyuZrz9mfi6UuM=;
	b=iZYC/5KYkOmAtab44FoZ0AE3XY0wOEytv8uELyLRDcHlg8tmAaFhTi5FhW8C4kI82wVE
	 UVZiS6CTZXLwj3QrT+ifGoDQUSq0DLFmUi1z5DUcgRtTdV1p5P+/pAvnhE4Xf5kDBy2RV
	 64r2wx0hfyoOgS5JY7MataPMYLYIlrhzTpmXZ7DOEaZPC2eKiafU0H5sSDe3YkZ6JiiV2
	 q+wAgXg8vXqVvh7ias9ZgR5X+wc/XrRgy78ofSsKUbpotiVD2sbfLPDe0OkPs4g7F9I4d
	 lQYbExpHFCmriCOReFN4zlA61Fv6gzLthFr/GMgicaXogb/LV44T822Cpwdye4+T3rA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792322297;
	bh=idls9LsWWdXPYQEcFumE39MF893l6iyuZrz9mfi6UuM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rSLpCFDd/VJAcGwmJlysy2ofUSIAxX3IfU30voMbbljVRzCFBQDD6YbdAboD3ktJ4
	 9KyXiOCVTPO8vm5D+YDloedwwAIUAbJP3nN4HRqSK01GKkANIj80PWjWMddIFClaFF
	 RJ3MM/bFtriFLAGS/CmmYdNyyoq5QqfG3VBI/vaHdFp+YuWPlzRcd089f6CkG/+W3V
	 shXimhWQNn/riLXDuUD5I8nblp+hEXt07IBFlFsZ/6xCT85stX+Gx62hnXaCo/Uu3c
	 vchD5ap522aVzT42Deh+WJTZKuLwjqopp3D/aefAJjCQnSDupub/Jt54Od/sZNWMY0
	 GfdzbuK7KlM6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1417D81285;
	Sun, 18 Oct 2026 11:18:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55621769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A1A81276
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6icqkSSmUb3 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 11:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4478181285
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792322294;
 b=HtUr5kXxZfdBAiTOv1WIpSW5uGILORekwJFgViOvUpH90By5/pDc2Dxk+uTJ2oaH6O6D
 JMAv4wwxdaIj+NNBsKQdVax1h4FrOVBn9/iRzPAHcX+Ng5QiZO+W1YTzQ5aoG6/+z1IAL
 25EztyCkXEbr6/gXEkRPRKJS/CMAb6yqBV05fwzAQSop8vx9w+T1HH4WHce+tbE6RFpXU
 P2QLRegplISsSGlcpkdK0TH4n67phFBJBBdZZopkYmOxwBj208dXCPsn7kD/MOPY0n1s6
 BKTWMpYU1Am2KLv0goXNJXIvWsB0Of22BgGmk/XbPw5FRsNY1jaSwVHEWgJAejXAbhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792322294;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=leIciPngZ06ugcvnopYeJ+ORRSv/wIDLnQr7YMaWbmo=;
 b=U97hmJGTZ2VZAzN8LTkAvLMbIkE/WCsPD//jGuI/PNrm/eSizKGA8QQzCAsxdUeXiMp2
 ZWoH9G1UnmGHxkVg7sBKmoSoHg3H0v4ruIA7aiQ25DYZSkmz1SRs5ZABX2hoPqXWMJyTl
 nO3GXv5byaqHCV8d9EU8PFy4iTxED7a67ERKzVgLN8fs4rdrpBI/f+mbYMZDFGD8KxTVB
 fpTKNf+UroW7kveRswdJsNupmbskmK92u82L7PPaLITUsEt95pSX2XBV9r0jN/Y8QoP8S
 pMg/No36Ie504cnYqXoYkqnrV6kjaNqvjd5FdeWjlIzQ6MjvohLj6O1NpROnPS8oUqg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4478181285
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32E7F96B0B; Sun, 18 Oct 2026 11:16:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:40:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea4388b3b09ab34513582d01ddd6a524212a971e
X-Git-Newrev: 0f592d0eae9e44040c12cbff64008fa1ddc48b81
X-Patchwork-Hint: ignore
Message-Id: <20261018111652.32E7F96B0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx8mn_bsh_smm_s2[_pro]: bump
 Linux to 6.12.112 and U-Boot to 2026.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f592d0eae9e44040c12cbff64008fa1ddc48b81
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 6.12.112 and U-Boot to
version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash | 2 +-
 board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash | 2 +-
 configs/imx8mn_bsh_smm_s2_defconfig                         | 4 ++--
 configs/imx8mn_bsh_smm_s2_pro_defconfig                     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index e675afabcf..50ea35890f 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7d2e1b5d5ab36b3a01856e71782dad2a54e634fb2b37c0a42998def3bbf957c1  linux-6.12.96.tar.xz
+sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index ff6e4ed2e2..66c72d3afd 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 50a5eb2d9b..3364ad15cf 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index 6a4a662b92..17f834130d 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
