Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9557FC2A062
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 650CA4061E;
	Sat,  3 Jan 2026 22:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbLjE5AQdoYt; Sat,  3 Jan 2026 22:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 901A540639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480238;
	bh=d103TQLgRNDTZWVO4xT1AJuNKX8AUcceLbHZ6vdvAC0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W8pWEhYrvAWMyokBVi4fN9Xzd8ekKDD+YxStFB8o2POmkP/Evv5MfssZIwozQ8rBU
	 X2/b80qB0MCZ3lUO8aveoJzxtIcARLXUqhiMnvnOXWUJxRxQLqZxMQKkSbNfjnfWrf
	 ylu05i4d7llCE+vwjhcv8ObNvJsoyBeupXuPpKP4RKgpVYtdTPm0x/7mZUL77vNgyv
	 CdH7fE/gM0DXgS7s8Cf1FWdYgHh8K5YA4PWn2vRnPy6mGYnh7pilJLivsd5gLwBHii
	 /CbAGNFxzURpy++aIQNQKtEKxrHl05/AB8cqoTVtrPelb9uPP2O1XUglz4OopEVReO
	 SXDAQG4Zhd8ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 901A540639;
	Sat,  3 Jan 2026 22:43:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D20725B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAF074064A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0icKhOAeuDs for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAA5840626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAA5840626
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAA5840626
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1887C1A260C
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E2D1E6072B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47345113B06D7; Sat,  3 Jan 2026 23:43:52 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Jan 2026 23:43:24 +0100
Message-ID: <20260103224330.2933161-11-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480232; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=5UfYGBaJR59j5wqafHaKGXEObZpEGJE8KMDIGZ3aBKY=;
 b=KnqDQFBjfTrUHOoH+0AKowRFRirAl0ysDcXgirIyqjJPTHD79dBVDmWWZNTKRe6G/IHwoK
 0Ta6/oQURweoWNlewjsHJYwzTIDDXRXkNbW/ECYfJ6v9BBf/3oo347It9huF++qzeGJFjj
 m50w45ZVTngY7ytWPhXmrOZfCKVLTBangNCajszGdQvF08GLncuUdAAKEzSMmh9AYHvxXx
 snuzPDn3qdoPdeAhfWIOJXpuoEYQJOxAirg3pJoub32sbVaM8EUWdHRxl6VPPOKsm5Zgxy
 movXscNMIskD1whXqaNJ5Q7AwsC5nd9OTts2/OZXmIh9/vF3DffQSSRWopKG5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KnqDQFBj
Subject: [Buildroot] [PATCH 11/11] package/shairport-sync: propagate
 dependencies
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

In commit
1abaf013dede73cb148a95d4ed708429776033f3 ("package/shairport-sync: add
support for AirPlay2"), a new option was added, selecting various
packages, without properly propagating their dependencies, causing
Config.in warnings such as:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBGCRYPT
  Depends on [n]: BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2 [=y] && BR2_PACKAGE_SHAIRPORT_SYNC [=y]

This commit fixes this mistake.

Fixes: 1abaf013dede73cb148a95d4ed708429776033f3 ("package/shairport-sync: add support for AirPlay2")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shairport-sync/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 89d9c9feb0..dad88e9982 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -28,6 +28,9 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION
 
 config BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2
 	bool "AirPlay2 support"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
+	depends on BR2_USE_MMU # nqptp
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # ffmpeg
 	select BR2_PACKAGE_NQPTP # runtime
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBSODIUM
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
