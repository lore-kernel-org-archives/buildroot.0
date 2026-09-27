Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9F2C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72CD260640;
	Sun, 27 Sep 2026 10:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aw3vhCouIMd2; Sun, 27 Sep 2026 10:43:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 49CAA6062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790505820;
	b=OoBRPmxwivQMbsOrqtnNQ2wj0ECQR81BYB9Coamd/ZZeZEuOb6wbCFRUvjMQVzKbvAYh
	 SbnGZhkfJvkxa/ziuTAEZzO2LErBQm9HCeY7u/u//9kq/Q/cCYvU910IsqlBzY9pog/3p
	 aOfbiFlL1R3HoOdrMLXuD/Vpv1VMrjbC4IUZx+QKZ24tYV3318jLhtQdEs7Hm9xV9MNSL
	 UVYWqrQ6nLGdDzGrjeJCMhtp9aBRavwuNbdarE4jhy01IaJ5eadGeQONXF45MN36R6r6x
	 ajZqX+9x5GMxprTsN4qFGejwkfrZ05NbmmBcL+yv/tBrs2E+O2UkAOs/dVAHD3E+dfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790505820;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qW1ZwF7tDKAUfhpPEiZQUKILNmrOs2dXpsaxK0CTtKo=;
	b=YEAMsQlWylpXGYW1l5uR9YmN5Fg0RiEM6s+CwXHkLsZEz6RBGD/wLy4fKz0UrKvRU3Ps
	 VHzdt2jt+ieXrdarLm0UBAej9EPIEJYGX2Ad4q9I9cLaftAAVIdyvKKeLxekeGT9mxUJn
	 gfmA4hqgRvg/A+vxam68bNGLKnqUwaXrBegtVJ0OLgqMIx2ftQAjeLqFpbwGEAGYwUkin
	 6XibPQxIN2FLEgSHsZcapRHuvqNpY5Amci0jHiqKny1U9JNFW1Pnz1Yx5pA5mqSCOzZhI
	 neZHX9eVTOZ9z5wd8/Qw/Bb8AVn1fCC/HtM8dhG3YZ/OQvlXrplCECAFCLtd96xBp5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=XUsu7WhD;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790505820;
	bh=qW1ZwF7tDKAUfhpPEiZQUKILNmrOs2dXpsaxK0CTtKo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aZ8esk7TRuxViCaEhVRSxX2LQxLNDqe+y2ps1LjAf9SEY5sM35rUR7Ww5nhcaG1uq
	 jCiYXpuBjGqzaumENvkkHN0KKJrlzQEcGn2Yi9tjmDDcHoQ3TxbuZqH+hPK8piNk5b
	 adOr84uG0f3vbDaV85A3kbcMSMEMaiiUPHjs09DnptCh0Q8cw/EndYun2EVA192Otv
	 d89ToX5NfZUTg0K8zYH7BgiTekWhxeXNye74bzUosfMkLHsOuqwANszS9GKw5LvrEH
	 nEG7UZbGpc0BhH9FZJ/tUUrFTT+bVcR1EoU0lg1C/QlLhWTOThaxE18jW5kLnxWYFT
	 f7uduDf8he1Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49CAA6062C;
	Sun, 27 Sep 2026 10:43:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A0C8334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F2EA6062A
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqbuXNVR99Cg for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:43:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C22396062C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790505817;
 b=LBaW67pG0I1KPfXGxAUuPU9FhB4gYHhulJSPdWOXRiQ01DrX8OHO9LxkiHPP9mcc95Qp
 BGyj4BjQLWfx64Pe8stMVENatbPnmiWkolN8KRhtvbgPAiNBd/TLg2Bmvm6NQg8GCL7bV
 C/fGrCBpo9BgzZCHGASHsX7Dfto6xaRjhTTyuToXhWdmFjINn4VvH2gTbBznv8MPRx4OH
 C6xGh2HIU2L8pJYjL3QVWM2x6y9kavoHl9ZZUeQJF/WkuEV3jJWCWlYXXsXCwvNP6osA4
 RWhjs4C/Ox9SJN2uQ8mUUVSLIQVXEPeMnL8KvYbSELz7UFpoINcQO0P226GbD7Jun7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790505817;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1DOOXca02z0CZBp0NAAiB+FJC4TjqxZeGXOdwHkPsUI=;
 b=kmK/YpB6uqkKvVIX60+IubJfxRwIBVhQbiA8M/AB1ELmYQj7ygSIhXz5E27G6cbRhJo8
 AK9nITkNghAB+XdWzcJrxVYE+R4XQjdQ0NQs9PSWj50TRDHaPOUqdXrnuYuUvbX1W7h0i
 Q02S5zOQunRJS8t/v6zM1CrITrVGUOaV5G1nrSqbvx+ZW9dLNj20Ik5/ldEcfNLs+LYXg
 TyOyS3fczRw2dWCs/vbOHFTzEmVyT7AakuznMgwrI//CU1I+hdpyHlqnPUhvCwTbSfhyz
 6hITLCmOwN9IYRPjhPmqOVOAp0+YmWVE9O1FJgdljUlwZXMl5Pu+vQzhs4fQzzGgrWw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XUsu7WhD; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XUsu7WhD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C22396062C
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505784;
 bh=1DOOXca02z0CZBp0NAAiB+FJC4TjqxZeGXOdwHkPsUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XUsu7WhDyICpTachLnedU9sACBpmpXH6ghg1iO1s7Z8TeA8ljZgbcX9JSrt22VGLn
 dFnQAqolk9EmqFyq9cPiBce2CDt7IhZ/2fHBAZXIgWX00nFvYjBiF/mRra2l0/f2ol
 7RVwuNBwIkS/M0NtJrQV1Z+ROzTA3djb84dbh3INLah6n1d8YS/RaqzTGIMs+5zLh0
 Z2pmZmiCAsa9Km4APHivO4lc1zONEijGD/vBPSqNMC/pyS2ldxN/JrjgmI7WpNjQV+
 ahOUDtCYnA31KRaztZjof8wCet4BaMq9RmAyWiQxWXi/xQQtqEz4qqMHe2XCRy7Yk6
 ewpOfigxEXqQg==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 TAn/wB0aW+kSkgIHKQ1lpoBMqb7mdEeAaBHbXjvmAeKRKY7y8RBWoAPKjwTrv6gr8TbAunOre+V
 1LqwPidMdYyryFx7vyafudFXBf5XHMNEoLbjEq5Imtc3ZBDpuaSPc20H+aRSCKOTZ7xYrmKdueB
 ySDLOq+jPkjNCO902fz4FPz/UbHaOyKANoRG7SqjsKwDW7F38IbPQOQcU1dbqhmeQRniYVadAOQ
 0cwMoOp1bD6pABycRNEJdFnJwdvfRQEfwKL/FyMWUx3q4BRdwf8JdMp5wPv4wv5DBG+EbJl7dmn
 QksF72HHEnY/rvPYJRHMeRsy+m8FHHw7wzf0a38QwA95TxY/8VaKwTQNeTIgwGjpdaSGkBW+fko
 oxWI53hYepb1nCKHjytFQ7akVj3PriMddpsLbhI0aXsOMPx6BBV5EVsty2w2ASuemDRq1TKX1hH
 GwKPsIQOObny228B63W0xKjJAF8kvWqSFh89PO7BW0kYkGZ2zT9rTJcEb0IvyB0mIx587rAqwxm
 4w19ZmEfshzcCxZQF0Lss2Bi4W9vTBVn0LIbfQDrAs66EsKZL6vDLPR/ZTjU/KInJRxGvX2LoQ5
 OR+SUbJRDVpIDknIZQukoxrxnH9xvycTMFCEmpwP1wxZyTAXgkR5oL29V3qS2IwlSaO8DbjQgW3
 FjlbqXT0NGplnP+7H1ngXV7x28/zOVnKtq2FTwnyH3BeZux9cFeuHVc23loB5hw==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63C08A4C4F6E;
 Sun, 27 Sep 2026 12:43:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLW-0000000007a-3KlN;
 Sun, 27 Sep 2026 10:43:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:40 +0200
Message-ID: <20260927104301.1801638-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 02/82] package/qt5/qt5knx: remove package
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
index 56e3254a57..da5a0db833 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -253,7 +253,6 @@ F:	package/python-spidev/
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
