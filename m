Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90312CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6249460B60;
	Tue, 19 Aug 2025 18:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spC3-Bzp1zNV; Tue, 19 Aug 2025 18:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E1C960BAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E1C960BAF;
	Tue, 19 Aug 2025 18:15:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FC19E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51E4640141
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLTrmKyt7jy9 for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 18:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A3F2840068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3F2840068
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3F2840068
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:07 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ae1e8so6416890a12.0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755627305; x=1756232105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mcFswdKr/63Lz02RAyhuzbJq/x7/tBWvqHfWyozzIOs=;
 b=XFjzxWIQHtbJtQwpyKQL4np+jui/vhpsNSunitWDcvccTwPkp/KCmVS8FOWRLt5TyK
 vPbtpfTIrYKE9ut1aDkQN6dTxm1fUWkNuH6TG031wmOHyKPw2aoWWHBK4q+4kvdOwO2C
 B/auW1GYTR/7S3MkxVTNwA1T6HVUvnPWaj0cy4JfWqQue1Osk60ZLFcQXkY15M2m++oQ
 2VRyTwa8fumTsacf4qhSyv4eVpSAntLscdKFSKZftqJ5yKCnNGAly/HuyKg/j/qBV6so
 uyGadKlPHG4CLXOrXlgPKqAKxj0Y5bxunZv/v0drYtBlOKSEaVzaj/TL9dKAc6w31VfQ
 DOhw==
X-Gm-Message-State: AOJu0YxAi/Qfosli9gPQsVMKqd6ey7iJEVjXpMg7locWkIEE6xEgJ8lY
 6ZBKbEDwRA0E/OD4G1VgSTIzmysnqOH9SEkS11a1hjRX8ieS65XdbBS1/DyR55VhJzsWNSaDfhB
 18Snt
X-Gm-Gg: ASbGnctOtJ7Cly6dzzwEa/JGfOh94I9fTYm39/hvHqVLkS01VySyc1XZv/kfDDEOVLP
 a9Wn4pRRVdez5pbp4z4LgWo/5ngWwoBhXPBrany0eqEKsFoXIrQiqvgt0XPRa/mTHD0HE8KY/qu
 mxA6y5yqttpfplbER015jSMqU6AqlgX2Df9BiuC75ig9o5ezf40IwFpCO+L3fQyyMxsA93vaBzm
 uohO6+jryZ7nMUUTKnrswgl1Nvb8LVYc/Y31hWqUKSZAbzK6OoMRl0rf8Tf+6EtO5obBOsOvwUG
 RcCoEnpGalcoWqMnUtKuD/V6j2qyOb9uLShD84Spee+3VvB3xPHMYunKobZVX2fsheD28OoLfeR
 AF1W2rS6NtwGfEBe7Hp15oORq2KX/RnXmUKAyBYv8AtzoTbCZchlD6of7z5d0FfBub/HWk8CyPE
 NpNw8m7tezCf+tKpdLYa6O
X-Google-Smtp-Source: AGHT+IFgBYnqevbZ1CTqif2J57XHI8oG4+Y/z0p+zK9QYXkG4/AaOHWcgGN69E1oFmWXkvkj2/BFxw==
X-Received: by 2002:a05:6402:21c1:b0:615:49c3:f347 with SMTP id
 4fb4d7f45d1cf-61a97542efemr225262a12.2.1755627305182; 
 Tue, 19 Aug 2025 11:15:05 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (mob-31-158-159-104.net.vodafone.it. [31.158.159.104])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a755f876bsm2112245a12.13.2025.08.19.11.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:15:04 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 20:14:50 +0200
Message-ID: <20250819181451.3012126-6-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819181451.3012126-1-michael@amarulasolutions.com>
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755627305; x=1756232105;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcFswdKr/63Lz02RAyhuzbJq/x7/tBWvqHfWyozzIOs=;
 b=Hjw8LW1KDgcLpMAZuR5qf0CXwRe7ISH9FunoexU60m8BnjWj20F6rEZcQrCnXwu28J
 nwOvwNNDnekBl9Zhx0PFM/gAmaETh8BgUhvtYIch1Io4K41+ZMfiBOa4ya4aGnR0k556
 7jx0lsQELgb1PWNDkXUAoagIn5S9NJwzuyC0c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Hjw8LW1K
Subject: [Buildroot] [PATCH 5/6] configs/engicam_imx6ul_geam_defconfig: bump
 Linux to 6.12.36 and U-Boot to 2025.07
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
 configs/engicam_imx6ul_geam_defconfig | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/configs/engicam_imx6ul_geam_defconfig b/configs/engicam_imx6ul_geam_defconfig
index ed4b491ebe..8560871ea9 100644
--- a/configs/engicam_imx6ul_geam_defconfig
+++ b/configs/engicam_imx6ul_geam_defconfig
@@ -1,33 +1,37 @@
 BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam GEAM6UL Starter Kit"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/geam6ul/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-geam-kit"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-geam-kit"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ul_geam_mmc"
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
