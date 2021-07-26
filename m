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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D726C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:16:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3579860F02
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3579860F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10AD6402CC;
	Mon, 26 Jul 2021 09:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6uIFb-EBwgB; Mon, 26 Jul 2021 09:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C916402C4;
	Mon, 26 Jul 2021 09:16:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8424E1BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72B7F6078E
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5j4l9_kvGPM for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:16:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37A866062E
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:16:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l4so10202109wrs.4
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWd+EZZxjY+TCgFxUQS0sIcbQtxhC9S6OFFWckrnqfk=;
 b=icPfgHnM9/yXReO6nh8J/8J1C96l2tQAtrgHgH4g6zj+1ASVha7+xgXPSP/C1Wyr8t
 A84xZopOpJrDrnBdGDiZ+BMbWiiUoH83iFLup+IrVEUg6v89mXSjB1fY/9gABcfaRYH3
 FfUDIluQ90XM/3ijlYNssKmed3PBZJpqNXg7YYXK2QKSOz8z+cs4Jaoe5n7d5hX9+Vwk
 dk8eySKsCF8maGBxkVffKnjDzLmV4LrRGu+YLlZl23H1eVSm75CHYu6C19IUiJorzJeI
 EdyI/14JGN1KxM1VAwbaJlHX9jmiL0Zj71ZqA2PBoNkPRKsRwL+6LEf7mWAYC2FjIxV2
 rW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWd+EZZxjY+TCgFxUQS0sIcbQtxhC9S6OFFWckrnqfk=;
 b=M/cJshRyC2Mx1si+9KUPnO1uxNZdXaMohrEFJNUbljE3+6shtj3n5BonK+6/y41s7s
 51aXODX6U2wZ5Z5uTF32J64endyBjhBXjbffrMJxPC9u4uBDc5npgSId1AshFWJt612o
 Qiq+CHv8lACllLKJ6trfBlpH3Kq5sd5qn5ZmUongefcELUZDWuYv8dWR4f0v0Q7u4HdX
 Xyd686obtzbY3CSMS72OGG+JLj8zXdIA2c3WogpTtigs+BRxOMJWq4sYjI4xr1Ti1JY8
 m/abmoA4vyZJI/0DTPAtkAtrNeYSYHos+fgygtSllEKILGKCY1/qYhAv3BuNT5va3fyW
 g5Hw==
X-Gm-Message-State: AOAM531fqQLBaJnaeTWDDjowOR/u7SdsdpvYaSgnmB42ZcsyIZXy/Jle
 FMREsReKWtR9+TjCOGlqn6hmgDpM2Flot0aw
X-Google-Smtp-Source: ABdhPJxq1N9baoY+w0f6wvCZ0oe8Am9KhzHYMTMrEWaYrEBVZ64moUw6AptUIsQ/MNopjlSkQCbj1Q==
X-Received: by 2002:a5d:6485:: with SMTP id o5mr17710717wri.184.1627290998552; 
 Mon, 26 Jul 2021 02:16:38 -0700 (PDT)
Received: from smartron.passengers.t24.sncf ([109.190.253.13])
 by smtp.gmail.com with ESMTPSA id 140sm35898128wmb.43.2021.07.26.02.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:16:38 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:16:35 +0200
Message-Id: <20210726091635.86606-2-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210726091635.86606-1-titouanchristophe@gmail.com>
References: <20210726091635.86606-1-titouanchristophe@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v6.2.5
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
Redis 6.2.5 Released Wed Jul 21 16:32:19 IDT 2021
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues that affect
authenticated client connections on 32-bit versions. MODERATE otherwise.

Fix integer overflow in BITFIELD on 32-bit versions (CVE-2021-32761).
An integer overflow bug in Redis version 2.2 or newer can be exploited using the
BITFIELD command to corrupt the heap and potentially result with remote code
execution.

See https://github.com/redis/redis/blob/6.2.5/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index f5e5827dab..3d207fa4c1 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  ba32c406a10fc2c09426e2be2787d74ff204eb3a2e496d87cff76a476b6ae16e  redis-6.2.4.tar.gz
+sha256  4b9a75709a1b74b3785e20a6c158cab94cf52298aa381eea947a678a60d551ae  redis-6.2.5.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 4e16b346c1..c1d435015d 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.2.4
+REDIS_VERSION = 6.2.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
