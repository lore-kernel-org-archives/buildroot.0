Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9003C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48B51402F4;
	Mon, 22 Jul 2024 08:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpROx_IWlkpi; Mon, 22 Jul 2024 08:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B00FB40256
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B00FB40256;
	Mon, 22 Jul 2024 08:24:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D73C1BF291
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 498C440256
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LzJXtiNl10dv for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:24:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5440D40241
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5440D40241
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5440D40241
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:24:13 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B056C3521143; Mon, 22 Jul 2024 10:24:11 +0200 (CEST)
Date: Mon, 22 Jul 2024 10:24:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zp4XKwrMN9+YZC/B@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1721636651; bh=ZvNqScOTH8YWL42zPQXfLt9nZLLCrqYmNYEDy1BF/Ok=;
 h=Date:From:To:Subject:From;
 b=oj18DNlGMx4pZlzJYu5leKZQCT81ra3JbXjrdsECgk1FgQen7mN6g6WnWamz/qpSm
 WEr3wgkEqQ1FvfPj1A1T+jKh94ZVVCQ5fqrj4u8kXQ6PMQzP7QQ4/Dz4jQy0JpxrXC
 7PBRrneABzFZYwKy1npy0DqqrYrAdQqTLSwrgjl2l9gCrOze9iHW+fFkVeubyPtgL6
 RlMDAjQtxWCO5+oDEDAlpUu7aoU241yypbWzeviBgZFMQ72q+nbym883CPsB6Jb+Pt
 lMsBLSFq+EMoyohCw+6AoB/lg+PTFXNpy2/iiFt9VimwLxa2DKvDtyzJRtETntqP3E
 2bKa+bSokz/gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=oj18DNlG
Subject: [Buildroot] [PATCH] package/uclibc: fix compile error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix compile error with older Linux kernel headers.

Fixes:
 http://autobuild.buildroot.net/results/dfa46b243aa6e289333cbd98e3162d62ee6fa865

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...-compilation-with-4.x-kernel-headers.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/uclibc/0002-Fix-compilation-with-4.x-kernel-headers.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
