Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26444D5B875
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED7F460F2B;
	Mon, 15 Dec 2025 22:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUFMcL-3A62a; Mon, 15 Dec 2025 22:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FF5E60F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839015;
	bh=ipyeQJ8SY5/glZLQLGbZTNChsOS1jNG3EGkBJNaW5rg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JXNMqIiE3Q2nax0bIF+w3V+fBPtbl8mKENsyF6qnY1bywzoY5wMbA1xEWXejgfTgo
	 Ubhgk54HDH+q2XueUQHYI0+YHAEl1TxJ+SyJbBxO87+QXFlC1E/84EELnlX7C5zeNu
	 A9I498VXHHvcQAWEbbzbpk03eOk7v1ab/kDkwM8uGfPUyJ7Dzx2PzcWtPUegM61RNM
	 iRTICNyI71e3wqNZFSCqr+kcFDPCVCoUpGZlzQj/wc4ZaiN5LxTHOjtYbLXUT54yh1
	 WVa3XnZ3y99v/N8hLDZTO7tTQjs8LRYrKyTOzUy1Z33DH179mlshx5kYWVyFkwudoN
	 f+zngggScga5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF5E60F36;
	Mon, 15 Dec 2025 22:50:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D215B219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3BE6408C5
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaSgL9m2nXoS for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C09EF4053F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C09EF4053F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C09EF4053F
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 19E374E41C18;
 Mon, 15 Dec 2025 22:50:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E590760664;
 Mon, 15 Dec 2025 22:50:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DF3E811942981; Mon, 15 Dec 2025 23:50:07 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 15 Dec 2025 23:49:39 +0100
Message-ID: <20251215224952.1253359-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839008; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=fPZjls8o75xM5AMSRgas7YdTZLxXWZlsDE0V9xftW34=;
 b=xbBots1TLzsOIh64tXfbWtoaGosG/B5c/oj2U5jG4ZkNs8DRzqDCBphSteNC+tER6NQ1lU
 ITJWIzNvRhqyRdrXy/McQkj7+/r04FiTvpAjuR4UPghXOzhGaOd3aTnhH4aqSFUTrV7iG/
 o2vm7p1noZc38fVNYsdzsq6IYOn42xcsa/6uGmzFuB4dNzoYiE2x42g0X5thdKT20VnNwI
 IrlkJ75QbujvANYGQvh8GNt1BqHZWU8eR0Jas/8bHU53YF/g5bG/N/g/tMBSPpJ3/SGusi
 0onUNLMFM+9DqmQsctKWiAQmIGpuE0WExzKeB1dkcBNsSRpTL8t5pr2ZcO/bLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xbBots1T
Subject: [Buildroot] [PATCH 07/13] package/libcec: drop rpi-userland support
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
from package/libcec.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcec/libcec.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 312e8b5acc..1c2bc075bd 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -24,15 +24,6 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBCEC_DEPENDENCIES += host-swig python3
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBCEC_DEPENDENCIES += rpi-userland
-LIBCEC_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -lvcos -lvchiq_arm" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) \
-		-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
-		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads"
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
 LIBCEC_DEPENDENCIES += xlib_libXrandr
 endif
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
