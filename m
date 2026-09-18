Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3666C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B07FB40ABD;
	Fri, 18 Sep 2026 18:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjBCp9NkwtYa; Fri, 18 Sep 2026 18:53:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 159EC40B0C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757598;
	b=hFO7EpNaX+k8NjeysIRBNM85+2zBlZKi+ih0YLvL7wCfsJEgws2kbu3r8xr7U5d5RqVZ
	 tzI14F3VKBtr4RS7El2wgFKNh8T4y36B3naY5JKssfCVluBle4CrCElsw0dXuC+9k4xEG
	 Ge6f/x9fVKcsUiCRlkyXvc2Q5+jleKDKMcOd4iFugzFy0Q5O9A0RE6ZVSpM3aPa6dX+BX
	 romVXRq6NXfSINsaN+mwSsDSPxg8ijU2jZkUnkmWI0b6c+RKMGUeoLLj2yF1aNDLASrzo
	 9N7OQIK2vYlzP7fjDJx0UmB4vIj5ZeK6oUUo/bVrd4RFvFjmHBQihNv326rLT1DD9Ng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757598;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iq0pPZTHfKzwh0ivJjMvxyPudSl28xNRwYXAnwKZvtY=;
	b=Xi8FSfCIHCqWaH5r6YdhsC91OfPl+5285u3q3LcoZ+k3B+tV6aNDmxnSGaJzM5R/+yso
	 ATAIwmtI+n1uFJGloDZMBju959jDA1T7L+RYjOolnpyg0zTaB9owQy7X8/T2PmMKvIKvW
	 ef8+7XmW88mMHRcYWdbh0CyFFyXfOItdFfnFg8dTfFb5h6UjacIQm4jPJ0UtPFzAyGXP5
	 yTJvR8+ZKCCU0Y+pbinnGuc0W8P8So6t8x9Os5WWD93Y46FzCV96pS+3ASGKJUl9//akH
	 oTeDV5MVxonP4SlxF/M195w9nek35wyJdeh/d9/CQjG18reLkBb+ZQ92o9s3u2ZNx4w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757598;
	bh=iq0pPZTHfKzwh0ivJjMvxyPudSl28xNRwYXAnwKZvtY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IKf9RtDEwSqO9fD60BUBq33DxwuiSdgZGhXrruQfgbYCRBmSXjTZ2fuWGsRokkUUs
	 BiIsIpYqyFx7tRzJSDW3jD9SUGZLon8YMK51/9qCEXA26z34nmm2wMmihUYz3zkfF8
	 /IQtvfN1kdlKmMcdtTqwkMO8ubk1hCBQdv6Li+9g4xV5SBOmFweW99veMmW/Zrjo74
	 KKZP3ErGS0IL8hAzNOQfE9VFl266gYmJhNSek8H4EfzRYU6n0AWCdrkw3jCMNMmspN
	 Y6j3ZiwUJ83hEEq3BxgSYKStfNTN1wshMx7q0G7TZsGhjygm63S5PlDPusOTJxDzJn
	 eo1hKpM12Iwhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159EC40B0C;
	Fri, 18 Sep 2026 18:53:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DEE7213D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0821812F2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkOk1-wVO1P1 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:53:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 15E0F8124F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757595;
 b=TXDlmR98q4IUkcXX1k3nTRwiMk8CoFXoCy3mErcIW5ughdK7QLAbr0OfmxFvR0GR6Uo5
 uGUtXo1A7zH1g2uUAES1jnIdONo3Q6HhGe7K7ndQfQnWaVMu/0kKWc2O5Bp1ZQg5FzDSp
 th8yWVq3oTvQBxIXJ3jvzAYkmIGI50JuNxV9KofcFYmhf7A53IagksvdeNSrvoMgmBh5b
 kgPzuNPNCIsW+fMB5O3LzEDGImjcGaFW1ONFmZDxiF/fhRBBtYvgI2o3h8zEoC5HKxdMd
 mbPspdwUYDd/8eG8NRTiGvgtepcbkvBXBLxkrC51UUQKnbr+nPtchZfJur8wpS5s+9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757595;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=8DOq9pF6vY5RyE33QUqGMA5kBWlQcZDhIuguh1EICpk=;
 b=XTBiLw5thSRutQtwOmozkT4xpLRTGPjKHp+YipvZwanPu3hCYet2uPH4/lLz6s3DLyBr
 oe8kgbUadRXHPwes1GoEonIKR8+nSU4ouAMgJn9SRGWmaPSletIH+lmr5eDlP2cAafrKr
 VyTXPluai/T5D8qSFTKI7mYuBntKxi+6HXdt2bZFXmDt5afCOwHobTcHfOD8fu8AP7fSS
 eeHLaVRor1fbQ3QikNVATSiihImkkFB6e31zqbPQzqGrcMjlCthXtQ1YgFI3kWsM0oUgQ
 SBJRMQiAF8zPHM0CJAX8Yqv9sWHU09Q2CUea1zDg0lCcTGom+nCte2E9DWYLcyFSdRw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dqiErNZN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dqiErNZN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15E0F8124F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756942;
 bh=8DOq9pF6vY5RyE33QUqGMA5kBWlQcZDhIuguh1EICpk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dqiErNZNdRDSv2QoX0P+OyHn4D6UWHbsAJpmm0QqSyRRbe1LQFtd4psDPvNurWROb
 3zf9G7jY8Eq11BE0NKC47TTsh38CF1Tk3LJjYktGY5WslZVUwBB3VMFmEBefVdtnxn
 1Hxt3/256W9AsM4CNPdJ3lmdvgM2rsO001Ptzp9bRuGU0AbqH+vDRQRrg7rkIl5HJr
 uXzAVFpNLWuIAQ1ZagvCKAZm2eSPPnaedrf9vYvtkfVO+OYKELhFieoMntJiRz+Fgu
 Shi6t5PjggoVyWmsKXOO3pkREN8luMz3djazp7FFIvS0F748Kysnz1mac3QPkoRSHT
 vKuagrFNdpcaA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:XEa7Kcc7WwdrMAL04tIzh+jJ8NfXLpYAbXNZQOFGYggvcdMSqF2dkZJMVbEMfwwjWEr8+baAhfjZ6m2jc0eyIKtw443iosX9XLAt1UHwxkLbLCTZTKBCeptzEq3sAn57tpBIjytMJDuDAkLgVD1QYdN5sQz0SgcDxhWDq7RVWGnWp7Kl88r3dVYWU1eyIR6ecPEbSUP3FxcL1n2eNLTQyOiPhRb3PhIRdrj4RzCuVN+BZTrwfCOr3aSZAW2lpWMjutbhTE4h8wWhP8WzONaDWBWIRNsEkvIeXIiGVpTf7ZaIiBPRYT259IxEXTGsaaA8DMXtpGUYEIpxGQjpNbPn4Bms0UJSQuafjoin+jomwqeAZ0R83qY9UCciiuDXXcyvvy33l8z/pLPd4TW5mLLTtwkraqu2wKHeHmBjKIvErRKQzhfnQ6QQiIzjuo2/6wvHrkETuGl5Mz2MBELUQMzLletf1FfVpfn0lWd6F6nviLlr56GNB3WIIJtAyqhemAM3K4XVgTH5M8l2TGXtac7OE7n85YeQWdaBKD4uhsyWjCA2uRn6Sdqc5JAEyQ+CFXRo4wDbceV1GxEz/5ohvYOxcUGEFdctiakA/QnV0lsufPYU2N
 MYPl3B1ybcqqXple0myb4vou5xWGVgsjfAMviO1wEVPivAEHagPk7vPBTdvePS/h0J7q+UQVKO
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3720DA4C473E;
 Fri, 18 Sep 2026 20:42:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWw-000000007cB-2q4C;
 Fri, 18 Sep 2026 18:41:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:08 +0200
