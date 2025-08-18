Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D073CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 20:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A716067E;
	Mon, 18 Aug 2025 20:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rixkXtdvamA; Mon, 18 Aug 2025 20:44:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C7360613
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C7360613;
	Mon, 18 Aug 2025 20:44:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67D12E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E51A6066B
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiQHUw3Sc8WT for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 20:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46BF7605C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46BF7605C1
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46BF7605C1
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:44:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7BB424E40C09
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:44:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 318A7606A6;
 Mon, 18 Aug 2025 20:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 952EA1C2282D5; 
 Mon, 18 Aug 2025 22:44:25 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Patrice Vilchez <Patrice.Vilchez@microchip.com>
Date: Mon, 18 Aug 2025 22:44:20 +0200
Message-ID: <20250818204421.3224446-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755549866; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=4zCkvywV78FavnAUYbAL35VxOZ7lnatRvYllTZv9lNM=;
 b=Ze/aIwA0BTw0NWtGKscaDxihrP3FABMJp5GlSUXEPhxWTafF9P9ZpE4cUwbQpM1bNn3JMV
 aqPTjTXWIp4J17SJex2HoOkIOwsDDTZUrt/Y24r5jeopvp4FUwX8DczLJgER89crxJ6BAg
 GqTFnaaqmAbkds3LExl1bvVeydGdmaSwyzPHd0QAdJsKW4pUa2pB2dpy2U4N8y3u7eyR83
 +GudldfBUmkhAzmxO1M+3UxT2x86+qUGqyZENfSHcUxhiLVLYr/5mN4WC5Qb++1a7XgxB9
 ct2MlqfbO3uulKfjjd6EQ1T2lFwoZoiYC7OUji2J9bTX76UzmArUv3UGB6EYxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Ze/aIwA0
Subject: [Buildroot] [PATCH] configs/at91sam9g45m10ek: remove defconfig,
 broken
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272530

It is still based on the 4.8.6 kernel, which is not even an LTS
kernel, so we cannot easily update to fix the issues which are most
likely due to the newer gcc/binutils versions we're using now.

There is no DEVELOPERS entry attached to this configuration as well,
and this defconfig has been broken for at least 2 months, probably
more (our Gitlab CI history is only kept for ~2 months). So let's drop
it, unles someone volunteers to resurrect it.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Patrice Vilchez <Patrice.Vilchez@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                |  1 -
 configs/at91sam9g45m10ek_defconfig | 21 ---------------------
 2 files changed, 22 deletions(-)
 delete mode 100644 configs/at91sam9g45m10ek_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 9b9575524b..5ed2f3e07a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -104,7 +104,6 @@ configs/aspeed_ast2600evb_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9260eknf_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9g45m10ek_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9rlek_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
diff --git a/configs/at91sam9g45m10ek_defconfig b/configs/at91sam9g45m10ek_defconfig
deleted file mode 100644
index 7072e5a689..0000000000
--- a/configs/at91sam9g45m10ek_defconfig
+++ /dev/null
@@ -1,21 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9m10g45ek"
-BR2_TARGET_ROOTFS_UBI=y
-BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9m10g45eknf_uboot"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9m10g45ek_nandflash"
-BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
