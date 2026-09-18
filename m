Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1C2C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 586FF40CB2;
	Fri, 18 Sep 2026 18:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKra3HN7gMCu; Fri, 18 Sep 2026 18:47:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7948E40B18
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757269;
	b=pSHRctmv1VeLBF0PgLRTIa5+nTFkKQXdeaYto9PSZ30NzCGKDYVRyaMyOaomF3lEcdLm
	 HgHwpy3gFv/Y01xXOGtXDJuFDu56qYtH0XY1bUGi9RVASgu1fNlMTZVJ5WoH6va9RmkXT
	 jINK+9SVADwnPLyoHkcDk5lz3/QQFHus0UFuET8/pUw9W88hvOM4vFaO8Z6D5svbw5OI8
	 TXkdvV9nl8OVwJU0a5AeM+fRudCZi3bkyV3jOYQ+4b+VzGtgRj01qN8fbcvCpinQ85/s6
	 qO2nfcoD9D2flR/ExtwEyb2CgM/hRWGfw0hcQP3j1k9DEWj7stt+TiubAuyqH5+vKDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	b=knx9Uf4AFmdAYU0ux59gkoDnLFQO30DcXsvxZlNiXyaanJ7OcdYha4rx1jgVNS+uM15Y
	 Ej5146OeuCGBivrGL0VASBkVWKv/XnReVvX6iOD4he3S2+R9PqDat7O4ir5WH0RNv+aLS
	 1GZO8hlaqYE8cNKJgvb4eoYluiL25LtwZDAbwXzAP1ezNIm/K4BWQUkVUIxrOtYnpBW5u
	 hRYpSNUF0jGBH4vePN28sC0kCxeugWKb9scLZUe49Id5LwFzhxd5q76skzw/pP35iLtRo
	 ZYLlVJZxaEncz7PBLsmssxwr5ZmEk3bJJZFP7VPLPaBLMAlxFc0YVtT81SRmYg8rqLA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757269;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WkxUKGhZiOTlQegd94erLl66xBCUQtjEAVFCTarHUoTYa6rzRHuoWL0ZvweDbSqVq
	 ZZIaV/5dqJeFRKpeTVWdkccmhIT0OvceAaMFwsw9zd/MVZm/QCxNBp7TKOgJ7ZAl0N
	 FagMJNeDWHQVSOOYyfcqUs08W0xkindSxWLpnSg793fyTcsss+Pib6g4mByCjghYfK
	 4BpQQkLzHw6tcCCr3lD0M4skmRMkJbaYlQaf5gqIVtnvIiLnW1ufBVnpY84WU8Mo2K
	 3o3k3J0m9UH+MD+INRqbzzTAjM2jpRYHl/TmiH6oZBfFsoCdKlLH+V4pNZsJBscaO9
	 aE0ClKe8GG8MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7948E40B18;
	Fri, 18 Sep 2026 18:47:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7636A237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CCA8811F5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlrTFN4FKHX2 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:47:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5D048811E7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757266;
 b=HXcUeoS5lHebbJKu+2CrGY5r5fokFp4/TA4VS+oYS9lSiljf7M8hn2vW4NzPwnfBtjwT
 OP7g3bdYvCQaoZCj7fKRFExqksds7t+HnNk1HAd2OEyOcrNNAMSiGjCVzFbFO1gqHoiYG
 QhJReoin4MbGKMoiuQm675qjk7HoL+1tWDkI3ZPJy8Nygpa4LRBKITMMO81kgMieXGuwp
 8BTpVfSsIFciOWl4bwTYFtVo2lO2z214w4uxVMHVLToDvenUpg203sodqdAQRtEQiBEPT
 T8qu0Yv+nfOJhR8Df+tteLTetVyOyjKAOuJVMWYBIkB6C1FXN5G59u3sK9FNXeSPxbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757266;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 b=d25iRRx75EDKBTjXgAnHO2fjtiqge07kzOcWGVD0cWaf0RmE3IG3U5sZyu23GZRY4odO
 6PcuHxqAW/c1TeHC5XtU3GYeOiRhnv/nFkpgDtvicQ2nS+O5fM2bSFN54awQ9jXlEhNpM
 jZbxz2xIjXLEPlmLD9gzFBotxz10k9Y0LQPAI6UQLfOkBWg4uG5jdjt7qKxdWm+JWR3/M
 JPkXK+u3bRQSdZ2QaHhtU5I+1g07UsfMJyYmIGQbmAunmQJruf90P2c1JMKcRsI1joWBJ
 q0M3OhxL46yD6B9PF7dEqr6J8IeIuAIDrYlL65ffbvttfLpPpYaD8VapwSFZlM345wA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ER0Mr72e; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ER0Mr72e
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D048811E7
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756928;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ER0Mr72e+Prdm7OccUjnWh0VcmxxT6DFj84xbICruuUoBDzqAmY6jwFx2rSq/G2Qo
 shwR/vUBP/2oxwPYaeGwe6g7TUzXFAaZNLsQFwiKP5676x+ugMjPUSjxWqzRuwqIad
 zRncUdB+Fvr3F5lD2putoRXrV5M5UB/uxJEg8foNCz/zwPapfTHf+TMUcHv9Qm7KMn
 Ls20DlPsmzwiKOeAjBMyCUDX5NwBpejjKn1+7b6X4GZtbpQnHVsLCHq50B7BGErJ4l
 TwXHcgMketU1f8OGsp/Jht1C/0zwJwbaTde8XSSBKUNfdOmuWaeNTbVvVZRD7W0V+m
 vvP8MGICdfH4w==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:nccUv67parsibriFOsIfR5uOV9sJuO91Img6ka672Gt0Kqajp19wju7AxEW037k7uwSoaY45lCMq2zakKLao/wh2c/RCftP953+uUiFVCVEe8JVnvZHakypgBRN9Vqo/gGIfk24uZi8Rtcd6cx/hAUBjZIg7KjLpxjNhvtMR7PWYVEw6vcN7Y6Xs+y/PLnsGru1wfUgMEzLVFO3Xl/ZPZmqKJ9MkjVsWSm5XeStxFL8GO39GalzAT6Fa+WrdfifwCHuU0RCZMeYZ0eiT/bvO9y+yuTeYPwq/mAIW9nIhfAQLzwkfb+7TuRe2DY8fJsZQIDIv4fZy4vv+rUdbVXt+qeFvYak6kaXt0WTu5set6mE6WwJ+km5a27ExNjeF2SyogjpVdH3LvmUCeMBxfAUSkaej0F9vKM6lXiPjAzafB47vWC5zZ6LwOQtxkoaUmspiQIHseda0lDxdPgaHwyeV4vbmJ0MAegJIEWN/+++l8OShuINBJwzJmMOwEQuWPKZcSOTjG/PoFpSNg+kXIyHcFyRpjMJBCwbjOHMcy601h5RzWXAFsPUgj16T8LLYRprYUQc6c7WOp23LYyoyLqBYIAQp1qCVJT4pPk6XSVZMbGiMWJ
 KwlhDzq4RcAqflKlPVt18FmnzSB5ZCq+7tEnk+Aiti83eEC5j9DnBDbF20oRhwzKzKFLs3sGRe
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BE150A4C42BA;
 Fri, 18 Sep 2026 20:42:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWs-000000007cB-1Clk;
 Fri, 18 Sep 2026 18:41:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:41 +0200
