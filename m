Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F87C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 08:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88F468125B;
	Mon, 16 Sep 2024 08:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_JOa8EAi_vP; Mon, 16 Sep 2024 08:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9679C81378
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9679C81378;
	Mon, 16 Sep 2024 08:12:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CC8B1BF311
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BDB381378
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FojdpRzCvDTh for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 08:12:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03EF68125B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03EF68125B
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03EF68125B
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:34 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a8629ddffbaso72092066b.1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 01:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726474352; x=1727079152;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=teRZvh74NZL1/ZU1iy4gAF9EfRhNOBCdGB9xhyDsDlI=;
 b=wCGDw1f3JXpEiZS40Wxyw7IOeEEG87LNzAFTLwV7IFTOi5OKiJweLnn8NtZjqqFXp1
 wFUTKb2Ykr4SwNCHqafhByZ9l7OivsXGtZBOpwJibxI7JVOASi+nqH8ezr5/la00HEwv
 JEr/CjBGW6bYD29oHTs89oGpbX/Zj7m2uRdxZMkKyx52CO7CUcgL2jmCFmnfeVj7tvLw
 JuEm3iy1ok+5e5cnyQD538vfvkOkg0nHuVTHiTWzzm2+TH3lMOU+vyLBPAb2YvkBxY8S
 zQVSJ5ud5ABwOqPC8tWQY6hVfq4LpTOqzlJcUbjA/Exrj/XNLzvEy9dMjL6EnhKWenk7
 yPVg==
X-Gm-Message-State: AOJu0Yy5ZR8XNnEGzuL/HU+0ocZMu17GY0A94QslY4WQYub/ZBGk3IMq
 WzguTK5Pl+T0rro8OQLU3FAY8q75v5jRdqG1Dz2Pl7Mhl3SnK3qxvg4jE9Pne4XmgFC2Wae3gMr
 ayIC1tw==
X-Google-Smtp-Source: AGHT+IE26qNi332xDi5iqaEEbUtIhPnnc5wyO/+PVqX9hDEUXlzQkc1alTf61uky0JeYmGhiePnQAQ==
X-Received: by 2002:a17:906:4a58:b0:a90:34ba:506e with SMTP id
 a640c23a62f3a-a9034ba512dmr516715466b.8.1726474351237; 
 Mon, 16 Sep 2024 01:12:31 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3a25sm275449866b.111.2024.09.16.01.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 01:12:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 10:12:26 +0200
Message-ID: <20240916081229.14823-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726474352; x=1727079152;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=teRZvh74NZL1/ZU1iy4gAF9EfRhNOBCdGB9xhyDsDlI=;
 b=BKS5hG1lkOG1nR82iADvo81mZzfRMlNb2lE8mH5jia4gkJNGHofTq8UBpnADayWQBH
 VSGmJGohJQyKtxYQmyoFA9lRrI6bIo3Cx4CYjrUhr0jZfomevOnWD8KG/V5Vrhvkvp/2
 1pqPLhADTgwFQhh49sPC7UKdatdNWp5JUQmyg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BKS5hG1l
Subject: [Buildroot] [PATCH 1/4] package/depot-tools: bump version to
 22df6f8e
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/depot-tools/depot-tools.hash | 2 +-
 package/depot-tools/depot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 1778b02494..01df83058a 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  904c266a5c5a96c756a1979990159b86a9bd60916782202b3791d32788cbb881  depot-tools-62fc3a1d244368a430ffd7a6b55377a6dfd5e348-git4.tar.gz
+sha256  5921debde49a63df8ad958e0434521c4dd62a9edd7031ddb1e5ea2ec89ba80e1  depot-tools-22df6f8e622dc3e8df8dc8b5d3e3503b169af78e-git4.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index e0c3842cd4..27e8896b23 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 62fc3a1d244368a430ffd7a6b55377a6dfd5e348
+DEPOT_TOOLS_VERSION = 22df6f8e622dc3e8df8dc8b5d3e3503b169af78e
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
