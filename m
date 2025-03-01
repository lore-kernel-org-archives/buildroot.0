Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D655C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F72370382;
	Sat,  1 Mar 2025 14:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTznGEnH_52N; Sat,  1 Mar 2025 14:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5242F70399
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5242F70399;
	Sat,  1 Mar 2025 14:27:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B1A7181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A4EE400F6
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWjLwHcYz_xg for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 14:26:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E320B40118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E320B40118
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E320B40118
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:26:56 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-866e8ca2e07so1301669241.2
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 06:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839215; x=1741444015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+C1mF0Z6CoH126qha1QCqs7RQwALNngRFAv9sBDr9QY=;
 b=JKCfbWXpCZBCy2VAarWC7vHkUdLX087xwQ3ffVxfoeS5LeqVEpRYC5TgaKU7jpDktI
 PWgNDuywHEk9Rn1cK/gtq+c4pgQwdpWpfc9+toobyErUSfEQUuc2j0V3Acqz+R6vac/B
 WwSmeU20lYMGaL2oEQ8upUvXN8Er7XjtJwzVek9CFtBO7Y+qzyp6p9eEEnZXkELmW7HU
 olHb9cqTALh6EmVPvY82rBO6gojuPodOQ65BEDCqGR52lgCzTfWBqFCBOSLY2La45wLD
 6cZ/T/9A0bFrgPY2LhpnNV2DWWowDpZu3IZdSqqK17lqfU6XYMLTRip4U9Xj3UvYllgM
 PIhA==
X-Gm-Message-State: AOJu0Yw5PKz3+FtLH6I/BsGd8Atu2KiUTNRQX2RN3ZMSY860D8w+laCc
 krPKEElrIpMqE0sQFeG+MAq4k8GY/AN0PRBRNlO743hZCyGAwPEpkmBb0JKm/aw=
X-Gm-Gg: ASbGncvV8FvPWsNU0ejthMt2Cppti+ynR4bilknU5LSWiwbPW61h8KhcgRXq+8WaYCG
 MTdgDPuOEnjLEleyiuGRrvjxkMfYcdn8ZNNAVMh3eX+1U8b3scSe2GfaLbmfts46T4hedqv1F1M
 u9Gy7+cGbCH6Ug3vKAjCirMwO/67DlAzn3gB67BUAY/MHxeFcYDdRRf40nWuu/XvN12yVA1w4Pf
 s9H1p5/otGchob1eXydKw6FsQom0fUnGQvdq/uISO0T1uc9owymqMIcaY4plx1fWaSluKNy4oCG
 OX3VKLm1r0BtmeoVx5bOAJFORroZbafprdQPinE9FBuPQvl0nPtDC6NnXUf3SGJAyw==
X-Google-Smtp-Source: AGHT+IEdJ0jS/Ie0zBmzCdL1rIb37t5rj0HzIb1a/rqiYp85C+6lqIeXQd5K2A0EEFDSvoSWLMO95w==
X-Received: by 2002:a05:6102:32ce:b0:4bb:eb4a:fa03 with SMTP id
 ada2fe7eead31-4c044d30a75mr4855200137.23.1740839215162; 
 Sat, 01 Mar 2025 06:26:55 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:e8e3:b53d:c3e3:1bc3])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-86b3dc1359esm858841241.10.2025.03.01.06.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:26:54 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sat,  1 Mar 2025 10:26:09 -0400
Message-ID: <20250301142619.72570-2-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250301142619.72570-1-gilles.talis@gmail.com>
References: <20250301142619.72570-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839215; x=1741444015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+C1mF0Z6CoH126qha1QCqs7RQwALNngRFAv9sBDr9QY=;
 b=ZsMdBkL64UgVOeTJHa4MiFdkxZHkpinpaPqdwnlo+YiRAet9H+Q53xAfefRCKSBnwc
 dZn1AtqO3nVKjSetfFJor7prVCWEPczlXnH/Z1NKtSI54/PLA8U51nUCgZAmconi+WPd
 TRXzLOR6yhw979yd6Vf8Dtw+oVWoQNBeq6SimnYZuJgNNNqbYjbCtt8htQU8aAdySQm5
 24sf0B26iTwa8ycodwZD4r9aoWBpuMWuuoFKrfH1YmXlpCab9W6KuczES3vRB8hArxQX
 eV5Ga97EtQ3fVYCO2OsK1w/Y5VJVGIKpWBYVhob7tBgxIeAxX4/IE2gsncwIRt0rLn9O
 Ap/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZsMdBkL6
Subject: [Buildroot] [PATCH 01/11] configs/freescale_imx93evk: bump BSP
 components to lf-6.6.52-2.2.0
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

Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.52-2.2.0
versions.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx93evk/patches/linux/linux.hash           | 2 +-
 board/freescale/imx93evk/patches/uboot/uboot.hash           | 2 +-
 configs/freescale_imx93evk_defconfig                        | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 0266b45d6a..58100572e4 100644
--- a/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  37f0dee8b3b52d6c7f8a46c3bdd4138b528f9cc607015400e7cad0c206df41d7  imx-atf-lf-6.6.23-2.0.0.tar.gz
+sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx93evk/patches/linux/linux.hash b/board/freescale/imx93evk/patches/linux/linux.hash
index 3c4223976b..620a7377ef 100644
--- a/board/freescale/imx93evk/patches/linux/linux.hash
+++ b/board/freescale/imx93evk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx93evk/patches/uboot/uboot.hash b/board/freescale/imx93evk/patches/uboot/uboot.hash
index 4e0d729ca0..4b763ba3ba 100644
--- a/board/freescale/imx93evk/patches/uboot/uboot.hash
+++ b/board/freescale/imx93evk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/configs/freescale_imx93evk_defconfig b/configs/freescale_imx93evk_defconfig
index b244ba9684..1472914270 100644
--- a/configs/freescale_imx93evk_defconfig
+++ b/configs/freescale_imx93evk_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-evk"
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
