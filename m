Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F36D5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCA8B40B2E;
	Mon, 15 Dec 2025 22:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDHSEkrVu1qU; Mon, 15 Dec 2025 22:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 364FF40B26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839014;
	bh=yj6DTI2kZzRzoc+IjZm8boP9nHegbKBysLSlYZLCCQ4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZZaEEEiTfgkMNyd3DKdekNKrNQMaXueqH/x3KXay+vvPsY7MrbO2Gl2OWAHmTnP1c
	 1723pYTaevKptaYgC6XGzdSu3uY/aBZdUYTRAdZPwz5lSmnLRcOSNPGTzFhh8Qcjp6
	 wfifJ6AJWrca6UPoCCoRiLP95dgX2aRPTu3NHtY6NWjn4vlXzRDYOYRqkDuYLsdT+r
	 8hmjquTR8WIvM+8AwDN9RCpSQ9GIEicVEDiIp9vafgAJVOlBCNrnognkGl+eJyajLf
	 zq92M5vUgNeiZA+ZIpP7aZG9bketAqz7/W2seQ6PhdzEPDxr2woTH8t0l1asgpv+Ka
	 3uj18xcPFXFAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 364FF40B26;
	Mon, 15 Dec 2025 22:50:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55BC3219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 477E2408C5
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9rNN4P4EkS3 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82DFC4053F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82DFC4053F
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82DFC4053F
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5078BC19D28;
 Mon, 15 Dec 2025 22:49:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B0F2060664;
 Mon, 15 Dec 2025 22:50:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8D02011942980; Mon, 15 Dec 2025 23:50:06 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 15 Dec 2025 23:49:38 +0100
Message-ID: <20251215224952.1253359-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839007; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=dlVSWeCLdMmMHUilscFf5B2G8OImQDy61YdhVq3MjIY=;
 b=QCtkyC88xBpt44Dq2z8fUHYjG5gnQHxmHVt9djqPHAZQi7dX7yWvShO2sTptuaxnZ7L1sj
 Y5yKNWuKlVfNbEta1+NwS2m6Em5lDwN8f51zHlY/1sJUWCF6PkYCLo4joqHu6Jz1APSKHH
 GZF8BYgIpVjlIrdvB1Lbo38N1twNltKnuTydkfo2lVrgMt8mRi+snSWN7k/qrN/9+wwQs8
 LjrKZs2Bz+fpXfDU01KeDq3n9Kj99WX38JN3vIc15WIsyIQZxKpZ5PdDdAZV3ua94+s45M
 8itfAI4/s80RlExZB19vvlYswJzw1/dINPRRfUfNqX1eTplSbw5RAOtq3Ob8aA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=QCtkyC88
Subject: [Buildroot] [PATCH 06/13] package/libcamera-apps: drop rpi-userland
 support
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

As we're about to remove the rpi-userland package, drop support for it
from package/libcamera-apps.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera-apps/libcamera-apps.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 06efb9a960..df7be41496 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -19,7 +19,8 @@ LIBCAMERA_APPS_DEPENDENCIES = \
 
 LIBCAMERA_APPS_CONF_OPTS = \
 	-Denable_opencv=disabled \
-	-Denable_tflite=disabled
+	-Denable_tflite=disabled \
+	-Ddisable_rpi_features=true
 
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 LIBCAMERA_APPS_DEPENDENCIES += libdrm
@@ -35,12 +36,6 @@ else
 LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBCAMERA_APPS_CONF_OPTS += -Ddisable_rpi_features=false
-else
-LIBCAMERA_APPS_CONF_OPTS += -Ddisable_rpi_features=true
-endif
-
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBCAMERA_APPS_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
