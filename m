Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAF8C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7589F40B10;
	Fri, 18 Sep 2026 18:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLRCifKeuq2f; Fri, 18 Sep 2026 18:57:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7443640BE0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757877;
	b=F0WJYXFyMVYq9mnSKX74litDnzcpdKx+yT88HfrFqLcnSop5SUIC2yFzTgLRpVsFS2Ta
	 sDnUfCts/18T6w8+zuYl33qUNWlahE9Br/3AqNT2cp9QtwuSIR3OO0QA5NGv+rstkIZ01
	 ZXRC6AJ+k+yhkEoKMhdKM5+aNn8SWLsiADSGvH2YW6ng/c94b2D+G4Kj00J/OewDwj03X
	 jwNPd1LbPGTLahktbxCbQes8zB+Rfa6EedYilHsihkUPfN92fHeC2UPq+s766sWLn9C9R
	 yiv1WyWJXKCWrHAnpHnwJ7JVNWGigOJ0J2u9Q5y2NqAtvlSNccRdWHMwRMPjsiU9ifw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	b=KbQHbKqSVyvY0ZL/fguDtD89ohgVNw5qQFjY6P6tXuu3oW6sZvShSiFAEFJJLU4fA+qA
	 oeVMQtegjw/wWCOoP4MhXF1/1nf+biNNM+qTu7/RkEgDF7xq5NZ5H/yu2totMudGcm4pC
	 Vy5UF5TRY0wQ8J25MmEsaaB01HyCCrBKePmo+dnXX2fjaHuV02j6aOrcQUOGvQh+3BqNy
	 shFDpXT4WEQas9LwrX4nW+ZF5psmHskQ3sZdv5cjSyODbR6Hsi8VrYwT0fh14LqckeNca
	 0KMlB2sIsu4H0khJi3MFk4jw6DYyd7VQpP2jxN1cZJ7vqcQqmUFg9ZSnlmEqrUJgnlw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757877;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=byKXyZNk+BH0hCEfsnWCRKaQRzPl/V6SccqN+SNieao+HZHSDhmtJnee0TD/N/g7m
	 4umU83ghHzdpcdfmMChCCg3G7BeMLxirCsJltn1ozsfnyWZaYt/0mTQYowBMNpaKCI
	 8A5rFqAmyvXT1o2Yi07FQHxOLAxb3YGGRfLJavgCheEfz6eWhAFmFpu9sR/s/703SH
	 e//K9A1srsjqqxeIZI5GPfOt2lnVW3GhaDv9As0Z5KAnPnXwIUNeYMgppKELiiVD3L
	 tAaacztPVvtIVMggCv0K3My3Fv/GfW0imhnGilp6Xg4buCIZ01mN/fGySGED4xYJUm
	 S57amwGsndPjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7443640BE0;
	Fri, 18 Sep 2026 18:57:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 764F3237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C3DF81209
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2j1HXmuD1J4 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:57:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6ED908101D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757874;
 b=MDdiZFfFoM1X5M51Q2D4Lv6xAQE1kuAKHnObi8GgahynKoQdUZ2RUYy9o3cvDGVuvaVS
 Rqu07pMKvdLYXZzRC7C5S9SDDTDzI9DfnLyPbexTCmCiM2ry9G9Cqks/HszwxgOuBD8bI
 I7/kSo0Y5Xqvh50PFhcvKXNKH3h23i4oT7o3H1+o9eBZR3ur+Vlu/yPMtYjsQeCooqQR/
 CrUE5GU1jVL8u35d8X6LN4gavgbkJl0i2qBEML74qwobsWpUtSiXC4SdfMdDTTLnRl156
 2LNjQBQvA8xwrvKmT66JZBd9Rln6/D0RPItkQeLbfjYaZp2iCOqum6XZjcBY+wrPfQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757874;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 b=FUuW1twDfC5pgOTyXb9MCTC2zOgwJ5c6O2VFe2G4aDSfNUBqW2q+jmJTjZQWf/niHXoQ
 3PllZJL9Ay/lUPYJIyNDh2Ww/OtBuaDjHjByw+AG8vQsHuAfCPTOK1vP/dJ+RxjGRL5xC
 o76rt+0Fz5zCWkifz34dZMj3r5F3FndD9MhOSbrNKZlHDz1s9KKFOoG4oEDAKjjdqPt/Y
 B/dnExdsqD0ogh6h6HFVNsESmIrk+WH1UfGiMPwDNFkNjpgZhg4yFzpMWAkddN2nh2jKa
 ZHisRO8tM1+gJx5TghZUqNziq26+2YBlMXYZF+2lUAnTlCzU0bK4cfYU6jgGa/EUKzg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TX+k0zOC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TX+k0zOC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ED908101D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756945;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TX+k0zOCI7VcOxoATdAWQaZHp+WIrstO6OeoRiXpX0jwC1L5aJbdtHKccDKvhLQik
 E42jsbmoP9RMSb94Bbzly9849oG9nuoudIWDDubsJInHC7AoC/Z0Wlx+KKx04R9qab
 qPutlBWNuN5/cUtG5nUc2HoJk9YN3scsxSYZQUcYJEa2Lls4a83DsCfQZRX56mRqka
 Qs3aMsG8jLtn/2Iga6MG4rMluQ1uP6j2DJ25kaKtO0v4debmKTWDBhaJkWTjv867MG
 UPOnzejgxt9rUaO6s6atpKsdBGtqsBHiyUYsW8zmt6cNNolSKpAJvwV4vbNCW4Tde9
 RKLiJye/Ye27w==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:wuOsbNGgNljRgi8+5uSYiTTKjU/EkSM7w0UAyVdNz7AQG0kBBLBf6xogaHOs9fmyD+yq6MpsN8dT47KJGGetP0WUzh4LfkqsxdoYklCHi/019yY0ygfFtUFdR6bp/2rBmeR5HHbrsFO8pJk8DW+/yl2uYGwCts/Ij0Oj/7lVQzl74K9QJu/0XnoE73/mI5PlQ+tRT8O+cd7jT8qNOyKpScvwDwQaqApgG+2AZE2+fVG5TVHzoR+rr9Q08xA5XHfvHQuX2ytC1TG9pH/ZEUjskIgmqpTB3mqcOlwtsw6vcx7qPKTCQJknWJt0IIbDdakRnIaRbp/d06wuNAop8PbAst9v2Dnuqx8m4EhLMW9dgGpDsQw0gTl5YekItcrvENajN4fJ6CywpaCU+ga5wXD1a9q+VMUVCpjdlt9dRizEgZeKq/CswHk+QTS0C7rp0aLMEnxzNebcDLpLtVzCtqAi63iZKlL/sb8zYgnsp4JLT5mUV5ulgySYxG3GFwjjQpruGSnRZSn7+tlHhSK2Rz3kqJiVRRctX5+BdsxSsZNIUw7EQZs0P2+MjEa0lwb+v4GwbxMsRv+qxaAWw4YDf8xUkME9yjfVcc/ABNCAEX9qjQVthT
 Em+UvFH9aXkxa+ONis6Jm2HPfqIX81g/YMQJGmUOPwTXBX0PALtc8C+zmE/2Y/1eOgRvLoAuQu
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1B45A4C474B;
 Fri, 18 Sep 2026 20:42:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWy-000000007cB-1QS2;
 Fri, 18 Sep 2026 18:41:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:15 +0200
