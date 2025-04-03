Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB1AC3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 19:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C8F41717;
	Thu,  3 Apr 2025 19:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgvoYU-p3Piv; Thu,  3 Apr 2025 19:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 598A74119B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 598A74119B;
	Thu,  3 Apr 2025 19:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BCB2F117
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE79E410E1
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osg7J0gQM1xY for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 19:40:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8727D4119B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8727D4119B
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8727D4119B
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:40:24 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id ED41F20193;
 Thu,  3 Apr 2025 14:40:22 -0500 (CDT)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Thu,  3 Apr 2025 14:40:21 -0500
Message-Id: <20250403194021.823332-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1743709223; bh=cxBuLff1+J7O5itQ8d/7SIkGQ/1o8AEMdpWQ2ijIh/g=;
 h=From:To:Cc:Subject:Date:From;
 b=bRMOJBiZYbpbzNHzXaALygqvDgdgx2F3Iuk2sdmSdLavXfqkqrw9T8ryOw5LW7kEy
 HrvTgn/efBZ0H8GYaH+DxpCRGuplAF4FsTsFwGG9hQDNyMziXcJQb4Fxzbqhd0Ejeq
 TvbEiDz9j1Enljh0F7HBTs9+WPEOueO+csfrM6OU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=mail header.b=bRMOJBiZ
Subject: [Buildroot] [PATCH] package/python3: backport upstream fix for
 mimalloc on armeb
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python3 uses mimalloc by default, however, mimalloc did not compile for
big-endian ARM and generated the wrong instructions for ARMv7+ targets.

These issues have been fixed upstream in both mimalloc and CPython.

Fixes: https://autobuild.buildroot.org/results/26b752738022e8b46e810a08e28d687120e5c4e3/

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 ...ix-mi_atomic_yield-in-mimalloc-on-32.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/python3/0011-3.13-gh-131675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch

diff --git a/package/python3/0011-3.13-gh-131675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch b/package/python3/0011-3.13-gh-131675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch
new file mode 100644
index 0000000000..b4ecde94ee
--- /dev/null
+++ b/package/python3/0011-3.13-gh-131675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch
@@ -0,0 +1,80 @@
+From a9aae012b4ee83f1aba7c122943c63b69c5b9f97 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 31 Mar 2025 20:58:29 +0200
+Subject: [PATCH] [3.13] gh-131675: Fix `mi_atomic_yield` in mimalloc on 32-bit
+ ARM (gh-131784) (gh-131954)
+
+Use the standard `__ARM_ARCH` macro, which is supported by GCC and Clang.
+
+The branching logic for of `__ARMEL__` has been removed so if the target
+architecture supports v7+ instructions, a yield is emitted, otherwise a nop
+is emitted. This covers both big and little endian scenarios.
+(cherry picked from commit 03f6c8e239723637811fd8d278661f5292351197)
+
+Upstream: https://github.com/python/cpython/pull/131954
+
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+Co-authored-by: Vincent Fazio <vfazio@gmail.com>
+Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
+---
+ Include/internal/mimalloc/mimalloc/atomic.h     | 17 ++++++++++-------
+ ...25-03-27-01-21-50.gh-issue-131675.l2zfOO.rst |  1 +
+ 2 files changed, 11 insertions(+), 7 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst
+
+diff --git a/Include/internal/mimalloc/mimalloc/atomic.h b/Include/internal/mimalloc/mimalloc/atomic.h
+index 1093c540864..a46a7676ad2 100644
+--- a/Include/internal/mimalloc/mimalloc/atomic.h
++++ b/Include/internal/mimalloc/mimalloc/atomic.h
+@@ -338,8 +338,9 @@ static inline void mi_atomic_yield(void) {
+   _mm_pause();
+ }
+ #elif (defined(__GNUC__) || defined(__clang__)) && \
+-      (defined(__x86_64__) || defined(__i386__) || defined(__arm__) || defined(__armel__) || defined(__ARMEL__) || \
+-       defined(__aarch64__) || defined(__powerpc__) || defined(__ppc__) || defined(__PPC__)) || defined(__POWERPC__)
++      (defined(__x86_64__) || defined(__i386__) || \
++       defined(__aarch64__) || defined(__arm__) || \
++       defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) || defined(__POWERPC__))
+ #if defined(__x86_64__) || defined(__i386__)
+ static inline void mi_atomic_yield(void) {
+   __asm__ volatile ("pause" ::: "memory");
+@@ -348,10 +349,16 @@ static inline void mi_atomic_yield(void) {
+ static inline void mi_atomic_yield(void) {
+   __asm__ volatile("wfe");
+ }
+-#elif (defined(__arm__) && __ARM_ARCH__ >= 7)
++#elif defined(__arm__)
++#if __ARM_ARCH >= 7
+ static inline void mi_atomic_yield(void) {
+   __asm__ volatile("yield" ::: "memory");
+ }
++#else
++static inline void mi_atomic_yield(void) {
++  __asm__ volatile ("nop" ::: "memory");
++}
++#endif
+ #elif defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) || defined(__POWERPC__)
+ #ifdef __APPLE__
+ static inline void mi_atomic_yield(void) {
+@@ -362,10 +369,6 @@ static inline void mi_atomic_yield(void) {
+   __asm__ __volatile__ ("or 27,27,27" ::: "memory");
+ }
+ #endif
+-#elif defined(__armel__) || defined(__ARMEL__)
+-static inline void mi_atomic_yield(void) {
+-  __asm__ volatile ("nop" ::: "memory");
+-}
+ #endif
+ #elif defined(__sun)
+ // Fallback for other archs
+diff --git a/Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst b/Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst
+new file mode 100644
+index 00000000000..be870a81df1
+--- /dev/null
++++ b/Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst
+@@ -0,0 +1 @@
++Fix mimalloc library builds for 32-bit ARM targets.
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
