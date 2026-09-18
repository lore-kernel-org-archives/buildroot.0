Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49436C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 151FE605E5;
	Fri, 18 Sep 2026 18:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jstfbVMbiDfl; Fri, 18 Sep 2026 18:42:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0548460617
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789756959;
	b=SNUWqf/1dB3U/dRdB0bt17mUhxSWSdUHXgrGC2Pus8Rq4QJFvQSYRBgHyDhGwhqDBW3y
	 1GN+wVXHyD67P1lpgIrxGeRWxqKMMksFlReJhPCq7dL/uNKtq5sJwZuoaFndf1mVvXt66
	 UkGqfuRF6u0sFyc06j6AVY3vdFsGvNSNcsfd+r2OjYNVQabALV1ssJFRXbJYqMNea9hzZ
	 EJ4X2ftDaVvtbb0SgbgKrZbnbjkpCa5nBGB0BzxIlxkZpBSkoQOXbhHi/abNlM9fq84Y9
	 MxqYu2YNEACNgrfBS7uaRg0/gZQkCfoj/O2gJayYRbQQj0zkIoY6dAik4HjArOliVhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789756959;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ExL+7Y48dBKx0gmxSR0D/PsIy7izUXGkcHWCWJVY6Pk=;
	b=aSffXZgRLfEsefpnDWS97tIsnTyQvukA7He7SbXZiriB7naZeYhnY8Pw4x5utNMV1SuB
	 c8augWTjgIeDUtq4VHoDds3eLZgN0owiXo27LBFPJj/8LEhen0uev/VaGgrbq8ntBVcv7
	 uA4y508ic2VEJ7Q6KpIr+c27p8oysRk+V268r+WKbYXZOmJmqFQGRiFQ4L+cLPHicU4XB
	 jIjdvAs6NxQANTIGFDDT/wDKnyXxcjM+EN6hbk4yiHkOcX8ebfZhzqL6YUbafPjMQlw9j
	 /9Hn2p3Z/0kkHUoXvwTEOylLvqjSPljE9oPecvk1Jz5au0NQR1g9QnSqaGTaLU3967A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789756959;
	bh=ExL+7Y48dBKx0gmxSR0D/PsIy7izUXGkcHWCWJVY6Pk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OaQlMhegthtxCXx//N1HtE8itfCwfHrsGLOc0/26o7rG51H7ChfVCoDSx2AwphHum
	 dP49rl4vTafz5UIOLTlnxf6YIA9cGbQMIVzj8G8IRJ6dbFkHxn3vghX4KAJnnNG51r
	 Y1xkiwC6Za30SbgwwIdiVz1Z23Dqnm+qC3Mm8a95Xz+xbZGJyVlgleNJsj0IF3hoJR
	 +YcYAkDE20Be98Ls1Odeevns6M6iMpKda93arG11GEA6WAaquD5u2OeNxBOmi0aCur
	 Fhb/u6lkcRKCnCtUAsVLrZOK4ofibvpErcTGJeXXon+dGIaB8mXmHXgHJQ6HfclyZi
	 u31c+DI+vZmVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0548460617;
	Fri, 18 Sep 2026 18:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D73D237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 833C38126A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2n_hZUL47-3d for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:42:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6DD8781265
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789756956;
 b=QA78FRT2R7Z2v6DHCTsqpDiEBTP5r3QDJg2x9vKMB5U9WhZtSSItc3pCDMRvr9EtNzXi
 DPQOWBegRL2FxlIcsDvLr5yAoYXmuLNAoJIX1UiGbT/C9GNEurkd1rHShAOPx4PMsQdmZ
 CHZKNqWNhQnPHz4O+rCzD3FJj5lpVjN7QLwlc3HT47OOLmgFf50tjIBUEzaY3772a0lfE
 LgOOMFN44+X8JZwo3xTmSdAY4oFi3+z+o7KGdfPc9g+apV2s2UW4eND+oJ+dGTqMZcWnn
 eJcnRqNgyww0azEAhUidlvJrGMKz6WTM246PqLZ+37qGDm3hA0gUbGLgciMLwUEAwtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789756956;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Q4qXDq7MWqLx5tVwg6jkJ6QLugU3s8fDUmEwox9gutw=;
 b=LW8VnsKRyNS78nu3hsyZ8APWYxIWZ811q5+vRN3peG5lJsSSotgrOkh1AnWUTebmfMqH
 9o+10l22aOt/QjRLs3RnEruyApOJW6r5kOIyj2VYgF3Rc11oCeUJtV9f2y13DoHC18Heu
 GWodygI1jtUSDUiRuFdDgPoPotbM113XlsYEiHxN8GLLDdAlRoxVS8Kb0sTgD1myHaWOW
 dnJ4HdLH/cr3WYGPV2HB78ce+qdEw3mYoplmtxRzrsQtwxRPaCULSfomOFZqHqG7fUd/c
 hFrRpZkjCoat16q0VC0Sh0Pj2UmsCt5b8orMYIrIW+Ziwn3WcXGjDgD7CJdCciSBEiQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=f62NRtWq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=f62NRtWq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DD8781265
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756904;
 bh=Q4qXDq7MWqLx5tVwg6jkJ6QLugU3s8fDUmEwox9gutw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=f62NRtWq5Vxn+Nrzp0kuh2q1RAJf5TNWCdwq1htbDlPv5DOeGdDuaU2n3qGd3oIYH
 9NYankBPT7slE9/53uYVahqYY/pPteJhCjtOhCcAl6BKsNoS1VE4bFTLARTuBqBZL2
 SBIvr9qOHBnYox8e7xdYtOZeqR4DJoxr6K692+irjCsODR21GtJCJt8a+vvf/yU2PT
 e2nEVLMdew2Tni7D15boAC55SbWYKk+gFkyt6+4dk7D5dSEro/o5N1vXkvwSIttjon
 S7qJ3blRxtZ23NJJqyvxHSlabQio8yBA+6J86tqApxC6UMjDzZp0kCZ89L54tyeq5L
 1XfUWiFcQk5gA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:6tJOqpvrt+d4WHuzDONlKz2K5+UMlqZCthQ1usxDGsoC02Twlo/S4/teUsaMYWzSOZeoyMoN4zDvslcsHjrRCo1qWkNtDU6JuQwEvFTF3jZ7db+mFHa4yTHsyypvR6wyHjVsDHQkH1zVPvhnSztCYtKcBjUOHOMEAVIqRUDSnjroOSWjBOOO2UKL2WXtB827T2PPW+Tl2yBmLkJ1CbKmiJGE5NoU5MPHxij9/np7A6nzpzD3E6UW+DmNJ5oYx743IV+uQhMz0oCsdM4MN6Y8cPftIczS3ytH+TaErv39uRDVbKIVUMm43M4/Jo5xIDgOgmkXzQEe3BT53sp38hSaTgt+oMI5qWCJMl92qXVGERrV7FaO1ey8BE1nwyHmlKDolKFa9j6CLMQMQPYJkHlbyzNOukxri33vtBomZWKPbyCh1URfZMNZpPPndmp1dIBtkZo9z/RdfMaWMw0KNPgTgA0EpB+IOkEnDHeVkaMiMZORJc/h8Kh479aZa4EATJ0gGs+xCcHHLRhEebG2qLicWpGZWv9sapJWpVukenWVkU73Jgn1WuOrx1fs2VLQ5Wn/tv5nMdWBtUUl70jDXbnVDZhJUV4qS6k+Rt4NlYTYVsYWf5
 ydeHFLnNmkpkPePgnc835Y7ilNIwJChQAqlbjb67d/T7VrAzRj27f12It4s+qV7U2CP5ddoGU=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D95AA4C46BB;
 Fri, 18 Sep 2026 20:41:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWp-000000007cB-1zfI;
 Fri, 18 Sep 2026 18:41:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:26 +0200
Message-ID: <20260918184140.3631274-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 04/77] package/qt5/qt5opcua: remove package
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
index 9c543ee8d6..b5c7705a5f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -199,7 +199,6 @@ N:	Andreas Naumann <dev@andin.de>
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
