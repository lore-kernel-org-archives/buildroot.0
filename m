Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E00F459F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 16:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A550F40C86;
	Fri, 10 Apr 2026 16:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bw8Rd5PizZ-U; Fri, 10 Apr 2026 16:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E03E40C4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775838407;
	bh=wvKHKFJPG1QNbkcbL5bgDDfSAguWtKcyu+TS3cOXVm0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q5b1tqRWac2yHACSAMVbEkTdpEnolNvZ5IkkB4K6s/tqf4lIpfVJX4OXcdcbc+teJ
	 3/uuPkvGHC7YNWG7WabDJL3y8ZuMJjN8ahdxGm9Bw17w4ZAM/rFXPCJ3Y8TQ5UZ9F5
	 eh4ay1PgX4RHsqACqDWGdECgSkT8/cDy1ikE86eNoNUHXO4jhj9x3Y5y+/vLQY0Rec
	 8/3/m0FVCqeN5ZagKeLAFEUK5wAu4coos6mX+ELMCQwuXmCes84/4hFhh9RNMgPNHF
	 UM+WdxF1k7g1/ojW9rqv+0QioagNhgw6UD0T3yzn7sJ7teTIpSkaCxNo4GI4k9cyXe
	 4RGD0UPxC7COQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E03E40C4C;
	Fri, 10 Apr 2026 16:26:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FE811F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 613A6838C9
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTBfmWpBTDea for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 16:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 375CE838C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 375CE838C0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 375CE838C0
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:26:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso24111015e9.1
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 09:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775838403; x=1776443203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7P0i/9Yp6gvSL1n/7tofGZddOOFnd+QHGwXXG8U6q7M=;
 b=LQOhxPQSWFfYRNTtT4wXGwLR6B+F6wDDA9G2lQre3V6qcVo7F9Mw5kN7XOrwlTEFOX
 60rG/OtnCZgduTno1jE6+tR6AsJTYaSNk7tmv6bZPtdNs9TvaNcAdsfyPNgk2iOEwgj7
 YN5W3Z+zb9k/JjRqJ7s3ndbpxQ0FWEMt6Hy+u9I1eVVqflNLBp5PNxR7W5CNCdh1CW8g
 00DBGfkNj9Rehh0RG5gjS3jhHm1X/zFcHOM47RmMGqXasHZzEPD8r0alFcz7P7wj2hFt
 K36avFOdRNl0WwDHQ6qioo/28jJ2fopRmKtrzkHTth92IbLyMpElxnpE2O0ch3rmd7Zw
 X0EQ==
X-Gm-Message-State: AOJu0YzV3ojoGxg8PjxcD694wIwzrB/gGzKg2dNUt22XEmGEIysEwVTA
 +4gCVB+9e744ueyUD+KOqNqOPmXwExXuazOT1ZD65YmD21HdBVT98sUAp5rHggJ2TfvFX+Z70l9
 ChuVe
X-Gm-Gg: AeBDievJOuX7lOV56Fd2z1mXZdiidHeEMaSC1GFzsm4BI/UF51jrD4gTpTIRVEbP0fk
 uUue5J17paQ/vy5wYqLz4sLidV50eJoonAtofOgeXxvjZYz+NaHdQwL/o+4mCcfbwPOoYz49VVX
 1C1yAUTW8yfFP8E54BZKUcSZl2zHvVYY4wOst2hPz6zLTJOqdYqOKb1IIXkSP6lo90mhb67g2ZO
 89a060+qJxL+brE+HlJugx0RQGF0FxLIo6+/lzAugROQNV6Vgx+fY1pKrzgu5qXY7Zk7wfqdLXY
 ZNucnKEO0Q2HinmyI2KtwS9Ao9Eh5EjXIg+MAoQTl5IIDNjzwgkLJWnYlRILCCaggpoBmYepT/Z
 cX1L6GC5WjU4ZVl436zb8T8nxFo+xQLu8a2l0bsrHJWRniqwtYHt09a5FMoTb0H0/1pyflKO2Wv
 58cc+QcwNe95ZDoiUnmNa1kmKqyAZgibVRHkRYk6azSmjoZTenN7b7gOVUGDjXD+eeFEkpOhXWT
 HDCrdeMep2CmISaFYCtuy4GVg3hHIBsMQ0gjN6pDRDHkMKchzFpCuYnvgfCXS0jwYwNLvivVNOB
 1zNLGs7bqQnX6up2GsQ=
X-Received: by 2002:a05:600c:c0c8:b0:488:b749:8482 with SMTP id
 5b1f17b1804b1-488d67bbc13mr37300795e9.4.1775838402782; 
 Fri, 10 Apr 2026 09:26:42 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d58a8445sm79371165e9.6.2026.04.10.09.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 09:26:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Fri, 10 Apr 2026 18:26:39 +0200
Message-ID: <20260410162639.1447900-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775838403; x=1776443203;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7P0i/9Yp6gvSL1n/7tofGZddOOFnd+QHGwXXG8U6q7M=;
 b=jDTuyAyE/SnOjUftQIuI+FUM49MbLBYnmmRxwX+G1TXvkq7+CuaVxRt6kCMO2NkOgT
 5twhONhj0CjIoAFydhwajlBXI6qd/vGDKAdnQHxGZsfzqelGDiZfX6PUzUntunZbSyMF
 hYEsXfCntEkXzD2+W5g1Fiv52dNrrVSIU243Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jDTuyAyE
Subject: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump Linux
 to 6.12.80 and U-Boot to 2026.04
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

The patch bumps the Linux kernel to version 6.12.80 and U-Boot to
version 2026.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash | 2 +-
 board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash | 2 +-
 configs/imx8mn_bsh_smm_s2_defconfig                         | 4 ++--
 configs/imx8mn_bsh_smm_s2_pro_defconfig                     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index cad9431c7b7b..f26f856a1a4b 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d1ad94a33681148efe884f4028970d69e332f2b003f0e8be53a1d25de38e49a2  linux-6.12.64.tar.xz
+sha256  c92591d896e79ecddbc3319136f0c2f855e832b397de7593f013ad7590a43e53  linux-6.12.80.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index b6a925ea4e89..36322a6a904c 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index c497b78b8ccb..223acec01d8d 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.64"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.80"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index 640c00fbd2b5..cccbe2e37057 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.64"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.80"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
