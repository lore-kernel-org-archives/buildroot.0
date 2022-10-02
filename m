Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01004C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 13:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 557D382868;
	Sun,  2 Oct 2022 13:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 557D382868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7oGyxL-xYVW; Sun,  2 Oct 2022 13:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D4DA8280E;
	Sun,  2 Oct 2022 13:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D4DA8280E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 212DB1BF344
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 13:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAC158280E
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 13:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAC158280E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CvpsLMOoZtyJ for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 13:12:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F9B813DF
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1F9B813DF
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 13:12:40 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s30so7704537eds.1
 for <buildroot@buildroot.org>; Sun, 02 Oct 2022 06:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=KWpQXsR4mX3w9eQSc7FjUsq7euv0V0v6JIXfXU5y7i4=;
 b=C9SYjCEYPLeNzy/7NZAQaFAaBRpn+VhNVelSLv7MELIwl3hZ+XQQQk0Mwo3xlSBMST
 2x21XWlrggU8sjwlhJXPQEtAYjeciid9hMPDD0zsejSgtrl06FYS9haMMU6u9kvz4l45
 fcjjIQsYeLdAV6TGwknUQ+lbeIQGfYP7MuYyWNwe6inoorcFC2ZfeeSnRR1vdaIA+1Bo
 UXxWN+Gsm/DpZUe8+dnO8enoRZjNAXsH1MyO/1UiXafzzFSLpIKS31QBNOcLj5Powdt4
 s5D1mryrWJ6Ex9M2XK/yuK4X2ea14srS+KJBIwP5jWbuQo358JqNEwD7I/I6h+qUSd7R
 opyA==
X-Gm-Message-State: ACrzQf0HttHd2FlGvMffoFTapq/nBlm1Zk3RbHLqnPrUhvGL6T+EEVpD
 zj2izhWyM0kzZaX2lrTCijTmgyy4dswSmQ==
X-Google-Smtp-Source: AMsMyM62oHyeLzOkFs6loijqCyq4oQ4fnsVptHHAZELR9E96mrKt8nahY7uR28CGK0ZLDRUNXmYRSA==
X-Received: by 2002:a05:6402:2692:b0:451:6515:1946 with SMTP id
 w18-20020a056402269200b0045165151946mr14866056edd.417.1664716358923; 
 Sun, 02 Oct 2022 06:12:38 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 oz35-20020a1709077da300b0073022b796a7sm4024871ejc.93.2022.10.02.06.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 06:12:38 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  2 Oct 2022 15:12:35 +0200
Message-Id: <20221002131235.529951-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=KWpQXsR4mX3w9eQSc7FjUsq7euv0V0v6JIXfXU5y7i4=;
 b=EqxZnb84gcEzxyrHKKWp3BHsKmD8uSkX+YK1Th22tdQt9Ntq480yBGXfc4/RUsj1Hl
 jgEBRKOCE3dkHdsFoRY0IiMh6eCkJW2U9gOF9IZMF0a+hpD7dn3Yw0n9N1O34M/XEuv7
 0e4xcc6tditJLIJwsYcog6sjtpXAMPggSOwck=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EqxZnb84
Subject: [Buildroot] [PATCH] linux: update cip/cip-rt kernels to latest
 versions
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index de9bf0ad7a..30e117a6af 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,7 +32,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.115-cip7)"
+	bool "Latest CIP SLTS version (5.10.145-cip17)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -52,7 +52,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.109-cip5-rt4)"
+	bool "Latest CIP RT SLTS version (5.10.145-cip17-rt7)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
@@ -129,8 +129,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.17.15" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
