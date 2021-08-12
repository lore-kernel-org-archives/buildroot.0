Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61266C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:23:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D09E60E93
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D09E60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08EFA402D7;
	Thu, 26 Aug 2021 22:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ELHNxZXiZVWO; Thu, 26 Aug 2021 22:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B99384035E;
	Thu, 26 Aug 2021 22:23:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA4B1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C57BF40794
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dnHamQzs2PJ for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD7914079F
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2E2158DC50; Thu, 26 Aug 2021 22:01:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:48:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 34da8f96141f14abd98bc4cab3fa05c0b7a0a895
X-Git-Newrev: 884a415ccb66c04767ad40d82b713f499a9bb8a7
X-Patchwork-Hint: ignore
Message-Id: <20210826220129.2E2158DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mongodb: fix build
 with gcc 11
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=884a415ccb66c04767ad40d82b713f499a9bb8a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...b-exec-plan_stats.h-fix-build-with-gcc-11.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
