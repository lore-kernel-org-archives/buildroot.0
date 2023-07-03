Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC6FEB64DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 16:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A31682001;
	Mon,  3 Jul 2023 16:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A31682001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJnYJOUWrcqD; Mon,  3 Jul 2023 16:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85DB48204F;
	Mon,  3 Jul 2023 16:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85DB48204F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13DFC1BF59D
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9C1E82051
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C1E82051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jRnQ59MSEaLi for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 16:01:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C668204F
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3C668204F
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 16:01:55 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b69f1570b2so77020711fa.0
 for <buildroot@buildroot.org>; Mon, 03 Jul 2023 09:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688400113; x=1690992113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+dr7GFD3hCne/pvHjDqC1qA965Os8RAf1zdHvf+Q0t8=;
 b=NjZiAxFRhXFfeGBZdlS7k4kC5f9+ugny1NtUf3Np4hse3Lc07Do03Xsb6H62budleJ
 Wy5HkTyFBO3nOpFGESGtSNR6zSwLCZoJ8h7652Rgut3nLkAH/jBu9bwBVN3F4WCaGA4A
 qtjIJKmKP46NgovY/Aq6IQ7a5JatHUu89KhA2etY8QnWgdArW0j3LogTbM1EHj5Upb5T
 dPHfFAogPj/27f1A4kBcI2RNJoZ9iwUg6T6Y16AKRgY+zJ3KcdJFe9m3k+KftsYsf++g
 /dmFtZsDQSAM1UJbm2lMgP5OOHNMfLzqfYX3WTI9v8k3dMrCByJbkhOx3odAw6HzXm8W
 H1Pw==
X-Gm-Message-State: ABy/qLYXe7BHsl0aejB2TG0yJtc1OMMQXUXfdB0yl4kCt9eLyr1Kc4Ce
 nnWDm5lmpxbhbrCvN6PMqPGk5gskDXV0RXJ6yQU=
X-Google-Smtp-Source: APBJJlH7JzJw3AnWr6OfNqcAn4nLLiCWvjZ5NipJw2WIOtno8kRMSQaSPAjGo0Nawhw7+Sff4NES6Q==
X-Received: by 2002:a2e:3315:0:b0:2b6:eb58:e30f with SMTP id
 d21-20020a2e3315000000b002b6eb58e30fmr2342069ljc.18.1688400113501; 
 Mon, 03 Jul 2023 09:01:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a056402001100b0051a53d7b160sm10619687edu.80.2023.07.03.09.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 09:01:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 18:01:48 +0200
Message-Id: <20230703160149.2302949-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688400113; x=1690992113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+dr7GFD3hCne/pvHjDqC1qA965Os8RAf1zdHvf+Q0t8=;
 b=FcFGINTX5ClH5yugVCkv2figR5sInsmbzmGHCfxiAldtu8jxx68BkzpzHeJmWi1dlZ
 x4mxatTtDqVQz0+fdHidm0vu/fcU4r/R5w2iJY3MAktw5OgnpW6S3Gd+eTi06NbPgeq+
 V/m5UydZFeXxi6TW4FLw3LIGdAshJxFgZhvHU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FcFGINTX
Subject: [Buildroot] [PATCH 1/2] boot/u-boot: fix u-boot.stm32 creation on
 newer version
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
Cc: Simon Doppler <dopsi@dopsi.ch>, Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in commit [1] of the U-Boot project, the config.mk file has
been suppressed in order to use binman to manage FIT generation.

The added configuration option allows the creation of the u-boot.stm32
image for both recent versions of U-Boot, which use binman, and older
versions.

[1] 5564b4cd4d5c69 ("stm32mp: add binman support for STM32MP15x")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in                            | 10 ++++++++++
 boot/uboot/uboot.mk                             |  2 ++
 configs/avenger96_defconfig                     |  1 +
 configs/olimex_stmp157_olinuxino_lime_defconfig |  1 +
 configs/stm32mp157a_dk1_defconfig               |  1 +
 configs/stm32mp157c_dk2_defconfig               |  1 +
 configs/stm32mp157c_odyssey_defconfig           |  1 +
 7 files changed, 17 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 085397d03d0c..ab0aaf2939f9 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -395,6 +395,16 @@ config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
 
+if BR2_TARGET_UBOOT_FORMAT_STM32
+config BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY
+	bool "Legacy build (u-boot.stm32 target)"
+	help
+	  Select this option if you use U-Boot with version older than
+	  2022.01), so that we use the old build target. Otherwise,
+	  binman application is called to create the stm32 binary
+	  format.
+endif
+
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	bool "Custom (specify below)"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c373..0b4b355a6c34 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -133,8 +133,10 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_STM32),y)
 UBOOT_BINS += u-boot.stm32
+ifeq ($(BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY),y)
 UBOOT_MAKE_TARGET += u-boot.stm32
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index d2c1b9013ef2..1f8e7a50d1e7 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -30,5 +30,6 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp15xx-dhcor-avenger96"
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index 3b56fefeca1c..44ff706fb2c5 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -41,6 +41,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
 
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index a487ce989148..3b8fdea993ac 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
 
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index f1f7baaa0806..8b83bfe44353 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
 
diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
index 6b699830b171..15b9a63b3926 100644
--- a/configs/stm32mp157c_odyssey_defconfig
+++ b/configs/stm32mp157c_odyssey_defconfig
@@ -29,6 +29,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-odyssey"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
