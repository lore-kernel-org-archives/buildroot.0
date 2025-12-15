Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B71D5B873
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BEF380F6F;
	Mon, 15 Dec 2025 22:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zuea6EgyxBT2; Mon, 15 Dec 2025 22:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CCC280EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839024;
	bh=nk81U9dPsMs7gZDZobPpXyEpL9wYfM4RL3D0QL/h6rM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G5l3v9iWQAX5TzEjU7cB/ONHXCNpZhSZLwaxrtLSlT9PPxPsScYI5WJ41dQtcquC/
	 ORBYZUDx3/aejf9Z6Qg1Pg0h+yS+qSR8xjblq2h0H3BIdYfsodPhgyXDh/0xpRplDD
	 793Q7roEWDKeRc7pyH+6OtEF25KlDLboAh8EC92Si1613tJx6NP0j+7Uv0t2jFd5Gq
	 iIFpQaRpIJifi4+vAjJDMV/dLfnNUfJFamsufjf6Yezuv5kAx0qE4o4dKSgj+xIz+s
	 QXqhMQT+p1KPr+ldMpdtOJ9f6JCyaw98dsg+MZTcAckIvK8xtYvH70g7+qlNvcOVNO
	 V41ZgWjrgqgcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CCC280EA1;
	Mon, 15 Dec 2025 22:50:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A45219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C6DC408C5
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9b6MEKeTPT0x for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F1B54053F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F1B54053F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F1B54053F
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8FAB84E41C18;
 Mon, 15 Dec 2025 22:50:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66AE060664;
 Mon, 15 Dec 2025 22:50:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6AAAF1194298F; Mon, 15 Dec 2025 23:50:14 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 15 Dec 2025 23:49:43 +0100
Message-ID: <20251215224952.1253359-12-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839015; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=5kzt8VMlWoUKQAiHDIVUwY5t77MkeLEhk8Kdg77LMp4=;
 b=bPblHOZukHIqTx604VePZnCXtZjpkuQKlYlN5yet35wq368BFmUs1DD34PEZBW63zEgEgR
 encJN41by3sqwWY0vMk/aJA31eOQUWFhNCOTPd4dK5wWK13gu2c+fDPeAotwlOPLLL8/mw
 uvC6ZMn+vVFQjebxHYph6bPX1i5VWUL0h+IvJofMO59jnYlJd/LZIq61TTV5uZXl/woDt+
 VF0NeDF5A+Iu9rBld4m2g82HHaMUp/2xIavrXxPYASRtzoPLmAQ1a9I4UQtpK93YpEZ5MV
 Ln4uYw5SIUe5xr7V6Lvc7WF4y7bfzLeN1MWQyGSL8pGNpVjG8odsBvN3rdAqUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=bPblHOZu
Subject: [Buildroot] [PATCH 11/13] package/tvheadend: drop rpi-userland
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
from package/tvheadend.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tvheadend/tvheadend.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 7d83c31e5f..e108a6d23a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -14,6 +14,8 @@ TVHEADEND_DEPENDENCIES = \
 	host-pngquant \
 	host-python3 \
 	openssl
+TVHEADEND_CONF_OPTS = \
+	--disable-omx
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
@@ -41,12 +43,6 @@ TVHEADEND_DEPENDENCIES += opus
 else
 TVHEADEND_CONF_OPTS += --disable-libopus
 endif
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-TVHEADEND_CONF_OPTS += --enable-omx
-TVHEADEND_DEPENDENCIES += rpi-userland
-else
-TVHEADEND_CONF_OPTS += --disable-omx
-endif
 ifeq ($(BR2_PACKAGE_LIBVPX)$(BR2_INSTALL_LIBSTDCPP),yy)
 TVHEADEND_CONF_OPTS += --enable-libvpx
 TVHEADEND_DEPENDENCIES += libvpx
@@ -63,7 +59,6 @@ else
 TVHEADEND_CONF_OPTS += \
 	--disable-libav \
 	--disable-libopus \
-	--disable-omx \
 	--disable-vaapi \
 	--disable-libvpx \
 	--disable-libx264 \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
