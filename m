Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E50C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:12:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6EB60FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A6EB60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 421E1614B7;
	Thu, 26 Aug 2021 22:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1X5FdAMwWvq; Thu, 26 Aug 2021 22:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D859F614BA;
	Thu, 26 Aug 2021 22:12:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B66D1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79356426B4
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8yD_hjvKL4b for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D80D7426AF
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 37D3D8DC50; Thu, 26 Aug 2021 22:01:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 00:05:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 912f9511de54f5a647e7aca52594c3020fe15ee8
X-Git-Newrev: 3298e67ac64ce1f52f58f1ef668c4c8c63309d04
X-Patchwork-Hint: ignore
Message-Id: <20210826220133.37D3D8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d: fix build on
 riscv32
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

commit: https://git.buildroot.net/buildroot/commit/?id=3298e67ac64ce1f52f58f1ef668c4c8c63309d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure on riscv32:

../src/util/futex.h: In function 'sys_futex':
../src/util/futex.h:39:19: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
   39 |    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
      |                   ^~~~~~~~~
      |                   sys_futex

Fixes:
 - http://autobuild.buildroot.org/results/692700a5f967760a0b8cd358b1712f1d5a7b681e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...tex.h-fix-build-on-32-bit-architectures-u.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch b/package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch
new file mode 100644
index 0000000000..b01db8a4b4
--- /dev/null
+++ b/package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch
@@ -0,0 +1,43 @@
+From e501b7c17ada9c694d3f8302622b78d733485b38 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 21 Aug 2021 17:55:33 +0200
+Subject: [PATCH] src/util/futex.h: fix build on 32-bit architectures using
+ 64-bit time_t
+
+Fix the following build failure on 32-bit architectures using 64-bit
+time_t (e.g. riscv32):
+
+../src/util/futex.h: In function 'sys_futex':
+../src/util/futex.h:39:19: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
+   39 |    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
+      |                   ^~~~~~~~~
+      |                   sys_futex
+
+Fixes:
+ - http://autobuild.buildroot.org/results/692700a5f967760a0b8cd358b1712f1d5a7b681e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12496]
+---
+ src/util/futex.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/util/futex.h b/src/util/futex.h
+index 43097f4cd5b..221eda9db0c 100644
+--- a/src/util/futex.h
++++ b/src/util/futex.h
+@@ -34,6 +34,10 @@
+ #include <sys/syscall.h>
+ #include <sys/time.h>
+ 
++#ifndef SYS_futex
++#define SYS_futex SYS_futex_time64
++#endif
++
+ static inline long sys_futex(void *addr1, int op, int val1, const struct timespec *timeout, void *addr2, int val3)
+ {
+    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
+-- 
+2.32.0
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
