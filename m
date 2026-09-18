Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A63C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5D6860617;
	Fri, 18 Sep 2026 18:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrh2DgZZUQua; Fri, 18 Sep 2026 18:42:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D409160D77
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789756972;
	b=eDGItRle3KSfSTmm0vPUVCoOO/smYmm1+sn9yxxuO9n5kjG5IL/lL/0IP5HbpCbNsb5d
	 UXZnaYC0gkIUpqrsvZeTmdRsKeuTjvVFagVuTvbASWz7Bpl5rHQzsGSnc2oECpHhue/ki
	 AayIfJQz8tTCuTkdc8I0lh9Pja8RdBHe7V+Z+WJiseeGraonCmCiOqrcOVbCKr0CybEx+
	 JxzF7Fdc4EukP/2/W7LicVaLcp8l/XtMcE0jC3poYpKiDGdnocnkv+WASkqWaMLFaJdUJ
	 XV9Cg39+CDpxnx1pU6anzsounVg9QWOMKniYRmJ4Bd02TwuyEh9bDSyy0F36lrvXA/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789756972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qCdFzGBgjNjx5OnWHGS8EJFFgpMTv6rG6dF27lWgeto=;
	b=NwzJiHkihKsmXEcthxVkPlZuSD/ma7LGw5NJUZ5iwhX68Fa4dtcGeZi8BqnzcrM3li/b
	 aqiMTRbNABGyXsW8T3CwIz+LcGR6nG858E4nYjOKsBhSmOKHLQxSI9ykYCiGS3W58gAgg
	 Z4XYvnvk6fB9ewObr/EesIPXwIfK4DKrcW8hVDKkpxCLZSG/JCV5nWKyk2Q3gDVajUqhy
	 gJIb8eZVpYGt3NBXAfeyBvKk74z1v+BU5WSqVWnMOMklIL2zVCvF4Hig2jB9Fi+gMV8od
	 vbcG9yjrC62agc1bEijfDhXOZ2JZttVBtZE72mJ26v35Az8DbVFh/J9fP75b39MlCKA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=JiBgYIZe;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789756971;
	bh=qCdFzGBgjNjx5OnWHGS8EJFFgpMTv6rG6dF27lWgeto=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JGhszSvn/LNUsL+Vfy5IFjc45/WJXChV7AmtLO3rYhTLAP+TMYRbvIZOHZMGqtc00
	 gRhKA8rEQbF0r2KPz06DEdbH1IrUhG/pRcP7yHvYdXtJxPrOd7koC5f4T5WM4CLAED
	 oQByCxydS8Jh/sre/tA6kIa9YF/Lndg/021CGPquCz/mPl/85PPh0+pfFcHfOkj8dS
	 Bkbotnhip82g5ph5E2lAFx+/kf9hZ/nzYzxUcYdIWLOcil2FKW+EWQwuu/oZGpb4ZW
	 zFOarCiXdDD8nz5MSUPsEiXuFviK3JOdwB/XjxM6ExKg2bT6IG6EZBV10gzqKczMWi
	 Oqj4N/mRKPCMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D409160D77;
	Fri, 18 Sep 2026 18:42:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81CC925B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7400660617
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jN8xqlGKkbwN for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:42:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1F05260D77
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789756969;
 b=QhClxpl4UY7vchDNac43B+hnsK1w9wsSmd0KkfkSohczPG4nwP8SOg77ImJB9xGJpRaq
 C/a1ZCPZP8khdUXikTBldA3xWZJo1lNPAsKaM4KJuoGVqau9TP6/AkZ9793/DIL/67qXg
 UKU21/Mt48wVcqx/U9oC6yTme9OJF7Epvq+kBrplazwXa9hpyb+SmH09peAOv17j0TcDy
 xtirsiKspuvmie6Z009yez0eFOLX1K0JmhR/wUNs72R6uwcmK8EGefXuWfu4U69FkD+nZ
 meRer9OOVPro/M+wUW8Pxvb+vHeAbNg0Un4ss0lCs1I4G6gLWatva6unjnos2bsv34A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789756969;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=D4k8yf/8pK4OUbN3OQFnfOU/dhlo4EPdKG5PXCqyHfo=;
 b=NiloQN2oGPuI52iecHrKOzJM45R54dP+fnMdiMAp2qYY+2mFL2hVjl8cCALiz4XHaavi
 POVXU/mKUQO0Jf9U/zWk1HiyC4GwI0rSB8IkG/n573JA9MTn9vkQU7Tfb0Kkw627tXnKN
 8odvMbZkdwLlQAZYbWRC+DWBzsvcEh6879Jf0/XW65HOLWYZylYLcU5cdx62ZgZ2Bil5b
 64r5QwSqs+hF1DnMCMRPv87UDw0ZJv/9a2y1sK5SSqb6dhizOnW7KQ4RhzaEBFm3VWNct
 bRCVfMMicvfGuACOJnQbEBde6STJtxQoiRcoxlPu1+Ss78E2XlapJoELbW0cMk6akAA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JiBgYIZe; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JiBgYIZe
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F05260D77
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756904;
 bh=D4k8yf/8pK4OUbN3OQFnfOU/dhlo4EPdKG5PXCqyHfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JiBgYIZeRqRwqPqq4EEp1O30IWQX6ZCXYCT79PxxsMA0mD9M/E4v1PrL0+0pG6BrV
 JEydZadGQlaXH2vlDYNxrCzdrYd2mnWQpvOed9yfE0cMi3IVBlowXJ1fIPv1voL40u
 AVDbUdzwzZP2uB1ygYfGHMJa6FYnTqg1QXIZeqyYrbGOak2NRGQVmT3COtavMjVL47
 ODFUH0G1bta71l6fUSl7yTjjZbE0WWEQBVbmaH/G6Ory6eoUD0BrCCd0F1ldK1/2wg
 njFzDoWmkK8G1lGD++RUdJTgS2i+M4Z8LhXf4VAtMeoWsgtp9CwAxJSW+0tSGyvToa
 MkVN436VdKf8Q==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:Xyk8bY/5GWypfzOkn8DmONqlxnEK4kyHR/oqAlCMqA0S0aPDEnqoF0+tuznx0okSK7AFxchvomC5vRiulr8liusR3HMRLnjenHZ1Evyjjqs3uz5kiVcp1Lm8xyzV0i7jew6VMqfEIb8tlRM17evfsBsgTeVMNoFgRmFuSn621yRYws446UM7txV9clHjC6NvJOJBIkuuDyVQMKkbSA9bP8qAYLbxzlIzhlhv2WvNPkbxbCisg/oZ003B5TYXkt/YQOHizFZXeVnB1vZAlB2DTelbgiuZe+fR+WfTav17bcY5BV2OAFyKyrESd6he9CfeqOsFbFJiMznmsAEaQOfO1AKwePkKbowuBDmP60S3dTnuAeGr2C9FR/xTNPWsLFe2T6p0reENtK9yDLnao82UnOPVQYAWD9B4gvyWcbRR7m+Ltjavje7vtE0885xZFMpVFYuqPgiaLONQq8ExB0XchMd+MCVpSITMmQQ1uXxQ/0BEwZh+ETgo7cSHzF7H3qRglOp43dsO35oyPxZGT7K9jXZOQq4qV3HHdzDruGtzP7AhZgK1TffrHGdz8/4UFx1VfdmTmBHwbIN/5VXnyfv95ObEIGQZTxZANb0Fv/RrdqXh09
 llY6eLVj3uCU5AhYYIPCiWYiuJdui+fEH6C0slJAMYb8rl6i3DWXNCna+RvnGehRrpVeLRTgqpFWBfVv+20D1JsoeehCjKiHcQm3EhDQ5BNrzUlJarEA==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42251A4C46F0;
 Fri, 18 Sep 2026 20:41:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWp-000000007cB-2fAL;
 Fri, 18 Sep 2026 18:41:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:27 +0200
Message-ID: <20260918184140.3631274-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 05/77] package/qt5/qt5knx: remove package
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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
index 06d06110cc..e6c4361bb9 100644
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
index b5c7705a5f..954279b8a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -247,7 +247,6 @@ F:	package/python-spidev/
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
