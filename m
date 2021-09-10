Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81E6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:48:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 187266054F
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 187266054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D773084A34;
	Fri, 10 Sep 2021 10:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGffhiDFf3X8; Fri, 10 Sep 2021 10:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5189384A00;
	Fri, 10 Sep 2021 10:48:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BECFF1BF591
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FBF660B45
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvVCBMeC9wLk for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 10:48:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E9E960B48
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:48:04 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id e7so1446675pgk.2
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 03:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=igF/bzusPDI+kSWzUPU1dlGfhmRAi1T1ZCU1Sj5Xpqs=;
 b=cQh6RDVHxyYVtSqw6mGNfF+2EBp7vgNHs9RDYCpSEeylQw8LBn/zTpVGrbzBqrS74F
 9pgq8YOvCdHFRb+/blaVuMbHVFG12oGciAv9zGdAJCjSMAoeVhmFnE1W2z0UO36OuD+X
 y34Fnul9zD3XL/bfPRtcbLwqJEqCg0IM0ouQrL1lZOVnTT48LgAdsHtZau/ubn837Dqu
 U+mFT69XZmVpApdPFnpV689RzJe6Z6p2mQ2pRAxi4HeuDStshNsfcLCoF7mjXTVYGUyG
 9Cu+DN49BN0vuipu8nCQHoe1pvBkZMG3zDSAM6rFDiflEwDPGkCOEvlYMN/B3+ykB1JX
 UpZg==
X-Gm-Message-State: AOAM530tyWyJ9sQxtp4dHwMzHU9N3CdLsswfUdqBoRRCuzp8+iNKWSum
 use0Mg4Q+UiOZXkRq7ArxOqczf3wS+1prg==
X-Google-Smtp-Source: ABdhPJyY3na+uUDKk3Qd2niOcnQCBSF1c9cWrw+TgnrFRRarYxZ1Z6XpRKGlSbX9pfGjK+oMqwqaHQ==
X-Received: by 2002:a63:4c5c:: with SMTP id m28mr6680620pgl.67.1631270884222; 
 Fri, 10 Sep 2021 03:48:04 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-75-194.sb.sd.cox.net.
 [68.6.75.194])
 by smtp.gmail.com with ESMTPSA id y5sm5134880pgs.27.2021.09.10.03.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 03:48:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 03:47:58 -0700
Message-Id: <20210910104758.519291-1-christian@paral.in>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v1 1/1] package/protobuf-c: bump to version
 1.4.0
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
From: Christian Stewart via buildroot <buildroot@lists.buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/protobuf-c/protobuf-c.hash | 2 +-
 package/protobuf-c/protobuf-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index abc11afc58..13e1b474bc 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8515da8b84ea36768ae69a52f9ede8d718936d6058077265b6e458cfc55f8bdb  protobuf-c-1.3.3.tar.gz
+sha256  1068bca1e9870e9492096f97c409cd15f10c5019c183e52ec6d53e8d18630cbf  protobuf-c-1.4.0.tar.gz
 sha256  20e800cad4550f4b19bb37fc9577dac21de13333ae66497c4c45ae489c35c34a  LICENSE
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index f28f5ff57f..baea4d623f 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 1.3.3
+PROTOBUF_C_VERSION = 1.4.0
 PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,v$(PROTOBUF_C_VERSION))
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
