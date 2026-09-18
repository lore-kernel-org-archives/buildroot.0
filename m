Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D18C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342D040CC0;
	Fri, 18 Sep 2026 18:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9W3PUZylI03; Fri, 18 Sep 2026 18:48:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6C53240CA0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757305;
	b=my6mpVQrihOvCq+6K5Imk0uYrjTWI7jDjDO94glYYF/xD7yxqlk/N7lgnsbo27IoSOGz
	 LOH1AtRS+4/KuslGNTEXs/3s2dQDBrIdiVzDmMZTwdlZ/zZtktZIA2P+kXm7L/jugct7+
	 sKLrY/5sbOwJhUx8enn6g0nfe+/V1bEu1HSDsRAICqvdP3o89sY/JuZE7ADcQjT0EltoW
	 vRWN7O3AkkU0b5/0vOQISjR4KQJZYZYvW8mr6bO4sa6MNOMQh3m0/XD1BRy+qKcAxRw+4
	 EyxTEJ0gQU94zXoIvVoHssuhrQ0VKM6xQPdSkXqRX1YONzqfAmYFixW1QuRsIfQQIOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757305;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=k0uayTYwj9Tr0/NkcDfUU7j6FDvFamYZXu6JGs/z6g8=;
	b=KRr+u5zqTYgcIkz98aYAwr178HmoarKj/U+TiwDMZBteHj4tcG9t2ZGkuH2p5fWyD+Gl
	 JWJG5zK2uLjJSs6/UPzKW2jrAQX25gwZJm1VIR6Tl7lLtDshytslFilXfTtp6vz0dxaF+
	 MH/wEsrcpGJMgdSz3d+ZbbTp0hIhEBeEWcBE5FOPlkdO9Dh0mKBDnne9wtqBv3PxhFGJ/
	 hN0m6YHSechIFQULQ2TNFuerPHo2w/+y89PdVPE5P3Iq0iG8IzscmojlqNM3OYGO454sw
	 p1PZq3l++flAdTczuX+ueYdijeDDLkmx6gIzi7n52bKE6QA8TMIuV6ztKs1XZxj4qxw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757305;
	bh=k0uayTYwj9Tr0/NkcDfUU7j6FDvFamYZXu6JGs/z6g8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FxYTnLHB5bpi6L6fRg/lzyujcOyVVb8y98+5Bf2x32nPxUUFrF2mXpbAeFw4YHFLz
	 I4ltWHnVWBfiBhEfvCqxlgvu5MxMDwS/njPrmsUouI/mvzKEoOQ3QuUtfsSv1asKKS
	 Zc8pgs4KlSka+HArFsaCMmUF4tDYiXSZ7lIflAeO7pluLFHPmw57NG7QL5hDaDgXvQ
	 CxENxeKBqN+ejNg/opkpGMt3snSGM9BVTmR4AQ83pmUonMTNMJmIc78vuTPcmieDhv
	 U0Vd7Q++Qpp2VYi8CNogBLnpTxDFZwzyJPtQcUBg4vtd8LPa6S7oX+uu5787c5gHzb
	 JcPntfcvZHo3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C53240CA0;
	Fri, 18 Sep 2026 18:48:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15C6E237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07BA2812A3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3C5IXhm5i4I for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:48:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 27C8D81233
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757303;
 b=lgtQO3Pd9HEiDX+AmBO6kOMcT4/GsYbY7UPL5HtPnzVPGP0E65zBMP4gK3B0EWNhseXN
 SGYnaQ9KM2rto5pGwUVC8HjgdRBQdlF4AzzpDAKJ9N/EzpKbTIIQ8fY3TF1cX6kY2bUEa
 71YYLYebuVCEc77KnFardgimR8qDMQCYN2TyWUIii2+fMsmIsht8k5m7qTID4nuq+8y3/
 RhynG9FF+9DQjAwHQAT14RWR8XcyBcVPZTiTlHxex43n+/69UoTzKYCsjL7IoTnE1BYjM
 KRlBOq3gvpYC0mlcvE/NdOReImsquvtgtK4e5PTANZknAjKYMBAxhbG6dZMBZz8AjVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757303;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0pbGfPwyrsLphRyAiB+7qF8WaaqKiBlbHBnYqy0u7HE=;
 b=FSFLY8N/vX3KdM1yzlPOUofgIfSkUm+T5r/ozHYEvpD7dj4a3K8EL6h39Ynou8BMeG4T
 U/z7LSPOCVa4PBfWxxIaj9CiI5SNSILsfk3GbEhhO487+hGFOoK75fyKChKIN9yDjPDpK
 TFLzeYqhFrsDBrS+QftDDztARb6gtIM0QhzJiH+POzLv9e9Fzm+1BDO41hFdkpydLTNMA
 7eqCuTLLQULTUMDMGDTtM0yJZZs/uvHabZRfp+2Z9tc3BaHOKIK8rXpby7oObs2i2PESE
 nqBTYsTVlOlr45tWpw5cxmjY7YFMY57ktZt/HQFfVQ8+i/xcs63sLcfyffjAZ7MfZ5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=orGdLuiq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=orGdLuiq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27C8D81233
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756929;
 bh=0pbGfPwyrsLphRyAiB+7qF8WaaqKiBlbHBnYqy0u7HE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=orGdLuiq0yspRVpP8/AfkRkhonCsWjsna/OmZB/5OsQn4f7/WaSu3tgdNQ6q/PWkx
 purQ1frYA25fnoJ3+Frf8aei/54jnMb2mUKvQmNnBmu+UBupf2O6Aw2tZhOsPqJ1a5
 BkiwF5Jgcy9e8kNztJiJqwNRM89eTBwyLRgIExRBCrRVIYA8DX0P7ikim5o5QkKm2y
 K+jQJ5bZTJHaLSlMVJxLtFVGKp3edz0mQ6+38pjXXFmVffSItO8/RNqJXr7U7Fuo7U
 sZ+shqeXPI64m5t2cbG67p5q4KkRuY+rtsdcdG8QLlWtx5xPmLe9lW9yteP4iOB7u0
 nL8YmocD07Zzw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:ud204puscd1hncihNlynLdoXo8pxh7d8WOg/gN8sOPDQ/3uMRs3THgAip480+iFePX0Y4k58YpvKaZbp6CS7IqIqZnG96G9yD78DuTHeJXqeqKdLd9RD8aUI+/n0bwpKHBxcaxSQag6Re3wJ7CMRRrrs2+eIWAX3BSIWutiaj1jbJ1FzXdzlKEszJoG0SHnXNjnFbGX/sOpKLHVKii2YtoA2XqXFlEIAaL4dXvXr1VcQpC3hV/PGkPHqyfymJs04oNfJIsgMZH8kKZ1zU+QAxKwIfURDlddF23AHOQYtuL9qoI/FUXJ0a7fmq5OLIaTT1bAyHOGBsuFJqqaKAWrnlCg7yV2Nen1ZIJVG3vcD+CKIdhBB0thVTzcLwbwypGDCWQXDh5PbTz2UU6n571lfsjHbyfL9QbYifMcoP+TrU/oZDGa6o4GEO1FsY5et1D127C4u7lFWmWaHUM513lZmkBuyMMwY9RZKD1odO4EBVOpcy2VrCVp1Jsq3aOOMv4x0EJ3nRxHacf255V/7gxWF29rHm79BaRQeIYt5I9HINX8K54AyTF7Lza/sxC41H7au6NYCI0fDpdGy5IkFomqM2v2UpTWJafkztd6p8SfX+Jw3ww
 DN7pOf+7yyBGptdbvuPfxoYJcpeRfvcf2uAHAh+vg8U0coWxfU5D+cWVUIQ+VgnBNKXB/QrmEF
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA68BA4C471C;
 Fri, 18 Sep 2026 20:42:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWr-000000007cB-42bQ;
 Fri, 18 Sep 2026 18:41:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:38 +0200
