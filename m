Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7F4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 10:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41F77824EE;
	Sun, 26 Dec 2021 10:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBsPfGURSc05; Sun, 26 Dec 2021 10:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85EF3824DF;
	Sun, 26 Dec 2021 10:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBB3B1BF476
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2D4841573
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TsByxosZaa1l for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 10:45:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96DC240966
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:45:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C41A7E0003;
 Sun, 26 Dec 2021 10:45:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 11:45:19 +0100
Message-Id: <20211226104520.663206-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/glibc: add a patch to fix build issue
 in kernels >= 3.15 and < 5.1 on Microblaze
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As explained in the patch itself, there is a bug in the handling of
__pselect32() in glibc for the Microblaze architecture. There a
special Microblaze variant that was added to support kernels older
than < 3.15, but it "hides" a generic implementation that is needed to
support kernels newer than 3.15 but older than 5.1 (which is when the
time64 support for 32-bit architectures was added, making __pselect32
no longer needed).

This bug causes a glibc build failure for kernels >= 3.15 but < 5.1,
on Microblaze.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...v-linux-microblaze-pselect32.c-add-m.patch | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch

diff --git a/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch b/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
new file mode 100644
index 0000000000..3597cd6a11
--- /dev/null
+++ b/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
@@ -0,0 +1,85 @@
+From af06fe63f9babb6d0179ae5d7d9245daada6bf56 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 26 Dec 2021 10:30:01 +0100
+Subject: [PATCH] sysdeps/unix/sysv/linux/microblaze/pselect32.c: add missing
+ implementation when !__ASSUME_TIME64_SYSCALLS
+
+In commit a92f4e6299fe0e3cb6f77e79de00817aece501ce ("linux: Add time64
+pselect support"), a Microblaze specific implementation of
+__pselect32() was added to cover the case of kernels < 3.15 which lack
+the pselect6 system call.
+
+This new file sysdeps/unix/sysv/linux/microblaze/pselect32.c takes
+precedence over the default implementation
+sysdeps/unix/sysv/linux/pselect32.c.
+
+However sysdeps/unix/sysv/linux/pselect32.c provides an implementation
+of __pselect32() which is needed when __ASSUME_TIME64_SYSCALLS is not
+defined. On Microblaze, which is a 32-bit architecture,
+__ASSUME_TIME64_SYSCALLS is only true for kernels >= 5.1.
+
+Due to sysdeps/unix/sysv/linux/microblaze/pselect32.c taking
+precedence over sysdeps/unix/sysv/linux/pselect32.c, it means that
+when we are with a kernel >= 3.15 but < 5.1, we need a __pselect32()
+implementation, but sysdeps/unix/sysv/linux/microblaze/pselect32.c
+doesn't provide it, and sysdeps/unix/sysv/linux/pselect32.c which
+would provide it is not compiled in.
+
+This causes the following build failure on Microblaze with for example
+Linux kernel headers 4.9:
+
+/home/thomas/buildroot/buildroot/output/host/lib/gcc/microblazeel-buildroot-linux-gnu/10.3.0/../../../../microblazeel-buildroot-linux-gnu/bin/ld: /home/thomas/buildroot/buildroot/output/build/glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/build/libc_pic.os: in function `__pselect64':
+(.text+0x120b44): undefined reference to `__pselect32'
+collect2: error: ld returned 1 exit status
+
+To fix this, we take a crude approach: replicate in
+sysdeps/unix/sysv/linux/microblaze/pselect32.c the
+!__ASSUME_TIME64_SYSCALLS implementation that is already in
+sysdeps/unix/sysv/linux/pselect32.c.
+
+Upstream: https://sourceware.org/pipermail/libc-alpha/2021-December/134635.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../unix/sysv/linux/microblaze/pselect32.c    | 22 +++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/microblaze/pselect32.c b/sysdeps/unix/sysv/linux/microblaze/pselect32.c
+index 70b7b52a48..6b6b3e8a2e 100644
+--- a/sysdeps/unix/sysv/linux/microblaze/pselect32.c
++++ b/sysdeps/unix/sysv/linux/microblaze/pselect32.c
+@@ -22,7 +22,25 @@
+ #include <sys/poll.h>
+ #include <sysdep-cancel.h>
+ 
+-#ifndef __ASSUME_PSELECT
++#if !defined(__ASSUME_TIME64_SYSCALLS)
++int
++__pselect32 (int nfds, fd_set *readfds, fd_set *writefds,
++	     fd_set *exceptfds, const struct __timespec64 *timeout,
++	     const sigset_t *sigmask)
++{
++  struct timespec ts32, *pts32 = NULL;
++  if (timeout != NULL)
++    {
++      ts32 = valid_timespec64_to_timespec (*timeout);
++      pts32 = &ts32;
++    }
++
++  return SYSCALL_CANCEL (pselect6, nfds, readfds, writefds, exceptfds,
++			 pts32,
++			 ((__syscall_ulong_t[]){ (uintptr_t) sigmask,
++						 __NSIG_BYTES }));
++}
++#elif !defined(__ASSUME_PSELECT)
+ int
+ __pselect32 (int nfds, fd_set *readfds, fd_set *writefds,
+ 	     fd_set *exceptfds, const struct __timespec64 *timeout,
+@@ -57,4 +75,4 @@ __pselect32 (int nfds, fd_set *readfds, fd_set *writefds,
+ 
+   return ret;
+ }
+-#endif /* __ASSUME_PSELECT  */
++#endif
+-- 
+2.31.1
+
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
