Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B122CC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 21:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73D39812B1;
	Sat, 13 Jul 2024 21:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id outOdHwWEOtO; Sat, 13 Jul 2024 21:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50E2D812DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50E2D812DA;
	Sat, 13 Jul 2024 21:05:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF5CB1BF355
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD4EF812DA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_8UFrHPPzpH for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 21:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C386E812B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C386E812B1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 21:05:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E1CD8668C; Sat, 13 Jul 2024 21:05:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:53:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d90980129f5773e1cff33f66f999209b68a0831a
X-Git-Newrev: 36c7b1f08607c92186b849bd395fb2529942a6f9
X-Patchwork-Hint: ignore
Message-Id: <20240713210503.7E1CD8668C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libxshmfence: fix build
 on riscv32
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

commit: https://git.buildroot.net/buildroot/commit/?id=36c7b1f08607c92186b849bd395fb2529942a6f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation to revert e39ad96136a8c340b3aea6b036024e28f14584f3,
and (partial) 26642e4cc09666110d5105e7867579a0e48cfa09.

xshmfence_futex.h: In function 'sys_futex':
xshmfence_futex.h:58:24: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
   58 |         return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
      |                        ^~~~~~~~~
      |                        sys_futex

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/commit/e39ad96136a8c340b3aea6b036024e28f14584f3

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ce_futex.h-fix-build-on-32-bit-architectu.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch b/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch
new file mode 100644
index 0000000000..40a796c4f2
--- /dev/null
+++ b/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch
@@ -0,0 +1,46 @@
+From 4fca45a71f08a5bebd12d39c85f49e0b0e4426bf Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Fri, 5 Apr 2024 10:45:15 +0200
+Subject: [PATCH] src/xshmfence_futex.h: fix build on 32-bit architectures
+ using 64-bit time_t
+
+Fix the following build failure on 32-bit architectures using 64-bit
+time_t (e.g. riscv32):
+
+xshmfence_futex.h: In function 'sys_futex':
+xshmfence_futex.h:58:24: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
+   58 |         return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
+      |                        ^~~~~~~~~
+      |                        sys_futex
+
+Similar to:
+https://gitlab.freedesktop.org/mesa/mesa/-/commit/7d87478124061915582412ba410759afe863d679
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/commit/e39ad96136a8c340b3aea6b036024e28f14584f3
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/merge_requests/8>
+Upstream: https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/commit/4fca45a71f08a5bebd12d39c85f49e0b0e4426bf
+---
+ src/xshmfence_futex.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/xshmfence_futex.h b/src/xshmfence_futex.h
+index 673ac0e..4476038 100644
+--- a/src/xshmfence_futex.h
++++ b/src/xshmfence_futex.h
+@@ -53,6 +53,10 @@ static inline int futex_wait(int32_t *addr, int32_t value) {
+ #include <sys/time.h>
+ #include <sys/syscall.h>
+ 
++#if defined(SYS_futex_time64) && !defined(SYS_futex)
++#define SYS_futex SYS_futex_time64
++#endif
++
+ static inline long sys_futex(void *addr1, int op, int val1, struct timespec *timeout, void *addr2, int val3)
+ {
+ 	return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
