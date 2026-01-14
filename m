Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2627DD38FFF
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 17:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B97F082479;
	Wed, 14 Jan 2026 17:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwzChqdC2IPe; Wed, 14 Jan 2026 17:28:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D4180CCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768411735;
	bh=LYFOXnQgueySYLZRdlAGrOz1NNJITAVV7N30ZzA0gU0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=Cvul7rEDfkK3IkSSvjYPr9FJ3xN6aZVPhSW6DsLfwrtpZHz7hbjg7XIlfWJPPZkzo
	 2ecPaBrPrkhRMEkucYlPOrxf0OCqJq/Y+Mlma99/L0RLr+sPeTqkKqlRcvWu9izUH1
	 LIF45jc9JGFu+L9DQsH47YluYoGAwxqBQ0TxFDzfFYCDWumrgFn5gOMjmCMovEhYcB
	 k6zXBC6hXU/6lqnbinEsPKzqslRMai4PwSIT6hiRUROoZjph3BdOdU+eNTQA2qGkAk
	 8IwI+3kUdLsqEkDFHKOgULEpWBLtvITYSPgtloht7mH03KZme1GRGUGAFlZvhAH8Yj
	 gDgpi854IVSgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D4180CCA;
	Wed, 14 Jan 2026 17:28:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDE9F1CC
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 17:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF1D76086B
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 17:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0qtc8wsWIrG for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 17:28:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 587A66083F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 587A66083F
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 587A66083F
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 17:28:46 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B830D31E0CEB; Wed, 14 Jan 2026 18:28:41 +0100 (CET)
Date: Wed, 14 Jan 2026 18:28:41 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aWfSSZEdw71k0XrO@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.57+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1768411721; bh=B7AEYHREkCV5AfiGJhOSivJs4rk6J9maHy+TDoltCaQ=;
 h=Date:From:To:Subject:Reply-To:From;
 b=MI+GR+ePRIxlJPbw2dB2y4+7ZLgVHrn9tqHOCGImnHdFD4h7roTEMQjLdsbJH26TO
 z0e8/qtgIudh2V44OTLnFRgSBdgIswInOOo+07p0W3HdcyrLnGinJrbmfnVenYJBAk
 FBnmOvMlYamTUN/98V+jS2pgCjNsWdkAOYFFGWA1MyO8cN9l/6pESoU3NS9SSJsRhA
 qO68U46Jn1EukbQ0UTtpQd+14qHWinAXOejCfYlNZEaHNFBeCU9kNnNOlzRm71ACaJ
 c5RyEC0YYOHwPuPa8w46It3SolFbGXfFd9rCEu4xH4U85YxXM/c/p8migsyHa2U8mF
 qba0Icszq2s+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=MI+GR+eP
Subject: [Buildroot] [PATCH] package/ruby: bump to 4.0.0
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
Reply-To: Waldemar Brodkorb <wbx@openadk.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for a Changelog:
https://www.ruby-lang.org/en/news/2025/12/25/ruby-4-0-0-released

License files were updated. Apache and Boost License were added.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ruby/ruby.hash | 8 ++++----
 package/ruby/ruby.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 90faed4c32..302c40b5e3 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,7 +1,7 @@
-# https://www.ruby-lang.org/en/news/2025/09/16/ruby-3-4-6-released/
-sha512  29000b3396ab95fc2dc13d2d78441ff5c34258e5421115181c54b1b4d55d5c0d4f3d0c3cec6b32b9a1bb8de5c51b383fcad4369ec3fb244fd0ce182afbe79ba4  ruby-3.4.6.tar.xz
+# https://www.ruby-lang.org/en/downloads/
+sha256  a72bacee9de07283ebc19baa4ac243b193129f21aa4e168c7186fb1fe7d07fe1  ruby-4.0.0.tar.xz
 
 # License files, Locally calculated
-sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
-sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
+sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
+sha256  4ebe48076b3ee165fbb9350aa8a9552f8043c8ed8a7edca2089133d33c1ea45f  COPYING
 sha256  36a9a6e7347214bbba599a412617204e65bff065dcbe5c46f5cb454c80de9eb0  BSDL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index ffe42968b5..76ad9cc73f 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
-RUBY_VERSION_EXT = 3.4.0
+RUBY_VERSION_MAJOR = 4.0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
