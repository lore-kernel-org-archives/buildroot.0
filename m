Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFD4C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 843A840264;
	Mon,  6 Feb 2023 10:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 843A840264
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZFRaU89kRwc; Mon,  6 Feb 2023 10:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 281B5408AE;
	Mon,  6 Feb 2023 10:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 281B5408AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEAEF1BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8811F81432
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8811F81432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gN7_vTad_hV for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:22:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E0C681406
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E0C681406
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:22:40 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d14so9841980wrr.9
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 02:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pBPuhAGhoU3R5c0IicHWKWKdUDGnzGNExRv3ObHO3RI=;
 b=OFZsimmE7m21zpUd59FLsxQr/Wb7QdjxZUoML7PzYphKwpQl28sPLBEh91CQCMxcDH
 ijOgKPiI7C3OgV/a+Tp+pkcnEuMuGuo5BGH+cm+X7YvpmFecpiolTHvO4LBtrivkowMA
 SYRM7iRu3fpNXNeWlfPapvgTIL9Vl4U1KLLTuAcyHR5Uq9EpkCJ9W2Z5sqGaiD+r084M
 InydGp6krH8qYitjlhjz/LQKx4kg4d6zYo0WIfTa9Xj0Pw7VEfiLXqX2i/krd9RSzTYA
 9O9ZGmRT4I4L/i+W4PBKHzemeoEmFfYh2K2OXzZ51L79VeCtPvNW1txBijOgUHdyABKU
 oDRA==
X-Gm-Message-State: AO0yUKUKovioMZWSLwFtYjgrZwMCK+JnHZ5eZCRocvoGT2l17PwybCi9
 6DVFEx6MHODuYLXwVPWmWREZEoTiFnC2ifN5xWLPCg==
X-Google-Smtp-Source: AK7set9CwGITseDMcHaoY7IO0u4biV7Cq8b6VBEuBALQgIKP1OU2zf5tJRcq4T7rCIya95Lit2hTsA==
X-Received: by 2002:a05:6000:1c2:b0:2bf:dab7:8f9f with SMTP id
 t2-20020a05600001c200b002bfdab78f9fmr15593837wrx.65.1675678958366; 
 Mon, 06 Feb 2023 02:22:38 -0800 (PST)
Received: from localhost.localdomain (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b002bfd524255esm8580134wri.43.2023.02.06.02.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 02:22:37 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 11:22:35 +0100
Message-Id: <20230206102235.63667-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pBPuhAGhoU3R5c0IicHWKWKdUDGnzGNExRv3ObHO3RI=;
 b=ORbpH8W8yqPO4Ny3FHbc5G4a26R1MPJ3nZbL2Lz9HBohWywFcjh2qv3+79l0ApAkD7
 wiii+TglZcmtTBVEmsRPLeTFrUGMlUQCfiKiV07vhWYsYEK1EakaQje7sZzYfbc3EDIg
 Grh/shEK08zVl5XvvRXal7lNURqWDmlRQeDoQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ORbpH8W8
Subject: [Buildroot] [PATCH] linux: bump CIP kernel to version 5.10.162-cip24
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
 linux/Config.in  | 8 ++++----
 linux/linux.hash | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a0e9286bd3..774f1e0975 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,7 +32,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.145-cip17)"
+	bool "Latest CIP SLTS version (5.10.162-cip24)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -52,7 +52,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.145-cip17-rt7)"
+	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
@@ -129,8 +129,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "6.1.9" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 927172e8fa..e88abe5bb8 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -10,8 +10,8 @@ sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-
 sha256  64cbb234e46c196bc12bde74b233c7d3cb3b68d9c8ed48bf06715bd0f5c549d5  linux-4.14.304.tar.xz
 sha256  636d3f9cb48eaf06df14e56bd9d57bfc7c1b5952a75b9f841d41a43b75829d1a  linux-4.19.271.tar.xz
 # Locally computed
-sha256  4594c147bdc493c7c286688542bbe65e550fb7bd58e0649ec587a2fe893ec0ee  linux-cip-5.10.145-cip17.tar.gz
-sha256  a5598f7f673b3ef819d6ed24f08d539eecb6febd11673a1d4752a1c05d4ee289  linux-cip-5.10.145-cip17-rt7.tar.gz
+sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
+sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
