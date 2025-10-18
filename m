Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D452ECCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 16:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A267640E2C;
	Sat, 18 Oct 2025 16:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9xHAxfhzf0r; Sat, 18 Oct 2025 16:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB18640EA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB18640EA1;
	Sat, 18 Oct 2025 16:33:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C19A343F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3DD582376
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiXcsow5ps4A for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 16:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D771B8236A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D771B8236A
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D771B8236A
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:33:21 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b5b823b4f3dso526176166b.3
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 09:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760805199; x=1761409999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qrOVNpj8d/D8DWuA5m2xyC1p5Kqkr71vT+j78daegBw=;
 b=jk11NKaFmYZx7uheeyVikYSjEKNrHvNH2UQO91nnqEwV4V3xtNm94MpLfOKZp3KRJh
 OkV1DNIgcmsCZtvzXgO1gO8lgz5baTh8MdgWcZWFO8X2ie81UWzgMXGO9f0/nqPidW2y
 OiE0Q6Rl8Ua7x3YlIZrT8gHLO0fKwTBNAdhhfTEShoj9iAEBDWVQ7MBWZbjKX6MnJlkn
 va3dTGfaN8D6UZt+ZKM8ql6t3eurWmWhQiR++g+REY85jscW6yNAn0XK9E79VNJXqVp1
 2tpxpnCx0JNK0Uq9BIDTxtJsq0GV6plFDRQRrZ+my4HOf/77JLKyBEzRwdCH3xuiG25I
 TAfg==
X-Gm-Message-State: AOJu0Yz6QRgyxL+290xUcm9fKHWY7EznJjeAebQU2Gy+5TOJPOWwEnWf
 UEwBGXCBcq0XfBGB63NdDfBeVXHmrDNsmzGZqEqClXO/BLT7tb3RGFSIDnLT5JW9sJi6dL1+n7Q
 2o6sz1ao=
X-Gm-Gg: ASbGnctyOL9OBkiTZhBbBWmIc34OyOsov3m/I/OI+lAeerhOUUWrUZZDct/ojfuerdp
 JlLYm68v5AmFb4kqgh69uykb2lyO/kD8x03CCZm7uBEWNul3Q9c7DuQPTHADEmxlH8zVags0gY6
 kcYnLH/ifykQivErxtnopbe7dZy5mPFlsUvgt0gqthXzge6w8DvHJY2Rx7Q6EfKVZyRNbfTTDui
 jfAl5TGU0ghlnc+6YKVTC6uxE8fz1n3eFV15anSrteLuVClMrjf8dadkMbGfCAHeLNcsfbvOFY1
 bJJo+bA4kVU1mzLz2Ru0XWAT3ox1rgWSYv7azREDzbxYr8pM3HSA7xvZuCBkn9IaOilsitYO4Vc
 MwxxEvfSr3G6VPyeHd8MVP9eedti2+aJFrth++hLI9ahOXJRR1gya/DOyLmmUouZZguHXuYT5L4
 fIdsteKSLuXcnW+d6XJHBesfugMux5+wUw4hOvwA3VG/bstLleyL8+nhMHelGZvnZEMBS8j5AD5
 bzU+993hKBYdc+o99pbFS5LnIUCUR2PjcSXfgQR0FJj
X-Google-Smtp-Source: AGHT+IGzXeJ3tCkJtusELPiQuhVC02pEq+Q/wO4GNvf88nu4zi/FTy6lISuOdl5tFHXmrdM7vKm7bg==
X-Received: by 2002:a17:907:25c5:b0:b4b:dd7e:65ea with SMTP id
 a640c23a62f3a-b6474b365c0mr728526066b.35.1760805199497; 
 Sat, 18 Oct 2025 09:33:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65ebb499dasm287992366b.73.2025.10.18.09.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 09:33:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 18 Oct 2025 18:33:16 +0200
Message-ID: <20251018163316.1190445-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760805199; x=1761409999;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qrOVNpj8d/D8DWuA5m2xyC1p5Kqkr71vT+j78daegBw=;
 b=KR9PHj0noW87l71NWXDtyH6JdEQeoPBV2JCqCtVye+2RMd5UAUfCGLEEiRtbVws1iQ
 JtEtuPyZko/Bnut+LKF6hG+zAVaYKclByKk5C6KcmqYf9MkJVpeUvoJt5tWgCHEkuZj5
 kh/t2cIrpBxGthSaPyECOqDWgw9QX3HWZSzGw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=KR9PHj0n
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux to
 5.15.194 and U-Boot to 2025.10
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

The patch bumps the Linux kernel to version 5.15.194 and U-Boot to
version 2025.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f769_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index 68e85f8a21d1..27549bda9349 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
+sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index 440526977bd9..98a5c53aaf97 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index edd429f758cb..54ee93aa1979 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.186"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.194"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
