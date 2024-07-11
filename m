Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B201EC3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 22:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CC348419B;
	Thu, 11 Jul 2024 22:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7DApYunlY0J; Thu, 11 Jul 2024 22:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F45C84152
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F45C84152;
	Thu, 11 Jul 2024 22:20:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAEAD1BF860
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C27B341513
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOOROa1AaGWm for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 22:20:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7116E41512
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7116E41512
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7116E41512
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 22:20:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 6E08EC0006;
 Thu, 11 Jul 2024 22:20:28 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Fri, 12 Jul 2024 00:20:18 +0200
Message-ID: <20240711222021.1553363-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711222021.1553363-1-thomas.petazzoni@bootlin.com>
References: <20240711222021.1553363-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720736428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZThRW/WtGFU7XZKy1livE86X2rx3MCziMcHF5YBslI=;
 b=Brp5X9xxgZ+cy6ESWFXrLPzoGqM//oX1YNcCpMZo+oFNQBFY7NxfkqHwNeqSIAPFWi3pHd
 TS2iYgmvojDbUzFIXVVXO48M/LZ7x/sgUL1BoZbEaS/pNwENvP+wmTkuRC53ZX9y47gWNG
 0S/Y7M57MbV1vUx4f4QsLqcjZ8irrXc76JO0COQqdJPSdlpqOyBCFbKa1XKZ8FKfB8RVsG
 veAHmPlfeHv6iUUKeWpHQt/mw9g7TN9DpIWkkDV/CwEDa62Fol/jEXAh7OxoTPYAhE8NeR
 doyRR7MDfDRyIrV064lMWCFFavwIksVOtYZgczJly/06QkQDqBqF/qOJS9LN/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Brp5X9xx
Subject: [Buildroot] [PATCH 4/4] package/gdb: remove stale hashes from GDB
 10.x and 11.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 809fdb3a7a3e4da8e7734a0d7cec48a4b3b99ec5 ("package/gdb:
remove gdb 10.x") and
030497be18cfb4dfae6494ada0c202f6c7c0f5c0 ("package/gdb: remove support
for GDB 11.x"), we forgot to drop the no longer needed hashes from
gdb.hash. Let's do this now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/gdb.hash | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 98170c96e8..6cf55a675d 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,6 +1,4 @@
 # From https://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb74888ef11ac1942064a08910e96b7865112ad37f4602eb0a16bed074caa  gdb-10.2.tar.xz
-sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
 sha512  8185d3e11ab60dafff5860a5016577bfe7dd7547ef01ebc867bc247603d82b74ff74c4f29492c7d2aee57076f52be33e289f4c6b414a4b870d4b3004909f4c34  gdb-13.2.tar.xz
 sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
 sha512  0217434073023a8b8316088bf3ee95d53a1b6a7897f6269095429016a8900f9a05e130c390d8d5d5550cc515c16519de1071d8eef96aa58e38056c7e37da1d8b  gdb-15.1.tar.xz
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
