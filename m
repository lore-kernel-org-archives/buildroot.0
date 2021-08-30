Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9601C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 15:31:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6751460ED4
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 15:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6751460ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 409204011A;
	Mon, 30 Aug 2021 15:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z81X1vAhzCkn; Mon, 30 Aug 2021 15:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7610840130;
	Mon, 30 Aug 2021 15:31:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06B791BF3E3
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 15:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02EEB80F78
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 15:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4qp5uCXRzrP for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 15:31:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EE7080F69
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 15:31:13 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x27so32088453lfu.5
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 08:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=TWMgkM3B94+HGLLJcLsnpkiJDWUvZEJQQvUjkgZSjhQ=;
 b=Gya0qQtqGiuDVdHZWjfzSYIvbC0tJd6vQOHiBZOjVix2GmKMpPdSdwBdYDYtVuSmCf
 NxqMcdQPY/7v7knY6ZKMCBCfCalEUHTOTa78uH5q6tfO45FOOyqJdbngeJTl4uXPhrAM
 uuMZ6b/GUE+EaOKztKr37RzG4XmbMRAnV0zf1qTptITmDqAveoTe92Bgvyn1nd4/nOJt
 UMCGAEvwgM+n+jkJ1p/fjt3XinjTrUQyY5j4+3v8AGttlFvt5jtp56sJGpzS0wdw8/Ei
 jqsjpFzJ+vs6mWKQPGvAbusJLIhaLbYHSyGync5X2OxFbit1fE/w6kEvM5W4ugCnAvd5
 7aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=TWMgkM3B94+HGLLJcLsnpkiJDWUvZEJQQvUjkgZSjhQ=;
 b=NIxE2CkuJIfva9jjdNCRBBsvEv4p4bVbuWDouV8txLOhG9GWO9jTBah8DK9ib8jL7v
 wrfr9iIndalLP832pZcdoqetkfoOl5LWUqiY6kcrwp9OLwvvvV1FKeAqXcu8GsZrWhXK
 Jqu5j0sKkd/0GU4vOv5XfnaETJPCpkUXrA91Gc/JYLn0VyLvYiPCD7mzAnbZ3nR+OzDM
 c1GO0TB1aQaHM2Wik1AWwGdN5vYNaB5SI82kiMiL5drL21RAkTBhlCF7QS9xDhD7pUyo
 7WyiI6qy0xsHiCayovLUSYpOK8jHBgQ7RsozyOuRHdwMWw0+QI0o/QSzbFgaRTEhkNCt
 EXIw==
X-Gm-Message-State: AOAM533FCD55gBgpO2QRxHpgQO+Nazl+zmzTLTLnY3zF9fJaFzIC/aSY
 J4yMTf3Twa11Z1vEHGDhLcrV8EkFCZK7fg==
X-Google-Smtp-Source: ABdhPJxIAml0eJcMAuFE3vXdC5NhDqSGlhmzsTu6jO9EEsJOZO5dDRmqaH0jh6xHyV7/xH8m6HbHoQ==
X-Received: by 2002:a19:4890:: with SMTP id v138mr17279817lfa.43.1630337471440; 
 Mon, 30 Aug 2021 08:31:11 -0700 (PDT)
Received: from wbg.labs.westermo.se (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id k20sm1871343ljc.2.2021.08.30.08.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 08:31:10 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Aug 2021 17:30:54 +0200
Message-Id: <20210830153056.3176678-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830153056.3176678-1-troglobit@gmail.com>
References: <20210830153056.3176678-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Subject: [Buildroot] [PATCH v2 1/3] package/smcroute: bump version to v2.5.2
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 - Upstream has changed to tar.gz
 - Drop _SOURCE, fixes check-package warning
 - setpgrp not used anymore, no need to override configure cache
 - Makefile no longer uses CC?=, drop comment
 - Enable MRDISC build option, must be activated per phyint in
   smcroute.conf, so safe to enable as a default build option

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/smcroute/smcroute.hash | 7 ++++---
 package/smcroute/smcroute.mk   | 7 ++-----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index f79ce167ed..62b72239cc 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,5 +1,6 @@
+# Upstream .md5 and .sha256 from GitHub
+sha256	7eca88389cc08cbfe75f787e02ab32a390ef806555069a08abe8d7fa925ed094  smcroute-2.5.2.tar.gz
+md5	dc29e6bd3024a1ad3dd0f2d8c2aed16e  smcroute-2.5.2.tar.gz
+
 # Locally generated
-sha256	431be94c46646767f69c85fee445277b7e765a55177d3ee29522416cfe2cc067  smcroute-2.4.4.tar.xz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-# From https://github.com/troglobit/smcroute/releases/download/2.4.4/smcroute-2.4.4.tar.xz.md5
-md5	a1dc8c54c684e8c8de139444f73a0ba3  smcroute-2.4.4.tar.xz
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 0db0e084f6..e4ee81db6f 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.4.4
-SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
+SMCROUTE_VERSION = 2.5.2
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
 SMCROUTE_CPE_ID_VENDOR = troglobit
 
-SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
-#BUG:The package Makefile uses CC?= even though the package is autotools based
-SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
+SMCROUTE_CONF_OPTS = --enable-mrdisc
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 SMCROUTE_DEPENDENCIES = libcap
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