Message-ID: <20260918184140.3631274-47-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 46/77] package/libest: Fix build with OpenSSL
 4.0.0
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...r-opaque-ASN1_STRING-OpenSSL-4-compa.patch |  60 +++
 ...stead-of-the-ENGINE-API-on-OpenSSL-4.patch |  64 ++++
 ...-Port-ossl_srv.c-copies-to-OpenSSL-4.patch | 358 ++++++++++++++++++
 package/libest/Config.in                      |   1 -
 4 files changed, 482 insertions(+), 1 deletion(-)
 create mode 100644 package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch
 create mode 100644 package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch
 create mode 100644 package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch

diff --git a/package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch b/package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch
new file mode 100644
index 0000000000..13511f0d27
--- /dev/null
+++ b/package/libest/0005-Use-accessors-for-opaque-ASN1_STRING-OpenSSL-4-compa.patch
@@ -0,0 +1,60 @@
+From 59695d938e0d23dda2eda124164bc8909ab2ddf5 Mon Sep 17 00:00:00 2001
+From: Karl Smeltzer <karl.smeltzer@canonical.com>
+Date: Fri, 24 Jul 2026 12:54:56 -0700
+Subject: [PATCH] Use accessors for opaque ASN1_STRING (OpenSSL 4
+ compatibility)
+
+OpenSSL 4.0 makes ASN1_STRING (and its typedefs ASN1_OCTET_STRING /
+ASN1_BIT_STRING) opaque. This uses the ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors instead, while keeping the direct access
+under HAVE_OLD_OPENSSL.
+
+Upstream: https://github.com/cisco/libest/pull/136
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/est/est_client.c | 8 ++++++--
+ src/est/est_server.c | 4 ++++
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/est/est_client.c b/src/est/est_client.c
+index 8dff9d9..06ca510 100644
+--- a/src/est/est_client.c
++++ b/src/est/est_client.c
+@@ -5313,11 +5313,15 @@ EST_ERROR verify_voucher (EST_CTX *ctx)
+         return (EST_ERR_CLIENT_BRSKI_VOUCHER_VERIFY_FAILED);
+     }
+ 
++#ifdef HAVE_OLD_OPENSSL
+     ctx->brski_retrieved_voucher = pkcs7->d.sign->contents->d.data->data;
+-    ctx->brski_retrieved_voucher_len = pkcs7->d.sign->contents->d.data->length;
++#else
++    ctx->brski_retrieved_voucher = (unsigned char *)ASN1_STRING_get0_data(pkcs7->d.sign->contents->d.data);
++#endif
++    ctx->brski_retrieved_voucher_len = ASN1_STRING_length(pkcs7->d.sign->contents->d.data);
+ 
+     EST_LOG_INFO("Voucher verify passed.  Voucher =\n %s",
+-                 pkcs7->d.sign->contents->d.data->data);
++                 ctx->brski_retrieved_voucher);
+     
+     return (EST_ERR_NONE);
+ }
+diff --git a/src/est/est_server.c b/src/est/est_server.c
+index d047b48..4b4d617 100644
+--- a/src/est/est_server.c
++++ b/src/est/est_server.c
+@@ -1133,7 +1133,11 @@ int est_tls_uid_auth (EST_CTX *ctx, SSL *ssl, X509_REQ *req)
+          */
+         tls_uid = est_get_tls_uid(ssl, &uid_len, 0);
+         if (tls_uid) {
++#ifdef HAVE_OLD_OPENSSL
+ 	    i = memcmp_s(tls_uid, uid_len, bs->data, uid_len, &diff);
++#else
++	    i = memcmp_s(tls_uid, uid_len, ASN1_STRING_get0_data(bs), uid_len, &diff);
++#endif
+             if (i == EOK && !diff) {
+                 EST_LOG_INFO("PoP is valid");
+                 rv = EST_ERR_NONE;
+-- 
+2.47.3
+
diff --git a/package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch b/package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch
new file mode 100644
index 0000000000..3ef41c4db6
--- /dev/null
+++ b/package/libest/0006-Use-providers-instead-of-the-ENGINE-API-on-OpenSSL-4.patch
@@ -0,0 +1,64 @@
+From fdf43891c4cffd5f9a7776a6195a636988c7aed1 Mon Sep 17 00:00:00 2001
+From: Karl Smeltzer <karl.smeltzer@canonical.com>
+Date: Fri, 24 Jul 2026 12:55:06 -0700
+Subject: [PATCH] Use providers instead of the ENGINE API on OpenSSL 4 (est.h)
+
+OpenSSL 4.0 removes the ENGINE API, so the est_apps_startup() /
+est_apps_shutdown() macros in est.h no longer link: they call
+ENGINE_load_builtin_engines() / ENGINE_cleanup() and friends.
+
+Add OpenSSL >= 4.0 variants of both macros that load the default
+provider instead, keeping the existing variants for older versions,
+matching the HAVE_OLD_OPENSSL pattern already used in this header.
+
+Upstream: https://github.com/cisco/libest/pull/136
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/est/est.h | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/est/est.h b/src/est/est.h
+index ffbe85f..716dd7e 100644
+--- a/src/est/est.h
++++ b/src/est/est.h
+@@ -25,6 +25,9 @@
+ #include <openssl/engine.h>
+ #include <openssl/conf.h>
+ #include <openssl/srp.h>
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++#include <openssl/provider.h>
++#endif
+ 
+ #ifdef  __cplusplus
+ extern "C" {
+@@ -829,6 +832,13 @@ LIBEST_API EST_ERROR est_disable_performance_timers(EST_CTX *ctx);
+          ENGINE_load_builtin_engines(); \
+          SSL_library_init(); \
+          SSL_load_error_strings(); } while (0)
++#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
++#define est_apps_startup()               \
++    do { ERR_load_crypto_strings();      \
++         OpenSSL_add_all_algorithms();   \
++         OSSL_PROVIDER_load(NULL, "default"); \
++         SSL_library_init();             \
++         SSL_load_error_strings(); } while (0)
+ #else
+ #define est_apps_startup()               \
+     do { ERR_load_crypto_strings();      \
+@@ -854,6 +864,12 @@ LIBEST_API EST_ERROR est_disable_performance_timers(EST_CTX *ctx);
+          CRYPTO_cleanup_all_ex_data(); \
+          ERR_remove_thread_state(NULL); \
+          ERR_free_strings(); } while (0)
++#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
++#define est_apps_shutdown() \
++    do { CONF_modules_unload(1); \
++         OBJ_cleanup(); EVP_cleanup(); \
++         CRYPTO_cleanup_all_ex_data(); \
++         ERR_free_strings(); } while (0)
+ #else
+ #define est_apps_shutdown() \
+     do { CONF_modules_unload(1); \
+-- 
+2.47.3
+
diff --git a/package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch b/package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch
new file mode 100644
index 0000000000..0a62049fbc
--- /dev/null
+++ b/package/libest/0007-Port-ossl_srv.c-copies-to-OpenSSL-4.patch
@@ -0,0 +1,358 @@
+From b2bcfd65b825a2adf8f9f3e8801211fae2332e17 Mon Sep 17 00:00:00 2001
+From: Karl Smeltzer <karl.smeltzer@canonical.com>
+Date: Fri, 24 Jul 2026 12:55:19 -0700
+Subject: [PATCH] Port ossl_srv.c copies to OpenSSL 4
+
+Both ossl_srv.c copies (example/server, test/util) fail to build
+against OpenSSL 4.0 due to relying on removed functionality.
+
+Fixes:
+- Add a shim mapping ASN1_STRING_get0_data() to ASN1_STRING_data() on
+  OpenSSL < 1.1.0, then use the ASN1_STRING_type/length/get0_data
+  accessors unconditionally. These files do not include config.h, so
+  HAVE_OLD_OPENSSL is never defined here; keying on
+  OPENSSL_VERSION_NUMBER is what actually keeps 1.0.x building.
+- Retag DN entries in the msie_hack path with
+  X509_NAME_ENTRY_set_data() instead of writing str->type, which has
+  no setter once the type is opaque.
+- Replace BN_pseudo_rand() with BN_rand(), available on all versions.
+- Ifdef out the FORMAT_ENGINE branch on OpenSSL >= 4.0.
+
+Upstream: https://github.com/cisco/libest/pull/136
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ example/server/ossl_srv.c | 69 +++++++++++++++++++++++----------------
+ test/util/ossl_srv.c      | 67 ++++++++++++++++++++++---------------
+ 2 files changed, 82 insertions(+), 54 deletions(-)
+
+diff --git a/example/server/ossl_srv.c b/example/server/ossl_srv.c
+index b87c2d1..3610e93 100644
+--- a/example/server/ossl_srv.c
++++ b/example/server/ossl_srv.c
+@@ -90,6 +90,10 @@
+ #include <openssl/bio.h>
+ #include "apps.h"  //taken from openssl/apps/apps.h
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#define ASN1_STRING_get0_data ASN1_STRING_data
++#endif
++
+ extern BIO *bio_err;
+ BIO *cacerts = NULL;
+ static int msie_hack = 0;
+@@ -317,6 +321,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
+         BIO_printf(err, "no keyfile specified\n");
+         goto end;
+     }
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+     if (format == FORMAT_ENGINE) {
+         if (!e)
+             BIO_printf(err, "no engine specified\n");
+@@ -330,6 +335,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
+         }
+         goto end;
+     }
++#endif
+     key = BIO_new(BIO_s_file());
+     if (key == NULL) {
+         ERR_print_errors(err);
+@@ -883,7 +889,7 @@ int rand_serial(BIGNUM *b, ASN1_INTEGER *ai) {
+     if (!btmp)
+         return 0;
+ 
+-    if (!BN_pseudo_rand(btmp, SERIAL_RAND_BITS, 0, 0))
++    if (!BN_rand(btmp, SERIAL_RAND_BITS, 0, 0))
+         goto error;
+     if (ai && !BN_to_ASN1_INTEGER(btmp, ai))
+         goto error;
+@@ -1304,14 +1310,14 @@ static int do_updatedb(CA_DB *db) {
+ 
+     /* get actual time and make a string */
+     a_tm = X509_gmtime_adj(a_tm, 0);
+-    a_tm_s = (char *) OPENSSL_malloc(a_tm->length+1);
++    a_tm_s = (char *) OPENSSL_malloc(ASN1_STRING_length(a_tm)+1);
+     if (a_tm_s == NULL) {
+         cnt = -1;
+         goto err;
+     }
+ 
+-    memcpy(a_tm_s, a_tm->data, a_tm->length);
+-    a_tm_s[a_tm->length] = '\0';
++    memcpy(a_tm_s, ASN1_STRING_get0_data(a_tm), ASN1_STRING_length(a_tm));
++    a_tm_s[ASN1_STRING_length(a_tm)] = '\0';
+ 
+     if (strncmp(a_tm_s, "49", 2) <= 0)
+         a_y2k = 1;
+@@ -1367,19 +1373,19 @@ int old_entry_print(BIO *bp, ASN1_OBJECT *obj, ASN1_STRING *str) {
+     *(pbuf++) = '\0';
+     BIO_puts(bp, buf);
+ 
+-    if (str->type == V_ASN1_PRINTABLESTRING)
++    if (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)
+         BIO_printf(bp, "PRINTABLE:'");
+-    else if (str->type == V_ASN1_T61STRING)
++    else if (ASN1_STRING_type(str) == V_ASN1_T61STRING)
+         BIO_printf(bp, "T61STRING:'");
+-    else if (str->type == V_ASN1_IA5STRING)
++    else if (ASN1_STRING_type(str) == V_ASN1_IA5STRING)
+         BIO_printf(bp, "IA5STRING:'");
+-    else if (str->type == V_ASN1_UNIVERSALSTRING)
++    else if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
+         BIO_printf(bp, "UNIVERSALSTRING:'");
+     else
+-        BIO_printf(bp, "ASN.1 %2d:'", str->type);
++        BIO_printf(bp, "ASN.1 %2d:'", ASN1_STRING_type(str));
+ 
+-    p = (char *) str->data;
+-    for (j = str->length; j > 0; j--) {
++    p = (char *) ASN1_STRING_get0_data(str);
++    for (j = ASN1_STRING_length(str); j > 0; j--) {
+         if ((*p >= ' ') && (*p <= '~'))
+             BIO_printf(bp, "%c", *p);
+         else if (*p & 0x80)
+@@ -1505,16 +1511,22 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
+             nid = OBJ_obj2nid(X509_NAME_ENTRY_get_object(ne));
+ #endif
+             
+-            if (str->type == V_ASN1_UNIVERSALSTRING)
++            if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
+                 ASN1_UNIVERSALSTRING_to_string(str);
+ 
+-            if ((str->type == V_ASN1_IA5STRING)
+-                    && (nid != NID_pkcs9_emailAddress))
+-                str->type = V_ASN1_T61STRING;
++            if ((ASN1_STRING_type(str) == V_ASN1_IA5STRING)
++                    && (nid != NID_pkcs9_emailAddress)) {
++                X509_NAME_ENTRY_set_data(ne, V_ASN1_T61STRING,
++                        ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
++                str = X509_NAME_ENTRY_get_data(ne);
++            }
+ 
+             if ((nid == NID_pkcs9_emailAddress)
+-                    && (str->type == V_ASN1_PRINTABLESTRING))
+-                str->type = V_ASN1_IA5STRING;
++                    && (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)) {
++                X509_NAME_ENTRY_set_data(ne, V_ASN1_IA5STRING,
++                        ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
++                str = X509_NAME_ENTRY_get_data(ne);
++            }
+         }
+ 
+         /* If no EMAIL is wanted in the subject */
+@@ -1523,17 +1535,18 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
+ 
+         /* check some things */
+         if ((OBJ_obj2nid(obj) == NID_pkcs9_emailAddress)
+-                && (str->type != V_ASN1_IA5STRING)) {
++                && (ASN1_STRING_type(str) != V_ASN1_IA5STRING)) {
+             BIO_printf(bio_err,
+                     "\nemailAddress type needs to be of type IA5STRING\n");
+             goto err;
+         }
+-        if ((str->type != V_ASN1_BMPSTRING)
+-                && (str->type != V_ASN1_UTF8STRING)) {
+-            j = ASN1_PRINTABLE_type(str->data, str->length);
+-            if (((j == V_ASN1_T61STRING) && (str->type != V_ASN1_T61STRING))
++        if ((ASN1_STRING_type(str) != V_ASN1_BMPSTRING)
++                && (ASN1_STRING_type(str) != V_ASN1_UTF8STRING)) {
++            j = ASN1_PRINTABLE_type(ASN1_STRING_get0_data(str),
++                    ASN1_STRING_length(str));
++            if (((j == V_ASN1_T61STRING) && (ASN1_STRING_type(str) != V_ASN1_T61STRING))
+                     || ((j == V_ASN1_IA5STRING)
+-                            && (str->type == V_ASN1_PRINTABLESTRING))) {
++                            && (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING))) {
+                 BIO_printf(bio_err,
+                         "\nThe string contains characters that are illegal for the ASN.1 type\n");
+                 goto err;
+@@ -1631,8 +1644,8 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
+                     BIO_printf(bio_err,
+                             "The %s field needed to be the same in the\nCA certificate (%s) and the request (%s)\n",
+                             cv->name,
+-                            ((str2 == NULL) ? "NULL" : (char *) str2->data),
+-                            ((str == NULL) ? "NULL" : (char *) str->data));
++                            ((str2 == NULL) ? "NULL" : (char *) ASN1_STRING_get0_data(str2)),
++                            ((str == NULL) ? "NULL" : (char *) ASN1_STRING_get0_data(str)));
+                     goto err;
+                 }
+             } else {
+@@ -1935,9 +1948,9 @@ STACK_OF(OPENSSL_STRING) *sigopts, STACK_OF(CONF_VALUE) *policy, CA_DB *db,
+     row[DB_type] = (char *) OPENSSL_malloc(2);
+ 
+     tm = X509_get_notAfter(ret);
+-    row[DB_exp_date] = (char *) OPENSSL_malloc(tm->length+1);
+-    memcpy(row[DB_exp_date], tm->data, tm->length);
+-    row[DB_exp_date][tm->length] = '\0';
++    row[DB_exp_date] = (char *) OPENSSL_malloc(ASN1_STRING_length(tm)+1);
++    memcpy(row[DB_exp_date], ASN1_STRING_get0_data(tm), ASN1_STRING_length(tm));
++    row[DB_exp_date][ASN1_STRING_length(tm)] = '\0';
+ 
+     row[DB_rev_date] = NULL;
+ 
+diff --git a/test/util/ossl_srv.c b/test/util/ossl_srv.c
+index 3efefa4..6ea539a 100644
+--- a/test/util/ossl_srv.c
++++ b/test/util/ossl_srv.c
+@@ -91,6 +91,10 @@
+ #include <openssl/bio.h>
+ #include "apps.h"  //taken from openssl/apps/apps.h
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#define ASN1_STRING_get0_data ASN1_STRING_data
++#endif
++
+ extern BIO *bio_err;
+ BIO *cacerts = NULL;
+ static int msie_hack=0;
+@@ -345,6 +349,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
+ 		BIO_printf(err,"no keyfile specified\n");
+ 		goto end;
+ 		}
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+ 	if (format == FORMAT_ENGINE)
+ 		{
+ 		if (!e)
+@@ -361,6 +366,7 @@ EVP_PKEY *load_key(BIO *err, const char *file, int format, int maybe_stdin,
+ 			}
+ 		goto end;
+ 		}
++#endif
+ 	key=BIO_new(BIO_s_file());
+ 	if (key == NULL)
+ 		{
+@@ -971,7 +977,7 @@ int rand_serial(BIGNUM *b, ASN1_INTEGER *ai)
+ 	if (!btmp)
+ 		return 0;
+ 
+-	if (!BN_pseudo_rand(btmp, SERIAL_RAND_BITS, 0, 0))
++	if (!BN_rand(btmp, SERIAL_RAND_BITS, 0, 0))
+ 		goto error;
+ 	if (ai && !BN_to_ASN1_INTEGER(btmp, ai))
+ 		goto error;
+@@ -1434,15 +1440,15 @@ static int do_updatedb (CA_DB *db)
+ 
+ 	/* get actual time and make a string */
+ 	a_tm = X509_gmtime_adj(a_tm, 0);
+-	a_tm_s = (char *) OPENSSL_malloc(a_tm->length+1);
++	a_tm_s = (char *) OPENSSL_malloc(ASN1_STRING_length(a_tm)+1);
+ 	if (a_tm_s == NULL)
+ 		{
+ 		cnt = -1;
+ 		goto err;
+ 		}
+ 
+-	memcpy(a_tm_s, a_tm->data, a_tm->length);
+-	a_tm_s[a_tm->length] = '\0';
++	memcpy(a_tm_s, ASN1_STRING_get0_data(a_tm), ASN1_STRING_length(a_tm));
++	a_tm_s[ASN1_STRING_length(a_tm)] = '\0';
+ 
+ 	if (strncmp(a_tm_s, "49", 2) <= 0)
+ 		a_y2k = 1;
+@@ -1508,19 +1514,19 @@ int old_entry_print(BIO *bp, ASN1_OBJECT *obj, ASN1_STRING *str)
+ 	*(pbuf++)='\0';
+ 	BIO_puts(bp,buf);
+ 
+-	if (str->type == V_ASN1_PRINTABLESTRING)
++	if (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)
+ 		BIO_printf(bp,"PRINTABLE:'");
+-	else if (str->type == V_ASN1_T61STRING)
++	else if (ASN1_STRING_type(str) == V_ASN1_T61STRING)
+ 		BIO_printf(bp,"T61STRING:'");
+-	else if (str->type == V_ASN1_IA5STRING)
++	else if (ASN1_STRING_type(str) == V_ASN1_IA5STRING)
+ 		BIO_printf(bp,"IA5STRING:'");
+-	else if (str->type == V_ASN1_UNIVERSALSTRING)
++	else if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
+ 		BIO_printf(bp,"UNIVERSALSTRING:'");
+ 	else
+-		BIO_printf(bp,"ASN.1 %2d:'",str->type);
+-			
+-	p=(char *)str->data;
+-	for (j=str->length; j>0; j--)
++		BIO_printf(bp,"ASN.1 %2d:'",ASN1_STRING_type(str));
++
++	p=(char *)ASN1_STRING_get0_data(str);
++	for (j=ASN1_STRING_length(str); j>0; j--)
+ 		{
+ 		if ((*p >= ' ') && (*p <= '~'))
+ 			BIO_printf(bp,"%c",*p);
+@@ -1658,16 +1664,24 @@ static int do_body(X509 **xret, EVP_PKEY *pkey, X509 *x509, const EVP_MD *dgst,
+ #else            
+                             nid = OBJ_obj2nid(X509_NAME_ENTRY_get_object(ne));
+ #endif
+-			if (str->type == V_ASN1_UNIVERSALSTRING)
++			if (ASN1_STRING_type(str) == V_ASN1_UNIVERSALSTRING)
+ 				ASN1_UNIVERSALSTRING_to_string(str);
+ 
+-			if ((str->type == V_ASN1_IA5STRING) &&
++			if ((ASN1_STRING_type(str) == V_ASN1_IA5STRING) &&
+ 				(nid != NID_pkcs9_emailAddress))
+-				str->type=V_ASN1_T61STRING;
++				{
++				X509_NAME_ENTRY_set_data(ne, V_ASN1_T61STRING,
++					ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
++				str=X509_NAME_ENTRY_get_data(ne);
++				}
+ 
+ 			if ((nid == NID_pkcs9_emailAddress) &&
+-				(str->type == V_ASN1_PRINTABLESTRING))
+-				str->type=V_ASN1_IA5STRING;
++				(ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING))
++				{
++				X509_NAME_ENTRY_set_data(ne, V_ASN1_IA5STRING,
++					ASN1_STRING_get0_data(str), ASN1_STRING_length(str));
++				str=X509_NAME_ENTRY_get_data(ne);
++				}
+ 			}
+ 
+ 		/* If no EMAIL is wanted in the subject */
+@@ -1676,18 +1690,18 @@ static int do_body(X509 **xret, EVP_PKEY *pkey, X509 *x509, const EVP_MD *dgst,
+ 
+ 		/* check some things */
+ 		if ((OBJ_obj2nid(obj) == NID_pkcs9_emailAddress) &&
+-			(str->type != V_ASN1_IA5STRING))
++			(ASN1_STRING_type(str) != V_ASN1_IA5STRING))
+ 			{
+ 			BIO_printf(bio_err,"\nemailAddress type needs to be of type IA5STRING\n");
+ 			goto err;
+ 			}
+-		if ((str->type != V_ASN1_BMPSTRING) && (str->type != V_ASN1_UTF8STRING))
++		if ((ASN1_STRING_type(str) != V_ASN1_BMPSTRING) && (ASN1_STRING_type(str) != V_ASN1_UTF8STRING))
+ 			{
+-			j=ASN1_PRINTABLE_type(str->data,str->length);
++			j=ASN1_PRINTABLE_type(ASN1_STRING_get0_data(str),ASN1_STRING_length(str));
+ 			if (	((j == V_ASN1_T61STRING) &&
+-				 (str->type != V_ASN1_T61STRING)) ||
++				 (ASN1_STRING_type(str) != V_ASN1_T61STRING)) ||
+ 				((j == V_ASN1_IA5STRING) &&
+-				 (str->type == V_ASN1_PRINTABLESTRING)))
++				 (ASN1_STRING_type(str) == V_ASN1_PRINTABLESTRING)))
+ 				{
+ 				BIO_printf(bio_err,"\nThe string contains characters that are illegal for the ASN.1 type\n");
+ 				goto err;
+@@ -1791,7 +1805,8 @@ again2:
+ 					}
+ 				if (j < 0)
+ 					{
+-					BIO_printf(bio_err,"The %s field needed to be the same in the\nCA certificate (%s) and the request (%s)\n",cv->name,((str2 == NULL)?"NULL":(char *)str2->data),((str == NULL)?"NULL":(char *)str->data));
++					BIO_printf(bio_err,"The %s field needed to be the same in the\nCA certificate (%s) and the request (%s)\n",cv->name,
++						((str2 == NULL)?"NULL":(char *)ASN1_STRING_get0_data(str2)),((str == NULL)?"NULL":(char *)ASN1_STRING_get0_data(str)));
+ 					goto err;
+ 					}
+ 				}
+@@ -2098,9 +2113,9 @@ again2:
+ 	row[DB_type]=(char *)OPENSSL_malloc(2);
+ 
+ 	tm=X509_get_notAfter(ret);
+-	row[DB_exp_date]=(char *)OPENSSL_malloc(tm->length+1);
+-	memcpy(row[DB_exp_date],tm->data,tm->length);
+-	row[DB_exp_date][tm->length]='\0';
++	row[DB_exp_date]=(char *)OPENSSL_malloc(ASN1_STRING_length(tm)+1);
++	memcpy(row[DB_exp_date],ASN1_STRING_get0_data(tm),ASN1_STRING_length(tm));
++	row[DB_exp_date][ASN1_STRING_length(tm)]='\0';
+ 
+ 	row[DB_rev_date]=NULL;
+ 
+-- 
+2.47.3
+
diff --git a/package/libest/Config.in b/package/libest/Config.in
index 3a0328c2f8..bd5f40afae 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LIBEST
 	bool "libest"
 	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_SAFECLIB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
