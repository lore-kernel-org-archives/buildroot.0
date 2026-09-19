Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04886C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC86D40676;
	Sat, 19 Sep 2026 16:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtWpkB-GHAZg; Sat, 19 Sep 2026 16:00:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C68BD4085B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833614;
	b=YHEQXtgyeDSjmD38GO9lLcV4ZCPSRBLYutMrQMP2rUPTTkOJfVrgk9Tou/0ZvR1eha+f
	 Qt0n4uwF3zpv5icYcKcHeyyRBlQb1/+XZo6f48HfROmFfe7eU3CFQWd2AMwgqv+BUp2Jj
	 xxTkRUzCL+I2XX2FJ1c+hQOiqskGxCUSISl8X3PL3ebsbJsOBjiTFuxDWrR88L2Mqp785
	 bs/TC185/1Gu5kZ+MbkNa4F/bYIiMqbtUP6SBEP1c5h5a9WFVyl9+LZVUFkIAqY0LOppd
	 ++MsJjlM/AKGD1L0tVjAreNBHtG6bHZpJGFpByS0MIpz3D/0LskBBGQ1uGgrdZVkODw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833614;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t/HBc0n9UDMuj86r33h5g9rp3PaYbifHHfOHfRn4qTM=;
	b=H6qj0gtFrOHSlyaubPwMs9a5Eg5rciG5ZSletmYp0Zr1QekGeob9pCsrZUmk9J1jVuVk
	 AYCCjAzrO56KVGdgw1GmAod/+MnE3BFlFTEBBUrI8lTXoH8sZqhCaTkZYuVwqn6KfPe69
	 qbGEP2+Q/me36oxWGUm0qCyvMfRzM41eFpGMQ9UPAEzCtHm6NPiTBjYiOQiRCdcLy8T91
	 HBrTTUDBSbLU6lTTTp1LbHCEebzVyOWVwyFpfc9PnHYT8NkYlKUgJrmg+//Fp1bWSOV/h
	 /SDa8P3/2/SCT+Ggxu3Cq8r9sJONSkEyqQfH9clr1MLy0Y5J2Yu/t5BzCzJYIcnRNyw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833614;
	bh=t/HBc0n9UDMuj86r33h5g9rp3PaYbifHHfOHfRn4qTM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kUjvjPF0gZn0ZZ+papdmNY8ovkLLjsY2VXqsAjDUGgNavrzAaAHAdq2G8E1CRa2+Y
	 te2wGLVSdKjOhT+NQWWKj8nsWbNyLs9ZXPsPmj4jC/sUc5eBVpOBjwOAnNizR6siTi
	 MNgQ26+iGCb0hsy84Fj3lnIPCjOCaup1UGxxzzpj/tDywAk9EGvOm4O0eny8Kkmxcq
	 vtC6XTW3g9FNRxihxQELzXQz31BZ6pJtFUiBqlgHzEYStO7ENhPZnKo1aBtwBVz/se
	 bSPKskiZI3kA/3K/vXqUqRps+hqGQpO7MzbFLh3UCb3b8qkaVj+vEeXJQWKCy+eJNg
	 YxGddCbP5UQXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68BD4085B;
	Sat, 19 Sep 2026 16:00:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 129FE37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04C73400BA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dZC1P9rFWz2 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:00:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4A22640026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833611;
 b=gbO0Q/03N98gQ/ba3L7WuhjytFhrcOtkF4YU3fe149M1FN/Xljha74kkZ3xHSfv+rnKs
 IJHfgr8/U6ma7Nkg9lqmOfTtR38ZUf57FKI4W3Abf2NWMt901cxet0N7I4GLTevoWfPyt
 HM1zdNNPVQvBoj7gnxiAb+rJs61HOn6NSI/IHCN2AP7qN4EYznfqsLVJXuwX+tffbems/
 /VBBQrBKKmCBXWze0GHPT6hgCnJ4QA8iM28iCmSB/OwvwR7lsIy0zCKmVGb5SjD3Gbuwe
 BaX9pNDvLfCo2b/PC2wPIbN6w+DVX1EMyYiMDBAyU6tCGX0g641bsFqdaqswg/oaw+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833611;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0Se9huhQPQ2KHeyS0iF2czBubDABoDFMXHo5sff4qeQ=;
 b=CcHMvfpar/aE/FrtqhScQQuVDGbAy/Iw0uWpyAt+QqdO7VZLBPxb1DAn1dShTiPjJIQ2
 lt5L4laEpJlZeT0rdgUsAHLjqgujPfkMC7Iy2oF3ExEpo9ZMgMZVQ3xlhVwwi297uYyqo
 kFq8JIpqtchB2966vFySZokRUuKPGs+SCfsrBuW0kTHqmxfAAzkrQr4wlFPg8d6UZpHso
 Ppm11YbWSQdtyOcBGWRJP/M5Xnmww7rOnvfFP+UbQ7s4DYJ17J/sD7XdAWg8rHVQnmIUk
 otSWaMAW3jyg93Rptn6ncGIJD4jCd6w57N/fKGdzJhOlJ0Fpufrr85RYYcWnynrxFFA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uCPwcSpI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uCPwcSpI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A22640026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833530;
 bh=0Se9huhQPQ2KHeyS0iF2czBubDABoDFMXHo5sff4qeQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uCPwcSpIpQHRDcjTNXzCeUaLTNq4l/8SlB++jl1IsT3fUnhJW8KPPs0A0Qybf5/Db
 cDxcY2apEsytr0kGT4aWmkCI2MLks6roy7iG/HzNS6f4uU66KUzIfuMmTQvL/1pnHs
 Sa3ii3ULL/DhhP345GD+ezEwumB3tvrubBygEKENydogX2/ZnTwHTND22+SvtqPCWS
 /U3k6w8i0Nw5dbSMoW1G7Nhqh0pvLgQoR9wbDk/EvVMjPNAtp2Y6TvE/xms9dpETzv
 giHjWIKu9ZkisUx1rVXMi00CozMJbBQJ4pQ4HzA7CTKrT7U+iBRn99nGOo3CVrSwqJ
 LesdI6MGmih+A==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:Sy6E91u944fTxrgwHK9oJ3e09O2ZVptLC1fz0hi7y5acjitUmT1T0fNoACGQSZoTEatwj8Hi+U7bjlN4MvRO7N2AGtEO/QpdOIwHIvV4czavqejkwHGaTNApybv/iEB+99LXTwB+Zb9I39Mi7Sfjp+2cjsb1b7Bc0x76FE0F6fHOr4mFmV78LE4gwCw0JRTbyfcoU9bdnCxKl6eJbp3oqHi7zZzTuIj5bjmWN3J4VVTaagV6Dm22NcdAHhyh4ZcKWa8zk5Y8VD8q2dT7Nk9HtwriL1BVprp0B6GmkQhzzTo6ZVEXidtdhM98CYiBnTV0z058TOa0vh2iT3c49Iqbio8M+ivdJe6YewxgCavlMXVmbmT0zKOae9DxCnKYgVOI+Iw+koIfleq8NWErJggtzLj6B8z4z212viuWr81lYDehi1y9TyBwCKGMAshIQG9FC75MFifB63SOyvFi+hIN9QHBfYZTgoM8B47ArJec4T+fl+exbCtDRC1vUNsk5yb7Nf4ofVkMTvvMBqmFANVjmdldgCxu/WVKb/EF/eYJWaW/R44Ti6HESC4+TwwjnKApN2g9kYw4cbojrob42c6CmEkH6re/W7t6OY28KZNx/K2UyK
 7qKE71l0DpViMraMMQpm4Xpf0F1Ez+oT5ffrJatZqIkcjt0fy85zFh9PRQr6eFeVpZnw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70AB1A4C47A5;
 Sat, 19 Sep 2026 17:58:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSj-000000005Jx-2vCU;
 Sat, 19 Sep 2026 15:58:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:31 +0200
Message-ID: <20260919155845.5776-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 06/77] package/libcpprestsdk: remove package
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
