Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C191EFC618A
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 19:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77789605D2;
	Sat,  3 Jan 2026 19:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUzWbXeVatqV; Sat,  3 Jan 2026 19:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F68B605F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767466999;
	bh=H37P5dONv2YmXZqdmHz+dSJFW4bC5UU7hJ3EaisUFcY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U5tTl2eyS4/lrDMyuzvaaxkUI2/6XXsvNItNePgzahSoAwTUv43s+yNTWJCs+aMBH
	 irMH96DGHxuKs5q5EPwmSy/gosrXcTenSQw4CkjQ+yCqzpDAcFuR1bCZKPnBJ5+WDb
	 CyFyVWXMF6UnCGKZNBRwMVKCPconObbG8zoMPQAUj/ChYRupCVA8Oo9JqFr74e0BdV
	 gIZS1QhzAY+3n73TTABasCIt6cXKKz6bI7a1Er1WkzS6kOoKhA3VJ3DlIZ7IdYu6HN
	 fn3NYE+LB34cg78tjphy/os4PXHwt7nLm2nRE/EmUVX8HRg58Ut9gytpx+Cn2sJS2h
	 SCSpkLQnSV57w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F68B605F1;
	Sat,  3 Jan 2026 19:03:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70EAE351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62954605F1
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYIlb7lM3g96 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 19:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BC22605D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC22605D2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BC22605D2
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:03:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 26154A4C334D;
 Sat,  3 Jan 2026 20:03:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56276)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vc6tv-000000001bT-3FV6;
 Sat, 03 Jan 2026 19:02:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Fabio Urquiza <fabiorush@gmail.com>
Date: Sat,  3 Jan 2026 20:02:58 +0100
Message-ID: <20260103190259.1904724-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103190259.1904724-1-bernd@kuhls.net>
References: <20260103190259.1904724-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767466980;
 bh=fFlQPANYHVyAYnjqanSiteNl+erWV2U23Lu0g7yzLM0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dHfAPHT7FnfP5HinxmgcMIIDvU4kKYgKSk1me6RsgZdVFTtmd8qF0+aVHTyENTivI
 rgrbTvuUDkBpOZp+sXEqpjPQaEIOyy4Z1pGPlGVvqVWXwb6ntxkjVHiudWsQddh8cu
 xOu14L+S2B12zXOj9JYKWcOhXR/k1GxvfvP3NLtOPxCnzy8FmnlS5fiBmjNTx4MoFc
 TZ7uPcyYGvZ16Piao3zYyqZCuDJ9taO9KSYSpDpYsxpHeqZu7c7cMMveIXRnnOS1Cd
 r0xx+uM4DCToyhc3B64kS1wjpyODGMwJqXVSx6jWq4fbVBpGLrmM37suXRg1m7BsoX
 auq2YAKobRx0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dHfAPHT7
Subject: [Buildroot] [PATCH 2/2] package/bitcoin: bump to version 30.1
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

https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-30.1.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bitcoin/bitcoin.hash | 6 +++---
 package/bitcoin/bitcoin.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 4f4061ed77..a6ee0feada 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.1/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS.asc
-sha256  9b472a4d51dfed9aa9d0ded2cb8c7bcb9267f8439a23a98f36eb509c1a5e6974  bitcoin-30.0.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-30.1/SHA256SUMS.asc
+sha256  5d5518782c3000f64717ec1b4291e7e609a1f900d9729ee83c982243779c3f43  bitcoin-30.1.tar.gz
 
 # Hash for license file
 sha256  7c4a87f43afaf667b4c2187af92ebdd27310a24cec113f973e058e3300a76002  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index e23ef45050..4868330a50 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 30.0
+BITCOIN_VERSION = 30.1
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
