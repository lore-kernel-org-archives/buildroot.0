Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509B6CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 07:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19FA34180D;
	Mon, 18 Sep 2023 07:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19FA34180D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXQmxK_USCS5; Mon, 18 Sep 2023 07:42:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08104417D3;
	Mon, 18 Sep 2023 07:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08104417D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38DEA1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 07:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11F1A81DE4
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 07:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11F1A81DE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbmBx562-cha for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 07:42:27 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E46281DE0
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 07:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E46281DE0
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so5175975a12.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 00:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695022945; x=1695627745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FgFqDY5gtXdAPtALiXpDcC7Cfr4cuPeQIky2vf0j+uw=;
 b=UzSur91xKl32ALKArsnHTOuXjF+IvV2a3CAjpLzRkVSaJcT1YNPsYB/vqhNbxuSrvk
 z7I1SR0ticyi/+hGgOJ3BnxqHZRuDNsvRwHQHmGLBusnABuA4hYKGajJ6EeBppt+xcze
 vMQYwVoI9hd1hXGGpYec7jxNUrp/3YmY3P6r09jQFx8xGvrv8LaguLGkoLfxNs84mBvI
 Dh0uQdqVfOs94ImlPpCWOoH+iQq+huGdzX1/iODW6xUkOaxudz8nhCA8kZ1e4QAvivA3
 GHup1bM+WYngLT9LDN36M2jCQK3sh8yXB6o7Czweu9Y0KAwPevGmp18IZ8+NvqQbJQ39
 jiWQ==
X-Gm-Message-State: AOJu0Yyb/9p76n9DgLLg78vh09o2XkiZP9uZKsvA4WKwt1IL80Dlt03F
 QiaiQtvuZTaecO+f7+WAYxKGx8EldleRhsr3A6Z5Wg==
X-Google-Smtp-Source: AGHT+IFm1HjFSWaof8USmUzP/PH0KCfyqpE7pHB0DeftBKJGKcAz7GFd2k6PnS8H4ofhMYExULCHlQ==
X-Received: by 2002:a17:907:2c78:b0:9ad:f7e5:67d9 with SMTP id
 ib24-20020a1709072c7800b009adf7e567d9mr3601838ejc.4.1695022944495; 
 Mon, 18 Sep 2023 00:42:24 -0700 (PDT)
Received: from angelo-ThinkPad-T470p.amarulasolutions.com
 (host185138219236.static.fidoka.tech. [185.138.219.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170906340a00b009ad854daea6sm5988259ejb.132.2023.09.18.00.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 00:42:23 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 09:42:20 +0200
Message-Id: <20230918074220.699340-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695022945; x=1695627745;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FgFqDY5gtXdAPtALiXpDcC7Cfr4cuPeQIky2vf0j+uw=;
 b=c8PYJr2xtwEPYijWH9HDFeitDTBUozwrZkf05irbVJ2jfF7DVOBVFgThxYqBHd2wmh
 Tue4GIA5xluDPBU4PwQbSLTv2hcBUiQ4l0JyH7nplZCC4MSmaL33Rljd2QKzSqGhB7Hy
 LQx+Eufp/t62yai+c/hmaWQMFOVVCi7eBrS0E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=c8PYJr2x
Subject: [Buildroot] [PATCH] package/grep: bump to version 3.11
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No security fixes introduced in the latest version.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/grep/grep.hash | 4 ++--
 package/grep/grep.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 142d15644d..a0028a4e2f 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# https://ftp.gnu.org/gnu/grep/grep-3.10.tar.xz.sig
+# https://ftp.gnu.org/gnu/grep/grep-3.11.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  24efa5b595fb5a7100879b51b8868a0bb87a71c183d02c4c602633b88af6855b  grep-3.10.tar.xz
+sha256  1db2aedde89d0dea42b16d9528f894c8d15dae4e190b59aecc78f5a951276eab  grep-3.11.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 2f3b405f93..61900bb957 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.10
+GREP_VERSION = 3.11
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
