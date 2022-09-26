Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC6EC6FA83
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 10:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BA8E409EF;
	Mon, 26 Sep 2022 10:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BA8E409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ze32sOSIgn5W; Mon, 26 Sep 2022 10:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D4C4409EC;
	Mon, 26 Sep 2022 10:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D4C4409EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE4691BF3EC
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 10:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A03A60EC6
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 10:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A03A60EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-nbSr0-huMc for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 10:17:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7889B60B6C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7889B60B6C
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 10:17:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id n10so9385899wrw.12
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 03:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Aygwxf1BU/2CVKwG/X4tnAEA6YQS2S9omO8cY8Fgevc=;
 b=kvJnsFbPnDDDNxqLBKJ9w15mYQOZyivVqu31uwzLuUu5YwfjQ00tiUimNg9KJKFJPI
 I7fjLQyrPnHEy/gZNakEz7X+k1iD41kI3Dx5TbCvKNA/pKLNEGUxWsV4X0XvKjavHqKU
 yg6Cr+1GYG5x6SSmv/ZQ6PNb9erdJIKVBR8tBBe97+vn3NrblQU9Zw2YxlANIJwJB4qP
 KNJBSicP9lG+cxVOBhbP/bqUkAQQDkN14hsEOQYfeT930Qj9vPFTPUw6C+BTE+VMgqoA
 vT/7KIz013bkfS0rUDNUvIVt0kn3OENjbUehOcg6Nn5swFqlpZRDz/fimQ1wFU5Sxg9E
 z+Jw==
X-Gm-Message-State: ACrzQf3fr0e6j5+u4i9F9PuAmxNmB0Wpz5iKrDTUfRNses3rJpLk8vre
 090q/uRDZHO1NIVLvIAeWFdlw4yExou/dQ==
X-Google-Smtp-Source: AMsMyM5ZfCt19SoHH70NS/E2aeVQ7OwNJlOmqZfsG8jPMyScYbKlmcw82b70AcC1R1JXdHVPlK1f4Q==
X-Received: by 2002:a5d:6090:0:b0:22c:ace8:493d with SMTP id
 w16-20020a5d6090000000b0022cace8493dmr1162741wrt.366.1664187462419; 
 Mon, 26 Sep 2022 03:17:42 -0700 (PDT)
Received: from localhost.localdomain
 (amontsouris-559-1-16-245.w90-24.abo.wanadoo.fr. [90.24.143.245])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d5268000000b0022a839d053csm14053346wrc.98.2022.09.26.03.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 03:17:42 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 12:17:24 +0200
Message-Id: <20220926101724.1989377-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Aygwxf1BU/2CVKwG/X4tnAEA6YQS2S9omO8cY8Fgevc=;
 b=grG9LjFQ1dWrA66BpDVnXob7ZJWvDhep5yJi18iKoyQuf9K9X0kgdX66MkQKoWiMxI
 qOJiGl/mt93PUdmO/0YXfa9NSUvhYus+YI5yJ+vlSWmD7g/xxZ9oIfs88fYP7yAWq+La
 NVe091GyZlGF1rrYHbQlaytU3veTzrYAXPR9o7EoEJNvxbGMyzkivGM81xzTKZIr0TZP
 HyiQW9xyji19UKFTHXOpqn8W3v79gg7o186gKaI/htCsdwF9NJ7B+17l60biqlEiDFuY
 dtgl20b+xFVFpoCKPpDSxvQRCVzo4H+Re6koA92v7+/e3ihoj5Ry3BKyvkdigDtxiRPn
 zxcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=grG9LjFQ
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.0.5
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

From the release notes:
(https://github.com/redis/redis/blob/7.0.5/00-RELEASENOTES)

================================================================================
Redis 7.0.5 Released Wed Sep 21 20:00:00 IST 2022
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2022-35951) Executing a XAUTOCLAIM command on a stream key in a specific
  state, with a specially crafted COUNT argument, may cause an integer overflow,
  a subsequent heap overflow, and potentially lead to remote code execution.
  The problem affects Redis versions 7.0.0 or newer
  [reported by Xion (SeungHyun Lee) of KAIST GoN].

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index d9b6ebea54..a10df46031 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f  redis-7.0.4.tar.gz
+sha256  67054cc37b58c125df93bd78000261ec0ef4436a26b40f38262c780e56315cc3  redis-7.0.5.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 245e9b4d1f..7a637c106c 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.4
+REDIS_VERSION = 7.0.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
