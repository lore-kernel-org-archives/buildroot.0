Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139D7E9A03B
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 10:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D7F78228F;
	Thu, 19 Feb 2026 10:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4B9KxSgsV1y; Thu, 19 Feb 2026 10:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35BB182277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771497429;
	bh=3rwHMzKvFUSRBWJ/f0U9+aYy/HE23wsENd4CT6vhm14=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wj/yet42Wl7g2YReipkIFyLQcIJ3OMsmIGDwXG3xhVIfgE9AE2lWw2PQ6WcKpeY5z
	 zSU+OI2wdW/B6y6zy+udQyMv1QKhP/nXqZ8a6VMByruhxWSF78sp/ArrwXl5CDTM1I
	 78mT0TMNmFFv76ocKn4kZxvoB/FyfaOJxZc+Sm/Vh/trJ9LCBXb7oOZrwA7cEjGbpp
	 9RY3aXvOc6ZlWIgYcGAi2toP4snwGk27syRPPbCEhEShDBIiDk1WLEahQU6w3BMsib
	 4dRvKQoUiFhXmhqoUclV5vmUj8+lqRD7kzCNV2u0kiWoH5XUvmuyGk8jN+zesdL9mo
	 N7V+mevyCOC3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35BB182277;
	Thu, 19 Feb 2026 10:37:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7B92183
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC4B160C06
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAxEAGo8lIn4 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 10:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1957660C0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1957660C0F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1957660C0F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:37:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0A9764E40544;
 Thu, 19 Feb 2026 10:37:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D58385FB45;
 Thu, 19 Feb 2026 10:37:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E41EA10368C93; Thu, 19 Feb 2026 11:37:00 +0100 (CET)
To: buildroot@buildroot.org
Cc: julien.peeters@eove.fr, Kory Maincent <kory.maincent@bootlin.com>,
 thomas.petazzoni@bootlin.com, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Thu, 19 Feb 2026 11:36:48 +0100
Message-ID: <20260219103651.753932-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219103651.753932-1-kory.maincent@bootlin.com>
References: <20260219103651.753932-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771497421; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=izc9PBKpc5pgsuBmHlE2AEdWJkj44OBx1sJkA1MCYDw=;
 b=GYXewWr85z73bKo6sMDne6SwPOFPvBXHKcTwOvuufyw0Bh98cG+sR42vhe9ndP3vcDWg2O
 JMVogM8Wm9Dn23TvR5iENaXx/QV9en40xmvP0ofpOIK6b4I/XHEPWSLPXNFS47I48GzGnE
 aIPkFT9VJsp5/+7cseQjooAMPX1zNz136xHKScyo63wSkA8PyEg0vwDOuvS+S63gJfDIr2
 9eVeavpURJiHWHCpF6j0QdBqZ/IbudD7RvwN9O4xfAdYNNnZG157bwF4oWCRxm4oi0uutM
 YqP0D27axAz5wajTnDFMpTcWGOQeASVGUAth/IsScNzecGnAAT4zuXMHvy64aQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GYXewWr8
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx/firmware-ele-imx:
 install with original filename
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

Instead of copying the AHAB container image and renaming it to
ahab-container.img, install it preserving its original filename and
create a ahab-container.img symlink pointing to it.

This is required for U-boot's binman tool, which locates the firmware
by its actual filename when assembling the boot image.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
index 8f25f4b5b5..8922afabfb 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -22,7 +22,8 @@ endef
 FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE))
 
 define FIRMWARE_ELE_IMX_INSTALL_IMAGES_CMDS
-	cp $(@D)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/ahab-container.img
+	cp -f $(@D)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/
+	ln -sf $(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/ahab-container.img
 endef
 
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
