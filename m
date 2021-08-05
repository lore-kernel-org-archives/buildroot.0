Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD30C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:56:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 369D560EBB
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 369D560EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1725D4067B;
	Thu,  5 Aug 2021 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYEQ0Tui5gWR; Thu,  5 Aug 2021 19:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 593D840670;
	Thu,  5 Aug 2021 19:56:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA8361BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D79EF4053C
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ilp66O6smzSJ for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E94F840539
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B4BD5865A4; Thu,  5 Aug 2021 19:49:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:23:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 344101ddb1d4531f7d41e4e1206b581804b86bb9
X-Git-Newrev: d54341fc33b6c02d01d31e8ddb938556867308a9
X-Patchwork-Hint: ignore
Message-Id: <20210805194940.B4BD5865A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pistache: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d54341fc33b6c02d01d31e8ddb938556867308a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with gcc 11:

In file included from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/async.h:10,
                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/client.h:9,
                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/client/client.cc:7:
/tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/typeid.h:26:12: error: expected type-specifier before 'size_t'
   26 |   operator size_t() const { return reinterpret_cast<size_t>(id_); }
      |            ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2443559df8c2357476e4cbdbebb08280cbb80a3b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...include-pistache-typeid.h-include-cstddef.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch b/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch
new file mode 100644
index 0000000000..be06ca760a
--- /dev/null
+++ b/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch
@@ -0,0 +1,38 @@
+From 37291201ed948e9d65993a717c59bb14f4187e13 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 5 Aug 2021 19:02:56 +0200
+Subject: [PATCH] include/pistache/typeid.h: include cstddef
+
+Include cstddef to avoid the following build failure with gcc 11:
+
+In file included from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/async.h:10,
+                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/client.h:9,
+                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/client/client.cc:7:
+/tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/typeid.h:26:12: error: expected type-specifier before 'size_t'
+   26 |   operator size_t() const { return reinterpret_cast<size_t>(id_); }
+      |            ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2443559df8c2357476e4cbdbebb08280cbb80a3b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/pistacheio/pistache/pull/965]
+---
+ include/pistache/typeid.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/pistache/typeid.h b/include/pistache/typeid.h
+index 10353ca..893e7c1 100644
+--- a/include/pistache/typeid.h
++++ b/include/pistache/typeid.h
+@@ -7,6 +7,7 @@
+ 
+ #pragma once
+ 
++#include <cstddef>
+ #include <functional>
+ 
+ namespace Pistache
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
