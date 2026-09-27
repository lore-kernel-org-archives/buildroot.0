Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B781C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A6AC40809;
	Sun, 27 Sep 2026 10:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzxJqkJ_cZWi; Sun, 27 Sep 2026 10:43:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 062B74081A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790505807;
	b=g3cW16P3UZaNoUL6YEBqs4nKBy06Qr6Mul6ZkqlOX4lod9Ghpw/h+VEG1aSVw27vHqKO
	 VkNberArUH+51cpxXEh4zKSx+5CRL0r8KLPWCOAd/CDjB6qywO0gg1G+BRKsiVCi5pxqX
	 YJtcboDAaZJLhFUj/y6BHAdK5tA2rANbO+qErEAOnj9dMxxNu0lM6naqsZgkX30v1JHt4
	 WyVHfGaOgbMXmEO9Zo1ZsNIGVzoMVWBUqjRfFx5dFtlNbvIAMyRB6bW6k7h0Cv33J7yof
	 AHil+9DXFViLLe7EBsWzFAvXjOgSZQlP2Mh+RWx3Zp0Lt+3tuuTUNwakUthRz64W2XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790505807;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jYmtUND+/kczrpBrs9ILGylsQBk6ykXxKpsTgsudNCI=;
	b=j6zs+2nbA5A30jawhakVr7B4G6j+wvT8GfGtZI4Op3YKjU3vwtnMt84khyfSdT78I9/c
	 OSH+eHoJ1RBf243XqMmrFPsS7Q1IkVz+muAv/M/mwpZ4CqcXvRNZlAn3Kdh5Kew8Ju6lj
	 EA8CIz6uuLeQ9HK9MEFon/2X42K9shdLXjNDOpoq1XJ5kkjirgpTz9lRA2XsLjmgd5Xvu
	 3nxOr7VuwfWzTZp34QbJlimVkNJqqxreOtd3sVs+xyl/eQ/Z5cQSWfpEqhoAfGKuxwshG
	 TAtnLuaQTStTiKLKdK+12xzgV56r4Zr9bviD99iKeI8Hra734x0znKoqbQeaVwMx0RQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="RCuzoDn/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790505807;
	bh=jYmtUND+/kczrpBrs9ILGylsQBk6ykXxKpsTgsudNCI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pcXMQENw7O27+v4jAG6F17FkhnbwfivUeqKAphBm9qasZSnKnporPD3wPVEojFQl5
	 Dm91T8NhbWRfd7BewqF7q42W8Ujv/gj3CTqqox0Se6OzPlfgMNuUTc8hDYRv/zfnDr
	 e5PGfzdyqG8XO524lc8xrq9YeKNG6ARFRT35jr7eNv+pu5B52mFrIQIoJ7zi79YQ21
	 X6okq10PNEI1TRd1bkfwwqBxIMCkpav3v3O1gWLiM6sSasH+tH3sPq9qvfSHVyy6+j
	 HFp28dozS6yAmTfEUAvEZyqLOxsK2d/z0Dc2ChlalJrkZpphbMCndxlahn4VH494RH
	 /GQAYTV4J8lpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 062B74081A;
	Sun, 27 Sep 2026 10:43:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B8BD334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51F4640809
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJY2Uc4rwwwz for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:43:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A6DA94081A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790505804;
 b=M/ODDCT+8FMTjFZOEjCos3GLusjYEqwGFrT0lvduHMmnSL8h6YXJXht1k7Wxkqsz6bqK
 WfJBLYSm2ItlIO+H4JmATlO6Tj0vBGZzBlQNJaN5PDtBjNRZs0KMf+XFNG9fzmzJeiP85
 knPyKUUQf9o8SXYEel0KDTi4VDIkkFoNQt/2N8wgJ14NuWUWql9lr7s2cy0KvvRu4SyP8
 QuDHbZy92Qh8vcWl3mTm8UOnLQ39PiCohaQu4M0uIlPYPnryDpQS+EUlzpTnMQvmTuxQ3
 yVgI8Z6om7Hn2HaOWeiZb9zpAnqhzlh3GTzswL/ZGyezFabwt/+IWurjCgYgiOkaS4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790505804;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=laD52sMriXitHAxg4p0kno9Sj0CZQ1LtBTM+m7Forbc=;
 b=SiRZ7/8HvmCTWBM2jjogYlOvPJw8swO41D2yyV5g+iDadik/RUmPEayCvVFgHJEOi/vT
 FA7WyxWZzV2uuCWOZyKvW3q/8RnY6NE+EPjzOGgth4AAgCixAsR5Io26Ce6PvtjdGX8kg
 g5bSKDJaHnCQKzdanyouy4sGNQyZgSb77sOZ+wBAfi7/5vREoGyJu0+1euiAhpWOgPgis
 CU0DJCxFFUlsqfSTHwYau2GUpsqGiEyt7psDeAMkRh7OBMO/G81iJBtTddEWQ7EBnu5YM
 Rye+h1UFt05aI/dZb97FZPwEutoraijpbXh8RKmbIbXuU3y/FteNNCkZakp0uhSkIrg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="RCuzoDn/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RCuzoDn/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6DA94081A
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505784;
 bh=laD52sMriXitHAxg4p0kno9Sj0CZQ1LtBTM+m7Forbc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RCuzoDn/lVRFGPZq4pLxyEQwS6XdbhYfOqamx94qSeWkJJC42sUg6Tv3tYaUEbwrT
 F5mvhl8Zf3sGVD/SYhnRFbSKngZVJiFXuaDRriMuwjUTeYtsMZ3QvBVaWWfJlBOlhd
 Es8pbQrOXRRxliheVgY7mMPIQUfHvQb8N4ZOBImMIUuxm8aFGVpohfZg3aJIHniKaZ
 RYv0hsrQMGdJoZSDhJGgIbhundaCLwNgc1JUFQifQJGoLI+qaoAyJq7El/hKDA0mnV
 p+2LmK7lev40rqDRRfBYgMjsne5srLFAmcOeChMEKXLWCtYMAK8omCeAK0KVVT5+ee
 L9/YfWnj3VjbA==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 tnSWkoPe5WN+tmUF+ju6csRwkVOerV4tbQHYsSHs/eByCH5AN1Xg7eTeAPTcdENiHzvrSswNCP/
 OzAsfwH1A1Q6MGi/wRNJtFeaJvO6pSpiKb2RvzjOrrs+JuurOiX+wHbRBUviQhn266/0vN2WGey
 316PL2091/TMM5NDyhJK+RCrP4yeigiR2AHwEiJNOg/LEMF9DOJ0kN1AhLXmTiaA3sH27yrqfC5
 fjF2nsZXyMFCYvMl77XS6S3UmSeSKia8P8TwcgqVtDalNbtlgfDgyRg4M7/XokepHSjB/gF7y9R
 X4eHtZ7RFHiNavWITmhJlrBFedQ+V1Qzvo6cVZrsUjk0WurYqcrK6ZH5AHwAI2WHpN5sD+k7iaS
 z6mRS+lWfmybMzDxNGKowA0C/4qPYMBQZCB/0tfIbvQBDIKBS+UrF9dnjyoQJIhKWHR3o20Vm6w
 lkK/z6mgsCyil8jPvSwuQ0ibLixbptf7VjnDtQpl7tIbJbjxIMHDxVEEeuT5FxTsCfTJi+URb9B
 kLwkkdNyH+osYBfm3RicFMc3abPvewedMFakTO/zLEp7GPTAO29L8NJl7IWZnHbkYMWAtLbAZtv
 lebx86Ciy+gL1DzS9r5y8Bp5kP2iW6n5rTy370WYGFYLvxCqPhjnvTfy0iS4HZLjBxdLQpEv85j
 EzbSgf68bloK2hPjeuTk=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4314BA4C4F66;
 Sun, 27 Sep 2026 12:43:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLW-0000000007a-2eBh;
 Sun, 27 Sep 2026 10:43:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:39 +0200
