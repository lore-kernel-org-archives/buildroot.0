Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8B5C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 12:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FF8041C0D;
	Tue,  7 Jun 2022 12:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7RkKgCoMX1W; Tue,  7 Jun 2022 12:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD1D4415C6;
	Tue,  7 Jun 2022 12:25:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C210D1BF33A
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADB2E410A7
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCe5zsmjL3l2 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 12:23:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DDF2415CC
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 12:23:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 198458674C; Tue,  7 Jun 2022 12:11:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 14:21:48 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6ff9cea6416787e1d6dcec568f6b1e368d26e5bf
X-Git-Newrev: 2a1e735a39f89c08dc6e293906c95740e3a320c0
X-Patchwork-Hint: ignore
Message-Id: <20220607121133.198458674C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rauc: fix build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a1e735a39f89c08dc6e293906c95740e3a320c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised since bump to version 1.5 in
commit 41bbe8df540e2c630ad04f8db7383a7e7705f368 and
https://github.com/rauc/rauc/commit/be55282d71d967dcc0cf48303f8245cbc8fff053:

In file included from /nvmedata/autobuild/instance-22/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:62,
                 from src/verity_hash.c:26:
src/verity_hash.c: In function 'verify_zero':
src/verity_hash.c:69:55: error: expected ')' before 'PRIu64'
   69 |    g_message("Spare area is not zeroed at position %" PRIu64 ".",
      |                                                       ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1a093c0e194a061836884419d2f50506105db01e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ea79360907ffd8fff11828a0fbda213979b15247)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-src-verify_hash.c-include-inttypes.h.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch b/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch
new file mode 100644
index 0000000000..916c8cca0b
--- /dev/null
+++ b/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch
@@ -0,0 +1,38 @@
+From b19a9c26d88a913417e77aaf60c72cdbf393d1f6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 31 May 2022 21:22:36 +0200
+Subject: [PATCH] src/verify_hash.c: include inttypes.h
+
+Include inttypes.h to avoid the following build failure:
+
+In file included from /nvmedata/autobuild/instance-22/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:62,
+                 from src/verity_hash.c:26:
+src/verity_hash.c: In function 'verify_zero':
+src/verity_hash.c:69:55: error: expected ')' before 'PRIu64'
+   69 |    g_message("Spare area is not zeroed at position %" PRIu64 ".",
+      |                                                       ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1a093c0e194a061836884419d2f50506105db01e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rauc/rauc/pull/914]
+---
+ src/verity_hash.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/verity_hash.c b/src/verity_hash.c
+index db82a78..3b2c2a0 100644
+--- a/src/verity_hash.c
++++ b/src/verity_hash.c
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include <errno.h>
++#include <inttypes.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
