Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD402C83F1D
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 15:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D55A40FC0;
	Sat, 12 Jul 2025 15:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0by3rbxzHAtF; Sat, 12 Jul 2025 15:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AADA540E81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AADA540E81;
	Sat, 12 Jul 2025 15:58:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B95EDF
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B6FF40DAA
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bJ_aUd-XxSL for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 15:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C95E40D95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C95E40D95
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C95E40D95
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:58:23 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ae0ccfd5ca5so436004266b.3
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 08:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752335902; x=1752940702;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8aUTsxvasPCHMvo++gwyYrqve5Bm52OjgKuhmCMuN4=;
 b=ie2Vv4WZiIDCaj2Yy7PUpJzRxdR0dv6NzteWtaEuug3aBJSMzVSHjJpexJyUgIgc08
 V/KI5/eMTPw/a+y2UmEu+Fs3Xq2vWx0BDfYeyH0EbWsSb+yPjCBd38IOLEn5VCgBwJVy
 XE3SPa292xIgL2PXpzU7TvhgSsbfEXPWvRJl8Dgd5yu0/HKPw7K8vUKPi+ZZ+6w4QAeP
 uKBvDPC9yRQCIMUAQ2qhtsU/tc2zHVdi3PX8jlAhBUCKz57fVGO7z1FVocv5bodGJ5hK
 //NL0PS4sOkvKq95WD3xgkLCcRkavCmw3UhKCIpwiNE6REkg82S46qTfbMtxaEg4q5+M
 8AcA==
X-Gm-Message-State: AOJu0Yw+SvcPpnyGvggnYdk/9KprXVmQYiYE/eZG/Jn0ajcsVYIJ8pBg
 yjQqqjOE7S4gTvObic/xftRQkuuwuRQu0i73+f77pbBoGXBAi50e9n/VTQYSSc9cqqIaTGX1mIA
 rvgco
X-Gm-Gg: ASbGncu2YDgSswX9jGNp9eD7Gx8DHILemphC8ZxBgJFNucqTkIXA3k1GV405zYwreGo
 /ZYOqdo42/u9FSHxbcSj0LIc+TxeOClEjPbQJXRJlKlpVHJpDlsslTQt8QViYPlhXacLSFeRUnv
 GdG26FUGbH+yyp7Pvcamw4CbIOyrqsmEfTPnfN1MS2muJTS0PDeJBlKNMUyXjhDk5idwfoat5DK
 gUt1Gzj5IRJFnLqoV+G6vIMmvg2nwURqhbg5LN1TgFY1QAtTGl8zM3MeKZcH+v36fDQl1Tq651P
 6zn8WJqPmS/gBGqD8ziWR3Rma9r6liTzb7q41wfrxlI8CHxrWUWMJZBaEN5iKhGu9Vi617Dk9kn
 t1pMEYNz1VQXqf8dIuH5NJ8LE7jBDokGupDZYV3K+NtksgvDBp8Ykn1kJnMCmXUpneMJZEcixTt
 1vg5RXMYLt2+mrlXhSWczZR9ijLEBqNG4okZs9HNTENGMVEYj0+GOnSdamGg==
X-Google-Smtp-Source: AGHT+IEhsYSbvlziDW3OZlzH8CVt4G6rjRGytwH4lymBkRk0fcWUgFe6P9gSqc42ijS+u+ggA4TC0Q==
X-Received: by 2002:a17:907:cd14:b0:ae3:66ff:f922 with SMTP id
 a640c23a62f3a-ae6fcb1d4eemr620288266b.50.1752335901741; 
 Sat, 12 Jul 2025 08:58:21 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82651e9sm509959366b.73.2025.07.12.08.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 08:58:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 12 Jul 2025 17:58:11 +0200
Message-ID: <20250712155811.1818776-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1752335902; x=1752940702;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n8aUTsxvasPCHMvo++gwyYrqve5Bm52OjgKuhmCMuN4=;
 b=iscBbfGXqerX/QxKLoEvCUKPX3r4f0LGPXspaIfOIsJQxDulr6ljjmSFGvOj3/BUoi
 TU5zJstbr4RR1dfIIBFrpoyEZQa/1HNTJUXtV01ZsDNyd3nx6NCDHrA5BbX3et5XHVqH
 XKPSs3gpubnwpo40Ado52EgFIbSQhpddnxhuI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iscBbfGX
Subject: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux to
 5.15.186 and U-Boot to 2025.07
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

The patch bumps the Linux kernel to version 5.15.186 and U-Boot to
version 2025.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f746-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f746-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f746_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
index 4e0aeb77d880..68e85f8a21d1 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
+sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
index 80ea21b7cb4c..440526977bd9 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index 71004ef82315..af1ba0549ae1 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.179"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.186"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
