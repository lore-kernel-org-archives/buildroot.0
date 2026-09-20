Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AA8C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A22C540D89;
	Sun, 20 Sep 2026 17:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vg7-u34DElQ; Sun, 20 Sep 2026 17:08:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 660F640D8C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924129;
	b=O3VmG0pr1AJ9f0n0tGociwYUpcdvpncXv4PpwmsSkqONNXn2XHjfT/jdDJSI1hrm05gz
	 2BA1M+G1dmT397TxAAD+ylM9gBBeK3++aHBkDhBZxEgNjFIGu8JzWY2s4owvrQddJg3Xb
	 lSSS5Q1ZdTWqdt+D/tak26fQ/HuFKfJ7HIDVXM27rVXHrFR9zWh6zcOZnWGMjJqSVcO8e
	 nl6bopuAMvz2xaCN1fCMr6GCYnDpvrgIOINhLimsLUR7XYIB7YgIXtrIRuNnOSPyW4eR+
	 eKp0d3RJDV5bLRi2eUO6i+xQ/972awRu1K9KWr3G1kDmQZDZm7UtztHesKDtZtQVmVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZXnqoVLsdTTLOp+gSkudV/wtngJ3K7taQidbBvT8K1U=;
	b=AO1QHw7WWlMnrxP5hVaqMbCFbzDhMKZifjm9DHcjsmq1FrtNDDrgsqND2qvz5Pew1rDb
	 pvUF1fkMETR0DGSy7c8AT2GP4bLDxfDGTkM1Fmx3DzObseux3CMfTF8eF8YMqrE259fEP
	 VhZg+k09Qkw5yLOdXMZ939tvgM88QY2b2eOcXMAJp9mgIfdZr2RwNpgTrFbdzU1tCLAYN
	 zERd0EyHv1UVilPTIip+DLz3cgwgfZbvaN4d1HA0feOcvqZIbhpe40Em7PGaNZP+Hu1kW
	 75sAxTxpeOBp/B5/fPM2eR8xhdLGdj3tgiEOc/A7dYy4u1YWeEwEKF2IEBe8eOMhXxA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924129;
	bh=ZXnqoVLsdTTLOp+gSkudV/wtngJ3K7taQidbBvT8K1U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Xmu0B14JR6OsP23Kh1960X0tj8fq9kN8jimt5pMt+zA1kJKAzThoHXigSVdn4NCzW
	 F9JFVk9jzG/W5758ZsiVw7EBSn2trzxWLzLJflVKaT/HaEPjlCHu7fvPKGzm9KawcU
	 eolDuZa7fB7R2x2kSpDZdZ/cUXRKs2aAdZPWN6o99O+UcqlkKMV6NN99xtku3u/guN
	 c784u8Z1pwh2GDnNql+NLr5/uBKit6PNcLZuYCz2asTLTbotsLSj6YGX9x5KN1SLei
	 +PPNB5qBEgvj1RRJGsNBElzu42a3UNRbk5E1J8E51CFTbHybqI1kPrm4vnPtibzvt5
	 W6Zdo/soN/Pkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 660F640D8C;
	Sun, 20 Sep 2026 17:08:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC89A3DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDF7F4007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7wNEr1u1Mij for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 89E0040022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924127;
 b=d2TZ3HV4Ok/3tMqpSlAkGQEo7MSOWYwdFeI9fXJLsMs+hrcUZPGt3vMl3X86+gXyhDle
 nr4Vl0jFMYbv9q6OwzlYl7ZOBE/QfTF4QInXGQsZCLWySCIhDnWAHXLNVLBGt5QNGE1MP
 azF0tUMQKEscTuND3SA2ddI6rJiQ4xaTaihwqDLsIzCBQkG1hB2M6YPgbRnszcoU9cgZZ
 aofhuElwzUGwutRB+js09lh4hyXPtXE30QYaXxeQB5si+Q6HmDsdeiM/Oj7VU9brJzjuU
 tOsaUsywmfxvkzwBiHUxuoRrO49Y2RTVCFHipkRs+fbvjH9QVBRO7JdarbHRU6t63Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924127;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IahBK4xjGxvHzz78Sm2BG/dV8inj40Uu1uFvQMB2IQE=;
 b=l1Ednz0H+8uyntPiCtUkEB5G5KQ/M6NoSRBvKkopzsYgQfSsTjmDf4o1i48SMwXNrj2q
 mQoUcZijiuD4ynHAFQ6vEfozidhaUxEfWfMzqzIbsFUvmbJNWdcbsALXgoBenjeW3WZ/V
 ooozc1P74incCdaDmeMSizWBHVC4+SFXSK6MTvNMUOKzJePoFq1PYwgtoHwbQJDS/m3TG
 DychdiaCbxN+53D02ETXRif2h95ZkyI813L2LI4tQta6VWU+sCoSk51ICtoC+oKsGg6mU
 A+CO1Gy9DOp+u1bLGInkFLzMOlGFUQbLA+BuMSDKyQcNmwZflXppXQqT4ZIkJuNc3GQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Uj4+YBhG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Uj4+YBhG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89E0040022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924098;
 bh=IahBK4xjGxvHzz78Sm2BG/dV8inj40Uu1uFvQMB2IQE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Uj4+YBhG8zB7qkrem43nDHBjPlNGg/UYXUWM0C7UKPNXsDqAGI9B6Z16YdzGsB+3E
 F/yv8jqw+sQ/eWjnpFN3Cz3CKC/aSNaxX//Xwje/CfdkIGvulQt0vL0UVFAeDk7R8W
 g1FcrKKAds3bNi/GS+LSJTg/OdCcoV5KolNZe69Lbrd37HcF4Eq4aIFRrWnqad1d3F
 4swT5eB4rTRwZrbowW1MrhD/x7uq5evJCo98wsYlCb5V5L0Fa1HY55WjmjEcknZG2P
 AJD2QyVrZLILa08qsbg2RC3DTyrZUV05qhNXRMSTaPwlmr0bPHIb/LvBUPs7KTQNHE
 YZYMKIoU67Kuw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:HdcH4gWGOCjvFhBS0u4Jz7SipouUvzKXnh5p9E8WgZhykGUUtxOkQThvIqPZp+P+j56DZijfWDjuct7oazu+OtqcTape6zejjVizakqyCxJpPS8rTGLGaFhnAshYDLaHT4XWqBq4bRrmeQCyEGJI1EaCniSDHWvf1U19zvnEdhL9tRNCcTvZeDyZ57nkLtyeb3cAqKABfRvKOT3MACFC1G9j9YeqcPE/X97wUyZIEW79idSDox4/hrb+yIiRHdVBxJnS4JjCzw8FkRXWJigXEB8CAuWwo4Zwo0O2D3ZVfJGhPb9HFH6fwpQybgjCMZDDjoa72DwcFZ5yhCqY4ajhwei+mPrPR1SH2yNCX/I23QWAwhYrgmsnVt+qDwvZboL6eJMlCizJCPvEzp2JnHbxhjv+UIifi46XY50ozII47XGAhRsj6CMDSsodcPRazP2Gwleue3Mk9OFfqDbKmh5szWWGhVcpGKxz2wveRxfrL0xA0nTstls1YM/b55DyTzQL9mzZTsUrjknNJSPvZGEycfYfYOOX1B6tPecVIhk39xe34vF1gISU6bD9Mii0AAOHCqRMxP28ONriEtqKiv1YBzmXjo5m6h6R8CX5JZzxg8369E
 xrDfgeM4eMvsPOZefou+ra/dWrhIhr4gLBH8Pe6pkixkuVGj70AAl6HQAIL4PSMil7Z3wDydzJYGci/2n4oAqMmmWRBpPtXG3eO9nu4Sn9GPwokY0=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE9EAA4C4863;
 Sun, 20 Sep 2026 19:08:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1V-000000000o7-1YGP;
 Sun, 20 Sep 2026 17:08:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:09 +0200
