Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCFFC47DB7
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 19:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D311B42212;
	Thu, 18 Jan 2024 19:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D311B42212
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMPykWMHbqEk; Thu, 18 Jan 2024 19:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2909B421DC;
	Thu, 18 Jan 2024 19:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2909B421DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B58451BF20F
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 19:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A8D48447A
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 19:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A8D48447A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3hcLt_aA9NN for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 19:37:35 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A225F84479
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 19:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A225F84479
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-559edcf25b5so2203234a12.1
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 11:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705606654; x=1706211454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S7iAFG00opTuXBUqSAp5ukCy6vcjWCEpxXtRb8DsmAU=;
 b=eV2bsED2VC0ae+cKC5yeMd9xtmpQVl7KQxKmYS3kXdsH5ElwtLA/ZgtD2wjtabGlta
 PeKrOK4k6bwutDyQ00P3MPPNPMl+Gn89MSGp58ANFfUZ2sgHuIOskX9g5nFp6Z41dH+H
 Xt2qUUOHneK4ADDC+1DodeBSkKDT/vpIWcq8janvzbeC/x6obUSXZmiQbR35mN4h4uu8
 HSDbABkAW3A6oGJ0+bEsn0ZkegwIWoiZvnQV6cmQMnxKOACArZ+mWrJeUYuNkpZzP05P
 omDGUMVwmUjiqQv+vwrGdPYl/UxLJlnH26crA79HeCdDWGWX00YxXgQz4urUu2QtaywC
 btVw==
X-Gm-Message-State: AOJu0YzMR9kOPmngcQdD8jYHZoDVHdEbuoVX+Y0Lq/KYZqSKFnQnEpbr
 ExauY63eAfGM9LKd1NKn6RjUxMU7f3T8eoED2SuRC46/zxopq88ktYi/nRlG9jJJMw==
X-Google-Smtp-Source: AGHT+IEkRGRsbrcxwjQDiwSz/H8tgYXnZY6U6V3o9++3W1zCEyjdl2rrS1WO8ZVZpttRQv9zd+weRQ==
X-Received: by 2002:a17:906:114a:b0:a2d:4d43:bef7 with SMTP id
 i10-20020a170906114a00b00a2d4d43bef7mr819620eja.71.1705606653429; 
 Thu, 18 Jan 2024 11:37:33 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 vi11-20020a170907d40b00b00a2cd74b743csm8188848ejc.3.2024.01.18.11.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 11:37:33 -0800 (PST)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jan 2024 20:37:17 +0100
Message-ID: <20240118193717.915022-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705606654; x=1706211454; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S7iAFG00opTuXBUqSAp5ukCy6vcjWCEpxXtRb8DsmAU=;
 b=O6GCe+cG2eUOnFxlft+fCPvJ+oqNPAnbCC3s+PmbJyuqEdL9UM8Uqj/r9IdJnm68I8
 gA5G5LuBBQa8ahcjeUYFTiLcsEczhEMS6zry1esS1jIPrDFluWD5RDZ6Ov61r0WV/Z/3
 bVGS7Of4IGgZ/kqyr7pY0On0z08YktshM709oxzaAYImDjoYafwvEQuMHsEyMmhp09EV
 QkxXXUfiRoT6If09TwaBL/R67zabDZ8hcUzCJ6BjH4oQFRlO37hKguRTaAmICsbvejT+
 Q4Ob8Pe+3c0lb7n6yf0I7v0/+QT9DgIB0L4UHLyue4NbBRmY7NrQg9Z5bKeQ++RAUJjk
 o6AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O6GCe+cG
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.2.4
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

See release notes (https://github.com/redis/redis/blob/7.2.4/00-RELEASENOTES):

================================================================================
Redis 7.2.4    Released Tue 09 Jan 2024 10:45:52 IST
================================================================================

Upgrade urgency SECURITY: See security fixes below.

Security fixes
==============
* (CVE-2023-41056) In some cases, Redis may incorrectly handle resizing of memory
  buffers which can result in incorrect accounting of buffer sizes and lead to
  heap overflow and potential remote code execution.

Bug fixes
=========

* Fix crashes of cluster commands clusters with mixed versions of 7.0 and 7.2 (#12805, #12832)
* Fix slot ownership not being properly handled when deleting a slot from a node (#12564)
* Fix atomicity issues with the RedisModuleEvent_Key module API event (#12733)

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 365fbf4063..378b930374 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  3e2b196d6eb4ddb9e743088bfc2915ccbb42d40f5a8a3edd8cb69c716ec34be7  redis-7.2.3.tar.gz
+sha256  8d104c26a154b29fd67d6568b4f375212212ad41e0c2caa3d66480e78dbd3b59  redis-7.2.4.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 77cfb1e0b1..09a3b9448b 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.3
+REDIS_VERSION = 7.2.4
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
