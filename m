Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE52C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:35:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7059661002
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7059661002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 481D1400F2;
	Mon, 25 Oct 2021 07:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZwXz6-30WEo; Mon, 25 Oct 2021 07:35:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B06E0400AB;
	Mon, 25 Oct 2021 07:35:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB5B91BF2CC
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A81E0400AB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSEj2gW3sCsp for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 07:35:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B250D40057
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:35:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e4so11077057wrc.7
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 00:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j0T21nCMGoKfcTI5AAcdmGNICVhHLeQkGQQq9Wz2dPE=;
 b=l+s/86jW+KD1mx7QBYSDhOGrX1faIQ6qecrwW6E8ILtkNFz7/1lrS+t0ci/dUfGDKD
 56rE4iIiqWs1lF4yrXIg8bYpEWJHA8Sv0P5+8sR+YZBWaNMX8UvUlquoH2oKdCyfPvol
 4Mh3Gj5sahsDDiLBOQCiwTdO1QyJwtjfIcHDCw7Lh18dGBPxWmpZqXmTOg8XZE5MhbZ/
 X+T98iMARp1H2DjxpGbu4Ksv6UB2c1juVonyM/OCoUGJkIyR0Z9fUoaj4MBO8mvxyZzU
 MtGPTkO03IF9q+Jna8bZh1CyBhUWxzXfHQz+OkIR7f+r/fPGYyfwhjs5BqMZh29METRX
 rQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j0T21nCMGoKfcTI5AAcdmGNICVhHLeQkGQQq9Wz2dPE=;
 b=VXA6S0whibKsteELmWIic3K5hrbgUW29KUqg+13WhzskNZjy9zrD9X2YzgW20f2xo9
 cvWakztuGbem1K92WoWQJT2PUmGoglyYs0Z09QGEak6/TCdOzdwUYUdTn4Em/QAnuHox
 DZVxK4QM+nv22PyDDeV6vbZYnRHGc/vhYo57CnMg1Pjf53qV/rwCgqgnyox8nT4h5BUi
 aedHWRljm5QNMypIpUyLphcR0bF7NqlAusI0OdqffuuIfWQ8YPOpjd90lkMd5M85+Ycu
 pMsOoJoz40NjCs8F67Nwgu1J1+kWl8hfD6GufuPE3Ira/BKLiSW3EYhXk7Uj/enpG1dI
 78gA==
X-Gm-Message-State: AOAM530eQHjrvAX9tgIb1XV9QM4ZiflHpn6corThpWAyjwhAQ1uokZA8
 Z0e0Dw/XvffJZtpS17wBuF6ihoHADnOwcQ==
X-Google-Smtp-Source: ABdhPJwKB2D/gBL8hXKO5xCnkhTMVIsP1/S/ezlkwF6KFm/1JaONi2XrqrMnprKSqJkRRMvPzB6fWw==
X-Received: by 2002:a5d:564d:: with SMTP id j13mr21143864wrw.402.1635147303727; 
 Mon, 25 Oct 2021 00:35:03 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:1002:3347:f8bd:7b81:c866:9456])
 by smtp.gmail.com with ESMTPSA id k10sm17984194wmr.32.2021.10.25.00.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:35:03 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 09:34:53 +0200
Message-Id: <20211025073458.8576-2-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025073458.8576-1-etienne.carriere@linaro.org>
References: <20211025073458.8576-1-etienne.carriere@linaro.org>
Subject: [Buildroot] [PATCH 2/7] package/optee-benchmark: bump to version
 3.15.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump OP-TEE Benchmark package version to OP-TEE release 3.15.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-benchmark/optee-benchmark.hash | 4 ++--
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index 51f248462b..3797920c35 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.13.0/optee-benchmark-3.13.0.tar.gz
-sha256 58431b0d48c634dcb86d5e307df157a99256d4328a77a5099e0b1b3cd79e2968 optee-benchmark-3.13.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.15.0/optee-benchmark-3.15.0.tar.gz
+sha256 f1ddac5e9f58333194eb302e6d9840fa334300bc103abb3d9f783bf009a78c50 optee-benchmark-3.15.0.tar.gz
 # Locally computed
 sha256 0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index ce168def81..1357f9f270 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.13.0
+OPTEE_BENCHMARK_VERSION = 3.15.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
