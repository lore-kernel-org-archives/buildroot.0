Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC83C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 15:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C93CF811D2;
	Sat, 19 Sep 2026 15:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJ579WwdgRIS; Sat, 19 Sep 2026 15:59:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C58F98118A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833578;
	b=QajUjKibicIwMQehTgnPC8exZeZNgYpvND3C8Z01VQp1hqEZrE1iHYTZHHK45t2HEPSR
	 P+6oUi509uZwV9PGNPYIHQg1fEsB85shW2I6HzVt6xR68Q0jADYF+ykTsAXACLWGx8n49
	 3GTs9gPVj6+yoFB9F2LCuY1u2e2IOzXdV51nvmYfL0qNtx3f7d/X0SZ+Ge3VC76WwcvGv
	 X/4pFdad2x43dRupoEFn3yA6NGsNvWd8jOza2kTQHA55DfcgH8GK+OKf9zRuODnYJy6iJ
	 xwsnxHBaQPB+36CQNV9FRz85mwWR4LRyg03QKuaaQSra0JEqCWk4o0TV74CwAGbIcmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833578;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=idKHuZ5470KGVrd0PQqVlK+IYYXlqZZZjwmhcGyONf4=;
	b=JjPs7ckYzc4CdCIOmdE1uJL2KDp2ygqBQ0o8yQoXywW1+LqcuWR952Tq8waH4UZEqasl
	 Tyvva9Jc0LOg6ATSoepDZUvtD4KmeSANIVDMQsNUn5LSjB0QJC2h6LraqEFg2Gxpoymi6
	 zTKuRi/oCUhpY0jsv5rtIgglXZh3NyWabmok6NfbQvbJDJEVozeS7IIT4FbFvIOpG8wC2
	 vsYXKXfOiW+6goUULgoENxkW1iRRa0FsKBVK2FbPXGN+1WCOjZ20tPx7hr/2PDAaaFeHa
	 SvoulFvLblnN/ef+T+JLgk+y7E/PHKQMOxJsXLt8S6ciZzrGWU7gQvFxukdqyJVnGkg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833578;
	bh=idKHuZ5470KGVrd0PQqVlK+IYYXlqZZZjwmhcGyONf4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GKNdbvTgtt6Cc9MSe/qLXfqKrm0WQ7XmuAJ85rf9vsOfxFxoA+uOxAPYHzhie+pT7
	 k/O7WcEC5kXSNn9Ry1IqnsNoilomEc+WlmFZ1R/4haLBw+odcQZd9rbcmX/C+7yZWU
	 bF3Ta7xjVYiNYGHmIQuoYRqfWfFNGK6JtnbRUKqUZQ7jp7o//Ls2QvCIXvoe6xYmIY
	 7EviAjJ+a7DE81ek+QW3yaMNgPtm98TK82Y20vQM+sTjlkbdYMbAsFsTDJfXLtBLie
	 BABr5dvK2MIyk4y26JoY7t+wQL91PrvZAp8nPVG/MFKPXpmBXpqWUo4JtNOXSqL96t
	 idojpI2DgmyQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C58F98118A;
	Sat, 19 Sep 2026 15:59:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC5AB37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 15:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2CE360664
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 15:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXTF1c5_t4vK for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 15:59:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9F85160662
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833575;
 b=QRfAYJKwkM+62kDcoJ5N0Ibg/6p5kU9n1Ef+1zTw+d1b4IP9RN0fbNy4umzai2d+sGal
 J1HmXN/CPxwXtomEfiIKaMdp1RldTiCUtquXqlMwLE+/KsFl7AVKKN93D6Rml3p1dWtVm
 vql0USp/tdVRl4cS41CrWYehQ6zbt9R1nZhE5zD9E3W1YEAaUxgyCnkqgQDOLvZtsqswa
 YxgaViS90cWKhzRqSkEHW4tkmq25Bs6kyLgaVZN5VtU/DXUJXpXyIZDQ9dSyu/fCSgGmo
 aERU0hu+LmRvCHb+P8RjbZL+BPPKoV72DcNSry4u/Miy7sTGa3klweYroOEC1pI2FKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833575;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=I9ohyT8d8e3qLB/3rsabkQ/+EKMzPW4UMXzVI3uwImU=;
 b=k81rX/3VNFMoRJ/L/j0oo5shE1+lwqP6hfReoQzch+OhKHyrjSLwnGlIfDkvGW73LITf
 REPV1y/Zm1HXxPZCmcMGPrqlGnc8bW9Bda8kd0IIpzh9utVynLf+3Sbw7NwUryjilzv8W
 sj43ENrZUe9TO10i99cQ6dgdYo2Mpfahq9mBSn/GEW3CanSAsPWJDZPXmwg8U3UEMqpg0
 EpBTvKYmOBwLSEh8fwTZKhewdAKz3IxOqmTqZqaHEBIJgOBTe5rgfrQT53owvqq+xhAYd
 yOKohLBcIvbm4jiZxWWy0CgM7nRhXukXyJdIsq+5G1zYAfLG+nSRxihyNZBgBwttJOA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bAv39hsX; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bAv39hsX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F85160662
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 15:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833529;
 bh=I9ohyT8d8e3qLB/3rsabkQ/+EKMzPW4UMXzVI3uwImU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bAv39hsXtYj/93jLOC9weu5xrU5epFGqX821tstK6Dae9IFIAACKj3eB1MkNj/Ffa
 la0lbnAiq1LvCawkoC627XpZH4KwyXQAlw3Fyl+T7EafIT6GRMFzLK+PS6OhxuhBcf
 izo9+9Y+AzM0Vz9uXQUdD2U76VBHB6wAkfI/goppKWJ5/AAqgedoBy+TN9EYJeKLYZ
 PVcQinudIlJKaVFdAKLDh71GFFCWkRb0KxVpBb/zqRYNgeiOgwspcRdyUcPr65Msd8
 UUB1MKtDZWT92CYc+dTDcVtGqJVUqV0pJicyookZh3M54XUBvuID0rqckLV+oG26nQ
 zwQJLXYuMiLMw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:+4Oxd+tf8bBBs6ELuAlu9za4E3/lP6r8Ila6Ouah4foNddF+mMEeQn8Y3BJErpM1I0ERTUXlG6SfBBI3IsAxZOkbLQ8Uy6M8hHn2qy7gSih8kMA9wLazkAnB1QAEm2dQM0BJ1OC+BPzSVXyOZx1FYA1gkb3e1U49fGrKcqUCEBm3qiA1gH2H2OLxBYYX2szpSEUmbWRkQUj4GCU2j8As1laACl15f0tU4lKplliFZclW/LunIZyQV/z8pzxn4+5DX36wdM+4qkvdUaiB38muFzDsQwX2Iz2/ulE0Dg/wzLSMMduBm8wb6SDbtjBeUzGVShvTZPb+fkdw6YMVCmoXQMHxrxKfGrJCQBghLPnr99orhBDsfk9grHW/JxIjSy+utjsLt7dl2rm+lW01jpEAUFVdcWmSBGJadvwPhCXIGBPmNZqWhlZUxMyIaen02yTumDly2b8fPnhpUjHwaNHqy+hjVapGnogiP0zK4GlTtuv32IJjKT957jR+rOTfzhmbcFHQ55mM8v2mXdUqOdVbryCycd363GcEu5NmAD6A/jxGAh36w8wtJE47DrO1BdNKeGMxpY2BIDE8B+8jxG+qRBrJ84GWMB3plr+1oqZcwBpnPn
 hejy5WjtykIqu0/acv8Uhkt39pZrpasYQ9e2wrF9RfUIGoemIqjrCKrLrFUOYfe7Jrh5s=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1E2BA4C4758;
 Sat, 19 Sep 2026 17:58:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSj-000000005Jx-0lXh;
 Sat, 19 Sep 2026 15:58:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:28 +0200
Message-ID: <20260919155845.5776-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 03/77] package/qt5/qt5opcua: remove package
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
index e20e564af5..06d06110cc 100644
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
 config BR2_PACKAGE_HEIRLOOM_MAILX
 	bool "heirloom-mailx has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index b7c354245a..8aacdb639a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -201,7 +201,6 @@ N:	Andreas Naumann <dev@andin.de>
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
