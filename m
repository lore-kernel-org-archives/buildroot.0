Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9A5C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:44:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB6E6108E
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CB6E6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D096D404CA;
	Tue,  7 Sep 2021 08:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PmrRfai5-l9S; Tue,  7 Sep 2021 08:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFD1E40119;
	Tue,  7 Sep 2021 08:44:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA741BF48D
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CEE540301
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6QBjQp3_-Wc for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 08:44:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D8DC402E3
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 08:44:05 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id w7so9178321pgk.13
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uj4d1LjxVZpNWIC4GO54069kxxNhOxZJDk6vy6bqZ7Q=;
 b=IknRqCFkAuSTWTZ8yVIjqA1fHn+EmpwMCQTx2VhoEJReabc393gii13Z+lPZF6eGtS
 bIZRmUe3Bf1zWd17oWu/sFemQUVcCc1klNDfLbfaAXVEb4SzPkTgeremnUz343xagZQ4
 paLDMNNKCsheHhcVp1/vkYhhe+EuzmxpjdbdOtjvkvu4ffP7WhaJUOMyUwiCdBiPu7xu
 4O+Yg5Kx/FJcJojq3yz6J33SnwmAub6xb6zvy9Ecy6ErOSOy9CMXq3/QB7BIWD4dXmjz
 KnPvrsG5tdUS69qHqfuYGko2TRuOBIrWr7eyDDR8vjB5l0+Xwcgk99+XuCnM8TCf93ws
 2zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uj4d1LjxVZpNWIC4GO54069kxxNhOxZJDk6vy6bqZ7Q=;
 b=mLZvgjmofm2CL8QywH5Ji/KtqjcI0oAwUkF0p1exDsyTZ3ZmdpjYXv8c/TkhCpPmGe
 6Nf7DhMr0ppXN40kQlzd2m1dAzr0s2qQsdPkTfaaLhf6MuIIoCcGJbP7yDVKcrs20Y9V
 7sEcOoH06jyDMnyAdyQCnVcwdF6vBoASu/Chl4O24yBmYLYeWvpqEcuUVsm2ixC/pozs
 RXtk1jcd/vz/bK54fOqi+Ve8+BYqnMsAPJrQ9lCUBt0JeMkXfThMOso+msHNPmIrRnaS
 NtJizYkIGIqbFGvZ2LYRPMEvhJUHhQKJZsYAMCwITKPAvIusDtlBt/Da/xsatz0yGyGh
 ZfoA==
X-Gm-Message-State: AOAM531aojtgfzim0kQ22PrhHcfLIDXzEY/2KXCCAbNntH06agi+hA7A
 0/eZuVtDhfebXyRfLXsoG4a0ORVJfiH4Vw==
X-Google-Smtp-Source: ABdhPJzhwbterM5koWwESemjcZj92wZu3UnLTNgN+tMS/USuBb6zyGbx6B4FF1MVAs1h5zyfJorutA==
X-Received: by 2002:a63:6ec9:: with SMTP id
 j192mr15908516pgc.115.1631004244627; 
 Tue, 07 Sep 2021 01:44:04 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:99c1:78a8:271f:9808])
 by smtp.gmail.com with ESMTPSA id u12sm12513308pgi.21.2021.09.07.01.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:44:04 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Sep 2021 20:43:44 +1200
Message-Id: <20210907084345.6192-2-judge.packham@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907084345.6192-1-judge.packham@gmail.com>
References: <20210907084345.6192-1-judge.packham@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/micropython: Bump version to 1.17
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.hash | 4 ++--
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index fe47ee09c4..d5045e8f27 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  542eb120df8d9eb6f200bcd856294e143813adea9dda0d7189405c218d4b16f7  micropython-1.14.tar.gz
-sha256  9c6089e26c8638a0645bcb0db2c85051f82de8022dcd07fb22baa0c5f9362085  LICENSE
+sha256  c21dbf8144237b3dbe3847c9ad5264cd0f3104eb078c810b3986004cce8fcd70  micropython-1.17.tar.gz
+sha256  59b1f0947a87c90d0d29dbe2c8deb3d1f8263bbbd2fb5ebcc79a649cff6dfcba  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index fa28da9be3..9ddcbd9712 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.14
+MICROPYTHON_VERSION = 1.17
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
