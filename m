Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC8DC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 21:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2A9581120;
	Sat, 13 Jul 2024 21:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1pUz-Y3PoJd; Sat, 13 Jul 2024 21:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA96481EE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA96481EE1;
	Sat, 13 Jul 2024 21:52:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 254A81BF355
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10440404C1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0S-2pbsez0Ii for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 21:52:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CB424033A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CB424033A
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CB424033A
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 21:52:30 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a77e392f59fso394185866b.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720907549; x=1721512349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8K4kuJFfc9rflPm2N8gDKf1TpONxDJ9Y+rHKP1B5+RA=;
 b=Z3pHe7mYjVu4kwdbFw3bjgmr8fj3t9M4vVj4gwObXggzIR0RU+ohBcoW/6TBzhMvd6
 MWvvOyY+xafHI011xNOvlXmZE44Fehpvok9aFqiNecPUkn9GUBaeoXR5RPCIkpyF8Ksm
 omVQWLGb9t4zT8KLObVotenm1qGrfd4g7bIm1diiUMzRmu6QWs56jvjLcxR8PKbffag0
 WhPXTRZD0MXgj/GW0dmlQfDJ8xVnm0pxiYqzhjSpHQcx0OCGiBx7AmaXGMCRtceZvkPc
 a8ahyp7b54wmvTFKoapSSikWqwDJ4tosoDB74NH3+7SeMsUJ8/pQjdFNGfDeK5HvGNTc
 4dQQ==
X-Gm-Message-State: AOJu0Yyvbm9IiTNVtFARPV3wjq/+D1ACS/zH+IgR3x0pgLfy+kDGfpwY
 26Hwu4kGYZ/l1iqKx6kHYGFMQNq3X1dMK7vpHS3/hJxLTjeiX7ZVRPb3gI4ZWnAdeS5DXVt48lf
 TLIM=
X-Google-Smtp-Source: AGHT+IGSEJk9mJKFzmLiLG5VFOQguCKIXL7UZjO4DEIlFz9QISVug+Frwun19xGdH1xvvd9oANHbNw==
X-Received: by 2002:a17:906:2819:b0:a77:a415:f815 with SMTP id
 a640c23a62f3a-a780b6b1f41mr899994366b.20.1720907548434; 
 Sat, 13 Jul 2024 14:52:28 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-44-29-159.retail.telecomitalia.it. [79.44.29.159])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5d2018sm80223566b.85.2024.07.13.14.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 14:52:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 23:52:17 +0200
Message-ID: <20240713215218.2665512-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720907549; x=1721512349;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8K4kuJFfc9rflPm2N8gDKf1TpONxDJ9Y+rHKP1B5+RA=;
 b=eJdU5WmyASEMxPLRFMuxOBkpHpB46QuMmtJbRzVOyCkFZmG3CYeZ4X90rE9HTXZYja
 TuUmb5EDrK0ThwzYCmXe2s5WvkEz7RbqC3iQm4bYZz8medTBLhmu0+ata1kTr4w/Ii0S
 z2N/PDlgNGGq1IWvg2dsGnCQb+dY1xMaV67Vg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eJdU5Wmy
Subject: [Buildroot] [PATCH 1/2] configs/stm32mp157a_dk1: bump Linux to
 6.9.8 and TF-A to 2.9
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>, Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch, following the suggestion expressed in [1], aligns the
software versions of stm32mp157a_dk1 to stm32mp157c_dk2. Indeed, the two
boards have many more similarities than differences.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240713130847.4097389-1-dario.binacchi@amarulasolutions.com
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
 .../stm32mp157a-dk1/patches/linux/linux.hash             | 2 +-
 configs/stm32mp157a_dk1_defconfig                        | 9 +++++----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 97c4500711fd..8b69a5a96453 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  068325043b7c8ecc47ebb8b4f241f01e86d3f69dc49a63f340aa94bd41a9e6df  arm-trusted-firmware/arm-trusted-firmware-lts-v2.8.16.tar.gz
+sha256  06d32acf42808b682859008292f0591d2d872f19aa1a8021bfcd1c1c626285e6  arm-trusted-firmware-v2.9.tar.gz
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
index f4b1146f83b6..95bd23c8d022 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2783d42112095f95c510e1b421f056df8cbfa845f9040c6115080434a77a776b  linux-6.6.39.tar.xz
+sha256  f048267b7b88316c9ca708c68d15a9ae802dcfc943c3188c1273eb958c433281  linux-6.9.8.tar.xz
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 31c52a7723a2..cf42b29a7c0b 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 6.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+# Linux headers same as kernel, a 6.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
 
 # System configuration
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157a-dk1/patches"
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-im
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,7 +29,8 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
