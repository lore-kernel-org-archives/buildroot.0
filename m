Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B687ECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 08:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F35BC401B3;
	Thu, 15 Sep 2022 08:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F35BC401B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teUzBtRvYQiU; Thu, 15 Sep 2022 08:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD32740178;
	Thu, 15 Sep 2022 08:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD32740178
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 015A41C11A0
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE5CB40A67
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE5CB40A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMC8A8gvU29n for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 08:45:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1113C4032A
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 08:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1113C4032A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F1C6083C2D; Thu, 15 Sep 2022 08:45:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 10:36:33 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 423eef7a0c100400c40c4a7a26fcbddf387d46cd
X-Git-Newrev: 33a8e1d53ca035c24bef84e9711a16d39c885f17
X-Patchwork-Hint: ignore
Message-Id: <20220915084556.F1C6083C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/stress-ng: fix
 build with kernel >= 5.1 and < 5.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=33a8e1d53ca035c24bef84e9711a16d39c885f17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 8c1868eb31951b56a9cec6268d49195899e890b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
