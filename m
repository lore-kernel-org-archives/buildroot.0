Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC2BC4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 21:52:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3C6D60F25
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 21:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3C6D60F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85A2C60804;
	Mon,  9 Aug 2021 21:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8Rc2Y5kkFsd; Mon,  9 Aug 2021 21:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08FAE6080A;
	Mon,  9 Aug 2021 21:52:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 491181BF295
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 21:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38CA06080A
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 21:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqQRgup0vKKr for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 21:52:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EA3E60804
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 21:52:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l18so23334025wrv.5
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 14:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TXAqdXESjZcCDqlUS8l9TfYeQK5ejalWHCGurq30lfg=;
 b=imrsqynsM+OsO683hFClmMnXNrZPmBT1p/vFK5Zv9dTuViYomElHXcEKZV3SCN6GEX
 I4AkEAvFdODk4McGPhCTR7hBPa1sbYGTpzyCblvvbfIyF4qN8F7fJk6KP7p7MEO6NUky
 pZ2nQGo6q38v2FdwfNvHo8L6yV0nYC0VWYqRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TXAqdXESjZcCDqlUS8l9TfYeQK5ejalWHCGurq30lfg=;
 b=nz0oAjbLKGEfSFHk2zgpsx0p3fJ5lxBFF4NkxBVd0xrHJL8uL/dLAYa5qQfQcaV5Zo
 E6agdl26QDn9qw4BXHZgNmiTftSk3F3tjsRu/CO3SkIPCzLlG8q1Kwpi20itWLXa4UA9
 Mmtc/HDlZ1hHu9VeKSh+/oCoGusFW2KBOxWpH/lXOSnm8SFIQ5kfx3Nmz0WE1qVEIIDu
 zHhyuoiQt2c3W6yagk7ULHQ/WjRdCKM2W9a6A3uYP/Sw7rMdFJHO/ChsE5VOX7HCq+s5
 /JI8E+dK2Q77h8mNfKLBIhFoF0Y0IMGFSzi7Ti3k3h/Q3tAaTQH9CeNNVVK2dm3x41k9
 iEZw==
X-Gm-Message-State: AOAM531lfLxkipOfEg3CS+d1UOLKES/qrFK1r8z+SMofcDGrjAGapI1r
 7ePwrKQsuWK9PGyoT9rXUdptMr+UZA9cjA==
X-Google-Smtp-Source: ABdhPJznxwBHK/pdsmdF3JTQe8H44ELqkz/JdEoItiVa3ALLMV6/02eYhodWtnVEhy0G3b3ZoVrGZA==
X-Received: by 2002:adf:dd05:: with SMTP id a5mr27075291wrm.214.1628545939326; 
 Mon, 09 Aug 2021 14:52:19 -0700 (PDT)
Received: from localhost.localdomain ([37.160.145.131])
 by smtp.gmail.com with ESMTPSA id d4sm6412351wrc.34.2021.08.09.14.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 14:52:19 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Aug 2021 23:52:14 +0200
Message-Id: <20210809215214.19401-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809215214.19401-1-angelo@amarulasolutions.com>
References: <20210809215214.19401-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] linux: bump CIP RT kernel to version
 4.19.198-cip54-rt21
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

This patch bumps Linux CIP RT to version 4.19.198-cip54-rt21

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f10fab8c75..3f00680a09 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -50,7 +50,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.165-cip41-rt18)"
+	bool "Latest CIP RT SLTS version (4.19.198-cip54-rt21)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -127,7 +127,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.13.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
