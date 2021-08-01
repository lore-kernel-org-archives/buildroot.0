Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7057CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:57:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C4DF6109F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C4DF6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6FA83C40;
	Sun,  1 Aug 2021 09:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id od8bYtfh_e5r; Sun,  1 Aug 2021 09:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C41683C2E;
	Sun,  1 Aug 2021 09:57:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9FF01BF8B4
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B5EF83C2E
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zx-KU7ODhQ3U for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 09:57:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9417383C02
 for <buildroot@busybox.net>; Sun,  1 Aug 2021 09:57:44 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n12so17754791wrr.2
 for <buildroot@busybox.net>; Sun, 01 Aug 2021 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XRT+8H/hFIUmNUeRxh5V/jOE4Dx3ky2LFXmiYv3uo2o=;
 b=V5+E/aE3U6YwzN0E+yVb5cA/Fxufcp1vHbqx/toF7D03Iz2TxzCKGuWvJOtNyJfKF4
 KPkLP1AyWBP6cux6ufXDpRJaJk4mHcpk81NeDUHHZJlW0FRDocF6lSyshaakTeKyrdnl
 B3Gc/mFbOc0LRENRDAX16aw3rqEJ2z1N4zbyrvpDK3b08ZAO+36MvlN1BL8K0Hi/7Rh1
 fg6Vwpf4854zSDH+RiHHZDRLEhZWvUtJRV0wc2yymWdpf7PgkefiOHOectxJSPnXsOzt
 cmGcwKr66OqEKkjvlmvEk/HOVUSM4MCn1wgQvabbnMwEr+LeF9Q19qqKR+ArR1YpsyhY
 nTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XRT+8H/hFIUmNUeRxh5V/jOE4Dx3ky2LFXmiYv3uo2o=;
 b=YZF4QBhxt7nY3k6QfSMdsDB20ucu/Y3rJE3gRru/3MtijnBw67X9lrJO6AnpBugDRm
 +N+ixLkoxrkVPhBJ2wcFdCWfOwdxKbzexhMrfLT//vENqXQ2B268FtIeKHZG/S8zWlpH
 +f88W9nYYyoAoJF2mYcLKa6BMd6ujiKPcFCxPPGTweAhyaxnImvpGMsW+BjvX/jJ2EwS
 /7qMAvYvd6aDVve3xZJGw753yWZnbIsI2NogptFVHvPQ7wYANUsbaZd8XsHprqayRh35
 SK1l2JDhZHxPcjWyTJPTEjXMSZ5wzAQeKUqGf1QfLu5suUfzkteNPaVGDz5rcxxASl3c
 14aA==
X-Gm-Message-State: AOAM5331bFG7e0DGEjz2hXmDsOFkFRjM0z12neYvM+JgjLM/aB0v5PaP
 RcJrubwd4zSoteWJU/caNNDcOYiao0o=
X-Google-Smtp-Source: ABdhPJx1Jx2Z8qbpS29HGQ8tTh99xh/sr0/YVzbnPtddGXu+SA4cPkAfiRyTR1MKqHO0YvuQMrJhHQ==
X-Received: by 2002:a5d:6043:: with SMTP id j3mr11852432wrt.417.1627811862460; 
 Sun, 01 Aug 2021 02:57:42 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id j1sm7803417wrm.86.2021.08.01.02.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 02:57:42 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  1 Aug 2021 11:57:34 +0200
Message-Id: <20210801095734.3213451-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lua-lunix: fix build with recent gcc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

see http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...ctl-instead-of-deprecated-sys-sysctl.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/lua-lunix/0003-use-linux-sysctl-instead-of-deprecated-sys-sysctl.patch

diff --git a/package/lua-lunix/0003-use-linux-sysctl-instead-of-deprecated-sys-sysctl.patch b/package/lua-lunix/0003-use-linux-sysctl-instead-of-deprecated-sys-sysctl.patch
new file mode 100644
index 000000000..e2369bdfb
--- /dev/null
+++ b/package/lua-lunix/0003-use-linux-sysctl-instead-of-deprecated-sys-sysctl.patch
@@ -0,0 +1,31 @@
+Fetched from https://github.com/wahern/lunix/pull/18
+
+From 99b02b08d3f1a53e58b558b9f2250225e569a550 Mon Sep 17 00:00:00 2001
+From: Tiago Seco <tiago@seco.ws>
+Date: Sun, 20 Jun 2021 11:20:23 +0200
+Subject: [PATCH] use <linux/sysctl.h> instead of deprectaed <sys/sysctl.h> for
+ linux systems
+
+---
+ lunix-rel-20170920/src/unix.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lunix-rel-20170920/src/unix.c b/lunix-rel-20170920/src/unix.c
+index bea4d14..dfa26a3 100644
+--- a/lunix-rel-20170920/src/unix.c
++++ b/lunix-rel-20170920/src/unix.c
+@@ -560,7 +560,11 @@
+ #endif
+ 
+ #if HAVE_SYS_SYSCTL_H
+-#include <sys/sysctl.h> /* CTL_KERN KERN_RANDOM RANDOM_UUID sysctl(2) */
++#ifdef __linux__
++#include <linux/sysctl.h> /* CTL_KERN KERN_RANDOM RANDOM_UUID sysctl(2) */
++#else
++#include <sys/sysctl.h>
++#endif
+ #endif
+ 
+ #if HAVE_IFADDRS_H
+-- 
+2.30.2
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
