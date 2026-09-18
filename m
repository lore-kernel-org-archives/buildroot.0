Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6781C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C18240BA2;
	Fri, 18 Sep 2026 18:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMXVgi3NfBWv; Fri, 18 Sep 2026 18:53:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B5ADD40BC5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757609;
	b=YxM3TvIm+V1t+gQ6GbPN4OmpnYx6NIJM9lNB/4ZeVDsoLK4Mnwt110htImd1vmIb5IQr
	 iZEkoyHNVdHUfyGgorL/6Sro5LaRz7BWWT23SZpSXeV6qas+TVVPVh6GMJO0PcsxRYWlz
	 9iwypiIg8SoJOGiZ7AcQoifV9qNyAQ88JPcJZh4y80QCmheP7PgSWMPIHwPBCd2+flHQC
	 PRR+BD4+Q+lKAlYiVhVbpP8ELtxN3NPA/GyytpLMsheibWAAEkvIpUAjub1E1Lu/NkwxT
	 ciJxlby4jGrPhSJBaL9VNSzrAIw+gyKAugsY1JZMiGxpql+iXfE0v6PcxyprNUh/Gnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757609;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	b=YAjUord4wVP9N7q/G4VsUPfUN0/zca4+TzeorpbCMqJ67DOOZo15cKuoVPyYMpIAeGy5
	 kUEvwp4j9xagSgd/ccVKwdeqUyWIjNymqlgs0kMLP0cYDTu1g0IyrVoNrF8VrGUSj2hYz
	 T5Fc4/IQzhEvdZW16/2J8wXkugt77CjN95vosbHXg/i8htgs/AoQbv/13lGVhaovSmjdN
	 y7bekB9ITabqBbxz9+AT2dLU/psiDwoHXsZgL29YeJVI5lFoW5K6eiA/Yd6hn2ICq5YCO
	 Juo8EcF5lXq9qpFA1u/5tqORlZV1NJM34YK+Z6yfQB4Ww4gZ+yd7jY/e0y2OGKGFAnA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757609;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SoHbJ4WJuC/jxf3Oc1mEjn81HHJ5Y4WPLb1o8P+0UILDNKNZazsyTVrIA9LTrdhDH
	 qClbroiFI8VIEbMQaTr0HKpTTCiXLhwpPCHrhMneh+rl6Lk8/LmgWZpmYia/FVSG0I
	 6mm5Q+p/PHj6iuIkZFB/YJ5hayziFsLx16SqAsyrsed55Qn7XBdx6lx5OdwST3APLw
	 GodVNQ8JVAotI8abA4BVJzx3gix95UqoeNuO5jBSV7DGkueN8c7hepP551X3glBbkA
	 h0YeoJwe4NKrnyj3EKOVs5Cl53wEUQwe2I7ox1LEssx/FTBuRyauu4YpqXrT0LjAVB
	 3DO3Q7Iw/4h+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5ADD40BC5;
	Fri, 18 Sep 2026 18:53:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1BD8237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88A98400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HW4FnC3eAwMh for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:53:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 95E0D4006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757607;
 b=aDaJmd3/X50PJmVGTQ59nVxEt3cJ2ds51jX6kSVDSipFBs46bjnu4tTZ9hX9IpT0+CoL
 HZUl1p0hSh8/S3a+yGRUyPQlIqL9+Zm/WItVVVwKFexU5fXC0LkIAW1iIt6EuCsIbGAbQ
 gfJAfPNd8iakrU1+VG1vHfzAFE7OZZvLX7LYKKc1laPzWzfnKcJ7cQ4N1ezFBcHZIIAvW
 SF/sMR1jy1yuExxXXuIph0fwO9LtvnSDUjmEwA/BLKZyCHPkDzEmcME3JL/byKTZr6Ya/
 PLqdHAjbBo2gnelV32D6b4J18tgEIPVoAxnomWONJXwKisvLd0oBz11R1PcLHwZxq5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757607;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 b=jcjpSk+IZFqiDJZxCkurScaNtEn6oQDob6Ksrw9egXR2J33wUH2Zizt83gQH9yE15ia9
 rcvQ+YTi9CfrBWdJhxuoiMuMAU3GmOW1bQW/aYBLNTzreZ7s6dE3URtPrg5KsKo+twVeo
 gbPb6mNNPGyfZ/Oh22U0SKwrDTAcrQCu8+sG1kj2nLwQdxS0lBbd6NrUtyBSiQiVPrw4Q
 m/ZXG3zj8ehTOG/FT2Vxd/kr9M3aRbbOpINdPfONIRANMupPE2ASwEnZIfe7wLFK6j0BX
 cpyz0q/ZICKwrOSte37SlcZhc1DIqk0gQYtQ3R42FF5x5yyvr7xaNa325cj+3FVj6Sg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PbAoZW92; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PbAoZW92
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95E0D4006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756940;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PbAoZW92f0bazgsysc2xheU7eXH1JIxOI73cp1U5rksBrC2cj7X4md7jnbdqs4IBv
 /gfOaZfGfegBUS9A99UJyezRUuG0oGhwVOg4DOdA8zA0I4AvG+JFVZE0S0qKE37dtZ
 tW/rPfZFObsd/E/elNBAhfMVt5WaSPVugTd+5pJSLJ/r5H5ozNGQG/imPmCFWTDW38
 0zONzIWnic9aYzu5L+bYWpWN5m9liBRPVAE/RBf/UBBCsx6LRFHw7oSqPQKwWSVKXt
 MK05NTNkrspiLYxqr9O/2wk15kbgnI+myw15giPGIKhBGEB1m/XqN/KJC0eSFAIsOP
 YYZ3Ibz+qgVjQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:U85Ajt5A8FYKaY1Z7ukiQq9N4adNw4foUr3RNHpUURA3TKnp5WZ8Vs+B+1PPG0OVhaP0j48hf3wEOmHsmx5UqEFXuByviLDdV0Abm5cz6QTLpPU7lfVtmr2fO8qK5SG/TMH3nkF+3A09q6yuzSoL/qGRO/TSWP7bwcTSwgmKMOAL4/ipzzL4HpZ12z6loMt6WlZ/V/FBRXl+hbJrYoVQYDgL/jaCFu5Sg2O2637yygLlYUAIrxJ+onrNh6fOa/W/7ZN2gxVfsFgjiXvL8ybuUkyM9+4O0dODFk6q6cjxtBy4Ds1lTolgykOFZjLe+yDxbq946/X+A5msNhQLSKaJWoe+S7dKFP1CJCg018YSUBu2vJFQvNB1e8iaRHoEN0iOt2oU+j3HhTVHbR0i6i/kH6mPK7wJpTfrfCNSiOiFzLSKh5a1kFABNlf3+R3+aN7rjvLe3pbeXzLmDn+GaIui1XfqirjHfZp3snLOZpDdTt2XwabRmSHlVqLt19IKd9sQrifChEQW4pIPw4rByq1mpBGC9nd8Ajwz18mEjFV2BCkyWNLd+aJZgHMiuUusAf8ym4m4LGn8VRYwMlSK4NxIM7Pa6C0L4+ApOV/FqBZYUl+rXw
 PDPNLCr3SIQJd2Mfi7QSFvFgfmJPTvMD8f0GPl9PaPNWGCelKzn12AfVycPUrMk0y72nXTIACx
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42239A4C473A;
 Fri, 18 Sep 2026 20:42:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWw-000000007cB-14hv;
 Fri, 18 Sep 2026 18:41:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:04 +0200
Message-ID: <20260918184140.3631274-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 42/77] package/ibm-sw-tpm2: Fix build with
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
