Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF928CA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BB4340CE9;
	Tue, 19 Aug 2025 18:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwHX6_TV4DyG; Tue, 19 Aug 2025 18:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A856240CED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A856240CED;
	Tue, 19 Aug 2025 18:15:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AD2CE0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11B1160BCF
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Y2QXIU_xEpd for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 18:15:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BEB560B60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BEB560B60
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BEB560B60
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:09 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-618b62dbb21so7833633a12.2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755627307; x=1756232107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4elw6+u61pWAMnzxHBWIcrmGJkpPGqfp7JXsnXSbxI=;
 b=PAX02u5pfY4cWyBLVCJ/mP+S6/+ILzngQPIHjEGfxEKtq8FsHb3yflF6psLYWlrdqG
 cH4Nrxg9zyQPksN8u6avmVQAaVXraVEJbPZTmEQD942OicbMJ8VinD3/KgaTp4PFITZ6
 VHLnOy9sfna5aNmkGFmofufP6sEWCpOuRNdOwi56Vki9AJ0eRJfHFBipnAxF37U8tUpo
 eV8GlWVc/ZBA75/jCEX7dVIfh2hrLK4uCHFiLO4jswfyn9azcwgJ00lRGJbOMjwgXUq6
 1LAQJiCyGqfbGdx4Fn8Ge/613ImcY6JkoiKdej6EgQw8+TyroLRVMuUtIqDycqzTKKdj
 kqgA==
X-Gm-Message-State: AOJu0YyLf1qkIctIwSMgDqyDbv5dZMmRT5pZYCYrAgO6jo/jo7l4oS1y
 8KEYGt86bq1RCKlOXff76XiOqkVPb7tNS0kGDtLd1oftaIhI0qaML9KGW79hB/g4KHKJllrikQB
 6iAgT
X-Gm-Gg: ASbGncuNy7qnyz5XZMO9nbel1EXnwIiSk+b5psGeciqeTta7d9IjCEOFzvYbQwDHDEW
 0AoLzgsOiuA9p9PtohnLxKtX7KKEWLyrKt39+qTlw64377tfUAVriNc2HN/dLF6/aBOH796eYfg
 HXdYrQmQLG2wYJb4hkm7/UnqCsX3IbvACtKsood0UwMclYhF/8v08DFkfS2JC5c1h9eyGYg0l31
 Kko/h4pw8NmLLBOUeq6j4G/C9K6vj6FrcReNeSCxqrtZLBfYuVnsUtOf1wY39AJ4oLQR6Adxggw
 NEjJco7CFYCWoRs8yOu/AYZrWiq4ZP7XWRPDMbuNZ8cg4cE0vlOb1cM6tKD93mLexWCV7ivJWlh
 faeb0D/meYyikyaC9MAc7QsrsF7p02s1H0jK/1ZekZLzusPBgGPr/1v6EmqIYPUe3v3qmv7QFWo
 uPnidjxTFrPRzHlHJf2e9b
X-Google-Smtp-Source: AGHT+IGumKjtbtbhrt3IlCIXaxW3Wu3ELhofcaiskvHu8eZVE0lri6ngbMMV+m6faPcCgBgNuv25Ww==
X-Received: by 2002:a05:6402:34c1:b0:617:9797:5e8a with SMTP id
 4fb4d7f45d1cf-61a9788410dmr202807a12.33.1755627306836; 
 Tue, 19 Aug 2025 11:15:06 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (mob-31-158-159-104.net.vodafone.it. [31.158.159.104])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a755f876bsm2112245a12.13.2025.08.19.11.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:15:05 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 20:14:51 +0200
Message-ID: <20250819181451.3012126-7-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819181451.3012126-1-michael@amarulasolutions.com>
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755627307; x=1756232107;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4elw6+u61pWAMnzxHBWIcrmGJkpPGqfp7JXsnXSbxI=;
 b=UKLb4+VbPq+2rl051x521u/l3v4sw25duV5wauflYJq/TkbpbGfOPy814wS4YdZRea
 RIabn/jFtFtZbcMIZP03/CTzNqxBBZoP6MhYI2mBxgyJUmJNDtW2qDwleCSBEP/FHAXT
 E7HrNEmpi0ZtedyBymTWfZOBsgejKyUoWg/Zo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UKLb4+Vb
Subject: [Buildroot] [PATCH 6/6] configs/engicam_imx6ul_isiot_defconfig:
 bump Linux to 6.12.36 and U-Boot to 2025.07
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

The patch bumps the Linux kernel to version 6.12.36 and U-Boot to
version 2025.07. Fix the cpu core and the vfp unit. The imx6ul,
imx6ulz and imx6ull are compatible with VFPv4

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 configs/engicam_imx6ul_isiot_defconfig | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/configs/engicam_imx6ul_isiot_defconfig b/configs/engicam_imx6ul_isiot_defconfig
index 1377022c30..7e647baa20 100644
--- a/configs/engicam_imx6ul_isiot_defconfig
+++ b/configs/engicam_imx6ul_isiot_defconfig
@@ -1,33 +1,37 @@
 BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam Is.IoT eMMC Starter Kit"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/isiot/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-isiot-emmc"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-isiot-emmc"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ul_isiot_emmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_E2FSPROGS=y
+BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
