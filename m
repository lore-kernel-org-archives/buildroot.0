Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB352C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:16:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EB3560F02
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EB3560F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E191402AB;
	Mon, 26 Jul 2021 09:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xp5oim60gz_q; Mon, 26 Jul 2021 09:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0E34402A2;
	Mon, 26 Jul 2021 09:16:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84E971BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8126F40377
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6H-P70sEDj8 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:16:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E26A401CB
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:16:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id k4so4859930wms.3
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EBfArf5zHv6SWx/2E8Bf02NqJewBlkrgwkTwEYyUsLk=;
 b=Gf/1KoxU2fyQg1VMtd8UI8TA6l3d06rGQfKvcI4yF8onitQsdRZOo1vhao09sxhDVd
 2J2mD3jCyzXuAtSQiUfWW9XBXa8M0Nbhljc0dGm4phEOtVeikEWJcUoGWwKKY6T2XHm3
 VOxkU8+8YlRw8Y344vVzG0hxdNyX0mCLqbzgTYycqd4LI4Nq1uki8xE24go1p/9ov4R5
 u4ASZvnLBRxUB0haSWWNT7dwSsfVlmU3UD6FqWQaL/FHHnQgf4KBpExlxLbTo3vgywo4
 Y+pP5E8bt4Rq8FRsAWtsAUfQdKm6gRxvgENgvsDrldwb9ZNnUj8I8txNI+8gCpVE4mbR
 qIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EBfArf5zHv6SWx/2E8Bf02NqJewBlkrgwkTwEYyUsLk=;
 b=fCXwOFUUIWIxfU7q0YYhN8lyWD013SxV5Rp4147Vmt7ixTdfJ3i4FUJO6xNVZa8qXE
 2Yfsx29Lr9Of5PW1r0ZpW0O2WF3DCrS44PreC5DRxvjImNAJp+JMVTJvnReGkAeTkadk
 RGl2D33RVrVSD6cly83RV5WS6tij16IdCpGh4zrxTRuWklicwSXLMBNit9+Sol7aEMb3
 9KPUDDOUg+moKh/8v3bq0enw5SW7w8gc5urPxHRK6wCyOrx8Oa8ZdZhxySFdlXCPoHF/
 7wiajslEfzC96Gor7I7NNd9EO4bx2BBb4V0U3PAk6l5NwpU46XXLzE6bCRlaaa8Wkf4q
 Vayg==
X-Gm-Message-State: AOAM531MUrAI5xW5aM3y4BcUqsjSUsZ5jE7t8V//T+J9K28Mbbn33plH
 VC40VDoMgy3jIXweHyjV4OoYyhLBBiwD0lsO
X-Google-Smtp-Source: ABdhPJykqFEYRgu7QvELAG2KDCo5a++n5vfDlpOLxMYwRY+7ZbRfZfVa+Pm3eGEP1Mo35egqUF9WAw==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr25631681wmg.25.1627290991603; 
 Mon, 26 Jul 2021 02:16:31 -0700 (PDT)
Received: from smartron.passengers.t24.sncf ([109.190.253.13])
 by smtp.gmail.com with ESMTPSA id 140sm35898128wmb.43.2021.07.26.02.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:16:31 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:16:34 +0200
Message-Id: <20210726091635.86606-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2021.02.x 1/1] package/redis: security bump
 to v6.0.15
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From the release notes:
================================================================================
Redis 6.0.15 Released Wed Jul 21 16:32:19 IDT 2021
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues that affect
authenticated client connections on 32-bit versions. MODERATE otherwise.

Fix integer overflow in BITFIELD on 32-bit versions (CVE-2021-32761).
An integer overflow bug in Redis version 2.2 or newer can be exploited using the
BITFIELD command to corrupt the heap and potentially result with remote code
execution.

See https://github.com/redis/redis/blob/6.0.15/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 15b55eb501..d736c09489 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  c3e60c928b183ca9fe8e878936a6f8ba99e0441b9b6e04d2412a750ea576c649  redis-6.0.14.tar.gz
+sha256  4bc295264a95bc94423c162a9eee66135a24a51eefe5f53f18fc9bde5c3a9f74  redis-6.0.15.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 925279274c..f66397b216 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.14
+REDIS_VERSION = 6.0.15
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
