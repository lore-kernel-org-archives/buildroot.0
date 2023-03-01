Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8771C64EC7
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 09:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5121B60AD4;
	Wed,  1 Mar 2023 09:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5121B60AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5sa2C133ORNR; Wed,  1 Mar 2023 09:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95CAF60AEC;
	Wed,  1 Mar 2023 09:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95CAF60AEC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CAC91BF86B
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 09:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DBE8402DC
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 09:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DBE8402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t27rPu5bh8GJ for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 09:23:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E64CC4025F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E64CC4025F
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 09:22:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so411945wms.0
 for <buildroot@buildroot.org>; Wed, 01 Mar 2023 01:22:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677662577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rXlAzPM2Id7aF4Co7g4Hgav8SDpvwIwCVp+cPcY4aZM=;
 b=qMu3ySL4chYqPmpK0Hc7Ld7CZDLrkGKWsnX0Y/LTwWHlhmKUXzMYGdnl16rCxNK479
 KOgX04lz2M2X7+QDaaF5iLmz5e+yTs9gFSf8PHDFkhHsKS5BfsMIUjUhi5wWALmktamj
 D7zZaCn8bMVEouvGrSt6KIcDCcZ/UZXGl4BGzgLBr02jJeHPSQ8Gclz7aM8gHeS70UBs
 AncbCtvTzhT8vau7WiSVTOvKgloGmqwIopW3hGwY4NVcFy7Y3de1LctE+k9v5qlb68LZ
 3xrCBQ8rM7aV0Bold54mlwxH1D4x0l/qhvxkvEBblY9N9hKGFNaM5M/6vLlawwHCc32s
 L81w==
X-Gm-Message-State: AO0yUKWIk0EdvRwSds75bU841oBXo+wvbZuJl1DbAtnG1EswcLbT9JRo
 SoIWhrYGKV21ifBJluqrRZ70tTq7fb6ouO/j
X-Google-Smtp-Source: AK7set8gUI/ahYgx2vSREM8sE1GbRZm+vFKXCIBmUxXUaKHPgEuolJjX08Eb3zWMUIwCCmJTppgJQA==
X-Received: by 2002:a05:600c:468d:b0:3eb:3692:6450 with SMTP id
 p13-20020a05600c468d00b003eb36926450mr4984963wmo.18.1677662577557; 
 Wed, 01 Mar 2023 01:22:57 -0800 (PST)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adfe90c000000b002c3f9404c45sm12040546wrm.7.2023.03.01.01.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:22:56 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  1 Mar 2023 10:22:53 +0100
Message-Id: <20230301092253.3104485-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1677662577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rXlAzPM2Id7aF4Co7g4Hgav8SDpvwIwCVp+cPcY4aZM=;
 b=QiUoKWjR2vOAOxMAunv9BJhORnp/draSOLj4E7Tf1Jkx2bfLwwUOCQIUa8xB6p9WUb
 R0rTwzViyMHYQ8jkHgbsQ8O1Rqd9P/bR3GWXBJCzfzaG7UXVXmZJDoGihYVo/WXFBety
 HlFgcsmVS5rhlbM4YoHz0uPZv/ObtVmRW3kSQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QiUoKWjR
Subject: [Buildroot] [PATCH] package/htpdate: bump to version 1.3.7
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
 package/htpdate/htpdate.hash | 2 +-
 package/htpdate/htpdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index f572fb1e84..b711773af5 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  3cdc558ec8e53ef374a42490b2f28c0b23981fa8754a6d7182044707828ad1e9  htpdate-1.3.6.tar.gz
+sha256  88c52fe475308ee95f560fd7cf68c75bc6e9a6abf56be7fed203a7f762fe7ab2  htpdate-1.3.7.tar.gz
 sha256  7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 2d4a11dd9d..20be904d3d 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.3.6
+HTPDATE_VERSION = 1.3.7
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
