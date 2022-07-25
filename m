Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB46C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A4B340CE8;
	Mon, 25 Jul 2022 15:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A4B340CE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYk-rBV7laos; Mon, 25 Jul 2022 15:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E7A940CD4;
	Mon, 25 Jul 2022 15:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E7A940CD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6ECBD1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54DCE419F8
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54DCE419F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zDjA4tVAbNU for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:22:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05B8D419F5
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05B8D419F5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:22:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v13so8685064wru.12
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=olTrHzByW8sdEk4ZEprbxFJfBB4s7k6/Kp9ESDHn4L4=;
 b=8QMNYLxLVxc/mpMokP0OLv4cLAsAMBrHZojUaBoFd5q65Y0orhqeiYIx22r4ZqbHr5
 vTJ9O1U+yeWQqaa8A88086oaSk8zGcaTdgxsD413jSTHlks2y8XS9YnwADFuB5RUHVNv
 CIHGKZ2IqScf8w5Mqd83bhcuE4qXBbyD6PhCSdD47PY3GPXiV7kyc8wY8CtrflO7X3T4
 DnWjPzvRlC5wAXquCltbgGJoHEPriXgCYBFsFQu56rMOPt/ziOQT1d9e/zLCFzd7/g2A
 pw8T5/qs1F3CK0Y7TlZhy0ax8JN4JfNBIVHYWh3SGegM9BrN5VfcyI/a47+Xc4/War3C
 9bIQ==
X-Gm-Message-State: AJIora9+7y+0h0GHT5sTLoZfJH1ptTC96Cvk6ZwR2Oh1/ZT8VFBSM176
 HN+liWz4pYJVsNDmAHBAACbZhDnQgN1kiQ==
X-Google-Smtp-Source: AGRyM1u3YUTasvGxwMRcMEPL8EgOvxiiaMkOIUhaQB9wNPloS0UCR57Q7qq/aRn62quY1pzPX04SLg==
X-Received: by 2002:a05:6000:114f:b0:21e:8c61:248e with SMTP id
 d15-20020a056000114f00b0021e8c61248emr2958198wrx.541.1658762551058; 
 Mon, 25 Jul 2022 08:22:31 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm14244983wmr.42.2022.07.25.08.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 08:22:30 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 17:22:25 +0200
Message-Id: <20220725152229.3370033-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=olTrHzByW8sdEk4ZEprbxFJfBB4s7k6/Kp9ESDHn4L4=;
 b=GpPYkUXSHIu0nCPzhMjp1UVeeK1fBkBzgbqgQa2GtlCDJndLjqAMjcO8M+2aZ5oEUs
 JoO9EM5GXIOMM+47AmSAi6Wm62+2kJ2Y5yM+iImL88ZLG/z34xmMLUmw3rEs2c2G/xoN
 mURDfGx8yvpDKGBSCnBq06hNsnOw11vAgOzQ1q34rTelaw7AplhiIEHfZn5dQXgryTJp
 3VZftnGwlkKdUgRhUpgQu6OP1JEAegXsgON7xWFTibwfLvMpf0EwrOS28SBfRZ8g1Mu6
 iF7gEVHkwaamR2u5qOvNk1DZv6faK7qQ5zmHbz9D9ww6YTV7E9HpotJ8KvpcWggv6HfV
 pgIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GpPYkUXS
Subject: [Buildroot] [PATCH 1/5] Config.in: add new option BR2_ENABLE_LTO to
 globally enable LTO
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
Cc: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>,
 Douglas RAILLARD <public.douglas.raillard@gmail.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages have a configure option to enable LTO. Add a global option
to enable/disable this in packages.

Note that we could instead (or in addition) pass -flto directly to the
compiler in the toolchain wrapper, but that has a *much* bigger impact,
so for the time being let's not do that.

No toolchain dependency is added for this, because all toolchains now
support LTO.
- LTO support was merged in GCC years before 4.6 (our minimal version)
  was released.
- Our oldest external toolchain, Sourcery ARM 2014.05, has LTO support.
- For our internal toolchains, it is supposedly regulated by
  BR2_GCC_ENABLE_LTO. However, that option only *enables* it - it
  doesn't disable LTO support when it's not provided. Since LTO support
  defaults to enabled for a long time already in GCC, in practice all
  Buildroot-generated toolchains do support LTO.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Config.in b/Config.in
index af9052d32b..8fc431a5da 100644
--- a/Config.in
+++ b/Config.in
@@ -551,6 +551,25 @@ config BR2_OPTIMIZE_FAST
 
 endchoice
 
+config BR2_ENABLE_LTO
+	bool "build packages with link-time optimisation"
+	help
+	  Enable the link-time optimisation (LTO) option when building
+	  packages. Link-time optimisation re-runs optimisations at link
+	  time, which allows the compiler to do interprocedural analysis
+	  across compilation units and thus come with better results:
+	  smaller size and better performance.
+
+	  Note that this analysis is limited to statically linked object
+	  files and libraries.
+
+	  This option may significantly increase build times, sometimes
+	  5 times longer, with only limited gains.
+
+	  At this time, this option only enables LTO in packages that
+	  have an explicit configuration option for it. Other packages
+	  always enable LTO, but most packages never enable LTO.
+
 config BR2_GOOGLE_BREAKPAD_ENABLE
 	bool "Enable google-breakpad support"
 	depends on BR2_INSTALL_LIBSTDCPP
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
