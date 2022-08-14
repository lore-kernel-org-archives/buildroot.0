Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E18C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48CE281991;
	Sun, 14 Aug 2022 10:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48CE281991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iSf8tjgZysdc; Sun, 14 Aug 2022 10:17:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55D5F818BE;
	Sun, 14 Aug 2022 10:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55D5F818BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 398001BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2235660BBA
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2235660BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEWUJ7izUda5 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:17:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5636F608B7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5636F608B7
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 829F187470; Sun, 14 Aug 2022 10:02:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 12:16:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e9d04986e6545e9258a8ba925c4538e6a9a481a
X-Git-Newrev: 8c1868eb31951b56a9cec6268d49195899e890b3
X-Patchwork-Hint: ignore
Message-Id: <20220814100236.829F187470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress-ng: fix build with kernel
 >= 5.1 and < 5.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c1868eb31951b56a9cec6268d49195899e890b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with kernel >= 5.1 and < 5.6 (i.e.
before
https://github.com/torvalds/linux/commit/9e3aa61ae3e01ce1ce6361a41ef725e1f4d1d2bf)
raised since bump to version 0.12.02 in commit
e551fe76e2073f15b0fcf92a73bb6b7334b017b3 and
https://github.com/ColinIanKing/stress-ng/commit/3d6fccdbe53d0cbcb75dd4b91571aaaae7ee1ad4:

In file included from stress-io-uring.c:26:
io-uring.h:1:9: error: macro names must be identifiers
    1 | #define #define HAVE_IORING_OP_NOP 0
      |         ^

Fixes:
 - http://autobuild.buildroot.org/results/1bf3f2bbc849bdce531d56b1024fa87f0c1ae667

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Makefile-fix-build-with-kernel-5.6.patch  | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch b/package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch
new file mode 100644
index 0000000000..4c62da3241
--- /dev/null
+++ b/package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch
@@ -0,0 +1,60 @@
+From 5d419c790e648c7a2f96f34ed1b93b326f725545 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 13 Aug 2022 17:17:05 +0200
+Subject: [PATCH] Makefile: fix build with kernel < 5.6
+
+Fix the following build failure with kernel >= 5.1 and < 5.5 (i.e.
+before
+https://github.com/torvalds/linux/commit/9e3aa61ae3e01ce1ce6361a41ef725e1f4d1d2bf)
+raised since version 0.11.21 and
+https://github.com/ColinIanKing/stress-ng/commit/3d6fccdbe53d0cbcb75dd4b91571aaaae7ee1ad4:
+
+In file included from stress-io-uring.c:26:
+io-uring.h:1:9: error: macro names must be identifiers
+    1 | #define #define HAVE_IORING_OP_NOP 0
+      |         ^
+
+Moreover, IORING_OP_FALLOCATE is not available before kernel 5.6 and
+https://github.com/torvalds/linux/commit/d63d1b5edb7b832210bfde587ba9e7549fa064eb
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1bf3f2bbc849bdce531d56b1024fa87f0c1ae667
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported) from
+https://github.com/ColinIanKing/stress-ng/commit/5d419c790e648c7a2f96f34ed1b93b326f725545]
+---
+ Makefile          | 2 +-
+ stress-io-uring.c | 6 +++++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 2f9cc9918..ee17ae08b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -528,7 +528,7 @@ stress-personality.c: personality.h
+ #
+ io-uring.h:
+ 	$(V)$(CPP) $(CFLAGS) core-io-uring.c  | $(GREP) IORING_OP | sed 's/,//' | \
+-	sed 's/IORING_OP_/#define HAVE_IORING_OP_/' > io-uring.h
++	sed 's/.*\(IORING_OP_.*\)/#define HAVE_\1/' > io-uring.h
+ 	$(Q)echo "MK io-uring.h"
+ 
+ stress-io-uring.c: io-uring.h
+diff --git a/stress-io-uring.c b/stress-io-uring.c
+index ab9fd0749..84f463611 100644
+--- a/stress-io-uring.c
++++ b/stress-io-uring.c
+@@ -311,7 +311,11 @@ static inline int stress_io_uring_complete(
+ 			break;
+ 
+ 		cqe = &cring->cqes[head & *submit->cq_ring.ring_mask];
+-		if ((cqe->res < 0) && (opcode != IORING_OP_FALLOCATE)) {
++		if ((cqe->res < 0)
++#ifdef HAVE_IORING_OP_FALLOCATE
++			&& (opcode != IORING_OP_FALLOCATE)
++#endif
++		) {
+ 			const int err = abs(cqe->res);
+ 
+ 			/* Silently ignore EOPNOTSUPP completion errors */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
