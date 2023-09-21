Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA65E7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF56182AED;
	Thu, 21 Sep 2023 19:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF56182AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MzYRl9zO0Vtl; Thu, 21 Sep 2023 19:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 381BB827DD;
	Thu, 21 Sep 2023 19:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 381BB827DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 347F91BF98E
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF71820CD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DF71820CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1Pl7zOkfnnv for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:44:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC9D981FB7
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC9D981FB7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97E3587517; Thu, 21 Sep 2023 19:44:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 21:43:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5724145b1e7c70e44cc1b5befa3f11198bf497c7
X-Git-Newrev: 6e7bc7ee8ce02d7bad20566d86982b26641235bb
X-Patchwork-Hint: ignore
Message-Id: <20230921194453.97E3587517@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: fix musl build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6e7bc7ee8ce02d7bad20566d86982b26641235bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version
2023.05 in commit b86542085df87da91057017b17f261a213bfd918 and
https://github.com/sbabic/swupdate/commit/8228b1390632195158f4387d7aae659ebd6f1469:

In file included from core/bootloader.c:9:
include/util.h:210:23: error: unknown type name 'mode_t'
  210 | int mkpath(char *dir, mode_t mode);
      |                       ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e545f294c7f032fd7434fdb91aa18a38b2e19038

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-include-util-h-fix-build-on-musl.patch    | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/swupdate/0001-include-util-h-fix-build-on-musl.patch b/package/swupdate/0001-include-util-h-fix-build-on-musl.patch
new file mode 100644
index 0000000000..d1e0db6b56
--- /dev/null
+++ b/package/swupdate/0001-include-util-h-fix-build-on-musl.patch
@@ -0,0 +1,41 @@
+From 1999685830d6e9b57014666b9e53e46de17a471c Mon Sep 17 00:00:00 2001
+From: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Date: Fri, 15 Sep 2023 18:14:57 +0900
+Subject: [PATCH] include/util.h: fix build on musl
+
+Building on musl 1.2.4 fails with the following error/warnings:
+
+include/util.h:211:23: error: unknown type name 'mode_t'
+  211 | int mkpath(char *dir, mode_t mode);
+include/util.h:269:36: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
+  269 | char *swupdate_time_iso8601(struct timeval *tv);
+
+These were caused by a recent reorganization of the headers and glibc
+appears more tolerant here.
+
+Fixes: 8228b1390632 ("Reorganize includes to have smaller files")
+Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Upstream: https://github.com/sbabic/swupdate/commit/1999685830d6e9b57014666b9e53e46de17a471c
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/util.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/util.h b/include/util.h
+index 2f5c7adc..5f4cdc01 100644
+--- a/include/util.h
++++ b/include/util.h
+@@ -8,11 +8,13 @@
+ #ifndef _UTIL_H
+ #define _UTIL_H
+ 
++#include <fcntl.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
+ #include <stdbool.h>
++#include <sys/time.h>
+ #if defined(__linux__)
+ #include <linux/types.h>
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
