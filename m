Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F7CC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 12:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A9540D6F;
	Thu, 11 Jul 2024 12:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dm7kiOewIqzb; Thu, 11 Jul 2024 12:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429C0413DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 429C0413DC;
	Thu, 11 Jul 2024 12:54:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54F031BF4DB
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 12:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4188F413DC
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 12:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dV_Np5kGpsk for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 12:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0882740D6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0882740D6F
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0882740D6F
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 12:54:18 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso115851466b.3
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 05:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720702457; x=1721307257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u6Q6BFz2R2FZFIDywhKvwtKr0iSVQA9KFRXnRoxzvDk=;
 b=jKSfPX3o3Vbu85KL3M7URvAy80XoLxuPVjmPLjnFtILU5qw7Nel8HhlwZF/VFsN9ng
 vB14BvOgulGBJ6BAVfWiFHojkwgaqsDlsa8gg6k5/dao2RbqSgoHPMQ0q4zDLmjoV1/f
 B5LbFLlnDsZVQsdXp0yKgusgfoteFEgwCQg6R9rW2KsJfEgbKr/3ZA9QnY/AK9j30kWi
 Ya9ItRVQis6ngTRVUxoIGvxxHz54of2VPhv+0oVza8D4UH1tjafbyoMfOuIgfwXocV4K
 zoDBedvNpLZZtg227nJujTydk6Tpl98sLthX3Ba45pViif9h+yd34+D3rSIyGcdFf88n
 c7sg==
X-Gm-Message-State: AOJu0Yz7g0rgVin6uwvX0E54Bwrr+7m/wWx4X5qeu3HmI3TFmYhwH2BU
 yJgfE/6ynuLJepkg8DL9tK9YyjLTLnOY1lHLZehgJ3rrH/9efEPoLEXbvr0hHOiql9Dx9G2wUGZ
 Zr7U=
X-Google-Smtp-Source: AGHT+IH96/c1ZQYB25US6X39xcdxMD/goOcz0eFDPLI7lAonk1lOMrWNe61zUjH6IV3AoDCMYs63+Q==
X-Received: by 2002:a17:906:fa8c:b0:a6e:f7bc:dcab with SMTP id
 a640c23a62f3a-a780b89debbmr560974366b.65.1720702456726; 
 Thu, 11 Jul 2024 05:54:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.36])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a57bf00sm252256966b.0.2024.07.11.05.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 05:54:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 14:54:12 +0200
Message-ID: <20240711125412.2662104-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720702457; x=1721307257;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u6Q6BFz2R2FZFIDywhKvwtKr0iSVQA9KFRXnRoxzvDk=;
 b=HqAqXPBb2P8tSpZxgHOuOjtUTa8W5cYUCEwTyzdiycJpfyeuP52LDTfn/xKxkTIJO8
 CL9gtJcREnWp39SHr50v4o0LENy+VPcFuWaV6WXUjOnJmurcM8ZZ6cfBZ/kB0r66Wsad
 8jmmtcBeK1uamtyDcrQ/zrceHoNKEUDl8DqLI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HqAqXPBb
Subject: [Buildroot] [PATCH v2 1/1] configs/stm32f769_disco_sd: bump Linux
 to 5.15.162 and U-Boot to 2024.04
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
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.162 and U-Boot to
version 2024.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Drop 0001-serial-stm32-rework-RX-over-DMA.patch.
 - Update to Linux version to 5.15.162, which now includes the patch
   fixing the UART issue.
 - Update Linux hash for version 5.15.162.

 .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f769_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index 49a2ba85a7de..d8e8263e9eff 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8beb69ada46f1cbca2f4cf901ec078846035c1cd925d9471422f65aff74243ba  linux-5.15.108.tar.xz
+sha256  91bfc0ea152ce7b102a0b79d35a7c92843874ebf085c99d2ba8b4d85e62b1a7c  linux-5.15.162.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index 7cef5b688ec3..97a2b4eaf95b 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 952d22cc60dd..c9140d089a39 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.108"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.162"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
