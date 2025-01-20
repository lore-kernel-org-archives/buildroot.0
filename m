Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24495C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 18:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C24AA83F3A;
	Mon, 20 Jan 2025 18:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gilLmzGl7fu8; Mon, 20 Jan 2025 18:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD50783F49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD50783F49;
	Mon, 20 Jan 2025 18:36:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53EF3D7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4146061041
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuUGmQrqsy0M for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 18:36:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A10360BE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A10360BE1
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A10360BE1
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:36:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43618283dedso49159195e9.3
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 10:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737398205; x=1738003005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F7NlJFAN85PoFPLAbo3CuNrpAsrc91/H0EBAALnapIk=;
 b=ZBuu3KKW/7TCanWG2Ycc9xu/n9eJ5Fwnm/7ftfYUx2iecF5MlWDMNWveOEjDkMX3B7
 fUp7W+IH4Mj0zr+sk7YiBW3Gnfzc+5DZUP8bykbPnhnNUOS7k/vl1Z+egbgHTbC7qjWq
 IjwKAL9vgxosei/UM00XDuueaqnsUVbgTFm2tBOIUENh033hKdHqE3zgLNtcXqDxDydA
 hM89ySfrppORtS5eDR3YVvne9NweGEfQOB3szODP5TC65l/qQ+fNVEhCdQWZpVLStCAz
 6ywfEXkzHaxhIOUzaOgg/BrbjBNMHgdg12H3jD8scypOlnWQMihe2+BoAUosv/NlaOBx
 kFDw==
X-Gm-Message-State: AOJu0YxfMpyO2IbZbnV2V1AWJF98UwWqKWdyro3wz8RmirDZ+HIydrxb
 nHzWxYNkifLw03eo3GeUuidp5MLCabWSTxeR21EeDSLsBpUkHKOl59v6cO1Rmq0FNbxR951JL9h
 C
X-Gm-Gg: ASbGncshy5hmM95DK0uT6w7sUk908cuoClMNbG+Vqg7b/oVK1fVcLmP/bCzdKVK4NmI
 MFoPBCfT3N6oPoiv299fB+Hmn0Yk2GuP6xJoGBr6DLJX9LAUOi2D/qn4Qt/wT/fUGEvaPHf9iXe
 AH3DA8xeAFT88K6JnQ83jUPvaQFq+7exItcy9Y7QL1R55N0qtclYdzmrgD0s3BfS9SduKJ4vNRR
 EXl4Fzv8AhT891gJyuA2K0+l7DbusR1O20R4w2eSB2ex0HNGTcqZ4IsELKP1+ygSesRFlMUWugR
 fpOqMQu1OZCytsGCXotqBIbbQJ9us7DltL83JkbYHDz5XMUNNzenrTS3WsVq
X-Google-Smtp-Source: AGHT+IG3LmArxodqRIS3YgdoIAFxCDFIntq/kUrQcjk91H/3o/lNbOO5aD5x2JGbqgxdY9TRg9z9Ew==
X-Received: by 2002:a05:600c:468e:b0:436:5165:f1ec with SMTP id
 5b1f17b1804b1-4389143145bmr134344555e9.30.1737398205158; 
 Mon, 20 Jan 2025 10:36:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.136])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c75298adsm210942845e9.30.2025.01.20.10.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 10:36:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jan 2025 19:36:41 +0100
Message-ID: <20250120183641.3343055-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1737398205; x=1738003005;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F7NlJFAN85PoFPLAbo3CuNrpAsrc91/H0EBAALnapIk=;
 b=Mdi6yEE/FYsFgOSG20sX/kif3eZBtWiB2xdFLML1mDNAE+IH3N1uMxUV7ccpzVz0ZR
 MZtbDZcbdjm1TgJR4yojOqr0JB5o+d7RY827vZSxoPn4J4soV/LAixoZ2xfJN36WywZb
 wo4ZcyHvi3aCe6AMO5uxRQcxE75XkIhoMncJc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Mdi6yEE/
Subject: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux to
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.176 and U-Boot to
version 2025.01.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f746-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f746-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f746_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
index b241c795baac..57c69adb36ce 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b1751f18ece3df08d502dd87a9ab1a317dc0f9486355bf8ee62ba6af0b35da30  linux-5.15.167.tar.xz
+sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
index 904fa56c02a3..50674352d71d 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index a3de2400703b..e72e5122b001 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.167"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.176"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
