Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D70C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 18:24:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D2060F21
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 18:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98D2060F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yuriev.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A84780CDA;
	Mon,  6 Sep 2021 18:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGNFHSPO9MYi; Mon,  6 Sep 2021 18:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C51D780C9D;
	Mon,  6 Sep 2021 18:24:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 936DA1BF470
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 18:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FF3940269
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 18:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=yuriev-ru.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SPw9yfIfQJm for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 18:24:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E56EC40266
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 18:24:06 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x27so14825823lfu.5
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 11:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev-ru.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2O7Bt7jNpZeATmgY07wA+OfY2wOt3ljseyuYHa0Z9eM=;
 b=0xosy7guCcuPOBs7mn8icHU+6BPEfCzEtFSg01RWRNMP30UMJvdAJTnMl3YHtwNvHo
 wPlDnP3DlKImPYbaPA8+xHDjfy7kbFZrxIhl3gt0GWCjJDcmcwnW5r6dt/b+xsgdCMsY
 PoJGqnV9Wp9rn97UegCwSNRxU6oBytl6X0vngpw3LC91IkKuwbQuWvpI+e5StqnSoDzl
 QnHTdZhcRsO6zFb43cf/1mwUCuB7x1MmM075eRcyujp335p22AgOlAIdLEqXOeDbgDG0
 2ktUxKJkGhMxIba+lGZwQMucMUBumeik0IfWjCAnWdTLJiU7VM4DPzKwShyKk8nkea+/
 Erjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2O7Bt7jNpZeATmgY07wA+OfY2wOt3ljseyuYHa0Z9eM=;
 b=NBThff7HIsx07xMaQ8ZOFfSzn+4KmUVXuRuzcdw9LiYOsOSGfkEZNgKIgYS3/Cd5a2
 8meQrvqBcYGN7F/nwpUy6t9Vj4DObNRmH5oKrPkfTkUeiNwqK+svLIjuenbYGV+2/tTE
 Gw3d4Zg4KgUk0u0elcLJz1CyAzk3WZTaOuQm6+s9UYl/m5EbO3wYVaUMwc9J0dPvqFeC
 OKjY8CAUV1wE5BbwDvmivwmopX24cvaxwDYk9wOMFuaPeZA1KYFmIyGai1/vdzD/AbtE
 Y8GxAEFuNJEufMNw3ru5SYUEuT2pfWQRAX7QaGG4hAMNEgs+Orqe9qGe8XEZ36iNY5gz
 tFTg==
X-Gm-Message-State: AOAM531UwfNsDPdAdehFWuh2s9yh8aAGrHjHSl4fvzED5q0X3VwSi/Ku
 dwVgCprJSbRw77QAsjqdA3NsR2qslxhJQC2J
X-Google-Smtp-Source: ABdhPJwEwjSARxWZsYVrClniCPcpzK+f5A13bo0KfkzjfY64Nwq2NJmnS9o/iUBKq4yVYImW9YK8iQ==
X-Received: by 2002:a05:6512:150a:: with SMTP id
 bq10mr10071904lfb.441.1630952644193; 
 Mon, 06 Sep 2021 11:24:04 -0700 (PDT)
Received: from ly-ThinkPad-X1-Carbon-2nd.ptsecurity.com ([188.170.175.182])
 by smtp.gmail.com with ESMTPSA id g2sm792734lfu.139.2021.09.06.11.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 11:24:03 -0700 (PDT)
From: Leonid Yuriev <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 21:23:42 +0300
Message-Id: <20210906182343.339361-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.10.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Leonid Yuriev <leo@yuriev.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Leonid Yuriev <leo@yuriev.ru>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index c8a28ada34..7cc835a96a 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://github.com/erthink/libmdbx/releases/
-sha256  745555704df76626a6612ad0c6bc6b1a66bfab98b9245b07dfb82640aa46d6fa  libmdbx-amalgamated-0.10.2.tar.gz
+sha256  a8f2436c4d008886e044f568a22bda44329fb1c67f175d91a929ff8e2065340a  libmdbx-amalgamated-0.10.3.tar.gz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 60c5148625..76bd56dfd7 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.10.2
+LIBMDBX_VERSION = 0.10.3
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
 LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
