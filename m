Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43C2C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 18:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FC0D83336;
	Thu, 11 Aug 2022 18:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FC0D83336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0Lq2_QEMt1G; Thu, 11 Aug 2022 18:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27AEC83312;
	Thu, 11 Aug 2022 18:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27AEC83312
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 777591BF228
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 18:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 513F5401C6
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 18:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513F5401C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4iBdr8NEX8m for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 18:55:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EFCD40183
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EFCD40183
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 18:55:12 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id dc19so34979588ejb.12
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Nf8y1DwoiCPGAvOwVeSAix+sgWcao8epNyeHGrB9Uwc=;
 b=aVE7pg4HxFis4xwx2ehUDZuipAZtVvi5VMtt1T1xmCb/Eo2cri0mqDD1T8uapfg/1t
 CA/yXzeF6DF7jV3Af6IuGdnJLodq3oTEXsObyFNWZU2kLVDbmGLozCeelOT/GefdGhEQ
 QVQqtAh4+17TV4JXAXxJj7a7futaia1X+PKYegqO4smJyfvt40JxrqQhWYURQzTPIkOt
 uzBtHCyprrvcNjXKQL9pRcuOXuMokeqHIsV0gHvme/Nt7sahTclasOFBxYuo/8MPCZO4
 mYTcSe/EgN34QyupOCk0Yt8g0KJ6GI7uyHtSrXLSl9gYbW9oKqZBkwzZqtTuw6C8Bm5U
 5I+g==
X-Gm-Message-State: ACgBeo3Fi2euqoTb9s6f4p23/UJqI1nrMPMG2hv30sHSjhPqlR6xfkj5
 LNSYXNtiTNZruCQai3CWcZAjI8ekNOp6Tw==
X-Google-Smtp-Source: AA6agR4Ipc+iy7jvNaGV5xvW0kKbrnIa0CG3TymgxslAlSVTohsGNpTQoFbkeVxtDCgUCWa23KZZWA==
X-Received: by 2002:a17:906:8a42:b0:730:92dc:a831 with SMTP id
 gx2-20020a1709068a4200b0073092dca831mr274349ejc.481.1660244111247; 
 Thu, 11 Aug 2022 11:55:11 -0700 (PDT)
Received: from localhost.localdomain ([217.110.184.17])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a1709061da100b00730670379f5sm3789841ejh.221.2022.08.11.11.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 11:55:10 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 20:54:48 +0200
Message-Id: <20220811185448.1122716-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Nf8y1DwoiCPGAvOwVeSAix+sgWcao8epNyeHGrB9Uwc=;
 b=OIjTL2E0wXnyImHHzAHjGdjXC3gKn+VDniQMOSjKhimgC0pH1c3bFvDeF/GuUPi/rs
 uZK4beC+j3IKcSIdE51GxqMIBvBB1wFQWlVrnCH0CB1WuL+W5khEkTsJr/jdpkT6Vwr+
 uD+voXpZPrrp3rePX6srWsXUUGtcqmUIsSfYIXyKvH0czohF9w+JyLTGAP9c0ZDOnoEl
 n2N8IiSuAm9dhtgpBFmcavgo6slCekeS0X0k6b014euIMFzFFTBo+5TvdMNHwO/aMXW9
 rzB4EYZTTvKKkH4jdOlmfdrQc7EHgLQQY1GhL8OsaavRRmmh6QM5V5S2cn0zfxxcHsH8
 ucgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OIjTL2E0
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.0.4
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

================================================================================
Redis 7.0.4 Released Monday Jul 18 12:00:00 IST 2022
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2022-31144) A specially crafted XAUTOCLAIM command on a stream
  key in a specific state may result with heap overflow, and potentially
  remote code execution. The problem affects Redis versions 7.0.0 or newer.

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index bff478fe7c..d9b6ebea54 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  2cde7d17214ffe305953da9fff12333e8a72caa57fd4923e4872f6362a208e73  redis-7.0.3.tar.gz
+sha256  f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f  redis-7.0.4.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index b292782acf..245e9b4d1f 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.3
+REDIS_VERSION = 7.0.4
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
