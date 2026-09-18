Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DBBC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00E4060617;
	Fri, 18 Sep 2026 18:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWeleZEp8af2; Fri, 18 Sep 2026 18:43:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F322660B9B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789756997;
	b=XpTThu1vgomrkBLj2N+eaFD2+bcdXm22G3wbgBLtyWvF3Qjl62sK+wUSZSVWmCdVhYke
	 JHZKadW1vMS4pVC1fchkYsIk8lljKZ1NxqBhwjIgjqv0uq/2/2bMqLXoRv10eEXRsws+e
	 WMteu0Jz0gZXg/Q0vJgZB9IYZ0D4bBTuMWKZOlTbWivuBc3GVji5ZOLJ8wf3ZR8FQJErz
	 JImJ3recGsPNk89dQqj/fVqBHg1qoi7OQ3owOQ16IUtt50fDQANo44x/TdYkADW3Gpige
	 WpWHPgNLksiHRUYRcMM1c3nbNVFs1bE+I19vj0iEFSoh/ubWw4HzZYmW7K0GKzcgWmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789756997;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t/HBc0n9UDMuj86r33h5g9rp3PaYbifHHfOHfRn4qTM=;
	b=mVD5VlCI6vyWt/jCduX6oE1M20WlAYF2QMmdcp3KudtY7zd628dnbufiw0dNo2d+TyBG
	 8OtrpKgdohotEEB4R/OTKf6r4Dml8WV8h73C5w3Ro8nWRce0cvV4bHFHGpXAr3Pu7P+ww
	 FptNZGGodSODB68hH6ySu5QkZ+FzIk5SROo0f0fmtUMPNBooJnHaSWx5/K8Xn6LwnBi36
	 ovZycMuwQlzsJddx0zpH7uBkrzIH2l0WihhgaZVytfcw2CwTpKaMkyYq1kB0mCnK6OV70
	 iQItGZAR0lGY6B+d8sO/fqoT3i5ig7ENYgsnvzo+f/51qS1Mxw/U+XPn98EY5FPq6xA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789756997;
	bh=t/HBc0n9UDMuj86r33h5g9rp3PaYbifHHfOHfRn4qTM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Fy8ZFUuG0KDZt5jm5wglOkTnxv/PJDmnaZEeurk/ZYTUgHMO++a9R5NzrzzzkYp/g
	 EKwL+ZqKX6k9OTEGgXq8fPBJ6Mo5gyjsASQAN4KsxJPDAFWG+sFB4DFOenymoz+Wr7
	 zCOEFeCnMwtS4SqJwuKtHvyMF0KZphYhMom70KdJCVIuwauKikaFO1EJ1Qy9iLIWoR
	 yMfkP46iLDXvHNZNvSgmKvNIRF9Zhc2bpxdAV44bcE5cGjHYzQyoLRkt0TxXAEzYrl
	 EUJkEG1Iqh/NNksKbqtB5m0g+VG06/VluQRg9pF22UD9Ff4BfFQTDytAGjQ/fRSeRA
	 dlvu50ZZmrcZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F322660B9B;
	Fri, 18 Sep 2026 18:43:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D247D237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3DC3812D5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nzhAYwnBgff for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:43:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 842A1812C4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789756993;
 b=PBwtUvTjbNfPYhGoQRNNxqPojaNXxeAtRvnEOocJ/Wvgl/DHxIBOahPkQuUf85oJx6nu
 rWwT5gzGsti352tCT/G1jxsH8uPkjynsUstJ/sYXvSnDS68DiuCTJkWso9MwjwsnFFkJq
 1xFWD5ckpRP6qTmsdjgmgmTmcd8vZgRWa2Z+NwE00yO95I1jyY3f4BbSZ9/7XM7t8byp/
 /6gXdJi5yGbfYQvM0iPT4dEKBGBKwZ4BfGtgsOnb7nRES4T1sqgxonIUOIuD+fRklna5W
 VfVvxXukivOi2Div1AsmN+PgKje2oY4poMC8YVdKJ0RpMXWGmzCN8oPeD5FTjBKKSww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789756993;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0Se9huhQPQ2KHeyS0iF2czBubDABoDFMXHo5sff4qeQ=;
 b=r8DJFu7g/4Uv9MF97g68gE2TY5/hypTjPm5M56SLz00/js6XcSuUMwr3DvBhWvtUDusc
 DOINGN+ya9Mql9IFeG3pIUTnWH+siTqiqDdvLdcgJ5VtC7o7cwABTgbeCXlFr1MLfAm7p
 mx8lzalyek+f7eyJX8qOCfNV6Nxr9KZxuFE6ebQx0BzBK0excSOsEGEtcsMteIP89k8N3
 qrFkLEUpHpim3Hqt3GYEMq+TAX5DhFn/QUjHeqRkOhs1xhgoNspZpxU0nN6WE6z8o9bwE
 mDiWu9Z/cKgBY+TgtjMeqlnVD2JwtrvfPw/xX6yPzVT323xJoexavLKUntz9uvlqoGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PrxM3lkZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PrxM3lkZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 842A1812C4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756904;
 bh=0Se9huhQPQ2KHeyS0iF2czBubDABoDFMXHo5sff4qeQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PrxM3lkZlL589J28p0py2Dl+EHBCSz0mrZ8xlxkOsQXYTC3c3Ojr7IENNHchDuROZ
 1sW0ykxCB45sFhqVihCeOsMUHeKQXQeLCLrLnkm5olw4erzzMdmfmU3SEcNMRwhEU2
 e80XhBlicrPEQAXLJEaipM7Rz9McGX752uFcd2rk3AyvhTecxYKJyfi7H3z0Z3rPPz
 iuNOdrzVdBBLBvnnjtxYCASoVug1HiP5B9TN19jYOJf21T59VrR0Q5gQnI7gRHSlz5
 3RHAHTRXd1YRvBZVlIPbqeGtbl6gikbNgKM1EPMeR44qr3oFURJhSeaob4mDm51k8E
 upHSVcBDkcLgw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:BvG8r/cD2/j7/M3XMmDOWDUI0nK6cwDSed9w4F8rZZLhLr7qC/+6xJnsHqHAjdYdeVaQYuWaMF87Ki+C7fk0mcdsfgBTbQZJSnwMVzogKGsshdGMh2ohgGMR46vKEbM//9IMBFii+LgUXjsasxCOrfRVXYUmBSKPHHBXw5Hb3L+nt8XgYdtXKEOE4zb4KRcnzRD8W6OntvsvLkvnKfMZwvvo5vAuMYV6cC+qXNSqRQ2lvXKo+CFyLxel1LX11T4lNHsyJtz859o5g6DYylOwiudBzEXWTwOfwVUDKHuT6wQ2C9rw2edY6umnS6SkPjIrPKy2ObDvL+FXTjBlcG20yXDbvgDN8HalUikoUQch+kJRy6K9qyYlPlWVVlFyKSN4vumGrmVwwwYIf0AteS1FzEO13v2uKc3W0hRHEpMpjJ+ccgpvDgwS56Cuo5PXwE/K8CU+PB/Of/6evZMe9XpcOBVhFdi38BBSU10Pe14ssq0dF3Rj4B1vHJMon8KLFL2hZ40bFsCcfQoTOGAETueXIrwzKkiR5vUyrmxxA5kG9r7SHmaJFdZIXrmtJM023Ycgsism4gsCEjxLuR9gkEvknkBj5dVn1mWCdWpIN9W7h3JEiZ
 WMXQsJmJ7LDwh02WOv4QryxWGgYFGxBOhb6SZ3rmig3V+wMTNRL+o1y2XCC/sxEl50AS88Cw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 951FBA4C46F7;
 Fri, 18 Sep 2026 20:41:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWp-000000007cB-43S5;
 Fri, 18 Sep 2026 18:41:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:29 +0200