Message-ID: <20260918184140.3631274-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 53/77] package/ntp: Add support for OpenSSL 4.0.0
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
 package/ntp/0008-openssl4.patch | 100 ++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 package/ntp/0008-openssl4.patch

diff --git a/package/ntp/0008-openssl4.patch b/package/ntp/0008-openssl4.patch
new file mode 100644
index 0000000000..8b4eb78596
--- /dev/null
+++ b/package/ntp/0008-openssl4.patch
@@ -0,0 +1,100 @@
+Enable building with OpenSSL 4.0
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=4023
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -Nru a/ntpd/ntp_crypto.c b/ntpd/ntp_crypto.c
+--- a/ntpd/ntp_crypto.c	2026-05-19 05:47:27 +0000
++++ b/ntpd/ntp_crypto.c	2026-05-19 05:47:27 +0000
+@@ -2019,6 +2019,9 @@
+ 	struct calendar *pjd	/* pointer to result */
+ 	)
+ {
++	/* OpenSSL 4 makes ASN1_TIME opaque */
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
++
+ 	size_t	len;		/* length of ASN1_TIME string */
+ 	char	v[24];		/* writable copy of ASN1_TIME string */
+ 	unsigned long	temp;	/* result from strtoul */
+@@ -2064,7 +2067,24 @@
+ 	pjd->year = temp;
+ 
+ 	pjd->yearday = pjd->weekday = 0;
+-	return;
++
++#else	/* OpenSSL 4+ follows */
++
++	struct tm	t;
++	int		rc;
++
++	rc = ASN1_TIME_to_tm(asn1time, &t);
++	INSIST(0 == rc);
++
++	pjd->second	= t.tm_sec;
++	pjd->minute	= t.tm_min;
++	pjd->hour	= t.tm_hour;
++	pjd->monthday	= t.tm_mday;
++	pjd->month	= t.tm_mon;
++	pjd->year	= t.tm_year;
++	pjd->yearday	= t.tm_yday;
++	pjd->weekday	= t.tm_wday;
++#endif
+ }
+ 
+ 
+@@ -3517,6 +3537,7 @@
+ 		X509_EXTENSION *ext;
+ 		ASN1_OBJECT *obj;
+ 		int nid;
++		int datalen;
+ 		ASN1_OCTET_STRING *data;
+ 
+ 		ext = X509_get_ext(cert, i);
+@@ -3550,8 +3571,21 @@
+ 		 */
+ 		case NID_subject_key_identifier:
+ 			data = X509_EXTENSION_get_data(ext);
+-			ret->grpkey = BN_bin2bn(&data->data[2],
+-			    data->length - 2, NULL);
++#if OPENSSL_VERSION_NUMBER >= 0x40000000
++			datalen = ASN1_STRING_length(data);
++			if (datalen > 2) {
++				ret->grpkey =
++				    BN_bin2bn(ASN1_STRING_get0_data(data) + 2,
++					      datalen - 2, NULL);
++			}
++#else	/* OpenSSL 3.x or earlier follows */
++			datalen = data->length;
++			if (datalen > 2) {
++				ret->grpkey =
++				    BN_bin2bn(&data->data[2],
++					      datalen - 2, NULL);
++			}
++#endif
+ 			/* fall through */
+ 		default:
+ 			DPRINTF(1, ("cert_parse: %s\n",
+diff -Nru a/ports/winnt/ntpd/ntservice.c b/ports/winnt/ntpd/ntservice.c
+--- a/ports/winnt/ntpd/ntservice.c	2026-05-19 05:47:27 +0000
++++ b/ports/winnt/ntpd/ntservice.c	2026-05-19 05:47:27 +0000
+@@ -87,6 +87,7 @@
+ 	int	argc_after_opts;
+ 	char **	argv_after_opts;
+ 
++	init_lib();		/* ntp_strerror() below needs it */
+ 	ssl_applink();
+ 
+ 	/* Save the command line parameters */
+diff -Nru a/util/ntp-keygen.c b/util/ntp-keygen.c
+--- a/util/ntp-keygen.c	2026-05-19 05:47:27 +0000
++++ b/util/ntp-keygen.c	2026-05-19 05:47:27 +0000
+@@ -625,7 +625,7 @@
+ 
+ 	/*
+ 	 * Create new encrypted GQ server keys file if requested;
+-	 * otherwise, look for an exisiting file. If found, fetch the
++	 * otherwise, look for an existing file. If found, fetch the
+ 	 * public key for the certificate.
+ 	 */
+ 	if (gqkey)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
