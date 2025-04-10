Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C659FC3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 18:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A374820F3;
	Thu, 10 Apr 2025 18:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKr_7FPpVZBV; Thu, 10 Apr 2025 18:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6FC281163
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6FC281163;
	Thu, 10 Apr 2025 18:01:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A56F8108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 18:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B0E080D62
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 18:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFhr_SrntYo2 for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 18:01:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B871C80E35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B871C80E35
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B871C80E35
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 18:01:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so890302f8f.0
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 11:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744308105; x=1744912905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jvgc1EM5oA5NbsFU1M5oml3wQwMvy9SGOr97KAD703s=;
 b=iG2Wo7aYuq+2GRCZUqxis3GPX3o31NcW+sdQLB6Fa6DMYW+ejBq9b9lUEF4gQAsUuB
 5qKsn7+2K3ng3T60sag0IXOkuJf6T75Lar07XNnMgEuEpmbkluJDDrJPgAnKrVRz+W6v
 mHFTvvxS47oA9pJNIlmqu4mOLagzy3JR6OPWlcjimcUomhFthDLy++1KEy0p/LLHqBmb
 BeE135ZTdDD50UnOvNoyjZykGCVneOcuoEcIqDLFoevuJfQek1TxxJ66y4gqVk+KazHi
 vUU8HhR2XIUoHU+A3YFAs1NRn334I76AGYROuOy3Rs/ZAl40uTiLQu8G0uF0E3uE+aP4
 GYPg==
X-Gm-Message-State: AOJu0YwHRzICK0Lrkg37TgENKbkZ++heU6vqR9CZZHDQwPOqUMfFcrs6
 2SY1VGeLsoB5hjFHxv8M6Sm2nBx75OGeCbF+GwYrrdqIhzQJMy6/Xh8Y+Atp8x9vp+ex2kTMvGH
 B
X-Gm-Gg: ASbGncvPwdLUvGJGYiIdQGOxHHWEk12ZR9bvUHcsHZYhHKqy7Wgf4jJ5cPmk79wN6bq
 l+Avr41w539iLYexyIuF8sVJ4fLDhZ1wNxvZJA5rIjWOWIxBjcg8l3eLGS/KaM+hri4icZewgqq
 J2VDHk+YohIMXJ/me3Z+PbhFHgd5bpFOTxhVKW0vKoG5t/kBrpn2fmQ8GzfN4yZtC/6SGSUvOgh
 yg7xxN2tATEpVvwYm6g5bQKH+15YPtJt+JGsWiEp1Jz/6y5YfA9OgsoAGRd/Iz43rEI5UdfYcu/
 TjnBM19/xTzOj4Ea4S/imZH4WkYfIwjV8Y3daQSFbYMyrTepRNJDc4GX76YaDSoBA1a2SfPlPK9
 WwuWx/IFNKSZHtHmCgnRNtEa/TqtmVsN4FcDTuSdv
X-Google-Smtp-Source: AGHT+IG0/pYPvmoo8oWUxntir0bs60pnvNcVbRy37U1PbWetujZXs6DfFCvi+psFS966PUbh4BzmvA==
X-Received: by 2002:a5d:64cb:0:b0:39c:cc7:3c62 with SMTP id
 ffacd0b85a97d-39d8fdec16emr3311895f8f.51.1744308105160; 
 Thu, 10 Apr 2025 11:01:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.44])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8936115asm5627624f8f.12.2025.04.10.11.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 11:01:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 10 Apr 2025 20:01:41 +0200
Message-ID: <20250410180141.2194321-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744308105; x=1744912905;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jvgc1EM5oA5NbsFU1M5oml3wQwMvy9SGOr97KAD703s=;
 b=eom73Ns1Hfv/6gp4P225NopYw3yRDHyNdaNWUtTLwThqZIvuVxsJMsoO7VaV91+GDe
 BCYGsPu7iGCAI9vlH+ldEfNgJaafZRmYsnRfe0TlwhyyL3gD+efTeCex6z+bMcL/eu0M
 k1pBL3r5p13/Qq4iPRUYkmOApP2GFaib769yE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eom73Ns1
Subject: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux to
 5.15.179 and U-Boot to 2025.04
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.179 and U-Boot to
version 2025.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f746-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f746-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f746_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
index 57c69adb36ce..4e0aeb77d880 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
+sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
index 50674352d71d..80ea21b7cb4c 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index e72e5122b001..71004ef82315 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.176"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.179"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