Message-ID: <20260918184140.3631274-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 16/77] package/libpjsip: Add support for OpenSSL
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
 ...l-fix-OpenSSL-4.0-compatibility-5036.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch

diff --git a/package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch b/package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch
new file mode 100644
index 0000000000..4d8f0d3c37
--- /dev/null
+++ b/package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch
@@ -0,0 +1,44 @@
+From 3923fad2e4f6f3403c3d6f1176b113c1c1b91066 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <rks1986@gmail.com>
+Date: Wed, 24 Jun 2026 11:30:40 +0200
+Subject: [PATCH] ssl_sock_ossl: fix OpenSSL 4.0 compatibility (#5036)
+
+Upstream: https://github.com/pjsip/pjproject/commit/3923fad2e4f6f3403c3d6f1176b113c1c1b91066
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ pjlib/src/pj/ssl_sock_ossl.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
+index 000aabad6..93fcf10f1 100644
+--- a/pjlib/src/pj/ssl_sock_ossl.c
++++ b/pjlib/src/pj/ssl_sock_ossl.c
+@@ -1645,10 +1645,7 @@ static pj_status_t init_ossl_ctx(pj_ssl_sock_t *ssock)
+                     if (PEM_read_bio_X509(new_bio, &x, NULL, NULL) == NULL)
+                         break;
+ 
+-                    if ((xn = X509_get_subject_name(x)) == NULL)
+-                        break;
+-
+-                    if ((xn = X509_NAME_dup(xn)) == NULL )
++                    if ((xn = X509_NAME_dup(X509_get_subject_name(x))) == NULL )
+                         break;
+ 
+ #if !USING_BORINGSSL
+@@ -2105,9 +2102,9 @@ static pj_bool_t parse_ossl_asn1_time(pj_time_val *tv, pj_bool_t *gmt,
+     pj_parsed_time pt;
+     int i;
+ 
+-    utc = tm->type == V_ASN1_UTCTIME;
+-    p = (char*)tm->data;
+-    len = tm->length;
++    utc = ASN1_STRING_type(tm) == V_ASN1_UTCTIME;
++    p = (char*)M_ASN1_STRING_data(tm);
++    len = M_ASN1_STRING_length(tm);
+     end = p + len - 1;
+ 
+     /* GMT */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
