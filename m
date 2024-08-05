Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CE5C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 07:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7500380D8F;
	Mon,  5 Aug 2024 07:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uul-mQFP1M9; Mon,  5 Aug 2024 07:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19BD280F39
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19BD280F39;
	Mon,  5 Aug 2024 07:13:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7834E1BF333
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72AFE606F2
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otyqFxboDa-y for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 07:12:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41F70606D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41F70606D6
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 07:12:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37AAB83FD2; Mon,  5 Aug 2024 07:12:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Aug 2024 09:12:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0e4448e7c38d604152b6e727dcd6fb6d23c286f
X-Git-Newrev: 327312359a742f40d35c241958602b2026f0a1ba
X-Patchwork-Hint: ignore
Message-Id: <20240805071259.37AAB83FD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: fix missing m_tim issue
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
Content-Type: multipart/mixed; boundary="===============6689926242516146192=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6689926242516146192==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=327312359a742f40d35c241958602b2026f0a1ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch from upstream to fix missing m_tim issue.

Fixes:
 - http://autobuild.buildroot.org/results/f07d6d6ae2331f9972974093c0503b9d3c6b914a/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch | 205 +++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch b/package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
new file mode 100644
index 0000000000..73100c2c1b
--- /dev/null
+++ b/package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
@@ -0,0 +1,205 @@
+From d0c8c185b439187b12644457bb2aa0326f25aaf7 Mon Sep 17 00:00:00 2001
+From: J.Neuschäfer?= <j.neuschaefer@gmx.net>
+Date: Sat, 27 Jul 2024 18:47:09 +0200
+Subject: [PATCH] bits/stat.h: Declare st_mtim if defined(__USE_XOPEN2K8),
+ everywhere
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+While building software that sets _POSIX_C_SOURCE=200809L and uses
+stat.st_mtim for ARM, it was noticed that st_mtim was not defined.
+
+This seems to be because common/bits/stat.h was picked up, which does
+not take __USE_XOPEN2K8 as a reason to enable st_mtim and related
+fields. This appears to be an oversight, and porting the check from
+common-generic/bits/stat.h to other architectures does indeed fix the
+build issue.
+
+This patch is based on commit 50bd6d06e ("Fix memory corruption due to
+struct stat field").
+
+Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=d0c8c185b439187b12644457bb2aa0326f25aaf7
+---
+ libc/sysdeps/linux/alpha/bits/stat.h   | 2 +-
+ libc/sysdeps/linux/common/bits/stat.h  | 4 ++--
+ libc/sysdeps/linux/frv/bits/stat.h     | 4 ++--
+ libc/sysdeps/linux/ia64/bits/stat.h    | 4 ++--
+ libc/sysdeps/linux/m68k/bits/stat.h    | 4 ++--
+ libc/sysdeps/linux/mips/bits/stat.h    | 4 ++--
+ libc/sysdeps/linux/nds32/bits/stat.h   | 4 ++--
+ libc/sysdeps/linux/powerpc/bits/stat.h | 4 ++--
+ 8 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/libc/sysdeps/linux/alpha/bits/stat.h b/libc/sysdeps/linux/alpha/bits/stat.h
+index 88bc6617d..f2dca250d 100644
+--- a/libc/sysdeps/linux/alpha/bits/stat.h
++++ b/libc/sysdeps/linux/alpha/bits/stat.h
+@@ -40,7 +40,7 @@
+ 
+    Use neat tidy anonymous unions and structures when possible.  */
+ 
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+ # if __GNUC_PREREQ(3,3)
+ #  define __ST_TIME(X)				\
+ 	__extension__ union {			\
+diff --git a/libc/sysdeps/linux/common/bits/stat.h b/libc/sysdeps/linux/common/bits/stat.h
+index 07c09f50a..fc76cc3e7 100644
+--- a/libc/sysdeps/linux/common/bits/stat.h
++++ b/libc/sysdeps/linux/common/bits/stat.h
+@@ -61,7 +61,7 @@ struct stat
+ #else
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -107,7 +107,7 @@ struct stat64
+     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
+ 
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/frv/bits/stat.h b/libc/sysdeps/linux/frv/bits/stat.h
+index 381d207f2..18321c080 100644
+--- a/libc/sysdeps/linux/frv/bits/stat.h
++++ b/libc/sysdeps/linux/frv/bits/stat.h
+@@ -70,7 +70,7 @@ struct stat
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+ 
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -117,7 +117,7 @@ struct stat64
+     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
+ 
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/ia64/bits/stat.h b/libc/sysdeps/linux/ia64/bits/stat.h
+index 6723166e7..2b70b8cf8 100644
+--- a/libc/sysdeps/linux/ia64/bits/stat.h
++++ b/libc/sysdeps/linux/ia64/bits/stat.h
+@@ -38,7 +38,7 @@ struct stat
+     int pad0;
+     __dev_t st_rdev;		/* Device number, if device.  */
+     __off_t st_size;		/* Size of file, in bytes.  */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -77,7 +77,7 @@ struct stat64
+     int pad0;
+     __dev_t st_rdev;		/* Device number, if device.  */
+     __off_t st_size;		/* Size of file, in bytes.  */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/m68k/bits/stat.h b/libc/sysdeps/linux/m68k/bits/stat.h
+index 7b9c3d144..70da1b384 100644
+--- a/libc/sysdeps/linux/m68k/bits/stat.h
++++ b/libc/sysdeps/linux/m68k/bits/stat.h
+@@ -60,7 +60,7 @@ struct stat
+ #else
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -106,7 +106,7 @@ struct stat64
+     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
+ 
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/mips/bits/stat.h b/libc/sysdeps/linux/mips/bits/stat.h
+index 539fa33d2..bad2a0244 100644
+--- a/libc/sysdeps/linux/mips/bits/stat.h
++++ b/libc/sysdeps/linux/mips/bits/stat.h
+@@ -60,7 +60,7 @@ struct stat
+     long int st_pad2[2];
+     __off64_t st_size;		/* Size of file, in bytes.  */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -103,7 +103,7 @@ struct stat {
+     unsigned int st_rdev;	/* Device number, if device.  */
+     int st_pad2[3];
+     __off_t st_size;		/* Size of file, in bytes.  */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/nds32/bits/stat.h b/libc/sysdeps/linux/nds32/bits/stat.h
+index c4e09e0f2..5272751f4 100644
+--- a/libc/sysdeps/linux/nds32/bits/stat.h
++++ b/libc/sysdeps/linux/nds32/bits/stat.h
+@@ -64,7 +64,7 @@ struct stat
+ #else
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -110,7 +110,7 @@ struct stat64
+     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
+ 
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/powerpc/bits/stat.h b/libc/sysdeps/linux/powerpc/bits/stat.h
+index 7494586b5..ce2ebf896 100644
+--- a/libc/sysdeps/linux/powerpc/bits/stat.h
++++ b/libc/sysdeps/linux/powerpc/bits/stat.h
+@@ -59,7 +59,7 @@ struct stat
+ # else
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ # endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -99,7 +99,7 @@ struct stat64
+     __off64_t st_size;			/* Size of file, in bytes.  */
+     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+-- 
+2.30.2
+

--===============6689926242516146192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6689926242516146192==--
