Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53869CA0EFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 06:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01883807D3;
	Sat, 30 Aug 2025 06:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 262ZGbWjgqmb; Sat, 30 Aug 2025 06:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAAD6807D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAAD6807D4;
	Sat, 30 Aug 2025 06:00:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A5E9FA
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 06:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 410FB60672
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 06:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUkuV_K5IAsL for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 06:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5544760671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5544760671
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5544760671
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 06:00:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 30B6C1A0C9B
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 06:00:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0A4C660620;
 Sat, 30 Aug 2025 06:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 082161C2295CF; 
 Sat, 30 Aug 2025 08:00:28 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Patrice Vilchez <Patrice.Vilchez@microchip.com>
Date: Sat, 30 Aug 2025 08:00:12 +0200
Message-ID: <20250830060013.2674789-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756533630; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=DWWwHb6CJp7sneAVP4D3Z2qt+AGeoNpSRXCFWxj+xdY=;
 b=FNXgvS+o0pqc80iQRcDGXqxepOA3MeyqkevxDVxi8zPcGOdQ/MYeYzJaTh22cCTijOfavw
 y1H690NIKpW4YzwDarLHkAL87+I5Nx7aeSoYNAhJE2K6Rbe0wjUFh+j9U+r2Nn/mYJUt05
 jD/CzVDt0ragTH2BkOfjHCUnuOgXls56uPRBHvLPjGjJqNrjZOc0ezb11JDoXMlHunEltN
 YvamXX/r0t0L5iR1yQ+opQ7Z5QzS1T4JZeK78lX6R0ikZofpa8JlzepBQ32TZyj05Uahnu
 2XcvOKMFvIneIHom6kCvOEK3L4M1PQ2mnNKIXQRVvUVPgTf7wa7X1f5p0p0Qag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FNXgvS+o
Subject: [Buildroot] [PATCH] configs/atmel_sama5d3xek: remove defconfig,
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

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167647

It is still based on the 4.9 kernel, which was LTS but is no longer
maintained.

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
 configs/atmel_sama5d3xek_defconfig | 26 --------------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 configs/atmel_sama5d3xek_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 974f6f3224..418ac68045 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -98,7 +98,6 @@ configs/atmel_sama5d3_xplained_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d3_xplained_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d3_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
-configs/atmel_sama5d3xek_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d4_xplained_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d4_xplained_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d4_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
deleted file mode 100644
index 2fcd7e002b..0000000000
--- a/configs/atmel_sama5d3xek_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_cortex_a5=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="sama5"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sama5d31ek sama5d33ek sama5d34ek sama5d35ek sama5d36ek"
-BR2_TARGET_ROOTFS_UBI=y
-BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
-BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3xeknf_uboot"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_5.8)/u-boot-at91-linux4sam_5.8.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3xek_nandflash"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
