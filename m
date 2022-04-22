Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D59C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 22:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DF5F61417;
	Fri, 22 Apr 2022 22:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rci3XKlmB9nE; Fri, 22 Apr 2022 22:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6380F61414;
	Fri, 22 Apr 2022 22:37:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74D2F1BF2BE
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60A5340195
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=embeddedts.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QlNe_1GHhHWk for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 22:36:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.189])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A841F40AFC
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 22:36:58 +0000 (UTC)
Received: from 1ni1tX-00054O-W5 by out3c.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1ni1tZ-00056E-UA; Fri, 22 Apr 2022 15:36:57 -0700
Received: by emcmailer; Fri, 22 Apr 2022 15:36:57 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3c.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1ni1tX-00054O-W5; Fri, 22 Apr 2022 15:36:56 -0700
Received: from tsdebian.ts-local.net (unknown [75.164.70.254])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 2B34C4083C;
 Fri, 22 Apr 2022 15:36:55 -0700 (MST)
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 15:36:10 -0700
Message-Id: <20220422223611.10443-4-kris@embeddedTS.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220422223611.10443-1-kris@embeddedTS.com>
References: <20220422223611.10443-1-kris@embeddedTS.com>
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedTS.com; s=mailanyone20220121;
 h=References:In-Reply-To:Message-Id:Date:To:From;
 bh=KxC0hVZP2HchHnCh4VRLCVRpxsTw+PZLFlskbH36oKQ=;
 b=Z7xg9M4Gk1XCKhlA8HlssBKa0PlYXSUueYNzIWUaWMKgxJal1aWUA4MMLHkTY5pv1Rwz23iXrGTDsAIPD7++PcBu4MepOvHck/Wj8NFrWK1ggb/UjLgsrvhupQcIz5dwWWNuzurVKF6FEXMkHsjIeWL94dpk5t1bYvigq2Xf3Fw5fOLVg9TljWgj6nWh0JVoNeYel/aYzBTaiCoyjqwiNIQmnAqmKkYCHOkNa1DdL43jSkb6qf6b9WDNdXti3hqcidpJSmdnctURr310cXRORTdc+PfCfSEvKgD9caU1yIHjgONqMzlEJtpVoNUChSQkPhcbCXmGUGF8/Webev9cOw==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: [Buildroot] [PATCH v2 3/4] configs: add WILC3000_FIRMWARE to
 compatible devices
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Featherston <mark@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The update to wilc-firmware added firmware files for WILC3000
devices as a separate config option. All Atmel/Microchip defconfigs
that previously only had WILC1000_FIRMWARE either have WILC3000
Wi-Fi hardware (WILC3000 is the same silicon but with BLE added)
or have the capacity to have either WILC1000 or WILC3000 devices
added to the system. Install all firmware blobs to these devices
by default.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 configs/at91sam9x5ek_dev_defconfig                     | 1 +
 configs/at91sam9x5ek_mmc_dev_defconfig                 | 1 +
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 1 +
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 1 +
 configs/atmel_sama5d3_xplained_dev_defconfig           | 1 +
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 1 +
 configs/atmel_sama5d4_xplained_dev_defconfig           | 1 +
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 1 +
 configs/microchip_sam9x60ek_mmc_dev_defconfig          | 1 +
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 1 +
 configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 1 +
 configs/microchip_sama7g5ek_mmc_dev_defconfig          | 1 +
 12 files changed, 12 insertions(+)

diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index bfa8e95941..8714463d89 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -47,6 +47,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 2e1a5c7f59..9481594716 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -50,6 +50,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index ba2fa46790..38618a5732 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -39,6 +39,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_RNG_TOOLS=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index a8b68ca0a2..1654408aa5 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -53,6 +53,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index cdfd9de17e..64455cb2e0 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -49,6 +49,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index a2205aeefa..8f5724d631 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -52,6 +52,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index f8783f5652..fab91cf0b3 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -50,6 +50,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index b4e99f658a..f9074e9862 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -53,6 +53,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
index 06e03967c4..2b4e234297 100644
--- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -36,6 +36,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
index 3bcd5f0200..f9aa6cdc05 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
@@ -39,6 +39,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index 27d1d3409d..b1b22c1312 100644
--- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -32,6 +32,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_SETSERIAL=y
 BR2_PACKAGE_SPI_TOOLS=y
diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index 6eb6c282e0..d68846e553 100644
--- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -30,6 +30,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_RNG_TOOLS=y
 # BR2_PACKAGE_RNG_TOOLS_JITTERENTROPY_LIBRARY is not set
-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
