Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A51C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 12:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 157E382A4E;
	Wed,  1 Jun 2022 12:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFNy3I5bU8mU; Wed,  1 Jun 2022 12:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B32982A2D;
	Wed,  1 Jun 2022 12:34:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB3321BF591
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9F6760BFB
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Wjl97VWiCi5 for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 12:34:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0115660BE0
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 12:34:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4BA3F868A1; Wed,  1 Jun 2022 12:22:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 14:34:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 267e39413ed09876c61eac1c5d7ee3042061b6f7
X-Git-Newrev: ea79360907ffd8fff11828a0fbda213979b15247
X-Patchwork-Hint: ignore
Message-Id: <20220601122253.4BA3F868A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: fix build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ea79360907ffd8fff11828a0fbda213979b15247
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
