Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3FECDE000
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 12:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADFE861009;
	Thu, 25 Jun 2026 12:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrN6rUs5CCHm; Thu, 25 Jun 2026 12:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9423F60FF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782390945;
	bh=wZ5LQ7iOkqZ/5ggpC8opLjF3DT3AUAnOd1KLUEPaOcA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XOtQVAG/czj7K+UBnW0Br2CHRBFXqS5cC6fVi4QQJnRBvJpCP3RJy+t45VJtk+OxN
	 ZS/d8a0E2Vb31jjj2mJr8/dtatPP/d3nnsGYndveY7SAh1V+cToDfxLrdNkXONKwIk
	 +eq6YE1xCQQBKF0oe/IyIjFkzUdw9+guCfMW1tuOsSKDUx7bbcNh3EOGQboqaExNOL
	 hcV1WJwnD/Q8bHXJO0pJ8JwFoK786WNvz8UkQE32jDY9kh3652N3ztVxxCEfQQy0xg
	 5GYLlc+B1Kya56nF8C45NDLs5tk52ruO/eviAanTS6/OGHBkReZ69Ur9jrzK0lsvsE
	 h4+5xOp1YWH+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9423F60FF4;
	Thu, 25 Jun 2026 12:35:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18883254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 12:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15CF8828EF
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 12:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51bj6HPujonW for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 12:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B8E5828E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B8E5828E3
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B8E5828E3
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 12:35:41 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id cjIwwFJ5IrbJKcjIxw2RVB; Thu, 25 Jun 2026 14:35:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu, 25 Jun 2026 14:35:36 +0200
Message-ID: <20260625123536.3814862-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfER4+ME/CQbS6COOnf0uHXtKW6tG2bKkkZ4+sEKuTHSfcGMlOaK1XvqY8cn5knNpGJyw7tHCNZFQMqM4doU/BzuGNO2A+BBILWl89+NEhZsfNKkH4ArD
 k8XIQ+wpErD2bRRkb+M6mMjCglqgFZPzVWCTaketDiefhTrsc5/8TEEJID44tMIVIo10eW+IpCvd8yNSnIrGFJ6J1gDI9Li8W67NLsKw1hxccEAlibH3oFgg
 5MiMKro5k4voi+36aG1S5oSNoz0b4fjUKmMfqkD7Wewl6ObKxOnBk4j45PuOtwio2HkDWhZiMjhyGQWKGN3grw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1782390939; bh=ktoZvxbk4YQfYUa83wNkOHqUD8CYVyeVNP07gzZ72OE=;
 h=From:To:Subject:Date:MIME-Version;
 b=T8k7FZaAgbtHn01mTx+7gkEnwihQhq3wVNJYmWNMXKvQhflYRTtnQXXECFg+4R9cH
 PaLLinwOsNdo8cfReUiriHiaxGeGSXoJVnlVx7Zetzk4L9Pd+2qre7OlzJFyeQQmp5
 Ne7IE1RmFzyr0CI4/DnAbQRFOT37z/jMu3ODi77fj9s1X3XTrr5gjV0ERzxaYghWCZ
 5kT7vLsYaqI2iqh5pZP91mkDdy2UfUiff7p7U8djf1DPFR211biy817hESpY0KfIcd
 lXMy7alPIHWlWMMOKA6TLta0xDpn1deqZG/mXlGfMN8O5P2iZPKENAcR85bKrWjC16
 iBvuGWXALzisA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=T8k7FZaA
Subject: [Buildroot] [PATCH] package/mongoose: security bump to version 7.22
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

Release notes:
https://github.com/cesanta/mongoose/releases/tag/7.22

Fixes CVE-2026-37635.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 556a438880..1a60b0c89c 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d4ddbd12c12f223abefcc0a74417a638ae5c118d7cf10ba546553c6b0e0b5ada  mongoose-7.21.tar.gz
+sha256  87727cd2c240ff559b16e9710d44b61ba3513dbee50428bd8ee1596d7c58460a  mongoose-7.22.tar.gz
 sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 8250751eb8..207d31cdfa 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.21
+MONGOOSE_VERSION = 7.22
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
