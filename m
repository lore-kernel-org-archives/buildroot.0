Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986F3C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 05:44:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2951A61042
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 05:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2951A61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6EFA400D9;
	Fri, 20 Aug 2021 05:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osIdHC5KcaKd; Fri, 20 Aug 2021 05:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E544A401B2;
	Fri, 20 Aug 2021 05:44:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0871BF681
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 05:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88CFE4010C
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 05:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hGgaUnNjsqb for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 05:44:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CD01400D9
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 05:44:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p38so18162138lfa.0
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 22:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=K9sBKlPa8GT2WC35P1qCl5bkFFr5fyqyh8R88AjrHyo=;
 b=FmZ3yR4826z3Hw0DH6EapPoi6+3ehiRBfMpVOcm86DfMgluA5ut9xbj+WebkrGKZG9
 jiDFv9Gs75xpH1G0sMuBf15rb5f0S7NSRPetXYJwp+pc4ECJKhbz258pNcoaLSXHJGHi
 /13Zidl4ZIvk8HB622pedvzKLcTrUxw6USqUBDgL54K7Nx4lULaQtDa4GSomjlFTpN4e
 BUqk+XyICTwrC7s13ITq7XaDePPQ2gIvrbJUh7Wi4E2e64MisLLPqaOf0DYoKNVsaCNI
 wWLcQ9VN7c5JaaEzUJ/xncc2GfSSirTuE3Jy2nT2TB+lJO20evzC3DwH39n92fg3AQLk
 YrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=K9sBKlPa8GT2WC35P1qCl5bkFFr5fyqyh8R88AjrHyo=;
 b=R2NnXJpsHfP7dRj76CZXOL27NUni5sJK2VHLwxAKt+PcKbPDu5lNIfLr0YOTEdK9v8
 krqN67OZA3EFHTBm90PGqLt0g6OqumdYI6s1qFdK5VvzpkGIwvmFYKMXf71AWOq4U5T4
 T3vi4hEuG0VmQ9xlNeCnX2M1vHgLZn4W0Ls79vs8Yl2JJXLmIe085eSQFxVHyN8H7zfp
 Nxxm/jYtAUoSPJpB/bSRszOuh1EkY2izdDXNxWNKOMIWGWpQT5EkR8B/cXwk7jWOlxWf
 NxhQkhtfrB2QM3hVPp1FTbJJk3s1JJq2FIajHi9RLMt5xWnt8KvsHRZDm/0WaWZngCBJ
 JoMQ==
X-Gm-Message-State: AOAM532ldQNbYAfDf4JTm8mvHg6ylhEu3Z8lOP0o+MXIVpUP+k9zHBQH
 kcPRxycBA7bXGQ4VCo3tF1O6R4MB4p4Alw==
X-Google-Smtp-Source: ABdhPJzlq+sa4StMv+8I4kXZKBv3kmZxJeKSo1b/z3rdg39yr6B9/1FVNH5rUMZE1dtsI39EBzDoOg==
X-Received: by 2002:a05:6512:31d2:: with SMTP id
 j18mr13991467lfe.82.1629438280605; 
 Thu, 19 Aug 2021 22:44:40 -0700 (PDT)
Received: from wbg.labs.westermo.se (h-155-4-221-58.NA.cust.bahnhof.se.
 [155.4.221.58])
 by smtp.gmail.com with ESMTPSA id q66sm457556ljb.83.2021.08.19.22.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 22:44:40 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 07:44:19 +0200
Message-Id: <20210820054419.439633-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Subject: [Buildroot] [PATCH 1/1] package/smcroute: bump version to v2.5.0
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
 - Set -std=gnu99 to work around upstream issue #165 on older
   toolchains, which still have gnu90 as default (sourcery-arm)
 - Enable MRDISC build option, needs to be enabled per phyint in
   smcroute.conf to activate, so safe to has default build flag

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/smcroute/smcroute.hash | 6 +++---
 package/smcroute/smcroute.mk   | 7 ++-----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index f79ce167ed..01d5eafd59 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256	431be94c46646767f69c85fee445277b7e765a55177d3ee29522416cfe2cc067  smcroute-2.4.4.tar.xz
+sha256	fa0a496ee4258c286814b789e1dc4d0be2cc4788adba23e8484ff5d0a65f6cc5  smcroute-2.5.0.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-# From https://github.com/troglobit/smcroute/releases/download/2.4.4/smcroute-2.4.4.tar.xz.md5
-md5	a1dc8c54c684e8c8de139444f73a0ba3  smcroute-2.4.4.tar.xz
+# From https://github.com/troglobit/smcroute/releases/download/2.5.0/smcroute-2.5.0.tar.gz.md5
+md5	285a2765a4366e7d5ba07139a9f56bd5  smcroute-2.5.0.tar.gz
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 0db0e084f6..16197e6f68 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.4.4
-SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
+SMCROUTE_VERSION = 2.5.0
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
 SMCROUTE_CPE_ID_VENDOR = troglobit
 
-SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
-#BUG:The package Makefile uses CC?= even though the package is autotools based
-SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
+SMCROUTE_CONF_OPTS = --enable-mrdisc CFLAGS=-std=gnu99
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 SMCROUTE_DEPENDENCIES = libcap
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
