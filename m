Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1BDE7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD4380C6B;
	Sun, 29 Dec 2024 14:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiMlml9d7qSZ; Sun, 29 Dec 2024 14:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3E7D80C86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3E7D80C86;
	Sun, 29 Dec 2024 14:56:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23BEDC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E761404CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUkeOp7t-PM1 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:55:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5964540550
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5964540550
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5964540550
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A4B4FE0006;
 Sun, 29 Dec 2024 14:55:50 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Dec 2024 15:55:33 +0100
Message-ID: <20241229145542.742168-11-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
References: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735484150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t6lNasJQ9g1xjl34shShpQeZdGGjDmK+qrYcJIo4vV0=;
 b=CwtR4qNgq9jJO6Q7ZJEuaEbRHmf17Lc4tYvFowbX81Qgs8wAHvTxUBKVZL5vG6YDYTEzgD
 jEVy9p7+PWbl7XZMhimmsxzT8tZRqH1YRQcKqqHYePVJBlJwblQpcK4jnKSZNXOJbvzRQS
 3hFr4/uvaIt2cN6w0TvL80bjQmlJ3QrNA6vfucp8MxcCVOd8o+bMD2ciJLgyXck3VZcjuy
 tfo3c4oLMkj1sRKPt6tE08Dv7wwhpDEh7w/Akk8Pkd3+eHe4m+TOzLunsuQFhc0ZECuSZx
 SIJyteFyv9K8t4U9U6prxpbp+ugHiCDAkEeYXVp7mw0f+JVgejXv17o7LHz1uA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CwtR4qNg
Subject: [Buildroot] [PATCH 10/12] package/vulkan-loader: drop directfb
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
support in vulkan-loader.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vulkan-loader/vulkan-loader.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
index b1545a4972..7aceb207b5 100644
--- a/package/vulkan-loader/vulkan-loader.mk
+++ b/package/vulkan-loader/vulkan-loader.mk
@@ -15,15 +15,9 @@ VULKAN_LOADER_DEPENDENCIES = host-pkgconf vulkan-headers
 VULKAN_LOADER_CONF_OPTS += \
 	-DASSEMBLER_WORKS=FALSE \
 	-DBUILD_WSI_SCREEN_QNX_SUPPORT=OFF \
+	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
 	-DLOADER_CODEGEN=OFF
 
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-VULKAN_LOADER_DEPENDENCIES += directfb
-VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=ON
-else
-VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 VULKAN_LOADER_DEPENDENCIES += libxcb
 VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
