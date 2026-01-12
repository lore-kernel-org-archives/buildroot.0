Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77C6CF45CF
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 21:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AE4661117;
	Mon, 12 Jan 2026 21:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWOk7tuMsMqy; Mon, 12 Jan 2026 21:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00CE86110E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768252174;
	bh=XygwJM+rvZTIveAkaI1jx61rmeg0ptbGT/E5/aSHLZo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mmr8CnyPMNmfcy3rco8RJ4cuOGEqRvgTPR8htiRlG2471PfUsMtFINnHajy2EfUpC
	 qDIWlYa44kTcGbBOtK723DAv9ZmiBqazM4QdY00I0PXd8G+1Iaz/YyUacSQx5OpTXf
	 FDUqCGUbytyfzH3rhu48mrnXXNqdr+/dH3ZBVzYgXJEYaurK0P/dV8xf3UPUXFnuN0
	 3BCSdTGty5/bjzDrs5WEPMYpStn97Klz2OjwwENiOWn59cAAPsWFNI96whpcq4GoKW
	 nuCCENjTmdpsi2An1xHgieyIXWoX7eHEYa6PvI4wNzrT4n2dvew1sRbhpPDJHcPARs
	 vPtTIqzD2kuZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00CE86110E;
	Mon, 12 Jan 2026 21:09:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D02D2231
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B59026110E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Or2DwEsOemB for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 21:09:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C8BE6110D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C8BE6110D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C8BE6110D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:09:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf07.dip0.t-ipconnect.de [84.161.191.7])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B3296A4C36C2;
 Mon, 12 Jan 2026 22:09:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38808)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfPAH-0000000024Q-1UbI;
 Mon, 12 Jan 2026 21:09:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Fabio Urquiza <fabiorush@gmail.com>
Date: Mon, 12 Jan 2026 22:09:29 +0100
Message-ID: <20260112210929.3767530-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768252169;
 bh=K66yVXMZgRDyW8ls9KV5FWImYk/i2X0E5+xBHvn0Tas=;
 h=From:To:Cc:Subject:Date:From;
 b=mqShQigZg/0F8CI1AgUQXvPaO6cz5T0ebAIvzwvuZpfR12lUQVLbLoUB6muRFgbZG
 J5lRx55NzSwSyiRwCVxj9fpO7sxaCYI5Y+2UAyED8t+CjtIPWaZasBbPR3mpIGE9Sy
 +yXeguJEFPkLx9K1xqKKuy28vk3741h507onm1rLHP8xuU3tRRgavYQICAeoRy6RQQ
 nInDNQM1X5t1qVw+9nXQEk6skn/Tsjrt3jkv1N0/7qzikodGJOlegs4lINCk8e6yER
 ieO7S/XrkAxoArqVFj2pLZ9A0NTEv4RHY29M1L0uUNV1cI6jaFiLV8c7ZQ2FJY3STg
 hTZFNY+O4LceA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mqShQigZ
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: bump to version 30.2
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

https://bitcoincore.org/en/releases/30.2/

Updated license hash due to copyright year bump:
https://github.com/bitcoin/bitcoin/commit/ed0774bd08b83813f162be33672b7d6c7fff9933

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bitcoin/bitcoin.hash | 8 ++++----
 package/bitcoin/bitcoin.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 4f4061ed77..89fe6ce280 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.2/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS.asc
-sha256  9b472a4d51dfed9aa9d0ded2cb8c7bcb9267f8439a23a98f36eb509c1a5e6974  bitcoin-30.0.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-30.2/SHA256SUMS.asc
+sha256  6fd00b8c42883d5c963901ad4109a35be1e5ec5c2dc763018c166c21a06c84cb  bitcoin-30.2.tar.gz
 
 # Hash for license file
-sha256  7c4a87f43afaf667b4c2187af92ebdd27310a24cec113f973e058e3300a76002  COPYING
+sha256  b028769f3852a9368ab10bd754ff01ebb741f84a2fa658c9aff82a631bc6ecfc  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index e23ef45050..89dacaf9c7 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 30.0
+BITCOIN_VERSION = 30.2
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
