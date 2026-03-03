Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A429EDEBEB
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B70BE81443;
	Tue,  3 Mar 2026 20:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-CpmxSVuNDd; Tue,  3 Mar 2026 20:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBE878250B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568076;
	bh=F/1QSMO6f8VMjYE387KwAty0Op2WhMAuQAX6XGJeCAc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cuHFg7k9q+Gs7mWgTfqR7IDLFVuIFa/UxsgINY8pDG12sjlPQ0gsFSMwVPN4eUmcN
	 S/WuJwTAgrZlwB7XdbcWIQcmRIhAK9V6CWSxXdESsd+TAQHhB3Ih+v3H/zUVIdA9Dx
	 vdEbWeuahjdybvHVs9sU4EX4BSGNOrT2EIZZXfOTa6JT2ZSOh2HwQeggKMJGwfCTQS
	 UM1PnwTCiRIgNeRjmiuMkZ1BMjzhjOgLbCVbb5xdJ5+GRYbjKIoMXhoDLpqbKBnZBu
	 9llBt6tnjbPNTWeTsHIE7tPaTi0KGBLqyh5lPTCcVlw3e9u/GMNoTaF16wf1WyzKJw
	 8qkGQfvCgJwRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBE878250B;
	Tue,  3 Mar 2026 20:01:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F0A025B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 050EA8250B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBoWPByWxSp3 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:01:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEA7481443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA7481443
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEA7481443
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A734A4C32D8;
 Tue,  3 Mar 2026 21:00:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvL-000000003gI-1OYs;
 Tue, 03 Mar 2026 20:00:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:40 +0100
Message-ID: <20260303200054.784253-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568055;
 bh=XxUZXg92+kOJlwXKDYDnfUo6RUDhsj8ytC3di5vOwqg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SqlkIi65aPpLoPifM0UUzaRUNW/tcM8E7IrwaOxEc+wGo+tWi4NadzaNgNW9DrHLl
 EgX9pFfzPVctJ2KCZATy6y3QBTP7eyuLJo8sAAIXuBqhrRmA6y9yuk5cJ0XEASiMCW
 xOOPNyu42KwgW5GmMEnTJRJXRq7gO5fdwrgr8uwOiAXx2QGnPLdwEFMLQYz23/S5az
 nOd3OkTlR3dBJfbO+LWO1wd1QL7LuZZd9uYyB6AS+2um+ssxgg93vtXwy+yxokhOKC
 x65AEHpgRUqw7ioSSlZuKJnfT9Fc3fVkcs/GTooFINq61p8tVcyDjcX/MXdAbxEnKk
 NXeGO7gdxveOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=SqlkIi65
Subject: [Buildroot] [PATCH/next 01/14] package/socat: bump version to
 1.8.1.1
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://www.dest-unreach.org/socat/

2026-02-12: Socat version 1.8.1.1 has been released.
 It fixes compilation with glibc 2.43, xio-netlink.c for Musl, and a few
 minor bugs, see file CHANGES

2025-12-08: Socat version 1.8.1.0 has been released. It fixes a couple
 of minor issues and provides new address types TEXT and STALL and a few
 new address options.

Rebased patch 0001 due to upstream commit
https://repo.or.cz/socat.git/commitdiff/2cc1f11d02928e7eca9560506dfc6e97a0ac92e3

Updated hash of README, used as license file, due to version bumps:
https://repo.or.cz/socat.git/history/HEAD:/README

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/socat/0001-no-documentation.patch | 4 +++-
 package/socat/socat.hash                  | 6 +++---
 package/socat/socat.mk                    | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/socat/0001-no-documentation.patch b/package/socat/0001-no-documentation.patch
index 5dbce0576e..13e9e503f2 100644
--- a/package/socat/0001-no-documentation.patch
+++ b/package/socat/0001-no-documentation.patch
@@ -12,6 +12,8 @@ Upstream: N/A
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [baruch: update for 1.8.0.0 and 1.8.0.3; git patch format]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Bernd: rebase on 1.8.1.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.in | 7 ++-----
  1 file changed, 2 insertions(+), 5 deletions(-)
@@ -22,7 +24,7 @@ index c01b1a4a2306..fd89acb06f3c 100644
 +++ b/Makefile.in
 @@ -82,7 +82,7 @@ SHFILES = socat-chain.sh socat-mux.sh socat-broker.sh \
  TESTFILES = test.sh socks4echo.sh proxyecho.sh readline-test.sh \
- 	proxy.sh socks4a-echo.sh socks5server-echo.sh
+ 	proxy.sh socks4a-echo.sh socks5server-echo.sh socks5server-auth.sh
  
 -all: progs doc
 +all: progs
diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index b1c3d3cd11..3a4eec60c1 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  8ef0bc4f602636797917f8574c3b249e  socat-1.8.0.3.tar.bz2
+md5  5456f0f0c5d4505b68edcb10e23ef128  socat-1.8.1.1.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095  socat-1.8.0.3.tar.bz2
+sha256  5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b  socat-1.8.1.1.tar.bz2
 # Locally calculated
-sha256  f51653b61cf2516c39e8f2edefc11604d0f9d14f0c6ae988bef228a1f0283ad2  README
+sha256  86e46422f9381b386bd2eb6606f9d6c3ff479f905660d0f318c571292ab304b8  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 69f8f40452..3d40540599 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.8.0.3
+SOCAT_VERSION = 1.8.1.1
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
