Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E4AC4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:42:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B58B60F11
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B58B60F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A6760745;
	Fri, 13 Aug 2021 13:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YiouaP9nfHam; Fri, 13 Aug 2021 13:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6624960BA8;
	Fri, 13 Aug 2021 13:42:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74F7A1BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 715C260BA8
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e6qsZ0YxEJCg for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:42:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3923C60745
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:42:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id f10so3797720wml.2
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhzL9SXjfejAhPV2Gxb6uZncTQfdhLxhJVb1FnerwWY=;
 b=n8W2XuecaWCi/mVEtOY2YCjwRGpYyYiYN9eghJE/iRz/mGjAXiKpkgpKvjo14jojMA
 HcByrZwG+wSdTZxRjq2edAJG6qQ/WltlFfFGZlFxHKy5Pwl9F4yuPZoMrCU46jU9wQ30
 v4uzangN1zKtl/tpoUkuw9XIUmTJXteMl/35I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhzL9SXjfejAhPV2Gxb6uZncTQfdhLxhJVb1FnerwWY=;
 b=ayHZ0D4UUgO2nk02HoFptEr7b1Giki9PJt8lHem/8I/FmQ4P2zH/mtKUYq3kyAhLhm
 2I8XyxWN3ZtzS7OEHc5ZR/l5ZFfEj6Mga2f30wPpK59BJjgTHq+GIBsezhglWKny4oe3
 YQBO2Ey8vMs1X2m00umCWSUntSErujTwOqBs9uKL/m/p/dhEioYslY3Dw91NmeE1kHzF
 pt5/kWb8rCSL93+kMTuf3l6uHBW4m5misAhsGLez1YzF34KosaPOa7F2r3ctjZi4m113
 RuIZdg2hZPHMB6GzC5QXeSgpiKz2DUuMwzsmP1oX+PpXPUiA4BPFcAVGnmi6tooXZs8x
 4RFw==
X-Gm-Message-State: AOAM531pbx8L0kXdMx7eF04/wrEBrY2HYBREH/2LRCuxRkwV/cK+Bp15
 9Eo44aDZjlPSvvLRNAJnjyEtUPTGdVO3pg==
X-Google-Smtp-Source: ABdhPJxMPBFoYrvkhgA1swOhLtTzV4PwGa29gBKxGpxb47g/d8XEfHQg+TgteywDQICjIMLxxp/wBw==
X-Received: by 2002:a05:600c:618:: with SMTP id
 o24mr2742835wmm.11.1628862152307; 
 Fri, 13 Aug 2021 06:42:32 -0700 (PDT)
Received: from localhost.localdomain ([37.160.221.226])
 by smtp.gmail.com with ESMTPSA id d4sm1650468wrz.35.2021.08.13.06.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:42:32 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:42:27 +0200
Message-Id: <20210813134228.1100864-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] linux: bump CIP kernel to version
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
v1 -> v2:
* Adding hash

 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/linux/linux.hash b/linux/linux.hash
index ee76ce8a24..a834fbf31e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -10,7 +10,7 @@ sha256  21edb57dea0fe04a51fcfb6d4e8c0c052787a20015bc74a0a0e63329601f2e07  linux-
 sha256  7f235d454d703112e86574150652807f42abead92f3837da32ea86b4f148b371  linux-4.14.243.tar.xz
 sha256  f2827d0506622fcae0dae0bc72b2f016469210f50c2d3dd1bdd1211a813dca27  linux-4.19.202.tar.xz
 # Locally computed
-sha256  9f1de83c5c2bb582a33bd4ee892d45671901cd06af9dc159f0f499f1b5265b20  linux-cip-4.19.182-cip45.tar.gz
+sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
 
 # Licenses hashes
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
