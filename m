Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F68E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8D7B405C3;
	Sun, 29 Dec 2024 14:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfedQtyiP4Tm; Sun, 29 Dec 2024 14:56:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B03E40586
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B03E40586;
	Sun, 29 Dec 2024 14:56:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6193872
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30ED940579
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8agnNZoHcf2E for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:55:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA0874055F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA0874055F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA0874055F
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4988FE0002;
 Sun, 29 Dec 2024 14:55:51 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Dec 2024 15:55:34 +0100
Message-ID: <20241229145542.742168-12-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
References: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735484151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClLnTCBXT6Nbc5hLqpRDpPisQiVIS8Ljo/cauvq7+v0=;
 b=Wx8kgorZRwQNhSyPa0zePJL5bp0lEwvwtjycw8F/3vcQ77gLggtldVO+bWbJf/gCeDxbKS
 t4VoMJl+DUIhJO0DCI9l8m2ksTpKGFX0XVwZGl8Z0A2x3PDFkhCd+iANoQsGegY7FEMTcl
 ErTGgFrYBbbTGbZ8eE95QZDIrnaeloa2iT5d8826J1UESKcAc4y59RuTElOSI5W53CPQfC
 s05lE9HNIz2oITNH4ibS0LqosapVZHdBJrSSO9ugNaV8G/UcgcCjjXN+n0XJ2s1Dqeilw7
 wEnpEFWAw59l/gQlmK9F/xrKb4pwX8ac6WbnOb2KxcFQuieB5fU8AsEGs1TfcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wx8kgorZ
Subject: [Buildroot] [PATCH 11/12] package/vulkan-tools: drop directfb
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

As we're about to remove the DirectFB package, let's drop DirectFB
support in vulkan-tools.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vulkan-tools/vulkan-tools.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/vulkan-tools/vulkan-tools.mk b/package/vulkan-tools/vulkan-tools.mk
index 68f7c1c04d..9f5bf46b79 100644
--- a/package/vulkan-tools/vulkan-tools.mk
+++ b/package/vulkan-tools/vulkan-tools.mk
@@ -17,14 +17,8 @@ VULKAN_TOOLS_CONF_OPTS += \
 	-DBUILD_CUBE=OFF \
 	-DBUILD_ICD=OFF \
 	-DBUILD_VULKANINFO=ON \
-	-DINSTALL_ICD=OFF
-
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-VULKAN_TOOLS_DEPENDENCIES += directfb
-VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=ON
-else
-VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=OFF
-endif
+	-DINSTALL_ICD=OFF \
+	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 VULKAN_TOOLS_DEPENDENCIES += libxcb
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
