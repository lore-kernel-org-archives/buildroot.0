Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D23C71153
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 17:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FE8F405BC;
	Mon, 28 Aug 2023 17:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FE8F405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynM0Q_PMLeQx; Mon, 28 Aug 2023 17:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A448640646;
	Mon, 28 Aug 2023 17:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A448640646
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E191D1BF271
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 17:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAFD240176
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 17:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAFD240176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SodTnUdtp6Wl for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 17:59:19 +0000 (UTC)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D12340646
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 17:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D12340646
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6bb07d274feso2751715a34.0
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 10:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693245558; x=1693850358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=UBIkM8LQqjoF0lQT7KqT+iE/Eyo1vdgX2mdHlfuIpTeE6wUyoZAeuoKy8DuX7P5pOs
 VBnub98NjJKezofxtyon5AGRKhnM3i6idmqy51BxnJ8WXkH6hw/PhMEWGINGtZHtJ67i
 fZ4G3HxDq2GcA804E4leSes9QkKbhSwkffszYNnzzDfNx4pFIUyoUS/GfiAdJcrPXJKv
 0i86Osyzdn8HPGAqlPi162CSBIct7YTTaczwhCAdpCdOD9lqduBqSUnyTFM8XUviTx+2
 TRylWdvIa0nUe/2L1azkLqNMi/EoKW3HqxIbJw3ikYYTm2AoIF19NMQ0iPc+Se7VI36R
 IcSw==
X-Gm-Message-State: AOJu0YwCuVGAe//tkYtkRaBHcrCmmgd5jFiEmeX/5U/iwLk+Ud4brvww
 3orcnORyT3nTnD3DIJwS8d1XaZbwbx+Dxzp/ofc=
X-Google-Smtp-Source: AGHT+IF9rg07CQdaprLnHLWitfhlqHqug7/w211HLNTptJrJ8p9QUmE/rGbMo+UxgbyP+vmXLSwfFA==
X-Received: by 2002:a9d:6206:0:b0:6b9:37e2:76fc with SMTP id
 g6-20020a9d6206000000b006b937e276fcmr14226004otj.30.1693245557786; 
 Mon, 28 Aug 2023 10:59:17 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a63505a000000b00570132a022csm1823143pgl.79.2023.08.28.10.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 10:59:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 28 Aug 2023 11:58:52 -0600
Message-ID: <20230828175858.309974-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828175858.309974-1-adam.duskett@amarulasolutions.com>
References: <20230828175858.309974-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693245558; x=1693850358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=IdkMES0NRazzw/zerlaa2GcGsGzj/VUt2BCPT69ojZnYbPVaSmucFztINnzDoauCJi
 TDmfOQie6v5EB7HYc4eJsBwMuDEdI/9WMzEmMUxQok7oYv+ITutql29LHf+l2ZUQRNcn
 LVIryRQshZZuBUvQQzP2A4qr1ye903Tn3V3fQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IdkMES0N
Subject: [Buildroot] [PATCH v6 1/7] package/python-httplib2: add host variant
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for the host-depot-tools package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-httplib2/python-httplib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 1093ecab39..2f4eb98356 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -14,3 +14,4 @@ PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
 PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
