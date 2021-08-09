Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AB5C4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 21:52:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB5160F25
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 21:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCB5160F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96BE382F39;
	Mon,  9 Aug 2021 21:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkyvAcEvQFQD; Mon,  9 Aug 2021 21:52:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 121C883083;
	Mon,  9 Aug 2021 21:52:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3AD41BF295
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 21:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2D3540394
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 21:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcIp4mmEyMXr for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 21:52:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83D8F402D3
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 21:52:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so435811wms.2
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 14:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VNuoAYrb/f1bNZC3mM4/87f6Ogw1+WhiTQJBVKJOo50=;
 b=oMvKOWCJZoz76pxQd70UClDpsw8gSzN6bpuy7xYAIvLEr+jXR3QHYMJdHiwQaUXfbZ
 qdsOlvwJBC35mFSzRPHkpDbw/VShdGiJsR857bfQNx7IiLuK/9NsLRFSbpZLFrfZzr3I
 T0e02qaxh+gd/sYW0PZmuIzX+YDd1qzdUOHLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VNuoAYrb/f1bNZC3mM4/87f6Ogw1+WhiTQJBVKJOo50=;
 b=rgXnZcFg3v/Y2zptcWdD50u2OfC2CQ05kon5W3DK7XTr1FIV0r+b1/KaATwQCHaHri
 flGv2GXcPHegmgAa3zkaNffWojzq+WoERw03lbDteE83jx3KGand0JnOrc/dCTm16ZcJ
 immIxfkHcUzPiT4aGJWsIS3n5fGXq3xUDOlU1dTano+YfYhBzVebM8/Szg+JHMqD8S7b
 j/9klPDsPpONdo8H5eAMzUSe7oZ6tB/GObb6o1bTPXfh/v64OBny0aSKAMHgAUM4/lEk
 A2Bqpwm6M6l67Cbsai97/ra7SDeNotNgDPrzRmCpPLdllF4e9lvkXsXOI54sIqZLmo2K
 tXXw==
X-Gm-Message-State: AOAM531yBRPdvI4Inc8jLs+V0zsWLZTIA1aUAvRANPkmVcTgrSmQCyoB
 E0a+zmwBj3DUJVttQRxVg1JRlYjvL7twEA==
X-Google-Smtp-Source: ABdhPJyMqyjwbAGjoCogbeRlY/hJ0ZuaK5vOKItBt4qnL7AiIwBdnW8jRLvMuOv1o40CIHhyjIYIKg==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr19128295wmq.34.1628545938625; 
 Mon, 09 Aug 2021 14:52:18 -0700 (PDT)
Received: from localhost.localdomain ([37.160.145.131])
 by smtp.gmail.com with ESMTPSA id d4sm6412351wrc.34.2021.08.09.14.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 14:52:18 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Aug 2021 23:52:13 +0200
Message-Id: <20210809215214.19401-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] linux: bump CIP kernel to version
 4.19.198-cip54
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patch bumps Linux CIP to version 4.19.198-cip54.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ef52373291..f10fab8c75 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.13)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.182-cip45)"
+	bool "Latest CIP SLTS version (4.19.198-cip54)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -126,7 +126,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.13.9" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
