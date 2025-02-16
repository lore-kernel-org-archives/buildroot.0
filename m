Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672FDC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 236FB60628;
	Sun, 16 Feb 2025 15:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXj4C4Qd2LCw; Sun, 16 Feb 2025 15:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DC1160A6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC1160A6A;
	Sun, 16 Feb 2025 15:35:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B108DE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B71980E46
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erf4WM-vMp62 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:35:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92f; helo=mail-ua1-x92f.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59C27810E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59C27810E9
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59C27810E9
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:01 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-868f18a629bso911436241.2
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 07:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739720100; x=1740324900;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sR5YB9n77wLyhRg25EY1b92MyyTsdr3BSXv601UO7xs=;
 b=rpUFn85h0bEnG2uizd0Q+JRjg+Cy/mlcCJXcoLIjZpMrmOw0PbcX8jRBj2z8URhomM
 8G3pFZ8LTlf1GdgQ/+dpGNfFa03yPG4Qv7dOetMo8lBhc1si+WIG6pHciBZw6Dd4Vzx8
 OkNvUdwi6pbR2Wk2n/CRqoMII2vmFNRbvx2x0HvaiFWnScLAXkNfK0y5dDaobOIo4UqB
 EC51TSQSzncFe9EvSvGHsqS6u2kfeWW6yGCKT5Kl3sP5RZNIobvUxdmhyzJmKK+NjNd5
 kfnMS7H74QmzxhoKkcYue3go4WEAeOB24ZRY7dVU4JwOgiF+daM4iCvt/utau3ksAoum
 IBhg==
X-Gm-Message-State: AOJu0YzBQ/TMwk2pGLo7h7RljH4/cHT/4VZZ5vm1aATg/Prkl8aqqnAg
 wCn6nD+mA0iTao9in0lEBYU6enQVPd48+tJPpuAvWFfDvokx3lSkHQ6eufiS
X-Gm-Gg: ASbGncve53icz1euNEH4u7JJmYYlfCzVy+CZUrA7nWOHDB1gYZ7piyAmiE5MFhs4Ye+
 rX/HYr+9bxWnJ9pCtw06gGhMAtMvU8GJK2DLna10OvNCqKTthXc2zzeHZKK1P+zGRA6vh9iCXJn
 H3dKUKsAEqlBYS0QkdbjJ9WMRYjQ4qx4Tsw1On8FyN3AS6rBeDFyj15xNoP1bM/kad2MHe/26KX
 lu73TD3AtTXAS06qc6lEOPKDblGEx1ErZjvziUnHkO5JlECEcmCxWqh8Q3llIMEvNqzLKRmjJ6T
 92vY+DD9dtFI3CGH+/zzSLt39Qneo9YakpF/
X-Google-Smtp-Source: AGHT+IGmB+9hz+MMQH9Qo5TM/F6ltLa7mAxU5NXI1IZZAvBEk4jHP8gn/JNMIW6QCJey953j/GwYHQ==
X-Received: by 2002:a05:6102:80a3:b0:4bb:e9d7:c0a1 with SMTP id
 ada2fe7eead31-4bd3fe473afmr3303167137.22.1739720099685; 
 Sun, 16 Feb 2025 07:34:59 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:69c6:af1e:5931:a271])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-868e8548ae3sm1528875241.2.2025.02.16.07.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 07:34:58 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 16 Feb 2025 11:34:35 -0400
Message-ID: <20250216153441.2706067-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739720100; x=1740324900; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sR5YB9n77wLyhRg25EY1b92MyyTsdr3BSXv601UO7xs=;
 b=UjyvqkSaoFNzNO6YC7b5Z02u1dygXuE2PePfqsReo1wO9Ek/JmVqiUx2Twgl6UxxKN
 nNFBiFIHysnUh1JU6dGY6rRrjkFVckCAr3ZkLsNsghlhk5ceXKbCWg1Zdb+YSRvOQqoY
 W6u4SkVgVQ3Z3Wb3AlKDQVHuyRo/Faxa6CSDoYrKvRDHhqSiPzqw8LMzC3gEfQIpDhDi
 dqGlNqhRy01gl25eTHhDljR6CuUmpoUUFfSltw98n/fDx+ynexRxW5mNnGvZNfxIbTWL
 US1Fo74S3dWb3u0BFtVrIIvy+pqWIjYYK/gimV+2XBh/8R7T4pTPVSwXKPdPANAFmVAb
 KG9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UjyvqkSa
Subject: [Buildroot] [PATCH] configs/friendlyarm_nanopi_r2s: update BSP
 versions
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

- Switch to Linux LTS release 6.12.13
- Switch to U-Boot 2024.10
- Switch to ATF 2.12
- Add BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS option required to build U-Boot
- Also fixes multiple occurrences of this issue:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556338

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 configs/friendlyarm_nanopi_r2s_defconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
index c190de35f8..2b6d34bced 100644
--- a/configs/friendlyarm_nanopi_r2s_defconfig
+++ b/configs/friendlyarm_nanopi_r2s_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_HOSTNAME="rk3328-nanopi-r2s"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Nanopi R2S RK3328"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-r2s/post-build.sh"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-r2s/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.13"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-nanopi-r2s"
@@ -19,17 +19,18 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r2s-rk3328"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
