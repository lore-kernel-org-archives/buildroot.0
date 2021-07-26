Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A82BC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:43:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F38360F23
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F38360F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5FC14044D;
	Mon, 26 Jul 2021 08:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o5kg9VpKdWvV; Mon, 26 Jul 2021 08:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4F1B4042D;
	Mon, 26 Jul 2021 08:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE4F1BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F102D40415
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnrA4J0B19xt for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:43:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 025584042D
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:43:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso1684747wms.1
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fsZtCdnQqgTjXwcVJDkBvsKpmPXKNAJPcAjGiO92J1o=;
 b=ED4PEXOzdsZtZVAzTYIY3tb/KMV++TRMFtmdGhFkD0KNxLxMx2pvbwuGhFX17Dh+KD
 hoAJswReqUYmTreB5hvwv1E0SRP8dqvZ8FM8bUiH36Plhg17WZIma2mxhscNJc4uUzYH
 l2epnx7dWcVjaZXVODzNweQ5e6yvAhL6cPnYJXVv3JDOd2Q5l+NziQ+THPyx7q2Qqxp6
 tv4HJsSmVtogPadbjFuDIm24+KwHNWy6MS/KHAVpu1JxISA29fmWebA7fYC+RHAd9IPM
 KDfzmuoq1LTY43gq24P4KYqXKlbW54ee3CbQIzOVMZfoX6lTmTW815y/R0UnUQcYiLAu
 s6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fsZtCdnQqgTjXwcVJDkBvsKpmPXKNAJPcAjGiO92J1o=;
 b=lKgYsoTxDcTQBUOeAsghZWZSVFLOFjFH9bn7YltFE7M9SBHrRhYq+OFQ+25BN1d2MF
 PvGxbAkvEdNZfUsjCoP/pJzFofYvQh3CBbEYPP9MSQ8haSjYPgxdYanCMOxC664lua0P
 zjGdQ3K8B5kdcOlM+ro5GMr+ZpUwlew8WTHbufM8Z+/0qJvLMopaqPZ/OduFuEKh+MaI
 MFtJCtkGH8xXDAWG3/uUKheSLa1bCoQKrM0aZuRWqdsbEpBh4r0rBcVXjFc7DOOp0Hwf
 tN4aCVLhIEs7TFYBHAxTgxZN9KkAvcysOgMmcogyQuFioDn07UgIby0AR9f3XXdJD5nm
 yrcQ==
X-Gm-Message-State: AOAM531WRjvs3lvktRnM4uvTE5wkmJZ/ljtSP0+cQJifwYy17kc64d4R
 kA/rGGplVgg3LeAvbVzCrvL5lh3L1vuJ3Q==
X-Google-Smtp-Source: ABdhPJx16wlW7W8f8QlGdU/LkExSXiTe7wuHO/nF2pjIU9oeUG6mVoh7UJsnLi3oeDx0gIJT9WZDpQ==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr25500856wmg.25.1627288994978; 
 Mon, 26 Jul 2021 01:43:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d18sm40967096wrw.7.2021.07.26.01.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:43:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:43:02 +0200
Message-Id: <20210726084303.1708442-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/iodine: add IODINE_CPE_ID_VENDOR
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

cpe:2.3:a:kryo:iodine is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akryo%3Aiodine

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iodine/iodine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 711d709c1d..5de6389189 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -9,6 +9,7 @@ IODINE_SITE = http://code.kryo.se/iodine
 IODINE_DEPENDENCIES = zlib
 IODINE_LICENSE = MIT
 IODINE_LICENSE_FILES = README
+IODINE_CPE_ID_VENDOR = kryo
 
 IODINE_CFLAGS = $(TARGET_CFLAGS)
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