Message-ID: <20260918184140.3631274-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 07/77] package/libcpprestsdk: remove package
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

Quote from Github site https://github.com/microsoft/cpprestsdk
"This repository was archived by the owner on Jun 1, 2026. It is now
 read-only."

Building the package with boost >= 1.89 and OpenSSL >= 4.x is broken.
To not block these version bumps we remove this package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                         |  6 +++
 package/Config.in                        |  1 -
 package/libcpprestsdk/Config.in          | 34 ---------------
 package/libcpprestsdk/libcpprestsdk.hash |  3 --
 package/libcpprestsdk/libcpprestsdk.mk   | 55 ------------------------
 5 files changed, 6 insertions(+), 93 deletions(-)
 delete mode 100644 package/libcpprestsdk/Config.in
 delete mode 100644 package/libcpprestsdk/libcpprestsdk.hash
 delete mode 100644 package/libcpprestsdk/libcpprestsdk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f1b995b486..2b77f7316e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_LIBCPPRESTSDK
+	bool "libcpprestsdk has been removed"
+	select BR2_LEGACY
+	help
+	  libcpprestsdk is unmaintained and has been removed
+
 config BR2_PACKAGE_RESIPROCATE
 	bool "resiprocate has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index d2c2c210d9..968ad126bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2020,7 +2020,6 @@ menu "Networking"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
 	source "package/libcppconnman/Config.in"