Message-ID: <20260927104301.1801638-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 01/82] package/qt5/qt5opcua: remove package
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

Build is broken with the upcoming bump of OpenSSL to 4.0.2:

x509/openssl_symbols.cpp: In function 'QDateTime q_getTimeFromASN1(const ASN1_TIME*)':
x509/openssl_symbols.cpp:1244:31: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1244 |     size_t lTimeLength = aTime->length;

x509/openssl_symbols.cpp:1245:35: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1245 |     char *pString = (char *) aTime->data;

x509/openssl_symbols.cpp:1247:14: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1247 |     if (aTime->type == V_ASN1_UTCTIME) {

x509/openssl_symbols.cpp:1307:21: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1307 |     } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {

and mbed TLS since it was bumped from 2.28.10 to 3.6.3.1 with buildroot
commit 3481a9643fc7223e400ed877f08ade34d44e6b78 as seen by the
autobuilders.

The last release of the 5.x series dates back to 2020:
https://github.com/qt/qtopcua/releases/tag/v5.15.2

Fixes:
https://autobuild.buildroot.net/results/1f0/1f06b1efdde65fcd99ff79a63ed01b749788dec8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andreas Naumann <dev@andin.de>
---
 Config.in.legacy                   |  7 +++++++
 DEVELOPERS                         |  1 -
 package/qt5/Config.in              |  1 -
 package/qt5/qt5opcua/Config.in     |  9 ---------
 package/qt5/qt5opcua/qt5opcua.hash | 10 ----------
 package/qt5/qt5opcua/qt5opcua.mk   | 19 -------------------
 6 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 package/qt5/qt5opcua/Config.in
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.hash
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index bb6257f532..317c22befc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_QT5OPCUA
+	bool "qt5opcua has been removed"
+	select BR2_LEGACY
+	help
+	  The qt5opcua package has been removed because it is
+	  incompatible with OpenSSL >= 4.x and mbed TLS 3.x
+
 config BR2_PACKAGE_LIBCPPRESTSDK
 	bool "libcpprestsdk has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f4b746290e..56e3254a57 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -203,7 +203,6 @@ N:	Andreas Naumann <dev@andin.de>
 F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
-F:	package/qt5/qt5opcua/
 F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f1b16ff39b..f5245e723a 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -49,7 +49,6 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5mqtt/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
-source "package/qt5/qt5opcua/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5quicktimeline/Config.in"
diff --git a/package/qt5/qt5opcua/Config.in b/package/qt5/qt5opcua/Config.in
deleted file mode 100644
index 2b0ba37af3..0000000000
--- a/package/qt5/qt5opcua/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_QT5OPCUA
-	bool "qt5opcua"
-	depends on BR2_PACKAGE_QT5
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  The Qt OPC UA module implements a Qt API to interact with
-	  OPC UA on top of a 3rd party OPC UA stack.
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
deleted file mode 100644
index a325653f80..0000000000
--- a/package/qt5/qt5opcua/qt5opcua.hash
+++ /dev/null
@@ -1,10 +0,0 @@
-# Hash locally calculated
-sha256  fa8e0e87aae6f321aecac2605e6ac1b858ba1ed4db3c4a78a193eb7b547ab224  qt5opcua-5.15.2-git4.tar.gz
-
-# Hashes for license files:
-sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
-sha256  f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d  LICENSE.FDL
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
-sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
-sha256  75d800e60c8d58c2e7f0338e8552ea6123a9ce7e5dd8e1cdf2095e013b737488  LICENSE.LGPLv3
diff --git a/package/qt5/qt5opcua/qt5opcua.mk b/package/qt5/qt5opcua/qt5opcua.mk
deleted file mode 100644
index ef51abddf8..0000000000
--- a/package/qt5/qt5opcua/qt5opcua.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# qt5opcua
-#
-################################################################################
-
-QT5OPCUA_VERSION = 5.15.2
-QT5OPCUA_SITE = https://code.qt.io/qt/qtopcua.git
-QT5OPCUA_SITE_METHOD = git
-QT5OPCUA_INSTALL_STAGING = YES
-QT5OPCUA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs) CC0-1.0
-QT5OPCUA_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL LICENSE-CC0
-QT5OPCUA_SYNC_QT_HEADERS = YES
-
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-QT5OPCUA_DEPENDENCIES += mbedtls
-endif
-
-$(eval $(qmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
