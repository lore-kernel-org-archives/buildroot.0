Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18574C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 12:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A48AF83381;
	Mon, 20 Jun 2022 12:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A48AF83381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDcuxIN1S5Vn; Mon, 20 Jun 2022 12:01:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6F3083339;
	Mon, 20 Jun 2022 12:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6F3083339
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F8A81BF346
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 12:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A2B083339
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 12:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A2B083339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EgX6ZyB8HCGV for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 12:01:01 +0000 (UTC)
X-Greylist: delayed 00:05:36 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62D6683313
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62D6683313
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 12:01:01 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 12:55:10 +0100
Message-Id: <20220620115510.33792-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1655726121; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=OtRAcMn16FjItduPTy+Avnd2uxARTq3iX/gJH9DcsLM=;
 b=nLoWYfogP0Juy5l2VVpx78krXRJxYmo5lw8ZXvatsfpoOozoaaROr1lntcqfMsZG982SdV
 3jf/mTJnqSqwfKX2LKnvKALvljyOkoa+rjhGDoIVom96jZNSlQYjHagU/sxTQnmhGriNc5
 Y9PndB0GrDZygGHqxBN4HDzBIs0eUvs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=nLoWYfog
Subject: [Buildroot] [PATCH 1/1] package/boost: add option to force static
 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This option can be useful when building for a system that
needs to somewhat maintain compatibility with previously built
software, as Boost is notorious for breaking ABI at every
single release.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/boost/Config.in | 11 +++++++++++
 package/boost/boost.mk  |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index b99b01f22e..60eb83ff4c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -16,6 +16,17 @@ config BR2_PACKAGE_BOOST
 
 if BR2_PACKAGE_BOOST
 
+config BR2_PACKAGE_BOOST_STATIC
+	bool "Build static libraries"
+	depends on BR2_SHARED_LIBS
+	help
+	  Build static Boost libraries.
+
+	  This option can be useful when building for a system that
+	  needs to somewhat maintain compatibility with previously built
+	  software, as Boost is notorious for breaking ABI at every
+	  single release.
+
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index f6e9a03220..162277b968 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -109,7 +109,7 @@ endif
 
 # By default, Boost build and installs both the shared and static
 # variants. Override that if we want static only or shared only.
-ifeq ($(BR2_STATIC_LIBS),y)
+ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_BOOST_STATIC),y)
 BOOST_OPTS += link=static runtime-link=static
 else ifeq ($(BR2_SHARED_LIBS),y)
 BOOST_OPTS += link=shared runtime-link=shared
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
