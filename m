Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94872CDB474
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 13:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 021A561187;
	Mon, 23 Oct 2023 13:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 021A561187
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5v3rkH2p1W-o; Mon, 23 Oct 2023 13:53:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E3116116F;
	Mon, 23 Oct 2023 13:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E3116116F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 653531BF36B
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 13:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A302416F1
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 13:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A302416F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3wqLXfiMaHc for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 13:53:14 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7B8E416E6
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 13:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7B8E416E6
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40859c464daso16649595e9.1
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 06:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698069192; x=1698673992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RusDMkallcMaAXF8fiHWiAB0CmJ7zQ50FzjySd32VZs=;
 b=ou6jb05BnozbrUUaZfs3KJuWaqAVxG7USdUt2jYn8lMwBHo33PrcsMKoMPixr8fNcL
 X9ANJdjCQ7gqx8SDOMg9e2uLgc28+nnaN9wOjwe86MQFO40fT03ljH+kjmrRa8TrKV6t
 Eb8/RMIvXMu+q65taBWpWkTJyFg8/yocgCvqAlKUcHODWkk88xPeRQf7Jfz3x/LEehAQ
 qSqybAphkViKy7c4t7ZkD+Z7uk6g9ST2ug0TFcM7SCt71m7Aamf+7ZoJzv/GZn4kwi0n
 RF3RFNwgnnrKc8o3Iuernp8xVgPFi0r+HD44Y8VPJ1g+VmxABF/CwazKMo7d3fqRYi+B
 HYKw==
X-Gm-Message-State: AOJu0Yy9EDSrTXCD/ck3GG8B7B8dOHGesLqmQzDKLpYjDwn1lFvMhz/w
 9eYj2LYQQrjyEsrhtOzx1hF8P3MY9QSS+Q==
X-Google-Smtp-Source: AGHT+IGiyLjwGlZMGO7ObmouMGZKFns2sNHVOkDw0MBsk2ult8ErkypR0cj87Q/wHfmS6hvoG2yanQ==
X-Received: by 2002:a05:600c:4f12:b0:408:364e:34a2 with SMTP id
 l18-20020a05600c4f1200b00408364e34a2mr7688511wmq.10.1698069191669; 
 Mon, 23 Oct 2023 06:53:11 -0700 (PDT)
Received: from smartron.home ([2a02:a03f:63d3:7700:58f2:6635:fd54:243])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b00403b63e87f2sm9634113wmq.32.2023.10.23.06.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 06:53:11 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 15:52:50 +0200
Message-ID: <20231023135251.63644-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698069192; x=1698673992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RusDMkallcMaAXF8fiHWiAB0CmJ7zQ50FzjySd32VZs=;
 b=mJU4S2ohA2spD2YJo+tvZL3ArQ/ZAtlTUG6L48zV8BAqSBgR6KY9d5nCK4ySoHPwFd
 x+yZ95uLrJUPzrGgC9l2+50FGZBKy2TtidYoeqFE6fc+V44yEE8ldZuudzkuUGRTVjZM
 e+78RRNCoEFENeId8+Zihdi18LhrUGASo+FovquIoofGvbjMn8yUAI35GtBs37J6Sdk1
 48d+zfc0WDypTFsPCOoVU+IEru/8cusaDSVloZ+kwphmXXV3t0AJujGfvgZu4t5MfZNY
 fHzgbkcCRIkFTu3Tj2Y2JZ//Js5b++8AUS6IiTaCHuPPySMWnvEccyzT6tr6xdOuNOA9
 HZrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mJU4S2oh
Subject: [Buildroot] [For 2023.02.x 1/1] package/redis: security bump to
 v7.0.14
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

This contains security fixes for:
- CVE-2022-24834
- CVE-2023-36824
- CVE-2023-41053
- CVE-2023-45145

See the release notes:
https://raw.githubusercontent.com/redis/redis/7.0.14/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 69bfc1475f..cbbb29ca13 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3  redis-7.0.11.tar.gz
+sha256  7e1cdf347f4970ea39d5b7fdb19aedec4c21942e202de65bdeb782d38d2f299f  redis-7.0.14.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index e5d3de8eb9..5bf15821ba 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.11
+REDIS_VERSION = 7.0.14
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
