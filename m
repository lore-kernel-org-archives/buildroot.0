Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330FCC4320A
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 20:12:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D545E6101E
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 20:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D545E6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 819104025E;
	Mon,  9 Aug 2021 20:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PUP1Tu6H79Ea; Mon,  9 Aug 2021 20:12:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E25F640261;
	Mon,  9 Aug 2021 20:12:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EBA91BF31F
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 20:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D3E940204
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 20:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lj6PAo7CXzNH for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 20:12:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D8BF400E5
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 20:12:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso249685wmq.3
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 13:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ad0jCei6YSL1+gCqLU47/0Un1puQkNd/IRGJ+4ZTpmw=;
 b=hA9Y0qqTlFGx51BcsbJg4CCyEfZlQoDfJDgjOmgza94gk07nEKLCMRoeqDJc2/tmEq
 R8/Q8WhBZEBPzPcKEN+SLhWi+eo69bubrvqC6P103Lj6lAXpSN62MSvndw4SwlpwNkeS
 VBqHoJy0YJpCBsu2J6jIfrLB3gwwAt/DcHHpUbo92gneEmY3p6K4DJk1D2n9ucOtm6W1
 nSIewsk0q+mj1xXrOeYVDLvbm71uWEPeh7EwRIQRJHCwWrUO5qNOFbK19+3EQNpJpKHv
 xq/MS/DtGu6mBj2e7Erf2aUdbq3xE33G/XVYB5Y7S47E4Ak8y93FJcLe93DognTJEikR
 GVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ad0jCei6YSL1+gCqLU47/0Un1puQkNd/IRGJ+4ZTpmw=;
 b=B69/c0yOAM7+9gLdgk973JwcznYa5+Pnnqw/zwlxyun8TftAdyEvkcR7fHWyv+lIwC
 eokcd3rUWOcUSWQwnzGGF52XlaNbvggjF+FtjlXbko7vcMZ048ZY46o06XK1JpGTSP/B
 NGSGlQx0bh8bDoS7YyjaoNt/wp+A40Pbo67LqJEoksmpDr19/zJBFIOVJZRnzxth57cN
 S+ipMnpVlOXS2ZXzVCSNMv16qNxlvmjbQWb3YnifzpUsjBLCwMt96tlktz2PUfNp+FRB
 GETQBLQrLIg5B7IiYC5npGe2ZfosOW3USyI3Izhhb3WM9ljcAW5XaidfuS4r83okpsv+
 fQkw==
X-Gm-Message-State: AOAM532TPCJHr/XgdwzTk3DbDn06cBmsH/f3bFaYmoYuEnssCYgyq0TO
 Jc58HrEIsWfLy3Ak9EhUbtHOS7N7+U4l1g==
X-Google-Smtp-Source: ABdhPJx/lwusGtu40LLVbntlNx2TeJYUDj/cQ/x4DRlZjYAMnDWoUoCanB0kiFjLov80Cl7NobjvSw==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr808566wmj.151.1628539924994; 
 Mon, 09 Aug 2021 13:12:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id p14sm480971wmi.42.2021.08.09.13.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 13:12:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Aug 2021 22:11:56 +0200
Message-Id: <20210809201156.1595045-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mongodb: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from src/mongo/db/query/plan_cache.h:36,
                 from src/mongo/db/catalog/collection_info_cache.h:33,
                 from src/mongo/db/catalog/collection.h:42,
                 from src/mongo/db/exec/requires_collection_stage.h:32,
                 from src/mongo/db/exec/delete.h:32,
                 from src/mongo/db/query/internal_plans.h:33,
                 from src/mongo/db/query/internal_plans.cpp:32:
src/mongo/db/exec/plan_stats.h:214:10: error: 'optional' in namespace 'std' does not name a template type
  214 |     std::optional<std::string> replanReason;
      |          ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8c0875fa413923504515a83d8b679366418c2444

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-plan_stats.h-fix-build-with-gcc-11.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/mongodb/0002-src-mongo-db-exec-plan_stats.h-fix-build-with-gcc-11.patch

diff --git a/package/mongodb/0002-src-mongo-db-exec-plan_stats.h-fix-build-with-gcc-11.patch b/package/mongodb/0002-src-mongo-db-exec-plan_stats.h-fix-build-with-gcc-11.patch
new file mode 100644
index 0000000000..e96a65252c
--- /dev/null
+++ b/package/mongodb/0002-src-mongo-db-exec-plan_stats.h-fix-build-with-gcc-11.patch
@@ -0,0 +1,44 @@
+From 0941e560850d54160c24778fa66b605714fd5012 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 9 Aug 2021 21:18:50 +0200
+Subject: [PATCH] src/mongo/db/exec/plan_stats.h: fix build with gcc
+ 11
+
+Fix the following build failure with gcc 11:
+
+In file included from src/mongo/db/query/plan_cache.h:36,
+                 from src/mongo/db/catalog/collection_info_cache.h:33,
+                 from src/mongo/db/catalog/collection.h:42,
+                 from src/mongo/db/exec/requires_collection_stage.h:32,
+                 from src/mongo/db/exec/delete.h:32,
+                 from src/mongo/db/query/internal_plans.h:33,
+                 from src/mongo/db/query/internal_plans.cpp:32:
+src/mongo/db/exec/plan_stats.h:214:10: error: 'optional' in namespace 'std' does not name a template type
+  214 |     std::optional<std::string> replanReason;
+      |          ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8c0875fa413923504515a83d8b679366418c2444
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: already fixed by
+https://github.com/mongodb/mongo/commit/e78b2bf6eaa0c43bd76dbb841add167b443d2bb0]
+---
+ src/mongo/db/exec/plan_stats.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/mongo/db/exec/plan_stats.h b/src/mongo/db/exec/plan_stats.h
+index 43053e27be..813e4edc9e 100644
+--- a/src/mongo/db/exec/plan_stats.h
++++ b/src/mongo/db/exec/plan_stats.h
+@@ -31,6 +31,7 @@
+ 
+ #include <cstdint>
+ #include <cstdlib>
++#include <optional>
+ #include <string>
+ #include <vector>
+ 
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
