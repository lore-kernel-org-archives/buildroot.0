Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080F6C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB30E40B0F;
	Sat, 19 Sep 2026 16:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BdukvHQzjd_G; Sat, 19 Sep 2026 16:03:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BF46A40AE5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833781;
	b=podaMf0/YoEzG2w8s+2Ra9BSw1/wr0d9XfDFgbvQnUeJKEHyhRk2Y/jCRcB1QXXU+7IN
	 b4/1HlxM3P6MgmUHVtCSdL0x6h0kYi84Oj1q+CGlFYEYqAyrW+BTvd5DSro/SMUuwZRZ5
	 B0QNq8dwEUNWF2Tq9dNY8ZHylILdj8D6pOSnmGSTLhiSmGciZTLP6il/Eq20eLapyXcdM
	 d6q9Q1Eq/VATxXhijH6oxhKkwTao5mm4eiBjoJ6pA9wlOGv5H75Jd92+2QIJIwlfeKPo7
	 cPoyPmS0FAIvWujagv8XDG15rV8OTP+CfY1MhpxclvBz9CON6M3QqL6QpYOJ6ovaNmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833781;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K38UEPTcjs+JlrSehlorOrOxRp9FvTYe2IN4WgIup0U=;
	b=MBHNJPgw2T7FT86pxpIVqUM8w3JSZW7FMhrFvqCfQ6q8GTMDbdEW1xkyB11bkTqZtocr
	 CcfxG/3YsR4cO7JqG50q8tgJFjwN6c8EFwcqDYMmkLXHYXZTKI7QADBtLNTrS77ZgkuiN
	 5JocSxH77qSqFYqqHZL9gQDMar5BKYcvFoHgxBy5lzWP5K8dF8MxPzevobwd3CMQV/Oou
	 3edQveCTcvWRgNDTC+YuXDir615mE/OABGQQupukcsyO2FjOzCn9vY37yWGiZm3pQ7Ib/
	 xe0AEeXDt0DbDEr2RhfGZCLigZlezjp14IvHQPbHTySq/rAuo7VGmNzrX8VtVsft/Bw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Lfj5xOww;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833781;
	bh=K38UEPTcjs+JlrSehlorOrOxRp9FvTYe2IN4WgIup0U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UnJFnVqJVITx8Nzorad7xAS2z7NhUoW4I0RWU5RVxuOIfI/XB5d3yl901KA+VtglZ
	 PXQlPJirLAv8bYeBmdVOD6DjguMfgi+BC8g3C7ajhdb/ECozTQBnTCPHrOkyN/VOVZ
	 /ulJC8nzLbd13e4f9EAQgX+YLyR64OITyilqmafYKJ9tagr8pFl1VwaXykQwCEFzVm
	 sCmrJ8mPj5b/598HQJd/HrDbCl98Em5wXroUUqAlyvKFmAjEzInWwVWtJVVCv7GmKC
	 kKDCCrhXqrd6ORpDvjG3BRFNiHHG+t44DTT0KwBatge4lA0j1z5hqhoaeP5VvPXfPe
	 Rw3d7BAIj/tOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF46A40AE5;
	Sat, 19 Sep 2026 16:03:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82F8D24D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68F0A40AE5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTigPfWLwOsH for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:02:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 28260405B9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833779;
 b=GflDv4hinputx4QxNrINlUlegFa6vQ41YbSXpKawKUWnahxbFViz7vkz/Xt71Sek0xSL
 qkT1hplYkPPqoun7EHAiWEtjVhICwWsLx915tofThcCl8I4rtGFgVVrI2Ye0eXsCljD/q
 cKYF7u12RLuIOni5NFJ0O1u0V6pJVR2BVXDhEdP4dC5IrAQ8V2B5HxWyqRAFgujyT+bkd
 /zPk0S/8kH6MutBx11DtJ3M0O0Ox/I/OmfnAxI94jyccipmqaVVw+qHukMCwDcoZ8kz4o
 /+iYFGH1sMX9KUNgqqWEdJtIPLXSlnY42g66IZzmuHMtv6KTH948+W5FAt0aagwwR3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833779;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5K82jIiPOAAxOVMXOUMEDuHnm5P3+HqOjNR0zVeDofk=;
 b=XNJzbk4tQKjxnESTX8fEswlX2OiaSLxPhFpcAULQP3iNp/Zkteuh2Oe10wDmrBqkqbt2
 OyvmIoL8ZiTekCj+bUXC53H7iwcrr0BBKCTlAO93nnxp3j9yscwOHz/ZrqnnmCFB4hbWW
 aF89mlBpVFkNonTLoTEq1H+2aSldEi+7TpDqUO9/v8jXhq8BROawBANtULoeO8FtJztSb
 kF35+0Ftjfy/w1iUihMWEwqSADWel44jzPfiqp8FvtSfrHJ5EGrhvwHL1z22PNwDMUrYy
 NSpKMmDRgW3/dVVBAdEuDix+39j20LazAlJsTP8OAXwimNpmLQsIkBLMHy7AF7DzQxg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Lfj5xOww; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Lfj5xOww
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28260405B9
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833542;
 bh=5K82jIiPOAAxOVMXOUMEDuHnm5P3+HqOjNR0zVeDofk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Lfj5xOww69lR39at8l4P3nosU0a9/GkYE8TV5CLwWB8IXtgK/R+9bQousfW15lfa4
 oIjdwke2XC4VMAU/AreMotoPDh8vHiXpsa9v3SG6VagGlRv+e6fiJHUYyjzkTD7xKr
 LrpXP4h5NGxIL2qfAg1dpAzlRQvXmbI4U78YpPnIAglMu3aNU8I0H4nlxZ/bXxdzHH
 5B2zVJZkA4b8VcNFRS/eYS28GF/vuK4LYgt7rHZJm8uEnln8beg6UMW920B9ODbj6a
 OuXvRbzoVBdB4jLHpTtfvP1x3XX6cD/HBoCv/hjX/pTnzRSXJIlfLZIKoaaDiUoo3b
 fAKUehjD7vyaQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:JXkSHU3XEjJqFu3m1t4v0H6rUDPmHqW9+GFY6AG1/GQX4/e727niEwNVRoFWEkgkYtFj5ImA2IfjeqaWnnp3gCD1MwoxodzS3kVUssygvfeo1Ml28kZkrKthUCWweZdXFh6WYxoHlsE6VqhjZJctbJdlUg4eNTt/onFV8JBhez9XfOTecq2sRdAEofWv3ejwam3yV5jbtZ83smwtvSPLWToqJAl5DWDtBqcwjLQEXhViyxDR1F3ZSwnBi1afuNGrMoaRgSwJB4JiupKS494n5Cc1u667u8RgFp11LMEoQM4WwHPEk4a7tQujh9XsalU5WBkrJw3IVbTqdQjbvzogOz1n7y7vuGb1tAW3O2lKpzQ4GvMUGyDcqyyaVoB4j7vTO1FiyLxkctC1w7Cp++EWsIbIQ1tT7CT8SA/2rZg4v17L72FjuY8a2NjYrViYC+zDa6COWzoskzUrKcbYARqylp+L+sov5/dNJw7X5dcQAWYtMKZCgKQukq4mnmK3N99wJYSXIRcUS6l89plsfv6akItEyWYlDRfycHX0Hbain7ZYvR7BoNV3lxvXJW+AVDOiUYWZ1wCVf6V9WwFS5bhDFKkminXSdSF3xvUMbmKKuX6tUw
 v3SQ1z32LDLirx1pUtVEKmt8B8Jz+Lb5DRy6HR2cIfWeZ1lHYAYLGF4g0M0XYwnoXRwYe3
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E291A4C47B3;
 Sat, 19 Sep 2026 17:59:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSv-000000005Jx-2t8p;
 Sat, 19 Sep 2026 15:59:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:30 +0200
