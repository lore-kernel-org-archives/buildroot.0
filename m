Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95D2CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 16:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5DA340EA1;
	Sat, 18 Oct 2025 16:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JF-EwLDWXb9b; Sat, 18 Oct 2025 16:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCE2040EA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCE2040EA2;
	Sat, 18 Oct 2025 16:24:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE5CF1CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF267401C8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Z1Jhd5SswIH for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 16:24:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2F9A40059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F9A40059
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2F9A40059
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:24:52 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6399328ff1fso4999375a12.0
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 09:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760804690; x=1761409490;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7WrAMCoGiK9o0sncEh3hxAyjztdFfytZcatyHqnF2Bk=;
 b=BumyzoeMlJg6ouAj4Lc5c3tvrBihF5EG3A2X+jk5WolOaXsYkSPIhzcoQOvrvgLrp2
 OyjuXcpcRVYASKs0T7Z3nPZjuuyrNn0Mg0wiFIuJepsgrcw3Lfu/1m+zQYY6D1y1EfY0
 MjYSOSqlT4KbAhTeZs7KMmsTixRhduSlf8r1Q/qi8s+GJfFP4TaljqOEvpCL7iBE4Qlu
 oJL4nkS3PugA4W1ktXooFawU+edofuclquFhsBXe/G1q8W6Ndqb7YzF1yQqLX2bOxXE9
 NwV5XDzKTEfTNNTqck6KOF63Vfl0iHwTceXC/pQiSt5IeecCJBRbUF/laZamJdi/+jWR
 kpYw==
X-Gm-Message-State: AOJu0YyMkx1MYRiPwV3XGzdl6a2SX6D5jHQ70m7FJXTOhdpa3rsYHbnm
 NcDxv0pNRmQm+U5Aq+Z+diMNNS1iUwWYWVNzdCYnAQu5ta+rhQZXIKbY1lcy7ePcIbcdK20e8qS
 f3csiJmg=
X-Gm-Gg: ASbGncsyAhPooS3GKMR0MqVPl/w4fKEP/+q/WDLSBVWZyaGAtwNyAFEmPTtFlSwN+GP
 +FZRH7gn0XGdOkII/IDPahCjiJHIJHnptv0r6ET0MUXOrtSwmh5TfSB/ouz+L5vwE1BN6OPUdAN
 lDdMauA72pvD76hkE4H8kn7ROOPMoTsKGLoGnBg4Q7HeZFUj1T9zbZudTM/V3MxI+zuso+cBz9j
 VVGbNNR2xm+oagTmpJYuYZ5tiEPmpTEwRzsPt0SMHifr6fG5/mrIaEt6+I6Y3z9PmnmwkVnaqhj
 6kozw7jthcq77VWi2InBZw1NNx6hHu8gpru91vB0ut8K6Kkfd5s7tj9pKmzJ382TAxt217tEokG
 a9PDjQyEWH7v0l2hkGEYc+UpFxTTAd9/VmxDa++EnqqvH0srvgOcHD+3woxAqJMII3Z+2279b/o
 lY4lJiwipqfcchutB572rhE6bKzyjWfecoJF95sT1PXaV0idNp1Qnm/9t8p8+ICQmR0Us3Aj2v2
 RUX3/eis9MC2/l9IaqCcVR03rs/7ExWvoFdml3QkFZS
X-Google-Smtp-Source: AGHT+IFWjy44sD24hQ6X3qsSdSFURXVW4bh//F7YngX5ZDPrnwkSpMrUWPkRt0QMc9OCC+zu0/weuw==
X-Received: by 2002:a05:6402:5111:b0:639:4c9:9c9e with SMTP id
 4fb4d7f45d1cf-63c1f66c726mr7228688a12.10.1760804690608; 
 Sat, 18 Oct 2025 09:24:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4949beedsm2383555a12.40.2025.10.18.09.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 09:24:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 18:24:44 +0200
Message-ID: <20251018162444.1188691-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760804690; x=1761409490;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7WrAMCoGiK9o0sncEh3hxAyjztdFfytZcatyHqnF2Bk=;
 b=bcNQ3OBwUN2dS/0b/Na2EnGCyMWJuD9E/kLAZjuWByTLnnPPaqjocjeM/N8j4/HvuX
 OG3Yr2+2mQgC1u4UCmFa4PXFCO3P4h9KE1CE2Ertbmhc0XoX+eeVsjUDIYqVg2meEkJc
 1QW9H0rW0f6NV2VBwMBnejGtGnbj8XGi0Gakw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bcNQ3OBw
Subject: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux to
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.194 and U-Boot to
version 2025.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f746-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f746-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f746_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
index 68e85f8a21d1..27549bda9349 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
+sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
index 440526977bd9..98a5c53aaf97 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index af1ba0549ae1..cd2123b992ca 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.186"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.194"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
