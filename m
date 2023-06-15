Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD81AEB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 13:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 770BF4157C;
	Thu, 15 Jun 2023 13:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 770BF4157C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkX07VOSApvB; Thu, 15 Jun 2023 13:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7659E41918;
	Thu, 15 Jun 2023 13:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7659E41918
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8ECED1BF30B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66E9B40562
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66E9B40562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFmoDPEw0dpp for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 13:43:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A5A5404A5
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A5A5404A5
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 13:43:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30fcde6a73cso2512600f8f.2
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836629; x=1689428629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4NvvCOIh8MOd4rXPwRPJSIgykycYbHam7H0PELcnYIU=;
 b=lE/OSyTa6jUEKSahjEdETHPl9XkYmI7FFIv9r1bg6HnkkqWK6kMivzCizUbv6rqg2V
 6AnzXIF8Orq6XMFCFWAUdRdE7Hs1JosNwMGytxkYSJmfEXAsdFwkf/SNII/9IGSKBvSf
 5MAZ6mWBBCq09VYMmgSsm2wIgHXfiS9DkPfpShCO4MbvMI491FYSwTQdBdGd8DDtsrpj
 eN7AvVmIt9JJ6UElKcRsSvLwe8qX5wmmOATj1UrMR04Lknjn5pzj0IdgOJcUlTgoeIkB
 ZH1hZTCYrn028mrnAsomxSndaaz10rM4r//DaVOa4ZYRK8JMNxQ7rA1sTpAnVLsXFhGT
 qmbg==
X-Gm-Message-State: AC+VfDxsgwzmjgGhf86rBaAroiVj1nZtVFuRV8Vc8L9MAGKy05ZMRNOn
 Rb9yXhB53flEUnxxy1XBgfx36HslTVirR3Y0U3Q=
X-Google-Smtp-Source: ACHHUZ4fBrziyX7HFtc29VIKJSFjjcEJztDOmlP3fvaNyvESQhXP3Ne/73/BUzKWPXrlzbI8ZJh66Q==
X-Received: by 2002:a5d:6e89:0:b0:2f9:c2ab:e1de with SMTP id
 k9-20020a5d6e89000000b002f9c2abe1demr10687105wrz.14.1686836629106; 
 Thu, 15 Jun 2023 06:43:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:31f3:6562:63d2:17f])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21129602wru.97.2023.06.15.06.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 06:43:48 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 15:43:09 +0200
Message-Id: <20230615134315.494330-6-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686836629; x=1689428629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4NvvCOIh8MOd4rXPwRPJSIgykycYbHam7H0PELcnYIU=;
 b=msT+DFQPl+8w9yBMldynuuPek8veuv6A8loWsga2n22J/tQKSgZBrK7rvTNOuBPHzO
 3s6RQvBWHdAM9Uk+0GKeYeHm8wSy6zMwjm3oA9wilhAYKe3emAfV1fs6RzMzy5DhWcdf
 DjXfLGCDxgf3ASz8WvVimv3RiiZ/1dblj3hMaDelNGrV6yi/12EcBWccVu95aiSxq57p
 iwxlVlTNMt9KDVt4JuWH2CURsLJvj0XBwiSlawwDkxQCc/8xZSMcW166mG2yLW06M4ql
 FC9gscjgAoasWk608PAho/sB03/j0wrnLy27sFM6sHZu8DnsamlXmLLq0X/HiWQv8pna
 blPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=msT+DFQP
Subject: [Buildroot] [PATCH v4 05/10] package/compiler-rt: move to
 llvm-project subfolder
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

To make version bumping easier, move compiler-rt to a new llvm-project
subfolder and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v4:
    - change inaccuracy in commit message (move llvm -> move compiler-rt)
    - remove change in DEVELOPERS file because the person removed their
      name from the file

v3: move compiler-rt entry in package/Config.in
---
 package/Config.in                                       | 2 +-
 package/{ => llvm-project}/compiler-rt/Config.in        | 0
 package/{ => llvm-project}/compiler-rt/compiler-rt.hash | 0
 package/{ => llvm-project}/compiler-rt/compiler-rt.mk   | 6 ++----
 4 files changed, 3 insertions(+), 5 deletions(-)
 rename package/{ => llvm-project}/compiler-rt/Config.in (100%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.hash (100%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.mk (85%)

diff --git a/package/Config.in b/package/Config.in
index 7f2f045c87..17343a8e86 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2024,7 +2024,6 @@ menu "Other"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
 	source "package/cmocka/Config.in"
-	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
@@ -2128,6 +2127,7 @@ comment "linux-pam plugins"
 endif
 	source "package/liquid-dsp/Config.in"
 	source "package/llvm-project/clang/Config.in"
+	source "package/llvm-project/compiler-rt/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/compiler-rt/Config.in b/package/llvm-project/compiler-rt/Config.in
similarity index 100%
rename from package/compiler-rt/Config.in
rename to package/llvm-project/compiler-rt/Config.in
diff --git a/package/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
similarity index 100%
rename from package/compiler-rt/compiler-rt.hash
rename to package/llvm-project/compiler-rt/compiler-rt.hash
diff --git a/package/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
similarity index 85%
rename from package/compiler-rt/compiler-rt.mk
rename to package/llvm-project/compiler-rt/compiler-rt.mk
index c8ea86e899..84add60801 100644
--- a/package/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
-# tied to the version of those tools
-COMPILER_RT_VERSION = 11.1.0
+COMPILER_RT_VERSION = $(LLVM_PROJECT_VERSION)
 COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
-COMPILER_RT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(COMPILER_RT_VERSION)
+COMPILER_RT_SITE = $(LLVM_PROJECT_SITE)
 COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_DEPENDENCIES = host-clang llvm
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
