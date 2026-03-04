Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678E9EFCE47
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E914381703;
	Wed,  4 Mar 2026 21:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkzfaGc-kN6l; Wed,  4 Mar 2026 21:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C6C381746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772658834;
	bh=NzJvboeWcdjJcGt5ZHrZnENhynAZwwai9TBDDLljLxY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HwBnhylJlqWYRaYwiTVsgwzQcgWpevnGlFjuwPcwaY9CruRwn1lGXVG86UiBZkDkh
	 Fk/+qVzJBi69W+cHnsD72gQaCP42a+uRwNPbACjph9+COWVvgACmLdrIUUeFl7BrvK
	 sVufbCaJHeUSVGfIC+OeHZNNBlI8SV2i8UjleHF7t9d3byzKbpQ+L4WHAFpZ9qDwPt
	 G74fqynhG9oPbZ4Tn1NM228IR+2467Gnrr97isROH8BOJwWTI27y3LbuyRY7v/E8tM
	 NJ2x3sJP0KQ+IE3LSaYScjKvib3L4t1Bueenm0bSt1lehqMAQOg8BJoJGXQys8rKAB
	 pOqohI0qmqWVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C6C381746;
	Wed,  4 Mar 2026 21:13:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D71434F
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03832405E8
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H27E8j3PG_7X for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:13:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A8D7404C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8D7404C2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A8D7404C2
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:13:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d35.dip0.t-ipconnect.de [91.58.13.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1BA6A4C2707
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 22:13:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47966)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxtXO-000000003MA-1P8J
 for buildroot@buildroot.org; Wed, 04 Mar 2026 21:13:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 22:13:45 +0100
Message-ID: <20260304211346.618625-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772658826;
 bh=GXqXZV17MH5Jx7RRPpzF6lQqSJU7CpcB1xxfoUA9YaA=;
 h=From:To:Subject:Date:From;
 b=VJr3foolPlXmS4SRGUbokdMc3Tt4sh/dDBVcSIBJR0WjUTIJ6TjvSORPbOB36ygJV
 97QGvdc2dJ2dwhupCF1aXFv9QAgo9fgk1cm4qrSuuysg2D8SEcXGEkgydLSEOsXekn
 oSxy+QJ59Nn2FB4B1z17w+VCFfQ25RP/Uu2FYhKFgRqrCvbA2SZU8Z1DDAFboZ8caX
 Cnuf93eo1QyE+XQpBGX0EwTmlCKT/ebDdAj3X+NSyoSP6f1Q1KFeKbSUQu6ZY+KaWS
 ntJ6D6ux1bTSWP30+6hirHjJiZCg5DNiCrSCxfliq0rmUQGcZ8KhjknLwE+WMZWFcf
 rENLxsovON9dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=VJr3fool
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18, 19}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{6.19.5 => 6.19.6}                     |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.251 => 5.10.252} |  0
 package/linux-headers/{5.15.201 => 5.15.202} |  0
 package/linux-headers/{6.1.164 => 6.1.165}   |  0
 package/linux-headers/{6.12.74 => 6.12.75}   |  0
 package/linux-headers/{6.18.15 => 6.18.16}   |  0
 package/linux-headers/{6.19.5 => 6.19.6}     |  0
 package/linux-headers/{6.6.126 => 6.6.128}   |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{6.19.5 => 6.19.6} (100%)
 rename package/linux-headers/{5.10.251 => 5.10.252} (100%)
 rename package/linux-headers/{5.15.201 => 5.15.202} (100%)
 rename package/linux-headers/{6.1.164 => 6.1.165} (100%)
 rename package/linux-headers/{6.12.74 => 6.12.75} (100%)
 rename package/linux-headers/{6.18.15 => 6.18.16} (100%)
 rename package/linux-headers/{6.19.5 => 6.19.6} (100%)
 rename package/linux-headers/{6.6.126 => 6.6.128} (100%)

diff --git a/linux/6.19.5 b/linux/6.19.6
similarity index 100%
rename from linux/6.19.5
rename to linux/6.19.6
diff --git a/linux/Config.in b/linux/Config.in
index 5a0757fece..7114aabc4b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index f2946ac337..233dacaff8 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3b56eeb1dc9a437f189ca56b823be3769994f59a4ea0895b08ec0d20acaca13e  linux-6.12.74.tar.xz
-sha256  a7cd9c97b4f0b31cc030bcdc60abe5434fffb2556e293f7438ce7909dff8c9fe  linux-6.6.127.tar.xz
-sha256  33bf087f7bbf7f626873dd7d955eb44182a93695db41f5f89a6bd3d233a39d1c  linux-6.1.164.tar.xz
+sha256  06ee7927556ff1aa8810c4826501b0fdb169ebdc180644b882cf7c143ac1c177  linux-6.12.75.tar.xz
+sha256  669633bb8480021f15c38883fb2f6fe2087cc8b69a582f26f6b7d4ae6b348e48  linux-6.6.128.tar.xz
+sha256  5a817184f1be901b75c7e0afc02376bc3ac51624e03ec6f7b8a5f9d395d22ef4  linux-6.1.165.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4f2afffbeddaad6b8527d41a3e3a82646d3cf5dfd0acbb6c4e8a99fc70461b96  linux-5.15.201.tar.xz
-sha256  e6857625fee3b587b0279b445adc3940a5c40723385fa1055ac7af16ff4b4c01  linux-5.10.251.tar.xz
+sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
+sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 20618f4da0..93ba293fa3 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  95ae05c8c709e353c0e8506c072efc5598d85b8b7b564a1ebac7ee8345042ffa  linux-6.19.5.tar.xz
-sha256  7c716216c3c4134ed0de69195701e677577bbcdd3979f331c182acd06bf2f170  linux-6.18.15.tar.xz
+sha256  4d9f3ff73214f68c0194ef02db9ca4b7ba713253ac1045441d4e9f352bc22e14  linux-6.19.6.tar.xz
+sha256  4f21c01f4d04c1d1b3ed794153f8900802c92497be620b07c4869530f2d28ee3  linux-6.18.16.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.251 b/package/linux-headers/5.10.252
similarity index 100%
rename from package/linux-headers/5.10.251
rename to package/linux-headers/5.10.252
diff --git a/package/linux-headers/5.15.201 b/package/linux-headers/5.15.202
similarity index 100%
rename from package/linux-headers/5.15.201
rename to package/linux-headers/5.15.202
diff --git a/package/linux-headers/6.1.164 b/package/linux-headers/6.1.165
similarity index 100%
rename from package/linux-headers/6.1.164
rename to package/linux-headers/6.1.165
diff --git a/package/linux-headers/6.12.74 b/package/linux-headers/6.12.75
similarity index 100%
rename from package/linux-headers/6.12.74
rename to package/linux-headers/6.12.75
diff --git a/package/linux-headers/6.18.15 b/package/linux-headers/6.18.16
similarity index 100%
rename from package/linux-headers/6.18.15
rename to package/linux-headers/6.18.16
diff --git a/package/linux-headers/6.19.5 b/package/linux-headers/6.19.6
similarity index 100%
rename from package/linux-headers/6.19.5
rename to package/linux-headers/6.19.6
diff --git a/package/linux-headers/6.6.126 b/package/linux-headers/6.6.128
similarity index 100%
rename from package/linux-headers/6.6.126
rename to package/linux-headers/6.6.128
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f8364d0c7b..4ef19c2e9c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,13 +464,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.251"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.201"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.164"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.127"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.74"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.15"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.5"	if BR2_KERNEL_HEADERS_6_19
+	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.165"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.128"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.75"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.16"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.6"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
