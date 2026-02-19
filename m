Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBC9E9A04C
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 10:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C6F28227C;
	Thu, 19 Feb 2026 10:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PobzxLCIcTWj; Thu, 19 Feb 2026 10:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 813628227D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771497430;
	bh=+Wl92XLoNgP25bL3TrGe29S/6WmOFZeRvBlfA9iHvG4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gxe/yf9evgjq93IeqE5ZpJPIJSKGK+KKs62AceFqlcz5g8E5A7G3YuIYFTKmEOMVc
	 AdkM6iqqJLWVj7OMqHYk2PSowM8mAOsWC0IF4g9AIsWZvYpIN1HxqcI5jqxmL5+FPf
	 1pieNqseH1Weyk10uAts1uRUEMTv/k9Tf/AjA9NM0tq5aH3xqVV8x7/j/lMhDUD0C1
	 2rsenZXtDFrZg78V6EJFXQaWbzzQDevAmmIRC+fBvsjm3JvC6RQrsSZELPEU1Rh7wI
	 mjAQFJAVRM6T06X8OfZ7b58fey1RjOcQwXLHfo3y53j40NCjv6U20qCdjm9p0e4+CP
	 iIswjk0JYiW4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 813628227D;
	Thu, 19 Feb 2026 10:37:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA4A9183
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D430A60C08
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrgIz0pTK13v for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 10:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 157D560C0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 157D560C0E
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 157D560C0E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:37:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A8366C2F4EF;
 Thu, 19 Feb 2026 10:37:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 467715FB45;
 Thu, 19 Feb 2026 10:37:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D588102F1CD9; Thu, 19 Feb 2026 11:37:02 +0100 (CET)
To: buildroot@buildroot.org
Cc: julien.peeters@eove.fr, Kory Maincent <kory.maincent@bootlin.com>,
 thomas.petazzoni@bootlin.com, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Thu, 19 Feb 2026 11:36:49 +0100
Message-ID: <20260219103651.753932-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219103651.753932-1-kory.maincent@bootlin.com>
References: <20260219103651.753932-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771497422; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=UdJszpiwcR+LmQL4fd+9T5Jeh29m+6iJSyaxiR/izxw=;
 b=tkzdIx28dG0l7nRTUoMfAVAhSPmEcfvBVMZONKlI/+6dg9rMY5ECfj8o8EENlenAwAnL19
 mzdpFPv36y/IEZ22Xlz7ge2KkTxiyhNFo/qB60RoBHi5Y1VEBqhIyXMvr+VH6CkqNIa1pw
 bMyO+Q9T26YISUs78J9YmycT0OwAqERdZTB3GJGKlYQMuMfzSFrAgITTtZJ/W9LTk30i9q
 xyUYtHZjLjrq2Z0WaBVm3Fq0QpL0El44+Gp7TbD5vaebO/vnS/xWUtbXboxk/MnRB1VUKK
 UejDZXEIRq8gc2HOW5vi6v8CdJcSXM9k3JXq5LNS3IWlGbjMif1VqovZqFogFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=tkzdIx28
Subject: [Buildroot] [PATCH 2/2] boot/uboot: copy ELE firmware into build
 directory for binman
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U-boot can assemble a complete i.MX boot image using binman, but
requires the AHAB container image to be present in the build directory
under its original filename. When BR2_PACKAGE_FIRMWARE_ELE_IMX is
selected, add firmware-ele-imx as a U-boot dependency and include the
*-ahab-container.img file in the set of firmware files copied into
U-boot's build directory before compilation.

This enables binman to produce the full boot image directly, making
the imx8/9-bootloader-prepare.sh scripts unnecessary.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/uboot/Config.in | 3 ++-
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 47ce24ee76..24c1ea89cd 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -323,7 +323,8 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
 	depends on BR2_PACKAGE_FIRMWARE_IMX
 	depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
 		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9 || \
-		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
+		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW || \
+		BR2_PACKAGE_FIRMWARE_ELE_IMX
 	help
 	  Some i.MX8 platforms (such as i.MX8 M, i.MX 8M Mini, i.MX 8M
 	  Nano) encapsulate NXP specific firmware (DDR, HDMI) inside
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6ddbb9e438..9061e49570 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -230,6 +230,11 @@ UBOOT_IMX_FW_FILES = \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin) \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR3),ddr3*.bin)
 
+ifeq ($(BR2_PACKAGE_FIRMWARE_ELE_IMX),y)
+UBOOT_DEPENDENCIES += firmware-ele-imx
+UBOOT_IMX_FW_FILES += *-ahab-container.img
+endif
+
 define UBOOT_COPY_IMX_FW_FILES
 	$(foreach fw,$(UBOOT_IMX_FW_FILES),\
 		cp $(BINARIES_DIR)/$(fw) $(@D)/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
