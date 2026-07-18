Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAFBC4450A
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 06:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19D6C81178;
	Sat, 18 Jul 2026 06:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkh9vcGc-fmS; Sat, 18 Jul 2026 06:52:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E643281169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784357544;
	bh=3PWVKlIBpIuiN3JsGhivG8eulp3AAAb+1OhZGMsURoY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GxyvolU1Oqe5Vnb2Jrd93t6z8y58i+0kJXTGX+nLjkwJv6AW5gjUsGrq7ok6hZx7D
	 qWlBuiQOTgwUoE+pixFudNbLmSCxwOkVAZqveMwnCPWh/BaAagIUW3tsImwgeey92N
	 oHefMhmkXkd9Gm4sTLUcsyR5+h48DMYZ54dvhyjlXljCu0HX3sfW8E3BFmuBaFrSbB
	 +AjqlRmVmKvDjkFcYz1MVEgbumNDyf8negmt8probLVJCOVsD6VxTiKoazkf+mcias
	 Uyogqlv4QQvpMZD5d4qg3o7DzImFuWRcnNiy2emd6ddZdCM1J1N5Uctr7pLBs/pqlW
	 pHTV6qT9wlvkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E643281169;
	Sat, 18 Jul 2026 06:52:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC7A41F6
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 06:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA2D460741
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 06:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdSSyTdufdZ6 for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 06:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E679560616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E679560616
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E679560616
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 06:52:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b33e.dip0.t-ipconnect.de [84.161.179.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F9E2A4C3E0F;
 Sat, 18 Jul 2026 08:52:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wkyuG-000000006Pt-0xlU;
 Sat, 18 Jul 2026 06:52:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Fabio Urquiza <fabiorush@gmail.com>
Date: Sat, 18 Jul 2026 08:52:15 +0200
Message-ID: <20260718065215.928877-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718065215.928877-1-bernd@kuhls.net>
References: <20260718065215.928877-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784357536;
 bh=Zg5cCnYoaArLEQEpZUGtmdeu8eFQE4faPmfADKjIgF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ITHXr9NxX/ecx4ow/qWJdNaNOen6uFn16nwSKKRIwBWuMtm3nN4smaFUviilb1f69
 hLgmV5RJFYOmH5pjsberTMkznD1S/jGOpRipm7uLeUd/T7+dnYnJiRwYoB+T+p+ONP
 dSGD6WN/ZOA3DSnNKcNqt/be2mx39c8tzpaUjw+GnjQKnD1K8vZ35g8bSNZpg66D6e
 lLz17+El8nEgqVQW+mYjBZ0GxjU7qYVtkyZMAgnpMxI29Qv3M/394REQxipowAz9uj
 QSqpRe4gOI/OskuTO9LdNG4MI0N3Cftm5hkBA9kzChhC8GT0/aVDUmrJduN68hrQGj
 qr36RHUTBLsCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ITHXr9Nx
Subject: [Buildroot] [PATCH 3/3] package/bitcoin: bump version to 31.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bitcoincore.org/en/releases/31.1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/93bdd02a074cb4b81babc3e02b3ae58978257aa5

 package/bitcoin/bitcoin.hash | 6 +++---
 package/bitcoin/bitcoin.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index b1576d5e8a..3adfc7a5d0 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-31.0/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-31.1/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-31.0/SHA256SUMS.asc
-sha256  0ba0ef5eea3aefd96cc1774be274c3d594812cfac0988809d706738bb067b3e3  bitcoin-31.0.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-31.1/SHA256SUMS.asc
+sha256  50411d5b43c7e4c90099394759eb6c2add6e7c2dbe728840893d638b6fc6afc9  bitcoin-31.1.tar.gz
 
 # Hash for license file
 sha256  b028769f3852a9368ab10bd754ff01ebb741f84a2fa658c9aff82a631bc6ecfc  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index d7019f2aa9..857768eba8 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 31.0
+BITCOIN_VERSION = 31.1
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
