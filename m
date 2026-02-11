Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070ABE9E311
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 14:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B110B82289;
	Wed, 11 Feb 2026 14:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MvBp1t_le6l; Wed, 11 Feb 2026 14:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFA6D82152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770821623;
	bh=JgQ3rPohK7lAgPKrodPpcnnIYSiINvXk+8BXv1PuSyk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=iCSrcPYGD/nWi9bP2J2KNCi5MEEZ8+CO78zuuI0Bl6IzYXVXzs+h4hoSAKsejOQhN
	 IPdMt85vYS0qT/n4f9T8PMdiYEOHjLpJa5OxsDn4gBTgjcjNoIMHPL9rOxhd0D/zJl
	 LMMrM0AtSSmDquAZGvZbta05s/Q91eUUw+PE79WhREawJhSjrN4DZW0ot6SUpU571/
	 u/dW1bsKIOXi83/M6q7rQJBZnCdYyS70nK7kLdI+mh5upgPZcxG/dLIo8Il8cTcESM
	 vdqc/MNao7Wu8Hqw5tKKDHr8ojeou5a8gtb8K7O64XNUHz+/MtbmaQqFuUrA2iOmn5
	 SVhk36z5XxECg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA6D82152;
	Wed, 11 Feb 2026 14:53:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D034E1F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B551040E88
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1g6HtfxuEaNS for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 14:53:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00B3F40272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B3F40272
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00B3F40272
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:53:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F1931814B9; Wed, 11 Feb 2026 15:53:34 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 15:53:02 +0100
Message-ID: <20260211145304.4018549-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770821615; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=oPMhiE/cyBgOltH+uquS7bXf2ZehCOhLBSZp9hVrvJo=;
 b=OyhbHTvtsIuFrpVxd4Yh7VGhAyhg61wtznOyISiGV+l4djxphynBJ0XliAZ5ExmE9aR2+6
 g2jC2o+59XX88z917erv3h3QIAYaXILPSNFsPr+Xon51mia+WMIqTBaEwAlslPq7rSjmlV
 nBwlhPSezX7JrdolLMcUPanuTly1/Bg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=OyhbHTvt
Subject: [Buildroot] [PATCH] package/log4cxx: bump to version 1.6.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://logging.apache.org/log4cxx/1.6.1/changelog.html

Remove dependency on Boost.DateTime because since Boost 1.77 it's
not a dependency of Boost.Thread anymore and that's the only thing
log4cxx actually requires as fallback.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/log4cxx/Config.in    | 1 -
 package/log4cxx/log4cxx.hash | 4 ++--
 package/log4cxx/log4cxx.mk   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index d9daf27eb6..8305217a48 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_LOG4CXX
 	select BR2_PACKAGE_BOOST if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_CHRONO if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	select BR2_PACKAGE_BOOST_DATE_TIME if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Apache log4cxx is a logging framework for C++ patterned
diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index d9e9af18cf..f6770e287c 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/logging/log4cxx/1.3.1/apache-log4cxx-1.3.1.tar.gz.sha512
-sha512  0956fd034fd1a98d2e48ed461578c1e85da02d176850a580195b6a60b959feaf402a2743cc84ccb5d467dd924ee46422b8a7b39d2be9ee131e4e275e65ba839c  apache-log4cxx-1.3.1.tar.gz
+# From https://downloads.apache.org/logging/log4cxx/1.6.1/apache-log4cxx-1.6.1.tar.gz.sha512
+sha512  6ee406314bd7ab02a46c98cc8a0d5ad5aec8928a23716a81a152775ca315cd3b950d600b2e221d5b4a88416ae9bbda1215fae43626107feea4df2f3e074303ad  apache-log4cxx-1.6.1.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 4b85adbf92..57f9b1e844 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 1.3.1
+LOG4CXX_VERSION = 1.6.1
 LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
