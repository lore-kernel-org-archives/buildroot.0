Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A42C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 12:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB47360DC6;
	Sat,  2 Dec 2023 12:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB47360DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ObYe6cfBMGKA; Sat,  2 Dec 2023 12:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14E9360D51;
	Sat,  2 Dec 2023 12:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14E9360D51
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E843A1BF299
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8D9340158
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8D9340158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qAUHbiE1U3Rm for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 12:34:14 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CBF8400D7
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 12:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CBF8400D7
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50aab20e828so4145229e87.2
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 04:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701520452; x=1702125252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aROJRRHJ2VpLCrN1/3JHjoNpF75HLm8p3UhU3qNEcps=;
 b=waUv0eJUnOd5FFaqQxbHzJGsOIuQiOmmRgFzWcPXk6mAuyCe9AxisP6u4Nj+bsDern
 3gqmqmdcft51iD6k+65qZWYh3Q1UcN7EFMnSpKvkkb6uplU74LcC6/K5E6Fsk32VpEXY
 BQ8H/xvkcWbiuCYxoBLQay+Q89niVrSiYwXLC6oHUemxnAmWYyffRoIS+/Ii0GTg7jUp
 nMdl30bxQcnsobV5AVrXJXfw0XIBiFCCGaeCKIkS1zzvTGLrCH3c5CQE4yRcapquS7Dy
 /VXVUpXROrgENTmEIFBMV6LJrQB6b1kX+h/pJSYz9wCFUKWwxHUIEkmRkrMQwIh0VW1s
 4jOg==
X-Gm-Message-State: AOJu0YxwHJxRsbRiLbTdTwcQlc4PkDdaFUnLXfxhVr2mT5jyWqdnP5E0
 py/t3C+gJpvUYvHsOBvDkJpd2MPBd8o=
X-Google-Smtp-Source: AGHT+IEkyHa9oCe73n1rizQvNAXB1bDjnI9hJK3LX+Fbw8zDIUcT4k9eIjMlBgB/CG0TW4qhe6fKkA==
X-Received: by 2002:a05:6512:23a1:b0:50a:10a6:1448 with SMTP id
 c33-20020a05651223a100b0050a10a61448mr2269856lfv.59.1701520451947; 
 Sat, 02 Dec 2023 04:34:11 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020ac2546e000000b0050bbcd68e8bsm705672lfn.47.2023.12.02.04.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:34:10 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 15:31:41 +0300
Message-ID: <20231202123400.2327151-6-geomatsi@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231202123400.2327151-1-geomatsi@gmail.com>
References: <20231202123400.2327151-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701520452; x=1702125252; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aROJRRHJ2VpLCrN1/3JHjoNpF75HLm8p3UhU3qNEcps=;
 b=ikWpOZYUYTKWQ/C4hECZLJ+Wo+5uvAbQoBhFNFEf5iRymKDXPOzQoyd0Ey7MJ2Z1eV
 3JQ1VvsxD8dqn8Tex39KdGg+gcY6w08IOjr+uXaokWtj2lwAQA3+1Bh7abts5PAy9h7d
 bmHiQ7MJXAJc1Xg8d4rCUsdORQRyVDbd8diRoKgQKG+5paTp5m3zGoDZ/yGfwcc7oaHn
 9d9g5LyJj6IOuf9xhngzKDVT6TqFXl3UwJbM7oRfWFGOxKQCwFzW/9y9srgX9By91mLi
 FwzT7W/hcXDCsykvnGYnraw2hg9GERzrS4hywFRZRv8T1/FRtqbkPh8S41tEsw7grOdf
 Hntw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ikWpOZYU
Subject: [Buildroot] [PATCH 5/5] configs/orangepi_zero_plus2: update BSP
 versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the new Linux LTS release 6.6.3. Swtich to the latest
U-Boot 2023.10 and ATF 2.9. Increase ext2 partition size to fit
new versions.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_zero_plus2_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 377e9f1c59..990e16463f 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -2,14 +2,14 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.8"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
@@ -17,7 +17,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
@@ -56,7 +56,7 @@ BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus2"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 
 # host tools
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
