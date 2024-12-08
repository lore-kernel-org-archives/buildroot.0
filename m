Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852ECE77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 21:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 471A1402D5;
	Sun,  8 Dec 2024 21:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19OKfrt6BVk0; Sun,  8 Dec 2024 21:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F410E402D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F410E402D8;
	Sun,  8 Dec 2024 21:48:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2444C979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F92040282
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fk5vaJqmiVpo for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 21:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A08C940273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08C940273
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A08C940273
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30167f4c1deso9416621fa.1
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 13:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733694484; x=1734299284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WGTooBJqBIfPUZHw/ODJr+cGDBsljKzz/h0u//K+iQE=;
 b=PnYKXRwegAn1lAog3P6epz5WlCBdjBWA1K2ajB//MHI0hEufG1BOwtS0C3e/5cEg8B
 5GNFaN2gNqmLYGLFPiAmediL1ntBCfbIEBXKAlBK+ig5gHrHgm0A12d4R+Ez6yNRqNAx
 WxPGw11pq0PTUOGUo1SZzMp4Aye5fL5ATqjZqXVMY91V76fVp0V5f0jqGFMmfltCvr7W
 /RlfLlVOfB4+klfVcKRpnUCopdwtxrTEkEQ0n0J3EDmXicrCZlnseqCVp98xNj4HGYks
 MuP0qh2h9onfhLSfBZ37OKLPvIXxK5qusMSGo0v1+SG8SyqPhG+FL0lJ13NoJsx/JAGt
 WTNQ==
X-Gm-Message-State: AOJu0YwvN56IXYUx5494G6MnXhC1Q4RlaMsOrGH0aFLnk89sVa82eQDt
 AfAkiZW2Brrg0wbfgq8CDlSqYed+deWYaKvFOZcXxZRkN4BqVA72MnfD4g==
X-Gm-Gg: ASbGnctcASqfVsIPuym9cXgwiMk/sF0cOtJMNsHhV4IL+26HV7/RQ1QualDxqA9r9gt
 mLx3bhjYYjLKZVHMitmTinaubf3cEuIRslRwVupKqn6VhzKd6syghBF5zHbVzL8DwU5d2cc+WZE
 ajsABWi42WELJbisXAFlQBMOKFth223S8POCzinmm0mLsdy3ug3ySXmnyVWnv62DMxZnGzYDMC8
 OpfPKf0aEOW2MxBrbRr/TGvN6ClrqHj0XswSbO9HMuWv3+dgEGGR/qzEoRa
X-Google-Smtp-Source: AGHT+IEgrbu4tTc2z+h3gtppVwk2wRSKignaEOb7+z+94kf+lK1eqC+jlcQZ8af6qLycSx58uAdecQ==
X-Received: by 2002:a05:6512:10c5:b0:53d:d431:74fc with SMTP id
 2adb3069b0e04-53e2c2b4b93mr3491080e87.10.1733694484276; 
 Sun, 08 Dec 2024 13:48:04 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54020798a43sm49328e87.12.2024.12.08.13.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 13:48:02 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  9 Dec 2024 00:46:17 +0300
Message-ID: <20241208214748.524923-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241208214748.524923-1-geomatsi@gmail.com>
References: <20241208214748.524923-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733694484; x=1734299284; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGTooBJqBIfPUZHw/ODJr+cGDBsljKzz/h0u//K+iQE=;
 b=kcysmxh9yo8mpcuwHTVnjN8bosGRThNa4EtBaOUJRPWUxgVkaPwaMioHjrnX1mG7ob
 XI3cuwPW3nxVXLMJz4Vj1YRfDRAwUmbUvv8CqbS4dMqXtp1a8TH2QAdJzqYKafgERUBw
 WKX2XGM50bXHOE3B7i2f1VIAZLZT6Pe/CVeATRY2NdlxdrxXa2US4G1hZVShv6ol/q24
 jA88aiP/ImaKWxgatLZG8pr0dJd7mMqtGUifm2F9a+MvxZAns+QIP5CKPNcuyWb/tnya
 jwiW1rYRtaEuZlerpPyZjTHGqtwruwR5obyjvckLo9isxAVqW/TB1LPEX2LyIvUQqMnC
 qMcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kcysmxh9
Subject: [Buildroot] [PATCH 1/3] {toolchain,
 linux-headers}: add support for 6.12 headers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And add (and default to) 6.12 to linux-headers.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 6002478854..67bdc32372 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
 sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
 sha256  d1054ab4803413efe2850f50f1a84349c091631ec50a1cf9e891d1b1f9061835  linux-6.6.63.tar.xz
 sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-6.1.119.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e8f7515894..0b517534c7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_11
+	default BR2_KERNEL_HEADERS_6_12
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_11
 	bool "Linux 6.11.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
+
+config BR2_KERNEL_HEADERS_6_12
+	bool "Linux 6.12.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12
+	bool "6.12.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11
-	bool "6.11.x or later"
+	bool "6.11.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10
@@ -435,6 +443,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.119"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.63"	if BR2_KERNEL_HEADERS_6_6
 	default "6.11.11"	if BR2_KERNEL_HEADERS_6_11
+	default "6.12.3"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index c2522aca7f..87160af3d7 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -660,6 +660,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -673,6 +677,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	default "6.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	default "6.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	default "6.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index fcffeb6b77..2dc04747b3 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_12
+	bool "6.12.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_11
-	bool "6.11.x or later"
+	bool "6.11.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_10
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
