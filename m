Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4214E8385B
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 07:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A85F4409C5;
	Tue, 17 Feb 2026 07:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvFXQIzWjKFW; Tue, 17 Feb 2026 07:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38A340CCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771314908;
	bh=F/1QSMO6f8VMjYE387KwAty0Op2WhMAuQAX6XGJeCAc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MK+yq73aFVbnOL5sRmlvnFZpVS6ZhgFLBpDAsSzLj2nFtQYBaFs8EpFkZR1alXxkh
	 lP3EOESbAuSt+sE1Nt/O5T5caB6mtu/5x4EEz51c9lYxJABEeJiq32Ju0whzs1vG0n
	 /+Ej8xOOyRYadVlXK6CYLaJjA8lmuW22ZJDjEogeGT1vrXchsTUlZRJwdQqVy4TYJN
	 f8K5XcZ3mMxBYTRCtlbnX3K548nuyPPbzv2S0no9U0lB378G6LFvNXMr9JHwx5GDSW
	 CULqJVcgTfY/BgZSw02E/cKenPp1YV5gZWj3PHUMtiD8nZnef6BYDgc8KJWwz4+j2T
	 a5IX7Ejfd0+Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38A340CCD;
	Tue, 17 Feb 2026 07:55:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C32DB270
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A80D960ADD
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28KRLEHkTLas for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 07:55:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 082F860AB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 082F860AB7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 082F860AB7
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:55:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b4bf.dip0.t-ipconnect.de [84.161.180.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1CEFA4C0C4D;
 Tue, 17 Feb 2026 08:55:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48346)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vsFvC-000000000Ep-3Gi6;
 Tue, 17 Feb 2026 07:55:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 08:55:02 +0100
Message-ID: <20260217075502.713155-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771314902;
 bh=XxUZXg92+kOJlwXKDYDnfUo6RUDhsj8ytC3di5vOwqg=;
 h=From:To:Cc:Subject:Date:From;
 b=jCYsqJg8J7wsIWdFCxw/3Ez10pO/xpRYhGospuJ756aNpofIrFowBqgCNqDEyDNo+
 6sGaII4ErhFkeebYxFYXrDJcJGrdALYp0yEQW3vJUHthpZ2WdbmHrZSVmasWigPMW1
 SKN/SxQV2IOresTzToVYE5lMswvqPSVCr3SbUaSf8rdh1h4B7X9PtBkWg16c+Ww9cP
 I0nVc8AVHGsML0bsABwkf3LIC00tpJbtopqhBHz8hHIdbMjQj2tbu8mPfcYhf+I5M0
 JH2yc3FJ5cce+r0BvTFMt3VjjSJpY7P3ehYKvklrmhIc2fYeygU1k23NaV5Sgb3XbF
 4d0tk3VHl4bIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=jCYsqJg8
Subject: [Buildroot] [PATCH 1/1] package/socat: bump version to 1.8.1.1
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
