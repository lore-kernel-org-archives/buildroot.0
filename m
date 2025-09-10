Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C70CAC583
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE96061505;
	Wed, 10 Sep 2025 21:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9D2Nb3LwyotD; Wed, 10 Sep 2025 21:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BC6E614CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC6E614CC;
	Wed, 10 Sep 2025 21:33:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F77E2BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55D7C40103
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oO75maeRUykM for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9565D4080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9565D4080B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9565D4080B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C370D4E40BDB
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9B632606D4;
 Wed, 10 Sep 2025 21:33:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 97201102F293A; 
 Wed, 10 Sep 2025 23:33:14 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Matt Flax <flatmax@flatmax.org>
Date: Wed, 10 Sep 2025 23:32:13 +0200
Message-ID: <20250910213241.1529448-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757539995; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=+QOPPx2LF4GolC0yZZ/cMHr76nnaKG2dte8zCkG8GzA=;
 b=JGehkMV62TI2D49rZne8XCC8TBwM4mMdPmTjfzpmb/qzY1kQVxND7onIEshVpK0jKIp9dj
 ihd6+21lsmNghLCmLAj+BwCorf6d6fGJyVysQhwu5YlX3hYzeH5nnrESx6MQGr/0Beycoi
 DZRBwO4jDjgtJZHygWKuN+c2oeOPqbyJL7aO7Y7fpe2r0OqbDmXJu2MYq94ReHgmWH80Eg
 doyOaXqN18inWeSfkdCOGC4Fif/CkssXnfuHpRAp5XEUI1Wk+sWDEC/UwsnpC4fMKuzeRz
 Qj5RtW5ihz0byL4xaEDYCo3+h45sWDwucY3KhJUCKn8mCF2sLUrzoptit/dYYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=JGehkMV6
Subject: [Buildroot] [PATCH 05/23] package/gtkiostream: drop optional
 dependency on libgtk2
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

As we're about to remove libgtk2, let's drop the optional dependency
of gtkiostream on libgtk2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gtkiostream/gtkiostream.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
index bc3d859d4e..c748c7a000 100644
--- a/package/gtkiostream/gtkiostream.mk
+++ b/package/gtkiostream/gtkiostream.mk
@@ -39,10 +39,6 @@ ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GTKIOSTREAM_DEPENDENCIES += libglib2
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-GTKIOSTREAM_DEPENDENCIES += libgtk2
-endif
-
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 GTKIOSTREAM_DEPENDENCIES += libgtk3
 endif
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