-	source "package/libcpprestsdk/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
 	source "package/libeXosip2/Config.in"
diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
deleted file mode 100644
index 7688021ed0..0000000000
--- a/package/libcpprestsdk/Config.in
+++ /dev/null
@@ -1,34 +0,0 @@
-config BR2_PACKAGE_LIBCPPRESTSDK
-	bool "libcpprestsdk"
-	depends on BR2_ENABLE_LOCALE
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # boost
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_CHRONO
-	select BR2_PACKAGE_BOOST_DATE_TIME
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_RANDOM
-	select BR2_PACKAGE_BOOST_REGEX
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_THREAD
-	select BR2_PACKAGE_OPENSSL
-	help
-	  The C++ REST SDK is a Microsoft project for cloud-based
-	  client-server communication in native code using a modern
-	  asynchronous C++ API design. This project aims to help C++
-	  developers connect to and interact with services.
-
-	  https://github.com/Microsoft/cpprestsdk
-
-comment "libcpprestsdk needs a toolchain w/ NPTL, C++, wchar, locale"
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
-
-comment "libcpprestsdk needs exception_ptr"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
deleted file mode 100644
index 8e398d0c54..0000000000
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  6bd74a637ff182144b6a4271227ea8b6b3ea92389f88b25b215e6f94fd4d41cb  libcpprestsdk-2.10.18.tar.gz
-sha256  5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97  license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
deleted file mode 100644
index 68d4cf68c1..0000000000
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ /dev/null
@@ -1,55 +0,0 @@
-################################################################################
-#
-# libcpprestsdk
-#
-################################################################################
-
-LIBCPPRESTSDK_VERSION = 2.10.18
-LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
-LIBCPPRESTSDK_LICENSE = MIT
-LIBCPPRESTSDK_LICENSE_FILES = license.txt
-LIBCPPRESTSDK_SUBDIR = Release
-LIBCPPRESTSDK_INSTALL_STAGING = YES
-LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl
-LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF -DBUILD_SAMPLES=OFF
-
-ifeq ($(BR2_STATIC_LIBS),y)
-LIBCPPRESTSDK_CONF_OPTS += \
-	-DBoost_USE_STATIC_LIBS=ON \
-	-DBoost_USE_STATIC_RUNTIME=ON
-endif
-
-LIBCPPRESTSDK_CXXFLAGS = $(TARGET_CXXFLAGS)
-
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LIBCPPRESTSDK_CXXFLAGS += -latomic
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-LIBCPPRESTSDK_DEPENDENCIES += zlib
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_COMPRESSION=OFF
-# brotli needs compression
-ifeq ($(BR2_PACKAGE_BROTLI),y)
-LIBCPPRESTSDK_DEPENDENCIES += brotli
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_BROTLI=OFF
-else
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_BROTLI=ON
-endif
-else
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_COMPRESSION=ON
-endif
-
-ifeq ($(BR2_PACKAGE_WEBSOCKETPP),y)
-LIBCPPRESTSDK_DEPENDENCIES += websocketpp
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=OFF
-else
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=ON
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-LIBCPPRESTSDK_CXXFLAGS += -O0
-endif
-
-LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBCPPRESTSDK_CXXFLAGS)"
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
