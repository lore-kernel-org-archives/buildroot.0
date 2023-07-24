Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDFEC001B0
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 19:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4922141869;
	Mon, 24 Jul 2023 19:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4922141869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCnuznxrpaWi; Mon, 24 Jul 2023 19:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 291FC4186C;
	Mon, 24 Jul 2023 19:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 291FC4186C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C3E31BF3C3
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 408FD41854
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408FD41854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLMN3hk3YtyQ for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 19:16:44 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 199BA41846
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 19:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 199BA41846
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b701e41cd3so67155611fa.3
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 12:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690226201; x=1690831001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18pCCWHCvy8e+3sYwZIrXsEoOhP31O2PJGknmwiK2E0=;
 b=BrRhcYMNpJtl7/AGvGdQBl7EYsmO0EKU2b1hvhDq56dksMiS8SfRyH/zFUrGaBM89d
 nJ+2C9IanO/GYGjXsA7PAsrcBC1FuEtIarDJkaT7QGEYwCCJ8Tg9KjTbIt3xZVeIir4H
 HnfJwNBA+Are8ImKQYx45MFWZdWpWKFOKgQMfQ1cGwhI2hvnw/QbQC7n1jcCVt4F9Xhm
 sl8x6rWv6LmaJZCXq1h9mb0kDsWY4E/F0DnfKYKDlREPNoXrF5HfW70eQaSWUYfC78vx
 ks+REeIsdT+1qV9GXuMniJfQhEGMcYZ/4NexzZCXeL3tLV03M6/ZOLzr9dT4VlgB9rRW
 kw+g==
X-Gm-Message-State: ABy/qLZXQKk2qe6GNvVqECJw8KA1vIwlXUXnCB8cEit2LDrDFH5Cm2Ie
 mVwc68gipjDAvJao2UtN4bx2vGWrzet5eg==
X-Google-Smtp-Source: APBJJlFDPr+/x2SYHBX27JTMe2rGbDA//4w9rOjI6oHZNgQzRWFGE38W9EfqTYCk4T4Tdk/oLrjCsQ==
X-Received: by 2002:a2e:9556:0:b0:2b8:3797:84e4 with SMTP id
 t22-20020a2e9556000000b002b8379784e4mr6798959ljh.18.1690226201393; 
 Mon, 24 Jul 2023 12:16:41 -0700 (PDT)
Received: from effi.fritz.box
 (p200300d197289500922b34fffe35b24f.dip0.t-ipconnect.de.
 [2003:d1:9728:9500:922b:34ff:fe35:b24f])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c214400b003fa973e6612sm13652513wml.44.2023.07.24.12.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 12:16:41 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 21:16:35 +0200
Message-ID: <20230724191638.637054-3-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
References: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690226201; x=1690831001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18pCCWHCvy8e+3sYwZIrXsEoOhP31O2PJGknmwiK2E0=;
 b=T4OzEwSsazpgtNjfA1nVue3qcnOncnXdyCcvsjtEmo1jaLiIZhg6Q893vPrfYeqjwV
 m52UjTWcCkM/7vULVNuDI6AHDD4T+NpPcG3dt8ApsPtWilBbAXTIhcBLXDsQPbA5jBkT
 +NMjIEttg9YlmMMBi5IjdD0h4RFYfLrhQpYNFddx8z83r8csSgrwNXNWFvMc1pojz0fX
 qoBmu7Bpahg1QXJL6LIkh9dT0E6ewRLS4nnAXnsv1AZCTKtNFeLU4bVSYRaanTLasGKm
 5pGyNlbbb9+ow9Cge4r0oWbLBLdgb2i0D/D96h/D4Q6hNy/dFvovYvJulZGAW+yJiSjB
 Uhzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=T4OzEwSs
Subject: [Buildroot] [PATCH v2 2/5] package/freescale-imx/imx-seco: bump
 version to 5.9.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>, Charles Hardin <ckhardin@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
 package/freescale-imx/imx-seco/imx-seco.hash | 6 +++---
 package/freescale-imx/imx-seco/imx-seco.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
index 378c24bc..e02e3088 100644
--- a/package/freescale-imx/imx-seco/imx-seco.hash
+++ b/package/freescale-imx/imx-seco/imx-seco.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  08cf25a4be6841ca7264a50b29c311b386eae1c02fced8a3b55fd04213acb4bc  imx-seco-3.7.5.bin
-sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
-sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
+sha256  c3bd761f457e939035b01a0ab36e79064a2a1bc6c3cdb3cd847f7f38df0964df  imx-seco-5.9.0.bin
+sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index 987f2465..3788f1e4 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SECO_VERSION = 3.7.5
+IMX_SECO_VERSION = 5.9.0
 IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
 IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
