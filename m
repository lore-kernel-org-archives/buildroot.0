Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33913C4452D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 18:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C86580F3B;
	Tue, 21 Jul 2026 18:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqOczZwtwyrh; Tue, 21 Jul 2026 18:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02DC080EE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784659394;
	bh=+YZcsULmmHG44XKA9UrqrwV3tffzMlDJs0xPYjiwx5g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SRdfN+0/p3h+f0B5fCKBXBcyuG6EE4eeFhQzkC1oR6A91+SR4ZmaKYnBLUS9wn+XU
	 q4lDJkDz5mp7Ro21V/l13V600+WWb/uJ4eHLhqCv4r02owq3ruBrGSSpRynsyQKPoY
	 HEJ1/4TCRFyFVVFpGvlMGBPp2nDTooIFJFn+mTBQm2SyMudj2padBnENt1KUwhrz96
	 +dQgRHQHm7douSWaUhm5cX9HhLV4Lpt1JpyZcB2p5CPLtFfBaOKIHVkDr3whgPF9x4
	 NU+Q8jayP8cmeYYDoRbUzOpctb9SL1iyl6iV414HIkO+fwiDG7pWrXYgryyJAgO4UO
	 MAhb24rIUfY+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02DC080EE4;
	Tue, 21 Jul 2026 18:43:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43DFDEB
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35F8D4030B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qrtn-PJTa-yc for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 18:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14A31400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14A31400B5
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14A31400B5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so89704135e9.0
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 11:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659388; x=1785264188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IHu9YXHDqQ4pWq6kwnufLHeeVy8v21Dy54JKOFvtGl0=;
 b=alViXy/nNn1wye2tRBl4k7gbdhvM4OwIMt/okdMakU+CklF9a3LjFTpdeV9aSGFyzh
 4lcshh29tYBHi27zjXbQ61TSgnpUBxAd1Wm18ASvqbBThEGDJXscUJmOdZ2KTSza6AA2
 OP8VXpTKQ02jJLbBhpmZsbgWMZW2aTOYSWohbDk9kmTyVx+pqPMVuiBmbubbrXp+p5tv
 ZGXakO51Y/SlK1C6t+sKdxETATTFqavGtBwRj12CEGlPAhFxsEV07Hnyb+At0YuFu0sE
 rM4aQ3YrMl83wNpBmi5SNXIginGIe6oI9Svw2RrA9W1ILHuIp26cgjl6jGNie6GFhsBU
 bwwg==
X-Gm-Message-State: AOJu0YwsJhJ9BauGYJ++pyYv5vpivWQXwiCwLfzFyOmZ9EV4oZwxCr+O
 V79Sxy3C7EzwpxAwAr5JJVo4uiP1oHhVN9MZwMT0UBl4hx860JLplvCKz/vCKSL9ej+nzHWhbVg
 JTx6L
X-Gm-Gg: AfdE7clCT5Wnqgstj6J54WsBt3p6LHUH+cZKt0799FG0VhR3Wpd9PEkRR5ZB93ythCI
 3Rn65qzvqV5rDPnpvQVp9njXof9DbpohOOOm84QqIwpUZ/66MsiRleBB1Q6MJqZzBQQeKjTFteR
 EVv3MfduRavYnlCdktcN6Z5csudmYS/1qYVaUW9qtMkW3sUu0XWizWTstayBf7TYzvtY8mU5Dvp
 C98seGFh6IVbdqK5y2prdQ1hgTxbIcKV71fCvXAuKLazEQuyLdZzreYiLs/jrFaBjB+AhrThUTa
 MtFDVRX/Qpqp53ielSjQZMJgc1jtdewdT4IH/2Y2gC+bquE2t9p9mGqk4lAOvXP2mu6LV/Gl/Ks
 JSZ4UVoktRvK6/lGRnA6qxzh//EO1gE0P/ywjFF2+l3+6zl/T/GJ45NSg/APIHiIidB0/FKa+qY
 RPd0H2YYQKZf+AYMwxG6hOv9f+YkUHyjeCX0sNSDDEo0Gm04Z8BjwPpP6DF3xtD/Ro0mn0ZQ/xb
 d7M4y+KPb8egeUp27gQP355rnUrXB9p0F7C/ad5PbuprI8hORqm1fcDqWcG0XmbDbTrKSo5o+ep
X-Received: by 2002:a05:600c:1f96:b0:493:e451:a9e1 with SMTP id
 5b1f17b1804b1-4954a3d0ac1mr222090825e9.2.1784659388034; 
 Tue, 21 Jul 2026 11:43:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b030a64sm226505e9.3.2026.07.21.11.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:43:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 21 Jul 2026 20:42:48 +0200
Message-ID: <20260721184249.1579381-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
References: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784659388; x=1785264188;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IHu9YXHDqQ4pWq6kwnufLHeeVy8v21Dy54JKOFvtGl0=;
 b=D2G3ulZmfCNu9a/0AamgPrpXo18BgG/taI1/yszOcZW+laVMzqbgp/6tkPVSuMaw/2
 KCvX18IUuv2J2FSRd5xD4+ur7rI0dOv+uwO4rJK50Ahx68A0a8IjUwWOUR5tgVjO/JPD
 VupKpH6B2KVLJ1f+JRAckc3HMiiaQGkQLcmeg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=D2G3ulZm
Subject: [Buildroot] [PATCH 5/6] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.211
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

The patch bumps the Linux kernel to version 5.15.211 and, for the SD
configuration, also updates U-Boot to version 2026.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f469-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f469-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f469_disco_sd_defconfig                          | 4 ++--
 configs/stm32f469_disco_xip_defconfig                         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
index 7929b2b9e344..b4a6bbd3f783 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
+sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index 36322a6a904c..ff6e4ed2e2f6 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index c0dacd5b0c12..c9c385e0711e 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.202"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index e642d8d48908..1d113da08ccd 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -9,7 +9,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.202"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
