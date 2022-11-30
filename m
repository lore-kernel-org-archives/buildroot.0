Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50D3C4321E
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 07:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5151441743;
	Wed, 30 Nov 2022 07:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5151441743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IwbsPFCZ-YrI; Wed, 30 Nov 2022 07:55:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4534A4173F;
	Wed, 30 Nov 2022 07:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4534A4173F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B295D1BF853
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B41760ADB
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B41760ADB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97OaTF2x6yND for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 07:55:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E6A60759
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6E6A60759
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 07:55:06 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id n7so142472wms.3
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 23:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nDtzBcrFtYLMnbmV5x2PAai5VTqNCeJTcDibXFL2pKI=;
 b=jpi4yVjuvX1Ur5yX5isIxWxRWasyEfAW9vTN2MlHFt4rMRjM1QmNxMs3QhhmEbcIFP
 mRg1OXbcrC+MvhQ4LneVFIYUNP0opK9MO5qS2WLqpDJD7G9iXu1Qw1pHXCS7KbyphFKw
 YiD1/sY64+BZtjOQe1GukTW8UO8vhkJhejXjqYXRtLqfOoW1ZhkiXFlMpD1vkwpML5Ad
 8XOOIsB7bGZiujMbzbgImHhnSxKexL36KasKKULT1gmhbHlFyg3uAbx1HxsxjMnBIhgx
 y5ZSpvrM5q+thjkhpbn4bzf1EpkaHIDv7+IY0Pziat4XMkHPqZ2jJif5b8OO67y1ouxn
 M7PQ==
X-Gm-Message-State: ANoB5pnV4+NxPlYW6pYhoTBGagh2+DA7JCjP03rjuWaviOacgStTfjft
 9LMfklJ6TYqMEUNc6H/5llVaEu9tJl9bXg==
X-Google-Smtp-Source: AA0mqf54YtHe1nQrda9qtx95OYUGhkv1tYzCTyF5TeBuG8h1t8E+FIQSiCj0Z4+YZV9vTEKx8zv3yg==
X-Received: by 2002:a7b:c045:0:b0:3cf:6f5f:da0e with SMTP id
 u5-20020a7bc045000000b003cf6f5fda0emr29919051wmc.19.1669794904514; 
 Tue, 29 Nov 2022 23:55:04 -0800 (PST)
Received: from lmecxl1178.lme.st.com (87-88-181-79.abo.bbox.fr. [87.88.181.79])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a5d5649000000b0022cdeba3f83sm677511wrw.84.2022.11.29.23.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 23:55:04 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 08:54:47 +0100
Message-Id: <20221130075452.2507453-2-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130075452.2507453-1-etienne.carriere@linaro.org>
References: <20221130075452.2507453-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nDtzBcrFtYLMnbmV5x2PAai5VTqNCeJTcDibXFL2pKI=;
 b=vLeLUHhOsug52+gellbiwkPo7CmqtA7BvO6aFm14xpJPS7AKHhCutTKGdA9+0J0knK
 7b3YNKR/XORAVRyhZoFWez85xmm9ysujzzRTOB+sSXDG8bilUWtUAxuwQfBGzP+T3k+r
 reIkYrNM7u06rZhon28BMExi77QYCZNOyJbKAw9y/8oT51a5vDnDm/U1Fz3imd8zGiQP
 byi0vrgELIx9JyRMYRzuZ0hgXIZCh+6QaEYloDV1ItrZq3Zj1z9DX/Lv39VCsmnGFX3N
 rg1sJPJ4ATmk7SKM09BzUoagYjbY/TlKVyzDf5ymGyCfliwchmAr4LLbMdhhtXmugKkK
 BuBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=vLeLUHhO
Subject: [Buildroot] [PATCH 2/7] package/optee-benchmark: bump to version
 3.19.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE benchmark package version to OP-TEE release 3.19.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-benchmark/optee-benchmark.hash | 4 ++--
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index 27c91e0fb0..d74a24c8ab 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.18.0/optee-benchmark-3.18.0.tar.gz
-sha256  2151aa5da062402518f35823d9c9dffa2e012f924625d2f7123e0d21d350a86b  optee-benchmark-3.18.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.19.0/optee-benchmark-3.19.0.tar.gz
+sha256  32f41854bf07eb7bb89dfc702da023c3a99518c33fbe7edf0e1f004e29a8c90c  optee-benchmark-3.19.0.tar.gz
 # Locally computed
 sha256  0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index 1071c4bb5c..338a51ada4 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.18.0
+OPTEE_BENCHMARK_VERSION = 3.19.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
