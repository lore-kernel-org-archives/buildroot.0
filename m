Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CFEC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BC8F40D8A;
	Sun, 20 Sep 2026 17:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6FvK9Ugi15E; Sun, 20 Sep 2026 17:08:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 10F5340D8C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924118;
	b=HrfHX84Ih6+52pNm8vcEHzo6yLZ0iFFvNLJ6nrQs83WIPQuy9fAW6zKjj4Jm7a2AqjVj
	 2allkJaVWQQtUTQu7xLxplo9g4sRidFiNTFBsV1kgu6Lha895fBcgQ+BsizF7rylk02Us
	 bHlmNB22TtoGYe+i/SBgUTVErMPLpHsbhe0GbQlyv1mET5Y0uuKw5EgXFIepaF/a86l7h
	 WJe4EA6j46upz4YMFaA57Ct8cu8krc1luw0UczoYIe+xIx07yJYUj1Kdfh555hQ8oQvcJ
	 oVpQY00XYmftwgpa3exLGcDYDdG/GDlGx7Pl237Y8EmcVwHZc03ZAH0CsQnStBrABRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924118;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GK5h3zmiOj9IKE1XaOWeRZ63Td/hWI+XhgPBT98CYu8=;
	b=WOcM5dQpFxbjhp3BY/ZymsE3If17J1b4dPeVGhS4SqKNYJ4hUhckHAgJyWUPCABJrRo2
	 +cImWe5Hz3W10FosnPhlQoWVsQ6xHt4fVfWQ3rYpvtuA+u5DmmujT+1Ccg9ilyJK5JeVL
	 tfFGdTwOwIzRLgJOR2wsNh9TqBVLbJR033n0aUskBgEACCS4vnXpqzgILj2GIcQdZ+KIH
	 cCO9lEVRW9q/qYqfy+Bt15UKryPKZU1s/XNPVROaqNHiOKcvwpK8aAzDjKyTwnTajTdx7
	 Qa09imQiOM/gbaxljVfX51Fmxy2yp7RWsKiPuAkTECPqGiPaOSlQd7gNbUcVufwessw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=BDO7PwS3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924118;
	bh=GK5h3zmiOj9IKE1XaOWeRZ63Td/hWI+XhgPBT98CYu8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rMw3znAnpoTH41KtjId7mtwpwuMB+208u2DJ+BRZAkLMIleVensmgmW5XZ3fGWlcj
	 mHCNKJ2k8mkQQgnTn8F6gPf1rxRN5PEzvjGRt62Ot6LB4NweJlUp2SevGP/aBvNfQs
	 6W82wltt8e2tlbhdxGwjtSs0aXdz9EUHf5ZJfZieUcozyX67WD/6PIg5M/zvG+xZr6
	 SBk4BgwN3HqF6c8T99OqWzz8RnBvxIMXrj+uq1EwkRaV9Qxrx1XzFfYpyvJSrZ2xDp
	 sEKtkMJTHvsXKiP8vp2LIqQpnyIhYMGcUNvZaKgDxnpa6MReWUmtHJ2GcaVL6G0Nfe
	 98+pq+BiWFrbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F5340D8C;
	Sun, 20 Sep 2026 17:08:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA24DB88
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B72A140D7D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSM5o-yg_hRm for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:08:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6801240D97
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924115;
 b=SZWeys6KQrWQqWtaAhialln8NSSDUsJ9bdCES/Pq7dcqjL1wXTy0GvS4WYkkOb0Ge6OB
 8rq3de/RZDyyh9yod1nr5YHAmlJLS5MfIxO03/Q7a5zLTV/M0fl3fFx60zKnvkmpPU1T7
 uDdRWj/M5lEoUHLmOVrKnTskfEWMACyvWLnAVphtgacM41yAXYksYfXMJwyzMl9vp9Sov
 mO1BIScd6ySIgSi2dS7LD4SPDV7ovzN8SBuEKlPmej5QgGpokFJFWK2IX5+CLYYJxBZlw
 1L7gUFCOTu2aWyu2W6ObJ5kw356YS+1ePVWGp5X/GVgpUfXlnsXKIWdXTHajf4LXIzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924115;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=8U981wDzb+tkjJYN4EF1kZW7rGEuWlcjbCxgKjvhUyY=;
 b=WsZo9FmDiH6flUW5vwpBwlZQPI9P3GFuC7fxe0+V5Rf8H9bB+PAcRSHmUU25uREYCD/4
 7Nqa8ieNXCXVPefcjtZboPKVkfbK+tp4LvWaTg2qYm8ILNh4KCy12p//4iWSaPygd0Bio
 WCLDn9BQdmZcADdwZnlSOzDJhw5GgRfnPobhfPAE40C5Pw95WHpBN0xXuqobEx52+/9jU
 W3VCFPuheKEo5NGP/BZ29GQUNwlt4CU1VM6wuZAzbpsUcIfqE+8Ksm380Ch1kH2DufLbI
 5d9MlBIj7kwKi0Ytr5gsAg6Ckd0wRGC33/z8TaazCUHvKzxm70qaAPu00HHXBTAOZNA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BDO7PwS3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BDO7PwS3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6801240D97
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924097;
 bh=8U981wDzb+tkjJYN4EF1kZW7rGEuWlcjbCxgKjvhUyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BDO7PwS3uAkjN6GZguG6tgBn6qpAsrhR5//pnqQ/PlQTI319wAObJDKlOEUrU571L
 ztLP5jmMIKFcr9V9Ta4rU/3LNraKzsczIWqdzd+8Kk1yqpv90tmF/v1dSUxC5D9n5Z
 iuR/KZYYkJJq3SWG0lhEoBZfBEKqKaY59gQOedoNluXHFF6FfamoqZdU2eNy/jFjFK
 P1c/z7WwznOp8g0M3mT1bxA4mNM2xbE0o2VJEMEwYi7cvU7GDpsh83Q7FqfySX8jGg
 rlkVviaui6kQLC7g/UP9r77AgDJnVEEx2cWgx4fvjGcoZpNs3yoCC8aO2uMtC7uIBy
 uZxOQ4X8qt0tQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:j2COvbmNM/nfsCN1i4HOKyzH+xhIYUGPMCv6FSDGa9LQrlDkUKqf5SQTCqkk+E4/qJbVM/DOVnaFu3ohbd0un2mHH0eA2hT9d0c+FaeUtIVl+XZ+Xj9XNx9scsT4AsAcpF2E9CLN39ZtE8BjvOCmxKh1M2gBlHQmGptaBZOun43w2knvDDTl2SgQRCjF+DBY5oLqTXMQOhaMKr8idmxNKNtlBZN/0VrzZpbIdogBrxpWz7LBskaa1Ccf14b72H+w33S5Js/KeOUsmtB7jO9Mj5z7gluDA+cV7+Qgh0Iksu08do4vLUWXNEc4sWK/vV6wBFdYiLYqemTKTWQYmLGETmvOjlfl2j6CqxrguaF2cUNe5WxeqVbabsEOoCOU01wTtMiuR4uII3Er/PzUvKtd5Pesxp0XgaPUt0bqtzonR4aD3U46r8fPP+JT+HoGoTSTK/pfrUSqUUA6FWDUyNWj3DfOPTvc3kbF8OMDeYBhwoxRNBqjh5qjReUGxtHStoM6QZvdRjuKsdOqeJ80DphvnGvVR7YQLy6piaQcHI4nuPZyFleoNmmJbcDHcBNSkZtQ+6x/THGTHWpnMN6x+aZbO3fIcEZCD0lGfnlms3pr3+IQiY
 6XRDF6uLhTj/+m0P9XwLa1f/dKG3xrlze+AR0owBADLf/bIqkUec/TtdwQ/rL7ZoYjOPMgtQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8BA6A4C47EC;
 Sun, 20 Sep 2026 19:08:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1V-000000000o7-0uqK;
 Sun, 20 Sep 2026 17:08:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:08 +0200
Message-ID: <20260920170815.240247-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 01/67] package/qt5/qt5opcua: remove package
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
index 62e3eb278d..9af019e627 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -202,7 +202,6 @@ N:	Andreas Naumann <dev@andin.de>
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
