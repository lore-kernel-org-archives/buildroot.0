Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D86EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 13:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D72D440A15;
	Thu, 15 Jun 2023 13:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D72D440A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_crgMeXnVkJ; Thu, 15 Jun 2023 13:43:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9CF6405F9;
	Thu, 15 Jun 2023 13:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9CF6405F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA581BF30B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D65028148A
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D65028148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YffnAhMRNl4N for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 13:43:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD07481455
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD07481455
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 13:43:45 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30fceb009faso633172f8f.0
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836623; x=1689428623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xllk+C/pcIt8GTftmEj8nvgMpWsx8lBgAIEK97jj1BQ=;
 b=QV7ltHhqF6pkJaBZQM7sBkRmIGZayMS9FWN4lsnHAbFCy40iDhzqdrVVq2lkubrgVp
 acu1fbwYO0ybcQDXccRQAS3XDCPymwx/ZgW2fHxvH/g3rwC4GBHHE6KN7JcIGGc4jWaY
 XwAFwpvvyKlVGOdlKjFCIXzrSMCWeDX+JEhN0ibEx4ywjfjC9BheTmT8lel9xsaiHR10
 UfvjfVhe2pKe20Vh8B+6OZ8gzIA4NUgAm95lQs5NSsU+XOeIQZTD9dYRRRKrUn2LK9Mp
 3lkZMgM5WDl1Rfsr4/9TiqgeL4hrtOU/k/dfaEWGybsteU+801VO5eVJsTHBia03sfy0
 Mv2Q==
X-Gm-Message-State: AC+VfDyZdFLhN4PSsCDZBVDNG7KNwwh8jEL8f/OAlf4NbrmX/x38MRbl
 WXGJwjqcE7DxEXQV1B2vJZPtaFZ7VaPOC8RCOao=
X-Google-Smtp-Source: ACHHUZ5LiN28vXzh/8NAi8QYLR9gyvoRWszAr4R8fyNN66f84QNgrLIXYvXXm7o9VI0SY3g/qz0/9g==
X-Received: by 2002:adf:dcc1:0:b0:30a:a193:3987 with SMTP id
 x1-20020adfdcc1000000b0030aa1933987mr4368501wrm.30.1686836623594; 
 Thu, 15 Jun 2023 06:43:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:31f3:6562:63d2:17f])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21129602wru.97.2023.06.15.06.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 06:43:42 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 15:43:05 +0200
Message-Id: <20230615134315.494330-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686836623; x=1689428623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xllk+C/pcIt8GTftmEj8nvgMpWsx8lBgAIEK97jj1BQ=;
 b=ki0jGHbtfWDZaS9xIJ7ZmCFJPTVP/ApbqkD0shg3eMBGjhLwH8CbZ0xB5LnAwUQ8Ot
 92Vcq0oHutWxKhCK8no25qsnYr4Ra8XFuU1/uJjzGF6X93RVag3j926F8L0WlPbK6ujQ
 IFrTPMu7Z04RWkrHXkMCF7F6YKnbno76VgOdCSd0+ZbaTM6OXE1czkrIp7HGP6eOTOvE
 lXyq0MY5bfFbnYUbDRuR0jQAvilcgFgtJPnV8vXF9W5+XiUgISFBGXOQFMr0VlHgbMDr
 HBt6h1K4wu4ZJDO9XaY5eaByNyGCuYOY0aGO22npQoJMEjJYQ9FdRLBgHSrUxSuEjvaL
 cWVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=ki0jGHbt
Subject: [Buildroot] [PATCH v4 01/10] package/llvm-project: new group for
 llvm packages
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

To make updating easier in the future, group all llvm projects in
one subfolder and define some variables for all of them.

Introduce LLVM_PROJECT_VERSION_MAJOR to be used by the clang package
in a followup change.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v3: Add LLVM_PROJECT_VERSION_MAJOR
---
 package/llvm-project/llvm-project.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/llvm-project/llvm-project.mk

diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
new file mode 100644
index 0000000000..747a6f5647
--- /dev/null
+++ b/package/llvm-project/llvm-project.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# llvm-project
+#
+################################################################################
+
+LLVM_PROJECT_VERSION_MAJOR = 11
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
+LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
+
+include $(sort $(wildcard package/llvm-project/*/*.mk))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
