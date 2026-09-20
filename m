Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66528C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB9740B2C;
	Sun, 20 Sep 2026 14:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8GBXk8Z5Vta; Sun, 20 Sep 2026 14:06:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CFCC040B46
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913188;
	b=KAZS/FJeGFWAS3Oz8QO2hbq20yU7bhoP+k2ihoyUyxFEwcTUzxIcOBVlBH6eu+5hVWRd
	 f563a5ZVhQo4nAViIkqcmRJ0sOLWm8lj5g65V5MtRPPW7EvWMoHRzsqSOE4idzY1YPAf4
	 D74IkibxD7n64NOpKCz0tmsp6sAPWAHzBWdVTliCTae0wwt1M0lSCxj85ZFL0jiSEVo34
	 uaWD2tou2RZz+wUQRB8stMP0yGgvBhXfutsDQ8WTWSUb8ThB9LUD7+wcvsZaC2nPFFfXc
	 ggXUBu9Fm6VCSHzpVA/uY7aXrrjwdAZt7JruXrucxm9AmwiOqTbpZXtdOqREALq9e7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913188;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GK5h3zmiOj9IKE1XaOWeRZ63Td/hWI+XhgPBT98CYu8=;
	b=DI9yy4enUm9tlPn8J0TRu2g50A8jhI34Zip2qV0NkHCjO1bWaQCoUCdww2uxlxKtxYfD
	 Ahi5wXZQPTl4rpu1QGjvGoOA/t3XVr1VIHAbFUYvCZU3fCBS1DtjNoGwT2Yn6EjMdjYCx
	 H/nVt74o/EumfjwHE7UrFSxh66N8pZRMMvH1/BI5sg4uGjKTm0NI9AgFNJxCB7hm9DAD2
	 +53owFpYxvf54S4HsojSReWqt1lUJOQmqMq5mEFTF1Tqrdwev7tjue5qR4pj7emXQpRQn
	 A8TrOF+LpJDfQfe9V+o/OA5Y8RGehN62rMT/zvaksgRxkzTe3qAdWBkaFQOHgTL5dZw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913188;
	bh=GK5h3zmiOj9IKE1XaOWeRZ63Td/hWI+XhgPBT98CYu8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CDmYMrVs9Gc0ak+pz7GjreGa+cDQ3WqHnUfchy6+iQqW6ZQjcLEhlxId70Cupvgyb
	 G8Uv6Eh9h3vVJRw2C/YznSgTkbcomK5XKKs2SyexUUMo9E+uPvE7CQrTkvvhakuHJA
	 TjEqnNnr3MuNbulM0xqc5LP/1/+a0q5MWOlSJnZ9/86X+98MUzc0D7d1t9uP8ZdDBU
	 y0hhu6TuNscYA2U45AGG7T1Aw0kDR+Ulgd/ibNL+Kvxq0b+aapfyBPMbP+eJ8za4iX
	 DSBv03dXL6sGWhxouMLBlZTacaA8mX15XWzOTkUPaBqazZT/WTGU23kbdGiVeAgUT3
	 9uPEx5cEe60wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFCC040B46;
	Sun, 20 Sep 2026 14:06:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5116392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB1FB4005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCCc7fy4NfbA for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:06:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D10BB40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913186;
 b=A6KKm1NqxjeXvPKJdLZxkPFxKa6Zkm1pSjdIY3RYx1fWOGkasDkaqYNia+DvhNyyJ1rE
 kB909KgI4zq2/pXn1FO4sC8nCL1MmO2ylgnAYgZR6hnWL9RXGDzpIyQ36iWODm12F7+Js
 MjRxs92OseDik+DiGQuy87adWsXe4iT6M1JPZgv8JuTLFTUx0f+Ejm3N/0ZiU6sg/j5R2
 RRwVD3nWvWU5V1z/4v3lXw6AcJowLLUgw1RZISrmhRFPhsOpIyhKc/nViQZ/QFQRcDj3/
 SyId20TpTk04oF9blBcs7JOXBaro8YZ9hlmXQXyXemjjsJUqok4dYaerqpHrKwp2xOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913186;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=8U981wDzb+tkjJYN4EF1kZW7rGEuWlcjbCxgKjvhUyY=;
 b=XuWAW2n0ZjFQ8jHYEcZKu0pYG/3ggfscl+QcSijyfbwrVV8u61kP4h5mhGDxK5KLRQ/1
 q/A9HhMFATKC0DyBwbe26LMODFmBeuksPMbn1+sU8xbE7eZBpz0AFDC/ZdlhAVLRpkKSy
 iUdFkaVOoRkycmrm11RZjEkCT4Wj41I/2oJhzb2LMroRMH34kIp0314L1KKkGP+PmELdI
 ZGHrW1Jqg9mA0HcXiRB+lEHXA9rVhhINxEKDjmCzTNIzjtA9Q48NQZOPwjUcalOw3SeMK
 qBzrqmbazwr7xPe2cvHz0Lf9h+KMsDpofdDeNdqHrVT7TEN/5JfN390kU4CEPO1DRdA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Wam0tcyN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Wam0tcyN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D10BB40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913167;
 bh=8U981wDzb+tkjJYN4EF1kZW7rGEuWlcjbCxgKjvhUyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Wam0tcyNsdbFPVdeAyjg5ZQYl1BV/4L0Ez4VNKKgwMf0h1eaqmY2V3JYik9+9/geE
 hUEDWwT16GrCs1d2O8T55HKkQ9uvb1Nc4ZSDPWsHs7V27UrliYutcskxz5o6CBJf91
 T5bWweCQihAZm7/VPAdmTOWXGjPyYxrKtyhArftR1znrMbKSgKNqGKw4bfPsyAhYz9
 4EPYzyFafUVOl5wGLGXSCckrWUDnj/VSDHLetghhy9wBGN1jxT+7Vmo8XdtlgzWfDK
 Gj8qTgCOxRv9eLvs08ojXtOIJ+TB44XhMqvJFyMba9rK9fNS+0WrwasJ+UgyQTPQRx
 aEYZ01eUaK6Lg==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:yuH99NjkRguyrKHoMDXir80PP+VS8a06n0RDaj6r+bovymGyEdVVNO9vw/luX5/Kush6+szZU1DGKKgylu8aG6hBx4MgQkuiAowU3SA9b/VqOCvsy12yQ8dMqx/J6B2hcWpHtTaKOelZ1DLCE3okvqGl+cAeyt615iLtNT5bcpw+8bRtZlZfSXMta1K0uO1sMcvQdOFmm65Pej0vzVbDwowoubOGWnI84ApSbVmqtZeIaIticDy2oal1RPRCQGTVO8kQx+pdjJXQCY0Mg6QBOgVhEr6vQCN1BK6OubPPUqUAPY7eo+i4YAnRgsUEFJjqjFU2SMttc8Wr7vQJak0UpNmW51e4n6DsiJ2GW1DNczlvwoc4kcc3K8PCLagIFr7++wqAGmCk1db33W5Syw5Ul+clgZHRK7LNLQEXPAxtO5k14s6O9d9ux+SvOpBOYMhgGJpVR0CCRt7/V0rJtoCO6sH2ti8MgoBWEOHnUi6m0RsNqRVozEWZ6ml0Voohe8pR4VN3vC9uxhgYfOUWMfu1iJgaXYgr7Kh98Nxipv/+Jvj23uVBzalnkF4E0YTUpL0Jql4RACVDR1Ne5WrqN54J5Xli3GwFSXRuKkNSi2I7bfaipg
 EVhCUl6Rt/DwzRfOb3hhCSwcZULuGrTwc0iKmYLZ2CTfuxUv2aoATjYiAjKw8b3Dmmmni5DGA=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8929A4C47CE;
 Sun, 20 Sep 2026 16:06:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBD-000000002J9-0By1;
 Sun, 20 Sep 2026 14:06:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:04:59 +0200
Message-ID: <20260920140605.3005461-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 01/66] package/qt5/qt5opcua: remove package
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
