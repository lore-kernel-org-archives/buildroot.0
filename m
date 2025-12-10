Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D06D3B9A9
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 10:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B5C40D12;
	Wed, 10 Dec 2025 10:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMMqcixsmJx4; Wed, 10 Dec 2025 10:29:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC0DD40D26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765362592;
	bh=+yhKycRPxRc5SgAbuW6QIwmqwQOHre9QIDqasRnRQA4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NkwaG70aMkoYLCdHuS/unVDGJLAxyt8EpmeOcA3EHqk4+xmQ5L7lnnlF5f5C4OfFL
	 hFwp6Q4YE+3A0NMUNMRo7MGiIUVkjBrOrr+oxQIU9EF5MWs6WYfcGJCGAB6/hS+6fY
	 iIJK/7+bjIZth8LMYZT32Z45yP/yMkYDsfjlfXbZ8fwVFUIEvGtJslrr7NjC3OpHBp
	 Qsj9VDuRy950Vn3FiKn+CP7vBq45wMoxQTFJmdidVPlRc+OhCDYwp/+zJ2gtPNClyt
	 SheFo+qn4Y75B2WetDjZjBKF8kLmKAPVS8IAVRQkJpt2EFmlVwzKiX57bW906Qttv0
	 +B66iRISWtbTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC0DD40D26;
	Wed, 10 Dec 2025 10:29:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DBD34237
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 10:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2A5940DCC
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 10:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLTZP3SbDv7a for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 10:29:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9173D40315
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9173D40315
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9173D40315
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 10:29:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 49CB41A209C
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 10:29:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1ABDB60714
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 10:29:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4EAB1119314CA; Wed, 10 Dec 2025 11:29:43 +0100 (CET)
To: buildroot@buildroot.org
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com
Date: Wed, 10 Dec 2025 10:29:39 +0000
Message-ID: <20251210102940.2535550-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765362585; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=CMsVJ4HVxWlvUdbEwiGAKI+o7FRExXw97rns6XHvgDI=;
 b=ExXvkjLwbGZ0F92BGZDpEQAERyJPHuzH+OZeo9O4KMqLEoXquPMTog3OwNaSRuQVDrohtm
 sanRYN1kc6kgKPKi3agm8/yc4N2s4H3LzG84HjSu/h7NQ1MuQdgKs17dwDOqswbQKGSbUF
 TbE6xeREKFFvp5o2m1OdNxZAdvGLZKCsAC4Sc5aZUOwV6CbBcGMXb8SGmFFmSD/J3WUMuR
 bHKxhoDlBy72bc/Wa8JPlaIcbVEm8hbSDNGIeUYTHA7wWSfFXILlb9BNqc+EhWaC6WahIk
 E9E0vsPEaVQXORJwPzzblNcwMabgmFWavf7072Zh9L5NjNks0fGfNgYI+RBvBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ExXvkjLw
Subject: [Buildroot] [PATCH] package/util-linux: Fix host uuidd build
 configuration
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

The host build had conflicting configuration options where libuuid was
simultaneously enabled and disabled. Although comments explicitly stated
that libuuid should be enabled for the host, the --disable-uuidd flag
was preventing the uuid tools from being built and installed.

Remove the --disable-uuidd configure parameter to allow the uuid tools
to build properly on the host side.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/util-linux/util-linux.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ed30c0b107..bfcb91232d 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -258,7 +258,6 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--disable-tunelp \
 	--disable-ul \
 	--disable-unshare \
-	--disable-uuidd \
 	--disable-vipw \
 	--disable-wall \
 	--disable-wdctl \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
