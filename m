Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511DDC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03DA640982;
	Mon, 22 Jul 2024 12:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DF2aAfQzMaFx; Mon, 22 Jul 2024 12:10:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB1FD4096B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB1FD4096B;
	Mon, 22 Jul 2024 12:10:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61B351BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BD504025F
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DU0DGGhY6p10 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A438401D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A438401D1
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 075EA86F74; Mon, 22 Jul 2024 12:10:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:09:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4521734348dd075fe7e1224ce4688c4fc683536a
X-Git-Newrev: f463a4953534df13397ce113bfbbc03d4b8e4df7
X-Patchwork-Hint: ignore
Message-Id: <20240722121030.075EA86F74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: fix compile error
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

commit: https://git.buildroot.net/buildroot/commit/?id=f463a4953534df13397ce113bfbbc03d4b8e4df7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix compile error with older Linux kernel headers.

Fixes:
 http://autobuild.buildroot.net/results/dfa46b243aa6e289333cbd98e3162d62ee6fa865

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...2-Fix-compilation-with-4.x-kernel-headers.patch | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/uclibc/0002-Fix-compilation-with-4.x-kernel-headers.patch b/package/uclibc/0002-Fix-compilation-with-4.x-kernel-headers.patch
new file mode 100644
index 0000000000..ad3efa9638
--- /dev/null
+++ b/package/uclibc/0002-Fix-compilation-with-4.x-kernel-headers.patch
@@ -0,0 +1,80 @@
+From 839bae66a376631ee7d5b1f5b2f5b4094c519ea8 Mon Sep 17 00:00:00 2001
+From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Date: Sat, 20 Jul 2024 17:23:45 +0300
+Subject: [PATCH] Fix compilation with 4.x kernel headers
+
+- Fallback to __NR_stat syscall in ld.so if we use 4.x kernel headers.
+4.x kernel doesn't support 64-bit time so we can use old syscall
+- Add preprocessor conditions to have fstat64 and fstatat64 in libc
+with old kernel headers
+
+Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=839bae66a376631ee7d5b1f5b2f5b4094c519ea8
+---
+ ldso/include/dl-syscall.h             | 4 +++-
+ libc/sysdeps/linux/common/fstat64.c   | 3 ++-
+ libc/sysdeps/linux/common/fstatat64.c | 3 ++-
+ 3 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
+index 4f41034ad..9ec0eac60 100644
+--- a/ldso/include/dl-syscall.h
++++ b/ldso/include/dl-syscall.h
+@@ -17,6 +17,8 @@ extern int _dl_errno;
+ #define __set_errno(X) {(_dl_errno) = (X);}
+ #endif
+ 
++#include <linux/version.h>
++
+ /* Pull in the arch specific syscall implementation */
+ #include <dl-syscalls.h>
+ /*  For MAP_ANONYMOUS -- differs between platforms */
+@@ -139,7 +141,7 @@ static __always_inline int _dl_stat(const char *file_name,
+ {
+ 	return _dl_newfstatat(AT_FDCWD, file_name, buf, 0);
+ }
+-#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__))
++#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__)) || (LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))
+ # define __NR__dl_stat __NR_stat
+ static __always_inline _syscall2(int, _dl_stat, const char *, file_name,
+                         struct stat *, buf)
+diff --git a/libc/sysdeps/linux/common/fstat64.c b/libc/sysdeps/linux/common/fstat64.c
+index 359c22af6..121b21fc8 100644
+--- a/libc/sysdeps/linux/common/fstat64.c
++++ b/libc/sysdeps/linux/common/fstat64.c
+@@ -8,8 +8,9 @@
+ 
+ #include <_lfs_64.h>
+ #include <sys/syscall.h>
++#include <linux/version.h>
+ 
+-#if defined(__NR_fstat64) && !defined(__UCLIBC_USE_TIME64__)
++#if defined(__NR_fstat64) && (!defined(__UCLIBC_USE_TIME64__) || LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))
+ # include <unistd.h>
+ # include <sys/stat.h>
+ # include "xstatconv.h"
+diff --git a/libc/sysdeps/linux/common/fstatat64.c b/libc/sysdeps/linux/common/fstatat64.c
+index 16dbf9215..739e84081 100644
+--- a/libc/sysdeps/linux/common/fstatat64.c
++++ b/libc/sysdeps/linux/common/fstatat64.c
+@@ -9,6 +9,7 @@
+ #include <_lfs_64.h>
+ #include <bits/wordsize.h>
+ #include <sys/syscall.h>
++#include <linux/version.h>
+ 
+ #if defined __mips__
+ # include <sgidefs.h>
+@@ -23,7 +24,7 @@
+ # define __NR_fstatat64 __NR_newfstatat
+ #endif
+ 
+-#if defined(__NR_fstatat64) && !defined(__UCLIBC_USE_TIME64__)
++#if defined(__NR_fstatat64) && (!defined(__UCLIBC_USE_TIME64__)  || LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))
+ # include <sys/stat.h>
+ # include "xstatconv.h"
+ int fstatat64(int fd, const char *file, struct stat64 *buf, int flag)
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
