Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C209CE9D3FB
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80471607CA;
	Wed,  4 Feb 2026 15:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fJg3bJpKV1O; Wed,  4 Feb 2026 15:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93FC5607DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770218064;
	bh=4K2l1k36y6/nAJhHGEXhrFRxwP2zuYhlIqgdHlNbq5Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pSqXZ8cwCVUXGhOfOghV7golg4VCU4O45oxS2cEj2MTtKkusZ52i0mz5SRtdUubo3
	 K2VbVPhoRE4nXrk24C15DiNv9cwclKFJCXGNeUFH+GiylN2rayfpCkeph5jB/kvgXZ
	 u+au0OTRUk10TJ32NOq+S4dm+NT7etNRdNIuuvM2DP+nIm8Gf7Iw9UO/L1EitV3wLV
	 AgpGGkiN3I0BzgZT3TkzxfL+KQJgrJA56dR6asgqIMbYoOeYXMcWejkU7fPiNecsB4
	 EUuyKV1v+ZavZ0HaNNWRCQnH2glY7+pkuh3Fe9SawR0d8mmjMqpmuhzxV7Fs6oq/rJ
	 +vVw6S1t6Bzvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93FC5607DC;
	Wed,  4 Feb 2026 15:14:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D48BBF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C380C40667
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huJEQIkqG7o3 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E943840665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E943840665
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E943840665
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:14:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6FEDA1814B9; Wed,  4 Feb 2026 16:14:17 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 16:14:09 +0100
Message-ID: <20260204151412.2337672-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770218057; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=tBA6muGAQzr+rfdw400QkqaAPaSw/G2MetMLmF/Z8q4=;
 b=qHYDrMuH6Cxxyh9LbWerOPYldea396NIIBWbRLBoN2DtECNXbsZmeUIrb0xYPArp3DfzGI
 6zjEVVWbvWyiil+ibXTIgLgPaS/JoO1gEH2DTXnnPEGKnSo+9L2G6K4A+j9TSpK2YXaB7T
 VqVJPylIKR/lQiu0QbuuQhLjHQdavYE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=qHYDrMuH
Subject: [Buildroot] [PATCH] package/botan: cleanup boost dependencies
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- botan dropped the usage of Boost.Filesystem in 2.10.0 [0]
- botan never actively searched for Boost.System, as it is header-only
  the dependecy can be dropped too

The only part of boost botan currently uses is asio. So use --with-boost option
when boost is selected.

[0] https://github.com/randombit/botan/commit/aff8cc8a7a5e22e3fedeae7ca82b63d4744ac82c

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/botan/Config.in | 2 --
 package/botan/botan.mk  | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 305cc2fe8c..6ac6341f71 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -17,8 +17,6 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++20
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	help
 	  Botan is a crypto library for C++
 
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 561e7bf702..64b7245c1f 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -58,7 +58,7 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 BOTAN_CONF_OPTS += --without-os-feature=explicit_bzero,getauxval,getentropy
 endif
 
-ifeq ($(BR2_PACKAGE_BOOST_FILESYSTEM)$(BR2_PACKAGE_BOOST_SYSTEM),yy)
+ifeq ($(BR2_PACKAGE_BOOST),y)
 BOTAN_DEPENDENCIES += boost
 BOTAN_CONF_OPTS += --with-boost
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
