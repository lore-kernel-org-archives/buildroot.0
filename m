Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA89FC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A6B6F808;
	Wed, 16 Apr 2025 21:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8P5kSynApt1; Wed, 16 Apr 2025 21:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85EA16F5A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85EA16F5A9;
	Wed, 16 Apr 2025 21:40:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 238EA20E6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBF8D607A7
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cubGeqUxOTdb for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E8D60857
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87E8D60857
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 821DA8458F; Wed, 16 Apr 2025 21:40:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 10:44:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e318e5c54bb4f2b5618cd88d54ddef6737f7b45c
X-Git-Newrev: c0839ab823246cc97b1aae62e07469cbb7b5adc4
X-Patchwork-Hint: ignore
Message-Id: <20250416214040.821DA8458F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: fix NPTL
 alignment on m68k
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5375192224965163173=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5375192224965163173==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c0839ab823246cc97b1aae62e07469cbb7b5adc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Tested on QEMU using the qemu_m68k_q800_defconfig configuration, with a
switch of  the toolchain to uclibc-ng and enabling rsyslog.

This patch addresses an issue where rsyslog’s pthread_cond_wait was
busy-looping due to futex_time64 repeatedly returning EINVAL. The
correction in NPTL alignment resolves the 100% CPU usage problem.

This patch is fixed upstream [1] so apply it until it is tagged.

[1]: 278ac6b30 ("m68k: fix alignment in NPTL code")

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
[Julien:
 - rename patch to 0002
 - add "Upstream:" tag in patch to fix check-package error
 - add "Signed-off-by:" in patch
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 53eae986a5c15afd0ade74875ce96a1b70e7c53b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-m68k-fix-alignment-in-NPTL-code.patch     | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/package/uclibc/0002-m68k-fix-alignment-in-NPTL-code.patch b/package/uclibc/0002-m68k-fix-alignment-in-NPTL-code.patch
new file mode 100644
index 0000000000..fbd9934376
--- /dev/null
+++ b/package/uclibc/0002-m68k-fix-alignment-in-NPTL-code.patch
@@ -0,0 +1,92 @@
+From 278ac6b3098315cddec8f71f27bd8de22e53ca6c Mon Sep 17 00:00:00 2001
+From: Thorsten Glaser <tg@debian.org>
+Date: Wed, 12 Mar 2025 22:11:51 +0100
+Subject: [PATCH] m68k: fix alignment in NPTL code
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/278ac6b3098315cddec8f71f27bd8de22e53ca6c
+Signed-off-by: Thorsten Glaser <tg@debian.org>
+Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
+---
+ .../unix/sysv/linux/m68k/bits/pthreadtypes.h   | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/m68k/bits/pthreadtypes.h b/libpthread/nptl/sysdeps/unix/sysv/linux/m68k/bits/pthreadtypes.h
+index 2a90a0b90..d2f22caee 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/m68k/bits/pthreadtypes.h
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/m68k/bits/pthreadtypes.h
+@@ -39,7 +39,7 @@ typedef unsigned long int pthread_t;
+ typedef union
+ {
+   char __size[__SIZEOF_PTHREAD_ATTR_T];
+-  long int __align;
++  long int __align __attribute__((__aligned__(4)));
+ } pthread_attr_t;
+ 
+ 
+@@ -69,13 +69,13 @@ typedef union
+     };
+   } __data;
+   char __size[__SIZEOF_PTHREAD_MUTEX_T];
+-  long int __align;
++  long int __align __attribute__((__aligned__(4)));
+ } pthread_mutex_t;
+ 
+ typedef union
+ {
+   char __size[__SIZEOF_PTHREAD_MUTEXATTR_T];
+-  long int __align;
++  long int __align __attribute__((__aligned__(4)));
+ } pthread_mutexattr_t;
+ 
+ 
+@@ -95,13 +95,13 @@ typedef union
+     unsigned int __broadcast_seq;
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+-  __extension__ long long int __align;
++  __extension__ long long int __align __attribute__((__aligned__(8)));
+ } pthread_cond_t;
+ 
+ typedef union
+ {
+   char __size[__SIZEOF_PTHREAD_CONDATTR_T];
+-  long int __align;
++  long int __align __attribute__((__aligned__(4)));
+ } pthread_condattr_t;
+ 
+ 
+@@ -144,13 +144,13 @@ typedef union
+     int __writer;
+   } __data;
+   char __size[__SIZEOF_PTHREAD_RWLOCK_T];
+-  long int __align;
++  long int __align __attribute__((__aligned__(4)));
+ } pthread_rwlock_t;
+ 
+ typedef union
+ {
+   char __size[__SIZEOF_PTHREAD_RWLOCKATTR_T];
+-  long int __align;
++  long int __align __attribute__((__aligned__(4)));
+ } pthread_rwlockattr_t;
+ #endif
+ 
+@@ -165,13 +165,13 @@ typedef volatile int pthread_spinlock_t;
+ typedef union
+ {
+   char __size[__SIZEOF_PTHREAD_BARRIER_T];
+-  long int __align;
++  long int __align __attribute__((__aligned__(4)));
+ } pthread_barrier_t;
+ 
+ typedef union
+ {
+   char __size[__SIZEOF_PTHREAD_BARRIERATTR_T];
+-  int __align;
++  int __align __attribute__((__aligned__(4)));
+ } pthread_barrierattr_t;
+ #endif
+ 
+-- 
+2.39.5
+

--===============5375192224965163173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5375192224965163173==--