Message-ID: <20260919155845.5776-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 65/77] package/softhsm2: Fix build with
 OpenSSL 4.0.0
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
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
 ...mory-leak-in-OSSL-byteString2oid-863.patch | 49 ++++++++++
 ...in-EdDSA-PrintableString-handling-85.patch | 98 +++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
 create mode 100644 package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch

diff --git a/package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch b/package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
new file mode 100644
index 0000000000..2defeda775
--- /dev/null
+++ b/package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
@@ -0,0 +1,49 @@
+From 1b72640ceccaa8fdd775f224c26a53fdaf189da6 Mon Sep 17 00:00:00 2001
+From: Shawn C <citypw@hardenedlinux.org>
+Date: Sat, 25 Apr 2026 20:05:34 +0800
+Subject: [PATCH] Fix the memory leak in OSSL::byteString2oid (#863)
+
+The function `OSSL::byteString2oid` in `SoftHSM2` (OpenSSL backend)
+leaks memory when decoding PKCS#11 attribute values as ASN.1 objects
+or strings. It calls `d2i_ASN1_OBJECT` and `d2i_ASN1_PRINTABLESTRING`
+which allocate new OpenSSL objects, but these objects are never
+freed after their NIDs are extracted.
+
+Signed-off-by: Shawn C <citypw@hardenedlinux.org>
+
+Upstream: https://github.com/softhsm/SoftHSMv2/commit/57e10cbbe75069be92c7e9720c180a05833481fc
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/crypto/OSSLUtil.cpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/crypto/OSSLUtil.cpp b/src/lib/crypto/OSSLUtil.cpp
+index 794f80e..d238eca 100644
+--- a/src/lib/crypto/OSSLUtil.cpp
++++ b/src/lib/crypto/OSSLUtil.cpp
+@@ -177,8 +177,10 @@ int OSSL::byteString2oid(const ByteString& byteString)
+ 		{
+ 			return NID_undef;
+ 		}
+-
+-		return OBJ_obj2nid(oid);
++		
++		int nid = OBJ_obj2nid(oid);
++		ASN1_OBJECT_free(oid);
++		return nid;
+ 	}
+ 	else if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_PRINTABLESTRING)
+ 	{
+@@ -204,6 +206,8 @@ int OSSL::byteString2oid(const ByteString& byteString)
+ 		{
+ 			return EVP_PKEY_X448;
+ 		}
++
++		ASN1_STRING_free(curve_name);
+ 	}
+ 
+ 	return NID_undef;
+-- 
+2.47.3
+
diff --git a/package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch b/package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch
new file mode 100644
index 0000000000..f6b9000b13
--- /dev/null
+++ b/package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch
@@ -0,0 +1,98 @@
+From c7e930156054e901e27149117494d53e9945f734 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ma=C5=82gorzata=20Olsz=C3=B3wka?=
+ <Malgorzata.Olszowka@stunnel.org>
+Date: Sun, 3 May 2026 13:00:07 +0200
+Subject: [PATCH] Fix memory leak in EdDSA PrintableString handling (#858)
+
+Upstream: https://github.com/softhsm/SoftHSMv2/commit/d23ea09d318c03c033420d065f1c64b019cc94ed
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/crypto/OSSLUtil.cpp | 37 +++++++++++++++++++++++++------------
+ 1 file changed, 25 insertions(+), 12 deletions(-)
+
+diff --git a/src/lib/crypto/OSSLUtil.cpp b/src/lib/crypto/OSSLUtil.cpp
+index d238eca..7763799 100644
+--- a/src/lib/crypto/OSSLUtil.cpp
++++ b/src/lib/crypto/OSSLUtil.cpp
+@@ -160,12 +160,14 @@ ByteString OSSL::oid2ByteString(int nid)
+ // Convert a ByteString to an OpenSSL EVP_PKEY id
+ int OSSL::byteString2oid(const ByteString& byteString)
+ {
+-	ASN1_OBJECT *oid = NULL;
+-	ASN1_PRINTABLESTRING *curve_name = NULL;
++	ASN1_OBJECT *oid;
++	ASN1_PRINTABLESTRING *curve_name;
+ 	const unsigned char *p = byteString.const_byte_str();
+ 	const unsigned char *pp = p;
++	const unsigned char *data;
+ 	long length;
+-	int tag, pclass;
++	int tag, pclass, data_len;
++	int nid = NID_undef;
+ 
+ 	ASN1_get_object(&pp, &length, &tag, &pclass, byteString.size());
+ 	if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_OBJECT)
+@@ -177,39 +179,50 @@ int OSSL::byteString2oid(const ByteString& byteString)
+ 		{
+ 			return NID_undef;
+ 		}
+-		
+-		int nid = OBJ_obj2nid(oid);
++
++		nid = OBJ_obj2nid(oid);
+ 		ASN1_OBJECT_free(oid);
+-		return nid;
+ 	}
+ 	else if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_PRINTABLESTRING)
+ 	{
+ 		/* The final PKCS#11 3.0 expects curve name encoded as PrintableString */
+ 		curve_name = d2i_ASN1_PRINTABLESTRING(NULL, &p, byteString.size());
+ 
+-		if (strcmp((char *)curve_name->data, "edwards25519") == 0)
++		if (curve_name == NULL)
++		{
++			return NID_undef;
++		}
++
++		data = ASN1_STRING_get0_data(curve_name);
++		data_len = ASN1_STRING_length(curve_name);
++
++		if (data_len == 12 && memcmp(data, "edwards25519", data_len) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_ED25519;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "curve25519") == 0)
++		if (data_len == 10 && memcmp(data, "curve25519", 10) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_X25519;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "edwards448") == 0)
++		if (data_len == 10 && memcmp(data, "edwards448", 10) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_ED448;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "curve448") == 0)
++		if (data_len == 8 && memcmp(data, "curve448", 8) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_X448;
+ 		}
+ 
+-		ASN1_STRING_free(curve_name);
++		ASN1_PRINTABLESTRING_free(curve_name);
+ 	}
+ 
+-	return NID_undef;
++	return nid;
+ }
+ #endif
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
