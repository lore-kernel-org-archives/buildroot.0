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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8ACC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:16:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B9660F36
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73B9660F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16BA94048E;
	Sun,  1 Aug 2021 18:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znFb-mQfligR; Sun,  1 Aug 2021 18:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 786524047B;
	Sun,  1 Aug 2021 18:16:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1331BF3CB
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BC688382F
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWRRR0ahrboF for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 18:16:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72CEC8354B
 for <buildroot@busybox.net>; Sun,  1 Aug 2021 18:16:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k4so7869146wrc.0
 for <buildroot@busybox.net>; Sun, 01 Aug 2021 11:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nYJyX+v6dNCyCup1FLi7NYXKaBq4nUGgBFy86mY25/M=;
 b=BvCxCk4Q0AqBdB3WVUbsOFB4LAIrDIi8blFKkAurlwj9M+kCuGa6kZLSWSCJ/WJQJb
 9/mI5Bw98ZNpLQ05An/ls5QeJ+dM2bv1XiiUiY6wi+/Y3rLNHQt+WU7S49HPic5K0pOv
 PNyOmWwlAkuFNTK2w6ga4jy1SKQSmoWIrOgKZEOjRQScZUdFr+qoQPCQm+UnbCDwVLC4
 aw0vo9rF8b1+1HJGr1E79+5taHVxELqT2TTNa4Ug0q/XV4UXkD3wV6xCdAk87do7ZFS3
 Lf8vi+uAa5snZ1Ta0R1Q5Z3dxmEqSrA6DTSNf49KRcJtfF6Xms+VWRIxGm5gtU/GCZDs
 cLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nYJyX+v6dNCyCup1FLi7NYXKaBq4nUGgBFy86mY25/M=;
 b=Mgv8EdPQw0RkAEN8Gl+DUFYcHahL4tRCDZqQB+o6/KG09N1w6vSUP269mIKDp2caUV
 rzm5D9cGUrNRIHTsPOEKeY1ZafD++D4JueIOXrF2Ik6gxSv+r8P66Npg1o9N5NElBOkD
 PqzH33xzn9rPP1oeqPUC8q2OOn4HM3dNRgL78YaiD3l9kK0VftF+Y7e10Zxq/EjCeFm7
 JabsZgyAmP0FRzH20ZL5qrwSAsrhlhSOoSwB86/6k1h2PHcBG4lo6f3nbnPl42uliBCw
 97PxYj8f44W/h+8AnClGRkLta7xhbHHwT2SVAfv7b/MbPtDDNkcHQky+CI4o0SONQmNF
 Lv8w==
X-Gm-Message-State: AOAM533sjRi8S5fnGSxo46Aa6/rbfJ4r4Svx7Gno61KwoNXB/mjVLKdT
 jyyC07ri22zrAKrelXjWNc6z6/Uq734=
X-Google-Smtp-Source: ABdhPJxNJAFexwAHO4KsYCvXxjmmHIVG9K+BsGRizuxqmadYvjG7cAMImPLUxxdOj8iFWSWUaST5Cg==
X-Received: by 2002:a5d:4284:: with SMTP id k4mr13995243wrq.407.1627841778482; 
 Sun, 01 Aug 2021 11:16:18 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id x16sm8903114wru.40.2021.08.01.11.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 11:16:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  1 Aug 2021 18:51:07 +0200
Message-Id: <20210801165107.3294045-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/lua-lunix: fix build with recent gcc
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

Fixes: http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090/
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...ctl-instead-of-deprecated-sys-sysctl.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/lua-lunix/0003-use-linux-sysctl-instead-of-deprecated-sys-sysctl.patch

diff --git a/package/lua-lunix/0003-use-linux-sysctl-instead-of-deprecated-sys-sysctl.patch b/package/lua-lunix/0003-use-linux-sysctl-instead-of-deprecated-sys-sysctl.patch
new file mode 100644
index 000000000..7a904884d
--- /dev/null
+++ b/package/lua-lunix/0003-use-linux-sysctl-instead-of-deprecated-sys-sysctl.patch
@@ -0,0 +1,31 @@
+From 99b02b08d3f1a53e58b558b9f2250225e569a550 Mon Sep 17 00:00:00 2001
+From: Tiago Seco <tiago@seco.ws>
+Date: Sun, 20 Jun 2021 11:20:23 +0200
+Subject: [PATCH] use <linux/sysctl.h> instead of deprectaed <sys/sysctl.h> for
+ linux systems
+
+Fetched from https://github.com/wahern/lunix/pull/18
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
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
