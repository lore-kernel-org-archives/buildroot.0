Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECC4CA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 20:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D66D4072D;
	Mon, 18 Aug 2025 20:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dA4obX4Yx_RJ; Mon, 18 Aug 2025 20:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7876740729
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7876740729;
	Mon, 18 Aug 2025 20:42:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52BF9160
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38A6A80606
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyNvQ8-SupNw for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 20:42:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E6E180605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E6E180605
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E6E180605
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:42:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E8629C6B3B0;
 Mon, 18 Aug 2025 20:42:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4BFA9606A6;
 Mon, 18 Aug 2025 20:42:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 61CD31C22C3C6; 
 Mon, 18 Aug 2025 22:42:16 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Patrice Vilchez <Patrice.Vilchez@microchip.com>
Date: Mon, 18 Aug 2025 22:42:14 +0200
Message-ID: <20250818204215.3223340-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755549743; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=dOAO8T70vIE1VkxaaO6etq8m6pklUVFvX5Xab9CeEPk=;
 b=i60hTXDecv4SCT+jhRBeqPWel1ydytgUPT6OfsotICpyBFLHBYZoyFbvEX30jWbA65sy+I
 jw6pp1beph0BKO41qTV9y5kiEvFQ8jOuZf6JhMiwgDM6yPwcmV00tfFJd6YpDeS+3ZszGy
 auucVdvkZGu2baRHrW6gPBvphERy2NwXOs8YVGxjBZF7TAd5cOZnNqEvNHtQuAcPITb2Vu
 dO/ccH6NZbkfiTLsl//CID7vTQFI4dK5ioJFhdLwyHRVlzDLDCMfa7VngXMx9SVs9jLROw
 Vws0MPS2/xPQwTZMPV1ekq2yDHUwuyEf3Z+MvLFCIt3k9BXoGvV9YXjyEO91bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=i60hTXDe
Subject: [Buildroot] [PATCH] configs/at91sam9g20dfc: remove defconfig, broken
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

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272524

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
 .checkpackageignore              |  1 -
 configs/at91sam9g20dfc_defconfig | 21 ---------------------
 2 files changed, 22 deletions(-)
 delete mode 100644 configs/at91sam9g20dfc_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 7215c61fd1..9b9575524b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -104,7 +104,6 @@ configs/aspeed_ast2600evb_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9260eknf_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9g20dfc_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9g45m10ek_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9rlek_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
deleted file mode 100644
index 6a79c95682..0000000000
--- a/configs/at91sam9g20dfc_defconfig
+++ /dev/null
@@ -1,21 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g20ek"
-BR2_TARGET_ROOTFS_UBI=y
-BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9g20eknf_uboot"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9g20ek_nandflash"
-BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