Message-ID: <20260918184140.3631274-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 19/77] package/asterisk: Fix build with OpenSSL
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
 ...of-bundled-libpjsip-with-OpenSSL-4.x.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch

diff --git a/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..28f9d4f281
--- /dev/null
+++ b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
@@ -0,0 +1,63 @@
+From 520061e78d1ec24d0d4b97555e11de01f4db8c2a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 13:08:28 +0200
+Subject: [PATCH] Fix build of bundled libpjsip with OpenSSL 4.x
+
+Source of the patch:
+https://github.com/pjsip/pjproject/commit/3923fad2e4f6f3403c3d6f1176b113c1c1b91066
+
+Upstream: https://github.com/asterisk/asterisk/pull/2162
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../pjproject/patches/0030-openssl4.patch     | 38 +++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+ create mode 100644 third-party/pjproject/patches/0030-openssl4.patch
+
+diff --git a/third-party/pjproject/patches/0030-openssl4.patch b/third-party/pjproject/patches/0030-openssl4.patch
+new file mode 100644
+index 0000000000..bfeefa2677
+--- /dev/null
++++ b/third-party/pjproject/patches/0030-openssl4.patch
+@@ -0,0 +1,38 @@
++From 3923fad2e4f6f3403c3d6f1176b113c1c1b91066 Mon Sep 17 00:00:00 2001
++From: Ravi Kant Sharma <rks1986@gmail.com>
++Date: Wed, 24 Jun 2026 11:30:40 +0200
++Subject: [PATCH] ssl_sock_ossl: fix OpenSSL 4.0 compatibility (#5036)
++
++---
++ pjlib/src/pj/ssl_sock_ossl.c | 11 ++++-------
++ 1 file changed, 4 insertions(+), 7 deletions(-)
++
++diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
++index 000aabad61..93fcf10f14 100644
++--- a/pjlib/src/pj/ssl_sock_ossl.c
+++++ b/pjlib/src/pj/ssl_sock_ossl.c
++@@ -1645,10 +1645,7 @@ static pj_status_t init_ossl_ctx(pj_ssl_sock_t *ssock)
++                     if (PEM_read_bio_X509(new_bio, &x, NULL, NULL) == NULL)
++                         break;
++ 
++-                    if ((xn = X509_get_subject_name(x)) == NULL)
++-                        break;
++-
++-                    if ((xn = X509_NAME_dup(xn)) == NULL )
+++                    if ((xn = X509_NAME_dup(X509_get_subject_name(x))) == NULL )
++                         break;
++ 
++ #if !USING_BORINGSSL
++@@ -2105,9 +2102,9 @@ static pj_bool_t parse_ossl_asn1_time(pj_time_val *tv, pj_bool_t *gmt,
++     pj_parsed_time pt;
++     int i;
++ 
++-    utc = tm->type == V_ASN1_UTCTIME;
++-    p = (char*)tm->data;
++-    len = tm->length;
+++    utc = ASN1_STRING_type(tm) == V_ASN1_UTCTIME;
+++    p = (char*)M_ASN1_STRING_data(tm);
+++    len = M_ASN1_STRING_length(tm);
++     end = p + len - 1;
++ 
++     /* GMT */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
