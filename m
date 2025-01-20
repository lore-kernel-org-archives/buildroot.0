Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0F8C02182
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 18:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7174E83F39;
	Mon, 20 Jan 2025 18:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1MbMfSgsQe2; Mon, 20 Jan 2025 18:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7673383F3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7673383F3F;
	Mon, 20 Jan 2025 18:34:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1E0F959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA4C5410A1
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TriYi5AbYqYU for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 18:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A42FE400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A42FE400DC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A42FE400DC
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:34:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so55452485e9.1
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 10:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737398066; x=1738002866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7h/8aSyB+yoxazco3YFCObc57YWLYBw8XWdkOndHcH8=;
 b=dYJd3FlhER7uDisOfqtkKb338BNRXMJeeZYSKxnOo6S25XN0bh55AuSnj12gmFhFfy
 pWqxIykES249eAcLDxciGb0xefFlLPFCjiWw7euQysd5Ds8ZZ5uppIKsmFN4FvavipPI
 PUkqoPCIJMdXjo7i1yDIKtg3XPb1RMc3LPW0O3rBOvWT2/fES34PBZiFL64QomQ723v1
 4Orz9/p5fdL1uezK66UGxSnw9lac6JdUfHi/lhT0dHAJ3/+J/BB8mzI93SaWy2ZIOTDD
 0v6Ol+Lmb3v2NKMkR88na6faL5+8si76xDj57znTqv6ncGv3RdPUkTJ3Hdu0+o5c64O0
 Hsgg==
X-Gm-Message-State: AOJu0YziFUf2YBOcvfhuHefNLTjwDT+H1ez2iMOmGIUk0Dt3zzXnCRST
 bi36PGmuqX4h7DgL6rIVqBOXGqh+S3w2GME7jl57G1uTmGywI7uZYcQx6qexmjwBIBqIqEhfgib
 g
X-Gm-Gg: ASbGncsPm9z9XMIoJuU81FYarTCKBwJ1LGJgf5KVe3lfvvJxVvDHo30Stt7xV6LWj8y
 8i8Ns5Bz0cRdWEhlc3CvGcQjRJmwOVKUOsMh6sCNryiVYsMU+5QUb1ubqVVj0kK+XhnSJpPV73T
 zsVJoAgxkGdzDdr6j0+kfaVnZc19uHwuS+sswendnxAQNpV0TQarzG6muRTne4jQbcnRuNy/xWh
 p3b51GpMnM+VfKYux39nzLgHoU1RH6RwWw08VqOTrJI4Cdqqbzb1yQ9dkxVDrBR46Sfia+cfmy2
 0bW29Smd3GB8iwziY/D4C1U3E3l0oUhjv9++IrF5a/YqQCtZ8k6r2XzeNHsb
X-Google-Smtp-Source: AGHT+IHferi4y8heSDLfUgpz1OoSX4Bfaby53G+l/yHfZ93WEfXC+4EHPDevUh5GY3mGm+4mUp0fpQ==
X-Received: by 2002:a05:600c:4c86:b0:436:6ddf:7a27 with SMTP id
 5b1f17b1804b1-4389141c412mr125682365e9.23.1737398066362; 
 Mon, 20 Jan 2025 10:34:26 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.136])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890413053sm151785235e9.10.2025.01.20.10.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 10:34:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 20 Jan 2025 19:34:22 +0100
Message-ID: <20250120183422.3342199-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1737398066; x=1738002866;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7h/8aSyB+yoxazco3YFCObc57YWLYBw8XWdkOndHcH8=;
 b=l0HLQSUpg7+WK9eA85uYBkEajR9PBj68xu/W9sYPCaO4Vk6kIjRPKlw4g+ORti3TTb
 iA85f4Df6uPpO7kvqFfwbOW6P9CWCJxKMr8P9C7r80iz+MsqaxqtN4OK3Y0hehUi5YTF
 XRDqk5z/0PLRvSfyOPHrkTMEdDDAEo0g7QSy0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=l0HLQSUp
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux to
 5.15.176 and U-Boot to 2025.01
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

The patch bumps the Linux kernel to version 5.15.176 and U-Boot to
version 2025.01.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f769_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index b241c795baac..57c69adb36ce 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b1751f18ece3df08d502dd87a9ab1a317dc0f9486355bf8ee62ba6af0b35da30  linux-5.15.167.tar.xz
+sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index 904fa56c02a3..50674352d71d 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index ef97714e4d8b..25b79f0de197 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.167"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.176"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
