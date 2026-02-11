Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DBBE9E30A
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 13:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72FB3816FF;
	Wed, 11 Feb 2026 13:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBoQNIfcFHOr; Wed, 11 Feb 2026 13:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 758D583DD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770817828;
	bh=6WLgNK5+zmszzFUUu4zWamlnzZiqk4GRwI5+gzwn2UI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=WmGbckNsIJrwdme0+e1lVdmpV0h+udp7OSuW5oIHW7L13I+SkytjpCM9tJ7DEws+S
	 CdLi+yx1Qn7J8zaaHjAZU2g8PL5xRkHV6U7VY3+u9MupGXm7klbsQq5P4iTTMHtiHW
	 SlT/t3ZiM+ALjPAa50P4w5ccmKzXSIPbpgtLiMTEM+ddReCudZeK0yhW4oLAEFxW6u
	 VxfMMP+JmdjwLG1QcU+W2opbdDepnNTjNXRpycHHFWB4Nm8JjMeeyp3UmsEY68Fzgw
	 Q8oCh475Lz6sJ+ntnbJ5TlwZwR7puxpZtXQK0DS2+Hkdle1D6o3EweI5CuA94HsP3d
	 mVYkJ9yygetBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 758D583DD1;
	Wed, 11 Feb 2026 13:50:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D06223D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 13:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EBA981445
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 13:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYup07GV9h-6 for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 13:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB32381367
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB32381367
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB32381367
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 13:50:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C6B951814B9; Wed, 11 Feb 2026 14:50:20 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 14:49:25 +0100
Message-ID: <20260211134928.4012237-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770817822; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=WzS3hYKlEcwGSepn9Z0WswwJPycYl5u7r8VwzyEuYUg=;
 b=O0zYrY23ISjvT/qHu0MxFNdo0KJlxoSiOSqeRPq0YzYe2UH78nuQ/AOb4nwBBSHEHRgPvx
 85iqYnzRDw8kEDroUZ0C3DygvCsidW+6SGZcPoBmTNJ30yio3GOlHifcCe2+3hd1Grb/FK
 kVs+/3KcSq+s2JMWhCuhDiS/GviHcVY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=O0zYrY23
Subject: [Buildroot] [PATCH] package/log4cxx: fix ENABLE_ESMTP flag
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

commit cf686670b99ae0388b27867db64516c09b2de91f introduced a patch that
was later included in a release which made the usage of libesmtp
configurable.

while the patch introduced the build flag LOG4CXX_ENABLE_ESMTP the
change to the .mk file used LOG4CXX_LIBENABLE_ESMTP.

So correct this.

Fixes:
CMake Warning:
  Manually-specified variables were not used by the project:
  LOG4CXX_ENABLE_LIBESMTP

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/log4cxx/log4cxx.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 2d8d57a612..4b85adbf92 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -23,10 +23,10 @@ LOG4CXX_DEPENDENCIES += boost
 endif
 
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
-LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=ON
+LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ESMTP=ON
 LOG4CXX_DEPENDENCIES += libesmtp
 else
-LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=OFF
+LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ESMTP=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
