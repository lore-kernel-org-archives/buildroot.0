Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023F8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC0461213
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AC0461213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6909E4037C;
	Tue, 14 Sep 2021 21:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8DeBh5O1zTE; Tue, 14 Sep 2021 21:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FCD940183;
	Tue, 14 Sep 2021 21:15:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEA171BF292
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DA0740183
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8q2dSGR2a_Xe for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 21:15:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D9D240154
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 21:15:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u15so423002wru.6
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 14:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y6F/EU9ObNVuLnpJ7i864ol2luUMG67PllSpb/j77NI=;
 b=BBOQSKCQmhNLGBKi5EfJZSvxddsIjbswEbbrKvyjeLBdblZv9cVVExg2fkmGd0OBxm
 fDCA9dlj8dB+QnDkKuchIGIdKSiXyitoxeEtRrDz4KnQJHy0Sl7vlYnrh3XllPDACqqj
 JeFXdhFdZtspATc2pAK+YKXf5fXHg1em5Irvg1kt8FOhVY4Mtmp1vYNKPHlShj/dygM6
 9OoSff2an9IAaDzOH0+lTC96/87wh/v7HStCZzGoyu4QtoR7MbgSMsJhKnHH5XO7ysd6
 hipyQICW8SCufg7AmLJWcEjk4yc3OaitCYvaFvB3V/tAIVRwEDoSFAtc8vHnBzRFml+Z
 e5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y6F/EU9ObNVuLnpJ7i864ol2luUMG67PllSpb/j77NI=;
 b=MvBIwpLOhrECKDhr9+W1OAbW/N+JJR0HUB70SM9qp+3wv2bafw6u+gGFLUnbhQ0L2e
 sgIbTH3GwRhTPIIwJ/tSkREysidO+MaLzkV7nZgXlfbj1zLgid7JHZuHcNfprF2Noktb
 3XxRmRNKvOItQlgPjHgUwbQIihFbhvDCww13ot3HtyZD8xq4HUUWW7Q2nO4rG93lctjP
 w9oCBRLQw7tFHukd0eoUOpy8AsSByeg79I5ive208mchb0wrqMuGOv6KJpkSIYbYew6i
 ILUlc5zgw3hW5YMdhGDvzw1Cm13mCUYEqLdRt+Pq1E8SGAKQYJewss7Uq6KZEwAJhRBZ
 r4tw==
X-Gm-Message-State: AOAM532yghSjn67qsesEVlkx3VW2Bo2w9loK7BHVadxVlAwOif2QoCGw
 mfL19PQMRvs0DUsW0iKelF7FCzkLWN0=
X-Google-Smtp-Source: ABdhPJw+deW+cpXLa/Lt2tqw6w5G4M0N7aoW/uJ3DnC4vU2pWdGwwi6VDwCadvUoL7Iiz8g3lJJZPA==
X-Received: by 2002:adf:c542:: with SMTP id s2mr1224139wrf.374.1631654106452; 
 Tue, 14 Sep 2021 14:15:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id l13sm11218853wrb.11.2021.09.14.14.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 14:15:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 23:15:01 +0200
Message-Id: <20210914211501.403653-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix static build with
 musl
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Static build with musl fails since bump to version 2020.04 in commit
fe97212976ea0b2a80fe1e076ad17d6f648cd1de because LDFLAGS, which contains
-static, is not passed resulting in the following build failure:

/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
/tmp/instance-1/output-1/build/host-gcc-final-10.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'
collect2: error: ld returned 1 exit status

Fixes:
 - http://autobuild.buildroot.org/results/d71aba27ff0c7711f2cb67261183506f25217a5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch

diff --git a/package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch b/package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
new file mode 100644
index 0000000000..502458e219
--- /dev/null
+++ b/package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
@@ -0,0 +1,34 @@
+From 3b89170333ef0fdfffee14751ce3e1d66d7dfa00 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 14 Sep 2021 19:08:02 +0200
+Subject: [PATCH] tools/Makefile: fix {C,LD}FLAGS with CROSS_BUILD_TOOLS
+
+When CROSS_BUILD_TOOLS is set, set KBUILD_HOST{CF,LD}FLAGS to
+{C,LD}FLAGS otherwise CC will be used with HOST{C,LD}FLAGS which seems
+wrong.
+
+It should be noted that, for an unknown reason, overriding
+HOST{C,LD}FLAGS don't work.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 4a86321f64..98bb92990d 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -316,7 +316,8 @@ subdir- += env
+ 
+ ifneq ($(CROSS_BUILD_TOOLS),)
+ override HOSTCC = $(CC)
+-override HOSTCFLAGS = $(CFLAGS)
++override KBUILD_HOSTCFLAGS = $(CFLAGS)
++override KBUILD_HOSTLDFLAGS = $(LDFLAGS)
+ 
+ quiet_cmd_crosstools_strip = STRIP   $^
+       cmd_crosstools_strip = $(STRIP) $^; touch $@
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
