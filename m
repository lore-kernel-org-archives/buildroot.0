Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14072C32771
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 15:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A710E415CA;
	Fri, 19 Aug 2022 15:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A710E415CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUW5x-aowOBb; Fri, 19 Aug 2022 15:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5068415EE;
	Fri, 19 Aug 2022 15:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5068415EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DFA01BF5DB
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24492842A5
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24492842A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdxUTVQYghD5 for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 15:18:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 729E1842FD
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 729E1842FD
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 15:18:21 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id s11so3553159qtx.6
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 08:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yVHljR8Z2D0bu6ALuH07rLqlwLEWD5mUE20CXF2Ak/o=;
 b=DbEefDhyuO5yCx4jfkazOKYhu2O4XjslVyAtgHmqmcLrgWjKkh9zz19bNeXv2Um+u6
 puor1UQjpTahYPHnpV9NEhEpPxMFZdtrVrEeRuiko5G8h6x7Ez8fteq7ZGUCWQeyj2FP
 tkhQb0KeXDxot167tYh8MPLyXwx36o+lJJaN2IDwnP4jPebhkab6v0t+nWFvvecmEb/x
 54MsEPL17X2gfoPdcZRMshaq/fmavOJ6lLhyeV+3ikXyiU4PU3KSeiYf6MAgKui77arP
 Z8LL9gvCo1naJ3/vGVNaj7i9Q/bQsyq3T58YAq/TyQ8hCjkoi7z0ODstzRe4G8en71BO
 6zPA==
X-Gm-Message-State: ACgBeo2mRo/7sPRT/Z5cyfaFQTyeFoCBsw2NsX3nNR48PIrsfCZTBliG
 A8cGPKjUX/dAMnFzooI4pr4Aamdk+rwDJA==
X-Google-Smtp-Source: AA6agR7UigmfELmQiZEA38koHdS2rugMeN3Osyw0q/tV9e4WKvUSEvza7dPx3FkY7UdtK57geH7MEg==
X-Received: by 2002:a05:622a:1196:b0:342:f7a9:a138 with SMTP id
 m22-20020a05622a119600b00342f7a9a138mr6917734qtk.344.1660922300125; 
 Fri, 19 Aug 2022 08:18:20 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 br38-20020a05620a462600b006bbc09af9f5sm3368907qkb.101.2022.08.19.08.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:18:19 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 11:17:28 -0400
Message-Id: <20220819151734.926106-4-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yVHljR8Z2D0bu6ALuH07rLqlwLEWD5mUE20CXF2Ak/o=;
 b=L/vx0oIVQWzF6JBFjqac91JHogL3Lg1VPEV+BAtb0OhofNsjz2OfuEJ94ymJGiy/pu
 O3wx4XO8ak09Pl6SXdL4FYIIKUe9pAzaDztPjAsFzVPzYLlBCDvV3X0hQSxfXcA0+l2F
 EhC0rY1o1pE0b27VGz0T9ESml6IM/Eo8S6ul72RStX9swOp8BjVjKmkV/XOvMW/4UToe
 A55gNfFLwkYQEeNddSA8pgegdqy/cnhEBCv7Z1mD4PKD5ly4HTKUroBhnWJ72zHL9TYX
 abVMKDv83GPSXeYy3gO0Gq2oQnzl6aIZWxjdKrSP8dk8GcO/r+w32rBM7B0av5Gv+Tp+
 1KNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=L/vx0oIV
Subject: [Buildroot] [PATCH v3 3/8] arch: make FDPIC dependent on toolchain
 support
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FDPIC support on ARM requires a certain target name, and therefore is
only currently available with the Buildroot toolchain. In addition,
only uClibc-ng supports FDPIC on ARM at the moment.

This may need to become more complicated if we end up in a situation
where each libc supports FDPIC on a different set of architectures.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 arch/Config.in      | 1 +
 toolchain/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 0ee7077df6..4cd58041a4 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -435,6 +435,7 @@ config BR2_BINFMT_ELF
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
 	depends on BR2_ARCH_HAS_FDPIC_SUPPORT
+	depends on BR2_TOOLCHAIN_SUPPORTS_FDPIC
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual
diff --git a/toolchain/Config.in b/toolchain/Config.in
index fbc2f28553..be72350c06 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -49,6 +49,7 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
+	select BR2_TOOLCHAIN_SUPPORTS_FDPIC if BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
@@ -269,6 +270,9 @@ config BR2_TOOLCHAIN_HAS_OPENMP
 config BR2_TOOLCHAIN_SUPPORTS_PIE
 	bool
 
+config BR2_TOOLCHAIN_SUPPORTS_FDPIC
+	bool
+
 config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
 	bool "Copy gconv libraries"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
