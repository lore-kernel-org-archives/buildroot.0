Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B22C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:32:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A150F60232
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A150F60232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5623840001;
	Sun, 14 Nov 2021 17:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAhB3uKnpCvO; Sun, 14 Nov 2021 17:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EF2140156;
	Sun, 14 Nov 2021 17:32:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECE4E1BF2BA
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCC1D60667
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OuSXZ3opP7AG for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 17:31:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-16.italiaonline.it [213.209.10.16])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03ADE605FD
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 17:31:52 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([79.24.99.64])
 by smtp-16.iol.local with ESMTPA
 id mJLpm8CKm7VizmJM8mVOqw; Sun, 14 Nov 2021 18:31:52 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1636911112; bh=yUj3eBjzbRQULusoWNTVFJDOp4Dn3S4eXuQ3ptw+ODQ=;
 h=From;
 b=H3k1iKn+DOq/Am7MvB10j9dUpLgKi2KsZjJeZSv9/otbqHwy+Ppbchb1WreFMOIHW
 Zg/EZZgZqk8CNZn8iaydlM/NuODm/yc/RRq5pJGLAkEyQF7THFNQ/8EkJMfNHj/Xm7
 uJmS4TTq2dyDVXWgYzpcKcZNfhafVvwwfDUSqbOsEAGn3MGcC0uWMCrbKVG/8G4hW4
 jXbseLz27DhgbwV/B/gIJ0d8Tu7eyMBFZAjgsNR8/SZCO3bANFCQLmaG7M2JBtLmu1
 DRuwRFmxmVCU11qOl1EMAG0xVkV1n3v51/HhN8gBhEk3AGpk/aayRp/uFU1FmgEf7T
 az6emCRUVVx7Q==
X-CNFS-Analysis: v=2.4 cv=ftYZ2H0f c=1 sm=1 tr=0 ts=61914808 cx=a_exe
 a=8X6arsqDvdvtpvHbdcPR/Q==:117 a=8X6arsqDvdvtpvHbdcPR/Q==:17
 a=pl1rPjcGXzItbPHqDv8A:9
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 18:31:22 +0100
Message-Id: <20211114173122.16612-5-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211114173122.16612-1-dariobin@libero.it>
References: <20211114173122.16612-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfMU9XLH9CiGo38H8tOhmko/dkyIzaKGMTTdtGlslbKrGm6D4mll4y5Lv1p6y1Qki5ZKNjF6pyh381L5CdPrCZWMj67Q4Aqzy/3Q4QyzYylsVrr/qeGHP
 6+o7xbuMSmgVMFFz6S0eP5vLifp3FaQZW1sJj5v9Pq/TvTZn6aMWqo11fdWHxgHS/wjRHT50OxDkcCeiFQTgI+0h1/XcMbEhy9/24Law2wXUd02s2dO0sK+U
 RKwyMe4quV55X4/x/opjtItgyBKiIA1ysx/HYWtn+1j/W0h66NNGzfIdsR0eamWQCt8vW2Aac60a8ctg5s0nPqc8w928RqHsYrXxP/YQho4wk4vdWMubqgiG
 To3KUP09
Subject: [Buildroot] [v2,
 4/4] configs/stm32f4{2|6}9_*_defconfig: rename configurations
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Lee Jones <lee.jones@linaro.org>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The name of the configurations are now more explicit. As a result, the
readme files have also been changed.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 .../stm32f469-disco/{flash.sh => flash_sd.sh}                 | 0
 .../stm32f469-disco/{linux.fragment => linux-sd.fragment}     | 0
 board/stmicroelectronics/stm32f469-disco/readme.txt           | 4 ++--
 board/stmicroelectronics/stm32f469-disco/readme_xip.txt       | 2 +-
 ...tm32f429_disco_defconfig => stm32f429_disco_xip_defconfig} | 0
 ...stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig} | 2 +-
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename board/stmicroelectronics/stm32f469-disco/{flash.sh => flash_sd.sh} (100%)
 rename board/stmicroelectronics/stm32f469-disco/{linux.fragment => linux-sd.fragment} (100%)
 rename configs/{stm32f429_disco_defconfig => stm32f429_disco_xip_defconfig} (100%)
 rename configs/{stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig} (97%)

diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash_sd.sh
similarity index 100%
rename from board/stmicroelectronics/stm32f469-disco/flash.sh
rename to board/stmicroelectronics/stm32f469-disco/flash_sd.sh
diff --git a/board/stmicroelectronics/stm32f469-disco/linux.fragment b/board/stmicroelectronics/stm32f469-disco/linux-sd.fragment
similarity index 100%
rename from board/stmicroelectronics/stm32f469-disco/linux.fragment
rename to board/stmicroelectronics/stm32f469-disco/linux-sd.fragment
diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
index 4d178b40d6..99d26ccb66 100644
--- a/board/stmicroelectronics/stm32f469-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
@@ -7,13 +7,13 @@ configuration for the STM32F469 Discovery evaluation platform.
 Building
 --------
 
-  make stm32f469_disco_defconfig
+  make stm32f469_disco_sd_defconfig
   make
 
 Flashing
 --------
 
-  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
+  ./board/stmicroelectronics/stm32f469-disco/flash_sd.sh output/
 
 It will flash the U-boot bootloader.
 
diff --git a/board/stmicroelectronics/stm32f469-disco/readme_xip.txt b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
index 632d221ba1..7c20c2d015 100644
--- a/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
+++ b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
@@ -19,6 +19,6 @@ Building
 Flashing
 --------
 
-  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
+  ./board/stmicroelectronics/stm32f469-disco/flash_xip.sh output/
 
 It will flash binary to internal flash memory.
diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_xip_defconfig
similarity index 100%
rename from configs/stm32f429_disco_defconfig
rename to configs/stm32f429_disco_xip_defconfig
diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_sd_defconfig
similarity index 97%
rename from configs/stm32f469_disco_defconfig
rename to configs/stm32f469_disco_sd_defconfig
index 438d32150c..5ad4068e5e 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.12"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
