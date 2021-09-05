Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CBBC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 18:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AB3604D7
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 18:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66AB3604D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D56B40442;
	Sun,  5 Sep 2021 18:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ET--jfZjQGG7; Sun,  5 Sep 2021 18:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C3440440;
	Sun,  5 Sep 2021 18:25:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74C441BF31F
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 18:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FC5F40440
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 18:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ni7_mnOIhqly for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 18:25:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83CF640302
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 18:25:34 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id n5so6327033wro.12
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iLnfVaNp9Nz5WHE43A3WF9rx0czAQiiFX333LtvoyYA=;
 b=D/zdWeWz3+qcDiMXGTJO0HdCIXxNlVLt/IkoUpZHoGMw8KEXIZd14gk0ptIzd2yZWd
 NoNz9wpk6m8+ptzG0YdxRlnb2C5cC1vFAVr6yi2OiJ4Kkc2p2VysoVipAOhaRgtKpNzt
 vTEuq8Zp7gackCCWSqG4EfSw8ErWpF1k0Vw8NXgloHXlALH2PoxGyrwWh9RIBAfQ1woh
 0yzJ0WJF2X41vGIfNXX4MBUhN25EbZ4nIiLUcr8q90yFRBj61O3shWV5g4KVKIR0o1KT
 aeb2PUUGsyspftQljm5n65gtvCwn0dUCwVdsKLNbhPFh7O59V4d0WxhwKkYnSalOZNtj
 sSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iLnfVaNp9Nz5WHE43A3WF9rx0czAQiiFX333LtvoyYA=;
 b=XK+JPAsQ9SA9jVzdAQSJHZ0Vyegg7U8zGJ8Z7xgpqT1SliH3ODeAUhy6bACCoFnf1f
 6yM3kG6U9aK2YFuSs/FiQ+fvDlYV1Gx0tSrrr0dYstFzB4xcEnXjBCH7BUhkJMtFib2c
 NWy2jMwcBmqsNs8Uzl3lLwiwD33iD7WFIio/lggo59qg5jTCUl1Awdt5OQXgBCiY3IM5
 jRWpi2wVxdnr0eIm/IgR64YZG5Z+p992O62yducY0g00GIOL0rDKTVe8R6JpHz5TGeF0
 8xfBH4EB4LxhdF/wOuSkDGBsDoEwN5C+jXoEu6K1aSIQ6uQbJkL2l0kkxqpCQdeX0FRd
 mM/g==
X-Gm-Message-State: AOAM533y94PfNLTdRujaNLgjKHHBiLZxLGfC4RhgVIFnTBg6o/zBxS9c
 E8DrDaY9SvfuUyAN6jcY30ePlcz8fEWKUA==
X-Google-Smtp-Source: ABdhPJyX/9HnqxCnxHpWPQZGDCZ1yXtg5bpYNEgkvpUaD7HK2ZgV57ksHfDC80mixsmyr9hNszQT5Q==
X-Received: by 2002:a5d:6807:: with SMTP id w7mr3565011wru.424.1630866332493; 
 Sun, 05 Sep 2021 11:25:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id n1sm5364872wrp.49.2021.09.05.11.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 11:25:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 20:25:08 +0200
Message-Id: <20210905182508.1151818-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boost: fix fiber dependencies
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Commit d39d8f7cee9b4634e6f490020204f63fae419e8e forgot to update fiber
dependencies resulting in the following build failure:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_BOOST_FILESYSTEM
  Depends on [n]: BR2_PACKAGE_BOOST [=y] && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_BOOST_FIBER [=y] && BR2_PACKAGE_BOOST [=y] && BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && !BR2_MIPS_CPU_MIPS32 [=n] && !BR2_MIPS_CPU_MIPS64 [=n] && (BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS [=n] || BR2_TOOLCHAIN_GCC_AT_LEAST_6 [=y]) && !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 [=n]

Fixes:
 - http://autobuild.buildroot.org/results/40b8af6ce273ebd5fca56d6734f64dacd562efb1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f6409769c6..536e5b8486 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -149,8 +149,7 @@ config BR2_PACKAGE_BOOST_FIBER
 	# mips support uses the "pause" instruction, only available
 	# since mips32r2/mips64r2.
 	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
-		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6 # boost-context -> boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
@@ -160,8 +159,7 @@ config BR2_PACKAGE_BOOST_FIBER
 
 comment "boost-fiber needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
-		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
