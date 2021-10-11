Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB9BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 07:27:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33B4D60698
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 07:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33B4D60698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0006260751;
	Mon, 11 Oct 2021 07:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycG-StaW-cOi; Mon, 11 Oct 2021 07:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5022560723;
	Mon, 11 Oct 2021 07:27:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA6FB1BF29D
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 07:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9923280EF9
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 07:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQRBc-tU6Zai for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 07:27:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF66D80E9D
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 07:27:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id a25so48124568edx.8
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HnFq5xExR5Wn/4JWA+2CZ7SR9Q8f9VNLx09BpSagIs0=;
 b=k0DMkZ2gU6xLosM5Zt9LZK9Vme8dJ5LzktD4PsTt2SlK+FDRFVweba6Egvy8/AJJQC
 EUttep4bICfUQ5PpGMpzfVNs+SNBuk/91SAx45x/cTO91JCKIouevp4TUy1b1xpHJc/3
 nt78Sa0tSgMHpYJ4xnnJGsMVNJjXzWepZdgF5csddNB8L21WUFj/WZlOOwsCUP5ByDUB
 +I/F9QGuux/AVVC1nehDw//MXFBiNnetNfXPrTalrPY0lDDcw5EOqcq5Vq3Hl/rf6aOy
 Vjh4yaVX2an9DTWZX3VWqTSdxzhSPSJ2rOkkpHKqHhPwEyD3qo4Dslcuf04nOLjqqvwy
 3Tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HnFq5xExR5Wn/4JWA+2CZ7SR9Q8f9VNLx09BpSagIs0=;
 b=Kp1M0YjwjWo9yqY6ua8I5wNPAIQS5mrFZTfOK4dx7uAutwsW+tYZMNVxlVJh3Azbeo
 QiLVdYtv7067HHpMBk2sJJoJY0ZrfXOE/Ac4BdJwRueiJf/Z70LRMxLebER3101I1zIB
 JXsOXbMWUjFh8sT7Tfd0GVHbMfdSSKrsuDDA6gNumGJyoE3cyGHz4LvBCxfRAGmTt3md
 exMS/zQKRHLPebSm83oLwQ2Q8Roia/k6Z51Wzn8NEESGN6G997Sy4U4VtQEPueN2M8bp
 uEJefwsNEU35rbay3SxqX5od+Oj2UKvR0pBSOcZ4bgtuQO43lUQUAbzGLsezDmazjvyG
 2W1A==
X-Gm-Message-State: AOAM532SRBMHtG8z4uUBqoFuF++RsDUvROT7viFMd8ejbps20zZZl07D
 ZsVOD3dL3HZDsFHGiOvZMovStOUW2hg=
X-Google-Smtp-Source: ABdhPJydIm8W2sbDGynYJv551rVycYIyJcBtHqCZymE2uB0IIrsutlO3OqLgMku9sdsTC5N7YgCZJA==
X-Received: by 2002:a50:8d85:: with SMTP id r5mr38772328edh.312.1633937218973; 
 Mon, 11 Oct 2021 00:26:58 -0700 (PDT)
Received: from smartron.home ([2a02:a03f:63d3:7700:47c:f3ae:fe47:54e6])
 by smtp.gmail.com with ESMTPSA id a1sm3690489edu.43.2021.10.11.00.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 00:26:58 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 09:27:41 +0200
Message-Id: <20211011072741.577768-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v6.2.6
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

This fixes CVE-2021-32672

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 3d207fa4c1..74a9392a63 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  4b9a75709a1b74b3785e20a6c158cab94cf52298aa381eea947a678a60d551ae  redis-6.2.5.tar.gz
+sha256  5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab  redis-6.2.6.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a260dcf719..f3c030d68c 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.2.5
+REDIS_VERSION = 6.2.6
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