Message-ID: <20260920170815.240247-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 02/67] package/qt5/qt5knx: remove package
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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

ssl/qsslsocket_openssl_symbols.cpp: In function 'QDateTime QKnxPrivate::q_getTimeFromASN1(const ASN1_TIME*)':
ssl/qsslsocket_openssl_symbols.cpp:1352:31: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1352 |     size_t lTimeLength = aTime->length;

ssl/qsslsocket_openssl_symbols.cpp:1353:35: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1353 |     char *pString = (char *) aTime->data;

ssl/qsslsocket_openssl_symbols.cpp:1355:14: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1355 |     if (aTime->type == V_ASN1_UTCTIME) {

ssl/qsslsocket_openssl_symbols.cpp:1415:21: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1415 |     } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {

Last update of the package dates back to 2020:
https://github.com/qt/qtknx/branches/all

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 Config.in.legacy               |  7 +++++++
 DEVELOPERS                     |  1 -
 package/qt5/Config.in          |  1 -
 package/qt5/qt5knx/Config.in   | 12 ------------
 package/qt5/qt5knx/qt5knx.hash |  6 ------
 package/qt5/qt5knx/qt5knx.mk   | 15 ---------------
 6 files changed, 7 insertions(+), 35 deletions(-)
 delete mode 100644 package/qt5/qt5knx/Config.in
 delete mode 100644 package/qt5/qt5knx/qt5knx.hash
 delete mode 100644 package/qt5/qt5knx/qt5knx.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 317c22befc..747683ff5a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_QT5KNX
+	bool "qt5knx has been removed"
+	select BR2_LEGACY
+	help
+	  The qt5knx package has been removed because it is
+	  incompatible with OpenSSL >= 4.x
+
 config BR2_PACKAGE_QT5OPCUA
 	bool "qt5opcua has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 9af019e627..6d9ab5892c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -252,7 +252,6 @@ F:	package/python-spidev/
 F:	package/python-web2py/
 F:	package/qpdf/
 F:	package/qt5/qt5coap/
-F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
 F:	package/rtl8723ds/
 F:	package/rtl8723ds-bt/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f5245e723a..8b4903a5ab 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -44,7 +44,6 @@ source "package/qt5/qt5doc/Config.in"
 source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
-source "package/qt5/qt5knx/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5mqtt/Config.in"
diff --git a/package/qt5/qt5knx/Config.in b/package/qt5/qt5knx/Config.in
deleted file mode 100644
index 991e93c8cb..0000000000
--- a/package/qt5/qt5knx/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_QT5KNX
-	bool "qt5knx"
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  The Qt KNX module implements the client side of a connection
-	  between a client and a KNXnet/IP server. This connection
-	  can be used to send messages to the KNX bus and to control
-	  the functionalities of the KNX devices.
-
-	  https://doc.qt.io/QtKNX/index.html
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
deleted file mode 100644
index 2600a739bc..0000000000
--- a/package/qt5/qt5knx/qt5knx.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hash locally calculated
-sha256  1648bd6d7e5d8fc91aaa6db1bf9d2744d0385a087ba78a00080f99f1d5027c8b  qt5knx-5.15.2-git4.tar.gz
-
-# Hashes for license files:
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5knx/qt5knx.mk b/package/qt5/qt5knx/qt5knx.mk
deleted file mode 100644
index 91b99aaa87..0000000000
--- a/package/qt5/qt5knx/qt5knx.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# qt5knx
-#
-################################################################################
-
-QT5KNX_VERSION = 5.15.2
-QT5KNX_SITE = https://code.qt.io/qt/qtknx.git
-QT5KNX_SITE_METHOD = git
-QT5KNX_INSTALL_STAGING = YES
-QT5KNX_LICENSE = GPL-3.0 with exception
-QT5KNX_LICENSE_FILES = LICENSE.GPL3 LICENSE.GPL3-EXCEPT
-QT5KNX_SYNC_QT_HEADERS = YES
-
-$(eval $(qmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
