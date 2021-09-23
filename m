Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA609C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 15:49:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 121526115A
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 15:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 121526115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DFC460692;
	Thu, 23 Sep 2021 15:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8qOlDad7YAYI; Thu, 23 Sep 2021 15:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF9960AC8;
	Thu, 23 Sep 2021 15:49:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD041BF3C4
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 15:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C3F240486
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 15:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOAASHVbNShU for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 15:49:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE9874042D
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 15:49:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t28so5130613wra.7
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 08:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gGOjmDt/cqLLrWY+5LgwiKEC81AsnstsphwgGakEHrA=;
 b=i1OqvGD7g55QWbbnuKGbf3PXqkXz+mVoBOUiY5xz4JLnLxAmwfcfg9kuOcSyH15HgP
 nECDvXAFluN1b1DY99nPeeICcsh1eu0SNc3+B5Y8wTKNDkeFmL7XgldpHQ1MnVZxdFJ9
 sFxFRLhWTZMerjrY+yT1NroCcfeDWYaXargn0Da5OtCzkB8A9qXplXI2LutsuY4YiM3R
 B2brYzZNuFzW9xLcRk8tTrBFYjpvPSewoS95VkdiSfFFff9l5PjuBMqEAIZLtTkCQ7x0
 bNsLkxrIp+3qJVE0RDTCyrKfb4JttPr7in7tfP2h15EDbb2mq1tA47kayFrGy6zl+FNV
 GPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gGOjmDt/cqLLrWY+5LgwiKEC81AsnstsphwgGakEHrA=;
 b=ifY4Im/aNoc0hGKYZkOkrZI/3ExRfMQu7dp1bwdKcwQxyWkOT1TMgHP1LRsEqkvMjC
 hcr/qgzALDEcihbYbSxAVHkxa+7riBd+hAXdxj4stdBieACASqip4ananHfx3Aeubqp7
 IvxF2TLHYnFOTaN7gdi5tQeoD1xJCyDo2GcjL3XNq54KPoMrUXvCFYuR4YbrdiisboqQ
 Mr77aK1ypZqb/59Pl05czxT5vXoiPh9NscHNtAYSVFKfJ/QLnNLPpF+I/EOgmdKccefe
 hESChvsw3CuCi11EQGqwIYgV0/iOnuABYERQCCVctaumaXZI9zS/xjRPSu7qBHxFs1eG
 bOUg==
X-Gm-Message-State: AOAM532uk6OeN2I7778Zflgg7TXETGFjHdlkFa/Rn873QWNZ7tp4yBtw
 DvvCTz2BrX0VkgVjj8Q+YJsnVBgoCEw=
X-Google-Smtp-Source: ABdhPJzHVkJRKg/ArPKNUk10Mz+jDje4f1LkNq2mixayv90oq4j/CVsmFghKPGev+9/NVOGcqAzSbw==
X-Received: by 2002:adf:f24a:: with SMTP id b10mr6112815wrp.281.1632412156152; 
 Thu, 23 Sep 2021 08:49:16 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:c870:4c29:b48d:530e])
 by smtp.gmail.com with ESMTPSA id j21sm6048982wmj.40.2021.09.23.08.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 08:49:15 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 17:49:12 +0200
Message-Id: <20210923154912.268966-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/mv-ddr-marvell: fix license file hash
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, nyanyamiau@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Commit 2cfdf8b8a269 (boot/mv-ddr-marvell: Bump to HEAD as of 20201207)
forgot to update the hash a a source file that we use as license file.

Fixes: #14221

Reported-by: nyanyamiau@gmail.com
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: D. Olsson <hi@senzilla.io>
---
 boot/mv-ddr-marvell/mv-ddr-marvell.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
index e1a86008db..5bfae8af45 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.hash
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  bfab74a625d65238c569b9df282b55c0fc9a1e2d3decedcf194d44774df2ede4  mv-ddr-marvell-305d923e6bc4236cd3b902f6679b0aef9e5fa52d.tar.gz
-sha256  69208236fc322026920b92d1d839ebdc521ca65379bfdb3368a24945e794fc78  ddr3_init.c
+sha256  48bb930b6fbc3f5db72e29c849b096df3868e4a6d2bdc0e2dd3365c768241cd5  ddr3_init.c
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
