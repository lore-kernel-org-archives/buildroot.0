Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDED9EDE9A0
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 04:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 636CC60908;
	Wed, 11 Sep 2024 04:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6c4liNJZOQn; Wed, 11 Sep 2024 04:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ABF66090B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ABF66090B;
	Wed, 11 Sep 2024 04:31:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8641A1BF339
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 04:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74B4E6090B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 04:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JGVID1AilgX for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 04:31:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BADE460908
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BADE460908
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BADE460908
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 04:31:35 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id AB8E63535C28; Wed, 11 Sep 2024 06:31:32 +0200 (CEST)
Date: Wed, 11 Sep 2024 06:31:32 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZuEdJENuvG2TQCFg@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726029092; bh=z15hgCfAoZ70xUrvr8Znz56rI+xgtyh4StVnembDlCE=;
 h=Date:From:To:Subject:From;
 b=lYoRhksUfdTDHvFnaK8vC3PQ0/D4zu3u0sBhAB1XRtlPC+5+T19PLOmOizmnIyT4v
 TUimi1PX3EEVe0GMRW6n4TDeD7sd4OMLkyPH+t/HSRNH+3LzFYdT1l+s/48iBa9ru0
 FkyD8mQEtEmY8kOdC85NCCJY9GlmccI/2kcU6mRkxwfUbS9MjLWdrtm7OcEORdzJtF
 Hd7f+mfLxOx30vjfG5dqyZQxg5gNeQIMNU0e1QK3dXfYhNw+ALbH3LG9vxI4B8zABi
 NpwiFJnd+7XJTWEDbsmDjrXdkl5F+f13PKzdp4I0djszOP1Eq0RmsrR1R8H4BAF4IG
 nvNDmALeU27eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=lYoRhksU
Subject: [Buildroot] [PATCH] package/uclibc: fix mips64 n32 big endian issue
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

Add a real fix for the time64 issue instead of disabling
time64 for mips64 n32 big endian.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...r-n32-ABI-breaks-a-lot-of-tests-disa.patch | 28 ---------------
 ...time64-Select-correct-_dl_fstat-impl.patch | 34 +++++++++++++++++++
 2 files changed, 34 insertions(+), 28 deletions(-)
 delete mode 100644 package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch
 create mode 100644 package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch

diff --git a/package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch b/package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch
deleted file mode 100644
index 5a12231b42..0000000000
--- a/package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From dd01754e21da71706af07f3e56eade66fc9164fb Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Fri, 16 Aug 2024 16:59:28 +0200
-Subject: [PATCH] mips64: time64 for n32 ABI breaks a lot of tests, disable it
- for now
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=dd01754e21da71706af07f3e56eade66fc9164fb
----
- extra/Configs/Config.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
-index 454b6ddb8..86bd20d76 100644
---- a/extra/Configs/Config.in
-+++ b/extra/Configs/Config.in
-@@ -1032,7 +1032,7 @@ config UCLIBC_USE_TIME64
- 		   TARGET_i386                           || \
- 		   TARGET_m68k                           || \
- 		   TARGET_microblaze                     || \
--		   (TARGET_mips && !CONFIG_MIPS_N64_ABI) || \
-+		   (TARGET_mips && !(CONFIG_MIPS_N64_ABI || CONFIG_MIPS_N32_ABI)) || \
- 		   TARGET_or1k                           || \
- 		   TARGET_powerpc                        || \
- 		   TARGET_riscv32                        || \
--- 
-2.30.2
-
diff --git a/package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch b/package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch
new file mode 100644
index 0000000000..c27e606b89
--- /dev/null
+++ b/package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch
@@ -0,0 +1,34 @@
+From 0dedba1051d781bfb3dd3b50101aa0e880cb6cde Mon Sep 17 00:00:00 2001
+From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Date: Sat, 7 Sep 2024 10:48:47 +0300
+Subject: [PATCH] mips64n32, time64: Select correct _dl_fstat impl
+
+With time64 enabled we have to use statx() instead of stat() or fstat()
+If the _dl_fstat implementation isn't selected correctly
+we can have multiple errors inside dynamic linker
+during startup of the system and of the almost every process
+Add sparc exclusion like in other places inside this header
+
+Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=0dedba1051d781bfb3dd3b50101aa0e880cb6cde
+---
+ ldso/include/dl-syscall.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
+index 180d03012..c143b8d45 100644
+--- a/ldso/include/dl-syscall.h
++++ b/ldso/include/dl-syscall.h
+@@ -168,7 +168,7 @@ static __always_inline int _dl_stat(const char *file_name,
+ #if defined __NR_fstat64 && !defined __NR_fstat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__))
+ # define __NR__dl_fstat __NR_fstat64
+ static __always_inline _syscall2(int, _dl_fstat, int, fd, struct stat *, buf)
+-#elif defined __NR_fstat
++#elif defined __NR_fstat && !defined __UCLIBC_USE_TIME64__ || defined(__sparc__)
+ # define __NR__dl_fstat __NR_fstat
+ static __always_inline _syscall2(int, _dl_fstat, int, fd, struct stat *, buf)
+ #elif defined __NR_statx && defined __UCLIBC_HAVE_STATX__
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
