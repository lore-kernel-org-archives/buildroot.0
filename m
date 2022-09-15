Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B7BECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 18:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F30FD83EAC;
	Thu, 15 Sep 2022 18:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F30FD83EAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMqhTg9Xw7cR; Thu, 15 Sep 2022 18:30:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ECE583EA6;
	Thu, 15 Sep 2022 18:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ECE583EA6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D58181BF5AA
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 18:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B117283EA6
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 18:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B117283EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bR1zOShm5TLQ for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 18:30:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13CF783EA2
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13CF783EA2
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 18:30:51 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id r23so9502312pgr.6
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 11:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=vcSkDMEEmBIbHRS3fdyshk+vvJgx7RE8mexd3GEHoZ0=;
 b=k1sRa1HbQkGxBxuW+7/BEgGwRzY//cOGMRO7vmXNMsYdYfvDafvsvlP/ANWkA0Qq6r
 YC9tzEA0AycpoK+0Zu9gMpsOqhVX/M9RcC2mh3cAaI0J8EMYaYSzRo3v+RvxrQl9zenH
 02ZeFxTbv5TwAcongRWB82viSxEjDZakTpl+9nsqY0cRX1DTB3vA3RiKymbK9GjL4mUi
 FJu+Xt/GDfg+S9OT5muDLHMDJ5Wf7T7eB41LCQQibKER6im/oblyQg3BhXtDGz774Zxj
 bAos+AfMJdSzw08NFoA2UVD3naBmtmArWrJ6kH9ZQ5WPli9DuvONxHVUT73PGgQT2rk7
 He+g==
X-Gm-Message-State: ACrzQf1JSVHdonoRdmvrDv+cTt12QJgHLqnHkDKdPn/4d0/0EiWse8hI
 YzpiKtnpw07a353y5F+AqkfP2jVvGh88Tg==
X-Google-Smtp-Source: AMsMyM5jK0KwfrbI6sHeyO72b+3hxAElP7CZOxb9h0J3K6uMtP1nsu4lcHEZE9BKD36KqaiW+jd0SA==
X-Received: by 2002:a63:1450:0:b0:439:3806:9b91 with SMTP id
 16-20020a631450000000b0043938069b91mr983127pgu.407.1663266649946; 
 Thu, 15 Sep 2022 11:30:49 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 r20-20020a63ec54000000b00434e1d3b2ecsm12034416pgj.79.2022.09.15.11.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 11:30:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 11:30:46 -0700
Message-Id: <20220915183046.458486-1-christian@paral.in>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/containerd: bump to version 1.6.8
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containerd/containerd/releases/tag/v1.6.8

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index c0c926f2e4..285519441a 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  27afb673c20d53aa5c31aec07b38eb7e4dc911e7e1f0c76fac9513bbf070bd24  containerd-1.6.6.tar.gz
+sha256  f5f938513c28377f64f85e84f2750d39f26b01262f3a062b7e8ce35b560ca407  containerd-1.6.8.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 80952914e6..89bbbf5c03 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.6
+CONTAINERD_VERSION = 1.6.8
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
