Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B412C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 18:50:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59BD86103E
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 18:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59BD86103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14DBD404A0;
	Mon,  6 Sep 2021 18:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DB6PcKDn_GUw; Mon,  6 Sep 2021 18:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C9B44049C;
	Mon,  6 Sep 2021 18:49:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2782A1BF470
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 18:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17842608CB
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 18:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGzjgiHJ0HQT for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 18:49:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3D49605DF
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 18:49:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0E61688701; Mon,  6 Sep 2021 18:48:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 18:22:02 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 7fb5d97625b219da58acb29668860cbb11120574
X-Git-Newrev: 85f3019f1d1f9829add571e7f69c380597d8226a
X-Patchwork-Hint: ignore
Message-Id: <20210906184829.0E61688701@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/mesa3d: fix build
 on riscv32
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=85f3019f1d1f9829add571e7f69c380597d8226a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit 3298e67ac64ce1f52f58f1ef668c4c8c63309d04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
