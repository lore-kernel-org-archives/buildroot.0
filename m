Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B661C369B2
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 15:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3A2B80C83;
	Thu, 17 Apr 2025 15:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7T7who7Dfi0e; Thu, 17 Apr 2025 15:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF4A80C4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FF4A80C4C;
	Thu, 17 Apr 2025 15:24:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3DE811F
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 15:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C95E440251
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 15:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4m00clPlqEER for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 15:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C521640173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C521640173
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C521640173
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 15:24:32 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e6ff035e9aso1710813a12.0
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 08:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744903470; x=1745508270;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=at69FeOgJBPdPhf5j2e4W+j7L+3GiZCRX08wJguv1JM=;
 b=mBHVM6ue6kEIOJ3BC5GqbVqZwt08J44E5X2njMrryF4FLZxcfe0JMIo0HfjQLgWnny
 3gjJz/o1MGa09pRUvEwJ6Lw1BLPWWTOu1bUM7uYyVVpQSdmU/4ECJZOXKl2h7+3+wQGg
 HujE87T0RcStiubPLzdKUzJuPhSbThsxdBdTiBvCoiuiruBbF09StSgiTmEaL8Ow0g+B
 QIfVXLS5GrFiS+8QBYo062NeIoqROaKlX3cwBiecewTLT+lWnEirncCDElWulbs8guK+
 /6wP4yMyy722CL9vT6ZlAvW0pgm/yGHJsRORoejMuadiJhbqiDcwnDt4DPM8kZXovQfl
 ekdQ==
X-Gm-Message-State: AOJu0YyPUyT4L6KuE2YDwxQbjhkB/1jYNYUMZ7YE7jmVURfau0UUY45j
 /2zz8YT5y9yosdqg/RyZFIP/VjyPuxM86SyFJPcDygQgb/v0fGcVMvk3Hw5xj8rHNcD5mdejlFN
 T
X-Gm-Gg: ASbGncuuvAQwpcKJRUh0ewD3l2UfVUdRtpV3ppsgOQ3cbPrA6KwyK6Als3CdzdXQphK
 MiZTKK8yfamVTehphBFJ66NgdIo3zKys1tU2o1U0u/G6Kw3oD3wkvZQ2/zPwVnRk1yaCkCymlPt
 l1nMMZHZEDwUVVZgpM0Dg0DKyxTVfO+pZL1yywlxFqibfLoG6EymrMcgfe6TmZ7MMpiOYs3edhW
 3h6MB88akVM45n2uteiUNkqeaiuydw6EcPUuUWqCGOPdUsJnn9AawbCk5DqnXzR6jqpZzspByxO
 /+4SZeG/i+j0K/4p0jp5uOobjIpSmr3OC8Rv0P1aJ3Y/D0L0DwLdwQUo4XsA9Du5LPq1UHJ9v+J
 oToXfw6vE093a87yiFRwKr5Gukb+Ngg==
X-Google-Smtp-Source: AGHT+IE+XCLNOJB1oom426HfSsZ9RmwbPt8A0DTECXgv/jjjnH/KrQgBKZUa1zchnpUy5bX3CUdDtg==
X-Received: by 2002:a05:6402:51cb:b0:5e5:e836:71f3 with SMTP id
 4fb4d7f45d1cf-5f4b75ee22dmr4494913a12.29.1744903470595; 
 Thu, 17 Apr 2025 08:24:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.62])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36f06a2cesm10056960a12.39.2025.04.17.08.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 08:24:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 17 Apr 2025 17:24:25 +0200
Message-ID: <20250417152425.3248986-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744903470; x=1745508270;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=at69FeOgJBPdPhf5j2e4W+j7L+3GiZCRX08wJguv1JM=;
 b=pch+G2ZlcTxSDYchBQfLTWRvl3dl2snnL3ICsHE4MVFkcGoy3irD4hgN3gcFRrNIlj
 sJaK20tAU2B38m1nUF9+zacwpagPMr0/e12BW1OHcBOR295DRiR+6o3puB3dTLvsolmU
 R/H24vbsZKtkjX5rmcwUY+aYhhOJiQM9b/icM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pch+G2Zl
Subject: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux to
 6.1.134 and U-Boot to 2025.04
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

The patch bumps the Linux kernel to version 6.1.134 and U-Boot to
version 2025.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
 board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index 6d69eabbd6a4..e300dfeb824c 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  61c997b8acbbb8ab184565e96f476ecbb7e773cb35b98a1a4c832d809b2bf719  linux-6.1.120.tar.xz
+sha256  60c70cdd70ddee384c004242e67844e3dd1fe28f75b26b3586859fff0a07bd23  linux-6.1.134.tar.xz
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
index 904fa56c02a3..80ea21b7cb4c 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index f12dc8383d80..2169ab446581 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.120"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.134"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
