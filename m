Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B081BC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 07:38:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE1F61042
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 07:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DE1F61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21E8160840;
	Tue, 27 Jul 2021 07:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Gd-_sB8WN4F; Tue, 27 Jul 2021 07:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6278C60837;
	Tue, 27 Jul 2021 07:38:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF3FA1BF2A1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 07:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DED7B838E0
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 07:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ws2Ly_nT4Ymo for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 07:38:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E65E2836C8
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 07:38:07 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b9so13134614wrx.12
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 00:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEHnwk7GxRTwzYDi6J+/YO8pLVO74ZKScMcbdpLbpAo=;
 b=mgImofUm8B4VaLM1O/EqwxqKo71EQXA5SLcNREbqnSO/uA6EUEA542+u94DQr+kZtX
 fjLFYsOecJQ4N4aOKS/f941XKtBa/5asXKz7Cy6A4fx2ZB9SanxwyZVOsHaVRQk5lX5B
 8kwaq0Q6D2wfZ9/ujyAp0SzF2DVuu652Zz5fUOzqvHNIdPCuQhewWqWnNXB7B63bps3d
 U187vNCrm3eP/r6E3PGFiVSvy2W/rSXxX1C7JYTG1eMKr0iIHv/hm9sgbkdcRcx0F1Oo
 +2OeDOpdOqNxdN9udrdAEU6R9H2bvWlFcrNkQRidv05BKodlEhD0Vc0yZTul2+ftvtL5
 8Dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEHnwk7GxRTwzYDi6J+/YO8pLVO74ZKScMcbdpLbpAo=;
 b=StZ58iy7Bmi1cH1Z31fHT/WbEjMQmLTvsKejEKDcNM1p6J3ee34wSTxLAVVBew7A97
 1bZtSWbLkBpQmKV9k2o52EI7ylDgwGRoCyZ+VJuIc5b5cepV2weWGof5kcgoz4OYCbfy
 iA0m9Mo7hBs2c6/YtgZPDFXqZEmxCeyiaxMlAGfHqZoCjjTaaWu1+MeRNnM0qhrPpp/Y
 BBjXp5KpxOaUoQ7Uzy0IuHD+7X/TizKZH+PxCFPfdlA4L1CdNr4D8pRJPKw+4PF4xBAc
 TS2mTbpZo5lW223Xejs2y8bZWEsnKcEJDt9w89WGG1zoZTD2uR6nQW2lXJ7hLYyakeCi
 qhBQ==
X-Gm-Message-State: AOAM530x0As1xgKWex5g+yarLCU9auu7jW73w9bXYvKLCBvQvdWD3usB
 mObvcM8IVbJ8kokTJbn403YU5EWeTZJ4jA==
X-Google-Smtp-Source: ABdhPJyAl/ney6xlHp02jvHvc91PXMKpqrvoUVrwaZhy+fBbitu981v4OIId3wgFpwE+BfEnbglAQQ==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr23502156wri.149.1627371485800; 
 Tue, 27 Jul 2021 00:38:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id l2sm134840wry.32.2021.07.27.00.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 00:38:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 09:37:55 +0200
Message-Id: <20210727073755.2283481-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/open62541: fix build with nios2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with nios2 raised since bump to version
1.2.2 in commit	b436b82411305839abc76bb438fe92661a067526:

/home/buildroot/autobuild/instance-1/output-1/build/open62541-v1.2.2/src/ua_types_encoding_binary.c: In function 'unpack754':
/home/buildroot/autobuild/instance-1/output-1/build/open62541-v1.2.2/src/ua_types_encoding_binary.c:322:12: error: conversion to 'long double' from 'long long int' may alter its value [-Werror=conversion]
     result /= (1LL<<significandbits);
            ^~

Fixes:
 - http://autobuild.buildroot.org/results/c0a33dbada549c480bc741c1c8177b788ff053db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...licit-cast-to-avoid-compiler-warning.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch

diff --git a/package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch b/package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch
new file mode 100644
index 0000000000..dea325c17f
--- /dev/null
+++ b/package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch
@@ -0,0 +1,25 @@
+From 0c53fd776af9631c915c8722e1d68ce9a69fa3f6 Mon Sep 17 00:00:00 2001
+From: Andreas Walter <andreas.walter@waltronix.de>
+Date: Fri, 26 Feb 2021 11:49:25 +0100
+Subject: [PATCH] fix(core): Explicit cast to avoid compiler warning (#4203)
+
+[Retrieved from:
+https://github.com/open62541/open62541/commit/0c53fd776af9631c915c8722e1d68ce9a69fa3f6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/ua_types_encoding_binary.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ua_types_encoding_binary.c b/src/ua_types_encoding_binary.c
+index 0fe88eb98e0..abbd23735d3 100644
+--- a/src/ua_types_encoding_binary.c
++++ b/src/ua_types_encoding_binary.c
+@@ -319,7 +319,7 @@ static long double
+ unpack754(uint64_t i, unsigned bits, unsigned expbits) {
+     unsigned significandbits = bits - expbits - 1;
+     long double result = (long double)(i&(uint64_t)((1LL<<significandbits)-1));
+-    result /= (1LL<<significandbits);
++    result /= (long double)(1LL<<significandbits);
+     result += 1.0f;
+     unsigned bias = (unsigned)(1<<(expbits-1)) - 1;
+     long long shift = (long long)((i>>significandbits) & (uint64_t)((1LL<<expbits)-1)) - bias;
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
