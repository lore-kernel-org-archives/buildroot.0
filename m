Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C6AC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D37B4606FD;
	Sun, 27 Sep 2026 10:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nw74SQG0rGPb; Sun, 27 Sep 2026 10:58:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D9958606DA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506702;
	b=fO8+v2InjEtACq5OEr08ZkWuZdhEGjeUYUSl+bIuxq8TXYc1ysFup0EnfXu4BPy6nfPx
	 Q7ioeoSSyQ0MMmSi3jlBRUKpB0qZCsiVlkdwSX9CELpXotfRwN5nW+HC2sqx0ruqaklVU
	 pVmeZJ72ZvPCLCRw0CHjCH3jp6xcweoGqTzUpcyghk+3sBh9Eh8sE6xrhUWSMPA2/zfI0
	 dkvkE42nqaK/iu3VOBlSXZvC2k7/CiewnKRNHWeQs0RT+lN31OLYxy1WxGVzUkiMKn/8f
	 KwppNlWyX11ab9ylTwsOB0h2bvRGDz0ngn2bYq7PmwKLDcXqaT2yjSqcfj0MUuXSFBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506702;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	b=imA0TPY5U9GCdrq9Rj5LFa5v2j7aLwBo9au647L27msnu4kHV+Y+53u1NLY4xVTu3FFV
	 0BOmTtCQyXmjl5NyMWVS49hO/n56wk41hPehh277abxQyDFfLwwZOMb/Qz76mDOWsGXsk
	 nkGSXgdclQ5IPg/YkUXPOPPV5wjPJ0rrywvRsLA36/A0AIdFjqmBLlRParmZ6/nY18k+O
	 V3dGJjKbtHOcwgoeMqelfeNtd5QMUNGKVew7dq3l6P+BQDIuIzFh21yKT54kUFoCnNBy+
	 ehwZJ2v7BFiHu2e/fJ5zRiwhTWL+F/DRN0xv2is6OJuiUu5fO8i+r4Ehrt44SE+LLKQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506701;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JuZC8ATT564OyAAFY4G+shveNhNnV1w2QJoR3sATC9BF0iFB73uQ99XOAt9uI1myF
	 wvp9G0TkRdE17dCvIIO5mnpktzJebsZd1AkGqlr4iNzWsMdBxpn1GWGT1w+XaVndEr
	 wmNJOls3AcsbBOE0/dyxZgcAj7IpoDd2A2l52qgoRDgnnjfj4/m624fTtcSt2wtOuY
	 sFMyfrFyUuANvr+/OYGsrcQDYCKTJEfnEfjQX1oRKo8RrtfkUDydsVXghYwBEOn10f
	 H3ZWcPPh9vAW2P3f8/5JWSF8vYqhxG7czsN/N3ddkzarQ0eJ9/w2JvF7EtriWRVhJz
	 FkUIq6s0yjIuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9958606DA;
	Sun, 27 Sep 2026 10:58:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2A5A335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B925E40068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48kve2catAqt for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:58:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CAD7440059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506700;
 b=CiX0F33kE+DTyEfRM9vmp3iBsyyUNUIMIfyGioFWJ3DYjaNxXvOgY0ilKmWKWW501/WJ
 9oOhRE3uIQDYZJsgCC3QOBXIOYr+l/m/BoWlU3aja2tSTTHy/yVgS9VnX1LtJQ21bYuA/
 Q9WIPc147PICnSnOK2tTpyuy0zKfH/ScAeAtko1AljttOf1qBTFqYgQl0Pg5iJHnHjN4d
 m41sMl4mnQMyJYIKtfFIbBln8PYba8PPbqtLk9cSk0pqO5wWX9GjK3IazPXjPbQ74RfVk
 CDsstoksWwBZcW8bYwViRauR2rsmBstEWcJpSSUGrAQaz7o+cEWw9R8LxFjQHhrBlpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506700;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 b=m25SMd/H4iFOPNoT13tC0/A4lJzjjl7qS9xA6CqL8t89nRhF99NZ5sHXw38KWLhScllC
 qrsnsEmBJ91JE2ruW5YaCnBMQWrCvCndCAHCmglgxuno6y+tlOcyXYBsmi0/iN1+t3Nqh
 bAVOR2luSYqXFc7iUjSUjAVGZ4sQrEH5MIti8j7pVXA2oWFTxhCNA++6uhHNSfJMSAMcD
 fKdZ0Ds6RlPoHJCndrUeyxUpu9Vjhs2lj77CaHd7McOkWi2o1D/YjmuTr7CcSJl6HzzNA
 bEfRX20dEKikqyMTWHEqXboFO3dY78NnSKL1IogDODmf44zcNfX4md8trO24UhuF9Fw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Rr4JU+k4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Rr4JU+k4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAD7440059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505867;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Rr4JU+k47mxUcPWrYVJir5I086eWggiFUX99EtQB/q1gM8PZjwnRx3Tb8QvqCc/uq
 FFsMY8dwH7iOIzv14ims9xi+iN+dCBVRIEdt2cUrmPhu81uc5bkgNjUngUo2O2z1U/
 uXxbVsX5g/W6CT4tuczy9n5PxxYvAVaT463MhzQP/vLiOwT65ixPlrf4QHsVnill3s
 3xuIv5dvxftc25+/caqNOFXsVWD/jHtbMuG3LZsvOVNPYTff8FYk+rdvvUIUCThAL6
 5kl7SSdvc5iuIdwIKm0lyYaGy8E8moGEWYzxzCC6hghQ4viaOKBKuEQRMA0rIzxleT
 62diiyoYo9ruQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 j70VP3h4ySclCw79TxW495oJJc8vcymIuCHtatQvOsK1/uYfujCIBNRoKSD7wbYT1OVZVv8Pj4M
 gjTAQQvI1fSfR7Uy2pBOh0fyGVFNkaOa8iNjeTpb1vU6PiVXfLhO38SBo2VCssKCn+CDO0z76NE
 VCMWjKt5GuiVYBXmISkfmCXMMrZbxK1Q+9UtuTTJILzQD653g5SBVhw97gtVtaUsebrStSoFeWi
 nB30crVfGb7dlitL8FmSfy6Q7oMLdsqH722yNg0G6o+vQfB91oOcHBL286Ttbp+Z69eGIlQ+83O
 0tKhe9c7wYplB6JpWWGA7A1v95r4jlaQIWOHn6tHak55cPDMrXMMm1RXhFIcmUGQECvdRaoAARa
 GER8F2O/mgxcQ8GP228T7UiH/GoxHOV55/6X6K1NKjX8qCdqz7neCpM65Uhzpp6K0Qx5D4BHg4A
 61o8tbbGKvEi8fxP8LNrsymDWnsi+VnijPg2p2hZo4k1Vqh49mGX7Qjco/P22q8uMllx9oV72qf
 7aZtrR7uaWMzLA0Nz/xq8HZKWvC01Qj2BunyKvPIgHOJUnsvwf9Qe1N4UZdh7BXuMh21wgeEXSV
 WV5kqIrXgSW3JtThvMsfT/gEECCQu95xVDwFm2sDRYVrp1ruVSEZ5A9lgDDqoHqyU3/shCrT5bX
 BmTqI9QVUnaF7AZJ/lHxr
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 697BBA4C508D;
 Sun, 27 Sep 2026 12:44:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLd-0000000007a-31N6;
 Sun, 27 Sep 2026 10:43:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:25 +0200
Message-ID: <20260927104301.1801638-48-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 47/82] package/ibm-sw-tpm2: Fix build with
 OpenSSL 4.{0, 1}
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
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
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch

diff --git a/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
new file mode 100644
index 0000000000..3b4e3d815e
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
@@ -0,0 +1,28 @@
+From 66921ee5ba05ffb92700b00f17cf1e8b75522aee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 11:11:24 +0200
+Subject: [PATCH] tpm: Update to OpenSSL 4.1
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 731957e..345d29f 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x40100ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
