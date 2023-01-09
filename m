Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA75FC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 07:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F1504097A;
	Mon,  9 Jan 2023 07:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F1504097A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_6wn6YRVd1B; Mon,  9 Jan 2023 07:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DFBF409FD;
	Mon,  9 Jan 2023 07:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DFBF409FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A436A1BF487
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D583404EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D583404EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vaA1XrX2U9d for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 07:24:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08354400DD
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08354400DD
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 07:24:44 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bf43so11611022lfb.6
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 23:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZVomxCmHhFCqTWe2O6OVhFQ4OfoPisf1rMJM9ofBtJI=;
 b=MkiZ+nHwKRXW4f/tXHM4Rp7U5gDSULipkJho6B3uaCSPQpWVX+Xfs+/4zzQhl2KLfm
 H/gUz5arTqOSZ+qaryV79D/zRiWctZszzjEM4L5VWMKnbm8unp5Fs89bAbgnJEiCjHdo
 Ldy7VcLJYv43UTV1395BgG4bnQk1h+CJd2wKYRdXkdjuaJBxPFutiR0StcrtxipVxd5X
 X7Fof0w+Ocyj18aZ7qYiiFvD6XAPo1TcqtIiQPxLGimZmJKHTmnzCmgyAxXbqx7DqPFI
 exxQX/eTtWczvT+qehl3l0VUj4OVrU0SYPXM3LO4E8pGHUBtj4mZPHpsheipBoDjKWjd
 CW1A==
X-Gm-Message-State: AFqh2koqZbPZVH/SEyIbn3YWN5/izJMZO5r/dcGEfTre7UZ993Gim0xl
 nWY5YL4s1MFy6rQ3vqf+pBWXIF499xU=
X-Google-Smtp-Source: AMrXdXv4q+BvL+rYm/jag4f8xLr52kizjZEXedDkfGYGbf1rWGb/YmwxI9DEbUXMCp4JZKRXfDqF1A==
X-Received: by 2002:a05:6512:c16:b0:4cc:7bf2:fa29 with SMTP id
 z22-20020a0565120c1600b004cc7bf2fa29mr2063452lfu.3.1673249082709; 
 Sun, 08 Jan 2023 23:24:42 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 bi35-20020a0565120ea300b0048a982ad0a8sm1482863lfb.23.2023.01.08.23.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 23:24:42 -0800 (PST)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 08:23:55 +0100
Message-Id: <20230109072355.487633-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZVomxCmHhFCqTWe2O6OVhFQ4OfoPisf1rMJM9ofBtJI=;
 b=akGJMWdXn2qeSTrtsdkvqCnn4e3ACAS6LD1XG++bL7HwU4F7HfmVuClF9GGDslr7rF
 xV7+68iu1e+al9IT/zD9J8MGmoOgt+ecKBQi/EPR7BGscsIZkRr5mE6kgMf66q8mw1xW
 jwbTri8DP+f0oTPcnnaJMAMUf59/zcjcN5RBM3OMZAWJi5kQmPGAxRQVpwEUUQ1ENZoX
 0BJP9ZDsmTwGqfegHTetowJ0RqHfoZ7LpCbs0mFRZP5stdmF5nJX6pvECM5cAuopijXn
 sz/6HWdooUIYTvjupiNzIZ7eCg+qLMItF+d7OCJhaW1qFxrGdgvf+BlUtZoJoOQwcOvL
 RfAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=akGJMWdX
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to v7.0.7
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From the release notes
(https://github.com/redis/redis/blob/7.0.7/00-RELEASENOTES)

================================================================================
Redis 7.0.7 Released Fri Dec 16 12:00:00 IST 2022
================================================================================

Upgrade urgency: MODERATE, Contains fix for a regression in Geo commands.

================================================================================
Redis 7.0.6 Released Mon Dec 12 12:00:00 IST 2022
================================================================================

Upgrade urgency: MODERATE, Contains fixes for a few non-critical or unlikely bugs,
and some dramatic optimizations to Geo, EVAL, and Sorted sets commands.

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index a10df46031..eb8c21be98 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  67054cc37b58c125df93bd78000261ec0ef4436a26b40f38262c780e56315cc3  redis-7.0.5.tar.gz
+sha256  8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586  redis-7.0.7.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7a637c106c..b08be11538 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.5
+REDIS_VERSION = 7.0.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
