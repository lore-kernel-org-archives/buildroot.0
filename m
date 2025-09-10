Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E13DCA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44CFA61476;
	Wed, 10 Sep 2025 21:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yj3i0wgKC6oh; Wed, 10 Sep 2025 21:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DC246162C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DC246162C;
	Wed, 10 Sep 2025 21:33:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CDF6234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EF474194B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpG4rMwLutIk for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E5E841938
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E5E841938
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E5E841938
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 528634E40B8D
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2A270606D4;
 Wed, 10 Sep 2025 21:33:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 39229102F29F5; 
 Wed, 10 Sep 2025 23:33:38 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexander Dahl <post@lespocky.de>
Date: Wed, 10 Sep 2025 23:32:27 +0200
Message-ID: <20250910213241.1529448-20-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540020; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=H2vvgvoyd/U52oFHnZ+QV+Dv0n5g9mrJsN/94Khm530=;
 b=Atejx+PXI/JVJe19YwFFbBWn1XQn8I5RK5eakfl7STC7jk932MA27qfxSgw2byGoSNT743
 exZhhO81TEGANfD92LRF2CF8kjfzuZ/FU9Zdb0xv11Yvf7lCzmNo1gMsJohnZR5Xbo57bG
 10uwFeWzW8p3GvTteElHtNVJGXpYOxTEpdBlonDUTnwS0vFOSGoKllACrcXRPeFgCVDX6G
 c4jmCNFCBSpCdUYNu6sc9dn1o17ve014eAnFTyChfGJk7pW2DqaRPSb+EIdGvKBQNZGvq+
 A24andi+3LMD6q1zH56aE/NO6GmxfBOY7cBqZSiumaZ/+TBDaSI60SOySi5aqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Atejx+PX
Subject: [Buildroot] [PATCH 19/23] package/putty: drop optional dependency
 on libgtk2
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

As we're about to remove libgtk2, we need to drop the optional
dependency of putty on libgtk2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/putty/putty.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 617518e647..ec65991f41 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -14,8 +14,6 @@ PUTTY_CONF_OPTS = -DPUTTY_GSSAPI=OFF
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 PUTTY_DEPENDENCIES += libgtk3
-else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-PUTTY_DEPENDENCIES += libgtk2
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
