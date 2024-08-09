Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5C6C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 07:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F976412D0;
	Fri,  9 Aug 2024 07:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DptUiVdzfTGb; Fri,  9 Aug 2024 07:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD3B440B93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD3B440B93;
	Fri,  9 Aug 2024 07:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B44511BF2F4
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 07:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0E6D80BAA
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 07:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDCRRVJVM2hE for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 07:24:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBBD580BA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBBD580BA7
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBBD580BA7
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 07:24:44 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EF988353542A; Fri,  9 Aug 2024 09:24:41 +0200 (CEST)
Date: Fri, 9 Aug 2024 09:24:41 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrXEOV0qrdgmNtc5@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723188282; bh=CfndBDWrcgr617AAwj5jf9OJ+/zwTy5N6swHIW4UVxg=;
 h=Date:From:To:Cc:Subject:From;
 b=GCEEbf6l7pzoCSnx9jaIjsSxeAfiemeB7rD/JkxlXmuJHJU17okldf15MOB9Dd+4C
 QLhjsndClYqkjPdvqrVBRYawTZFa3SjHWBMD7sNO4qwUNDLJ9CMtHkcMV5uX8fd5Ta
 A7XopActXwy3BiVTftWgd1BbrVi9l1YCq1Hk3YuF/U4eyFt9Yg9Dp1kRqZ+E6pyB9R
 fOKQ0y/+HAAtZ9bFZPe6vIEosG9vM9YzHbf8CJcjHDEqYBGuV5+SCHxdpNlbh53Hw1
 hol5DZxSbUbfZRDdlQV1eaodSAc4flAGG6+IKoGQrePxYl28TtoM8N8AvhOUYd72Tx
 LS09WAPO0PvHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=GCEEbf6l
Subject: [Buildroot] [PATCH] package/uclibc: fix st_mtim issue
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
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The first patch to fix this issue was incomplete.
Add a patch to also fix all other architectures.

Fixes:
 - http://autobuild.buildroot.net/results/f3b/f3b3942b6b645d9523ab08d179a3f8aca7d6641c

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...are-st_mtim-if-defined-__USE_XOPEN2K.patch | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 package/uclibc/0004-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch

diff --git a/package/uclibc/0004-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch b/package/uclibc/0004-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
new file mode 100644
index 0000000000..6340abe09b
--- /dev/null
+++ b/package/uclibc/0004-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
@@ -0,0 +1,132 @@
+From 354129807db12c792696b74d0cd38f2c5d2fd704 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 9 Aug 2024 06:16:02 +0200
+Subject: [PATCH] bits/stat.h: Declare st_mtim if defined(__USE_XOPEN2K8),
+ add missing
+
+d0c8c185b439187b12644457bb2aa0326f25aaf7 was not complete, add
+missing architectures.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=354129807db12c792696b74d0cd38f2c5d2fd704
+---
+ libc/sysdeps/linux/mips/bits/stat.h    | 4 ++--
+ libc/sysdeps/linux/sparc/bits/stat.h   | 4 ++--
+ libc/sysdeps/linux/sparc64/bits/stat.h | 4 ++--
+ libc/sysdeps/linux/x86_64/bits/stat.h  | 4 ++--
+ libc/sysdeps/linux/xtensa/bits/stat.h  | 4 ++--
+ 5 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/libc/sysdeps/linux/mips/bits/stat.h b/libc/sysdeps/linux/mips/bits/stat.h
+index bad2a0244..81d2e4687 100644
+--- a/libc/sysdeps/linux/mips/bits/stat.h
++++ b/libc/sysdeps/linux/mips/bits/stat.h
+@@ -145,7 +145,7 @@ struct stat64
+     __dev_t st_rdev;	/* Device number, if device.  */
+     long int st_pad2[2];
+     __off64_t st_size;		/* Size of file, in bytes.  */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -184,7 +184,7 @@ struct stat64 {
+     unsigned int st_rdev;	/* Device number, if device.  */
+     int st_pad2[3];
+     __off_t st_size;		/* Size of file, in bytes.  */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/sparc/bits/stat.h b/libc/sysdeps/linux/sparc/bits/stat.h
+index b88885fe2..0fbef8b3f 100644
+--- a/libc/sysdeps/linux/sparc/bits/stat.h
++++ b/libc/sysdeps/linux/sparc/bits/stat.h
+@@ -53,7 +53,7 @@ struct stat
+ #else
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -93,7 +93,7 @@ struct stat64
+     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
+ 
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/sparc64/bits/stat.h b/libc/sysdeps/linux/sparc64/bits/stat.h
+index 8516b159c..62b48b745 100644
+--- a/libc/sysdeps/linux/sparc64/bits/stat.h
++++ b/libc/sysdeps/linux/sparc64/bits/stat.h
+@@ -58,7 +58,7 @@ struct stat
+ #else
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -101,7 +101,7 @@ struct stat64
+     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
+ 
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/x86_64/bits/stat.h b/libc/sysdeps/linux/x86_64/bits/stat.h
+index a7412c8f9..a8c75feaa 100644
+--- a/libc/sysdeps/linux/x86_64/bits/stat.h
++++ b/libc/sysdeps/linux/x86_64/bits/stat.h
+@@ -77,7 +77,7 @@ struct stat
+ #else
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -138,7 +138,7 @@ struct stat64
+ #endif
+     __blksize_t st_blksize;	/* Optimal block size for I/O.  */
+     __blkcnt64_t st_blocks;	/* Nr. 512-byte blocks allocated.  */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/xtensa/bits/stat.h b/libc/sysdeps/linux/xtensa/bits/stat.h
+index 045a017fd..43af825ec 100644
+--- a/libc/sysdeps/linux/xtensa/bits/stat.h
++++ b/libc/sysdeps/linux/xtensa/bits/stat.h
+@@ -54,7 +54,7 @@ struct stat
+     unsigned long __pad2;
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -94,7 +94,7 @@ struct stat64
+ 
+     unsigned long __pad2;
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
