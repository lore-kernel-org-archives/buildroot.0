Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BBDCCF9FF
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 09:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02362616EB;
	Fri, 31 Oct 2025 09:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbKf3ZobS-_1; Fri, 31 Oct 2025 09:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A70A616E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A70A616E8;
	Fri, 31 Oct 2025 09:12:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B344CD
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 09:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5B7540BB7
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 09:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2Wr1ro6DBmT for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 09:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA6714052C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA6714052C
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA6714052C
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 09:12:19 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo445847966b.0
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 02:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761901936; x=1762506736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C0YyF8FjGIkSGjllzsG/LbtfI0AHwSbzZv3MEx9NAQk=;
 b=vrVrIcfI3QlekgfAt22hPwmqzBiZd7rnR5yMFrAgeBNe102G8XIEaoPF14qiv7vY9C
 NZfibSrd99Q8pbLecsbZ2pzf0LAB7NvNBrFMCZZJp3ILTGp1ImQT1MYZ+N7DCcG2hze/
 G6wvxD25Pc+kKZhGUuvtvthPfPYFY7ptw8+9rjmP3J4PyF3uMQPmuDU1TnWn/r/o/msq
 RElTYPQeauBcBl2hxo3WefKt01EZ0Yr1xyQvpb1U/cRu3PBcMZeRaaBx1o2Fyuglqc3N
 mdWYLtKVV6mn5NgKrQC9X3M+tFR2pAZOWOkFgzaYFFTXUe/GeRKmnlbv1x4qCxw0IaAz
 pnkg==
X-Gm-Message-State: AOJu0YwbXjtzoEUzTIOc18FhVW6aPzQzjzYQJ+aMHIldBSHkJ5DVi4sr
 /Qglp5WjMRZEoR+21nl8QS4frLr7jiW4FK8c4mllFFIollAOdRNG93GTx5I8msJgJVvgUqBz1ti
 +jdgZ
X-Gm-Gg: ASbGncvTzEJit20YrE5AwwbPTzdSSgd/ZZ1tSJ8J2cDU8jQOSIBQH7HvJHhVdB6W/77
 NIzYPCVD57j0Vwyxzv5eGmdgXnV0O9FJtf6040HCMF3Vlp1MRAz1Zpwg0rEdnIQSysQrej9MK/h
 WRwU/br4V+ptL3Op4B3qzea0VEx4v4p+5ZcytevE/CBrHdfVelrPSyS2UzFuPi1yOKsGwex2OsW
 fFa64oke095xw1ReGqNv6I09SZYFFeSFoR/sB8gH5IR33xfbG/FGpO69KfLRai7v2Ape5hZK67F
 xGIR5aI68V8JOkrz2mjTo9aph1xS78cSpFC3Seqv0x2mM5/ztVknKlUHxbQ+YypW0WNlc/7BLUW
 k1MK5xMfz5MtWC/78aE9H/6Ea4tgtbS0Y9GJ1azrQS3Q4NrT6V+H1Tu8X1G8CcLFp4e3AFMAuZm
 p8bGx7R+DmpNDdFIVIvhWiFOhW5WUh+V26FtfLDZHjE4oABSTOe5lZQ5n7n12Lan6b
X-Google-Smtp-Source: AGHT+IEjfPi3lm2f4mBngQQ5aEZBF9IeMSOwap5O8X7bsOoOAWPDY/CdlPza5X2yl33EkZw8KYuVGQ==
X-Received: by 2002:a17:906:9fcd:b0:b3f:f822:2d9b with SMTP id
 a640c23a62f3a-b70700b3bd2mr272038066b.9.1761901936465; 
 Fri, 31 Oct 2025 02:12:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077cd2d48sm120810866b.60.2025.10.31.02.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 02:12:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Fri, 31 Oct 2025 10:12:11 +0100
Message-ID: <20251031091211.2337622-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761901936; x=1762506736;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C0YyF8FjGIkSGjllzsG/LbtfI0AHwSbzZv3MEx9NAQk=;
 b=ZCTbYlUGMOOA03uVWvQobq7k2RFPoJ+qfNs9LCo7mYww7t7a9/4SJBTNNJ7BiDo699
 IcBc4Jt0aYg0N/17JG+eokhnfUJCig+zF50+zGpolnmjUbdxuvjljRbmOBBUKt61XIa3
 EHlHi6+U4J2wdjtyoPeb1rVHk4eS2UBpVURA8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZCTbYlUG
Subject: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump Linux
 to 6.12.56 and U-Boot to 2025.10
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

The patch bumps the Linux kernel to version 6.12.56 and U-Boot to
version 2025.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash | 2 +-
 board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash | 2 +-
 configs/imx8mn_bsh_smm_s2_defconfig                         | 4 ++--
 configs/imx8mn_bsh_smm_s2_pro_defconfig                     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index 839b62862a60..b61e87cec65d 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  6e562502a8fd11639f558e43b74f0df0d85fa85e60f5332acb275a75a35f5345  linux-6.12.39.tar.xz
+sha256  55432b2af352f7bf3053c348d8549df2f2deeaa4a361c65d638c2f3b2ca7ec96  linux-6.12.56.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index 440526977bd9..98a5c53aaf97 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 662aea69deb1..ee8fb9bea39d 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.39"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.56"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index f1e9d0c0a151..1abe3a531a72 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.39"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.56"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
