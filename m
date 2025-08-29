Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4662CA0EED
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 01:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B23980F5D;
	Fri, 29 Aug 2025 01:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YT3ZW58qRZHV; Fri, 29 Aug 2025 01:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D39E80EF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D39E80EF6;
	Fri, 29 Aug 2025 01:29:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A68E0D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 01:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8540341318
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 01:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXhq0lN7p4lA for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 01:29:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 01D504040D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01D504040D
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01D504040D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 01:29:22 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7718408baf7so1564538b3a.3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 18:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756430962; x=1757035762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=avGsj6QCLNMF7RhP64Ef0DMcpJgprK6GvR4FHNiqnlE=;
 b=LYfPoC4GJ7nQBYFYmHjzyvRzEGs0xx00lKHaMInm5jntX+O1jLg+R2+FkXuZQdCvPp
 lvkrxwanl7cs7clPJ1Qx8oH0DZ+etWMgKpGxrCIRIS1xWvBoZo/YSX6GN4eVTiy7cSZd
 Tsm6DQKklZTDZooTyZ1QuDoEpYFRejgHZyhdu0B2ngSfG+9P99uH4irxtXAaywz6nU9A
 AThtjVj9M4pMiMGv/tNE7ui40UEH8PbV/FeuEDZD09kStRh4NByOkBBUPuN4dtSZMn4Z
 UpcvCNXeMdrkUNEP1TO8KrP/zadYtlNooYotYkxm33trLJbwYN4A+eGUEbOoC/Z+jJO6
 1+hQ==
X-Gm-Message-State: AOJu0YzYW67U7/hUc7I+ZC91yXwAQKYGevHWruhUNHt8a1zHi9eDkyAQ
 bLn/rdaIv1TL2c6LK7+/nAN5LT8/YtbzsP2SYYrZZsm4mIl0Y2pk3r5yZ9CIZQ==
X-Gm-Gg: ASbGncuAK3nAUhIxs01tmi0lDyxkwllHT+uUJQ4duNGtRD2VxrkvxqLL+9QkibzghZ6
 9u1TEQarhM+vFlzYdmLDqu8MhhLFwTDlwsLtNmT2fODbNIJfPrKm8SMbfg8P6Lc8pSCMKXTrCZz
 Fh/aRcjpEgu5um/JCTVkQON0IYe4pbUNuijiWV7mKX611BbsLbYgfUGnnZYw50YBdo7VvftLcFM
 o6uyvLSpMBEqDfsvgY2n1w7gzZJ5yf+F3RojO861uPefdhxFtsdOeDSJhzTVOGBiPbyuwbTglJn
 mPBj3/zdb9Cwdq9EKkzPo/D7npPU6Dh/+WdEV/pH61ifo0giz5ZtjYHfmx2u0kN2pAHvKY6Iy9F
 7Yfsr4OfyIkj5SG8l6tKvHiK9CyFYkq1v/lAYhTxN5pC3yZ8=
X-Google-Smtp-Source: AGHT+IEqYEhM5R7XJUk1HfznRRRAFtigujtScDSuSsOfNYvh6N8N8+Rw8zcgcgwS5loGJYn0PmH2ow==
X-Received: by 2002:a05:6a00:14c3:b0:771:ef79:9338 with SMTP id
 d2e1a72fcca58-771ef79949emr18979987b3a.21.1756430961683; 
 Thu, 28 Aug 2025 18:29:21 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f5bb:a70c:f190:d679])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a4bae96sm715425b3a.67.2025.08.28.18.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 18:29:21 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Thu, 28 Aug 2025 22:29:13 -0300
Message-Id: <20250829012913.2050830-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756430962; x=1757035762; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=avGsj6QCLNMF7RhP64Ef0DMcpJgprK6GvR4FHNiqnlE=;
 b=lgQ5o8wvfbZeSzIbBF+8Vx6zl4ffuJ6MMI9KUmleWCiYBa/uJ27xizYf4LmQ/n0C0r
 CM7aHyuJP7R5URW2cufjaODuZ68xjg+c8AwkBqOGds/lKem7LnQdsVaaw3G7IHbu1zDW
 3sEg3qg0dVKp0kQW6s8D+ftbih1hG7Z3DFKZ5kTQxekgTEajyyhQBJLmcuQNUfqX0fEC
 jKLeWj9SBr1gKvjrTwSL2aSyYk7oNi0CJNiXaAlBKZTM2IpS7zcfHQYz0+WJK3QXxKL6
 2Y4q1tKhGqC8ACae0JCXsBF6KOyxLD3EkQc5EexGqRCOkzqCHC/fv3jRrPZXHJLZBG2a
 y6rA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lgQ5o8wv
Subject: [Buildroot] [PATCH] configs/imx8mm-evk_defconfig: Update kernel and
 U-Boot
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

Update the kernel version to 6.12.43 and U-Boot to 2025.07.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx8mm-evk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/imx8mm-evk_defconfig b/configs/imx8mm-evk_defconfig
index 00fe2fa76119..1af55040a7b8 100644
--- a/configs/imx8mm-evk_defconfig
+++ b/configs/imx8mm-evk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk"
@@ -31,7 +31,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
