Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04A5D277E7
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 13:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 576988302F;
	Sat, 10 Jan 2026 13:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDWRdU6BTSew; Sat, 10 Jan 2026 13:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B88483BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768052366;
	bh=pX8p+v8l8hR2KEwYvWrw2lgd8dhheg5go+Ckbvm/ggA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k9uH7+hu3F3MoXT4A4HCH3Gv9sCfo6CZY8vDrydq3c9tAvI6JTHBYSS8pmwgPiYNa
	 IoWmTCumf3vWdJMSrrEzWi6LeSVk2gVMPNxe0R3p6Kjoc6tGmd7kT+wShGu/dFFU1O
	 molTSG3UxyHbpMNZaIaaiu9JAQKrLvWEX0t7JhNz8fp03xYQy+ao9pUfg49GGwjKlo
	 1uiAOTeXFceUOlHN8pkuw3912vHGVJNDVqPn9vyBrVGM5SXJf6hjEh0NMm3VgLgR6A
	 sdYjAHmrl8s0yhezXLQwiTdMbxQHtg6eV3Z5g2f8rZzGnYouRY6EQz8xy84Q+Jb77q
	 hhxJUk4a+Eh1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B88483BC0;
	Sat, 10 Jan 2026 13:39:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 549BD18D
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B62F83BC0
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jW5I-GOwJfqK for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 13:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D516F8302F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D516F8302F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D516F8302F
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:39:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b915.dip0.t-ipconnect.de [84.161.185.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 391A3A4C3EC9;
 Sat, 10 Jan 2026 14:39:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53002)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1veZBJ-0000000070J-2MNS;
 Sat, 10 Jan 2026 13:39:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Jan 2026 14:39:05 +0100
Message-ID: <20260110133905.2518546-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260110133905.2518546-1-bernd@kuhls.net>
References: <20260110133905.2518546-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768052346;
 bh=Io1/kafAOipr4jzvt8S4LNTYCgJQB7Cs+99SmvIBheI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Q5aVwrLeN1suAi0Pc/l1Z0sqeyRwaZelNFgdtIhAswwX7Y7srj+3oF0lkRMP2geMw
 n8JHtR2WtjIAggR0dc4T0KfQCRbh7aSeL3N4ew207Dvio2OzBuZ/2ntKcL91UiqxFG
 bQNpJeQ81SN0AHb/xlrv5poqHYLXEXxEgMBM5Aqq80M9UFc3GIPb0ZHAnJdph4Q1RR
 n1svCSBdeeFlC/5cQcRKqWsp7wNVVM0Fw9DhJWsYIe01qSECAKuNFelcUsLAmngg3W
 olAzX1xPKDibaficZZy7gK/md2GDHTZQIKrcV0f1WEIljFIlgZJsX8lS8TDnppgfER
 UXjBnokJ+fXFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Q5aVwrLe
Subject: [Buildroot] [PATCH 2/2] package/safeclib: bump version to 3.9.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/rurban/safeclib/blob/v3.9.1/ChangeLog

Removed backports from patches 0001 & 0002.

Removed patch 0003 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...snprintf_s-Increase-Buffer-Size-by-1.patch |   9 +-
 ...snprintf_s-Increase-Buffer-Size-by-1.patch |  15 +-
 ...03-fix-armv7-asm-inline-error-GH-115.patch | 156 ------------------
 package/safeclib/safeclib.hash                |   4 +-
 package/safeclib/safeclib.mk                  |   2 +-
 5 files changed, 14 insertions(+), 172 deletions(-)
 delete mode 100644 package/safeclib/0003-fix-armv7-asm-inline-error-GH-115.patch

diff --git a/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
index eae11dcc0d..c744e043d9 100644
--- a/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
+++ b/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
@@ -27,20 +27,19 @@ cc1: all warnings being treated as errors
 
 Upstream: https://github.com/rurban/safeclib/pull/150
 
-[backported to version 3.7.1]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/str/vsnprintf_s.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
-index 59dbda94..ca838df1 100644
+index 0b62c3cb..cf8e866e 100644
 --- a/src/str/vsnprintf_s.c
 +++ b/src/str/vsnprintf_s.c
-@@ -296,7 +296,7 @@ static size_t safec_ntoa_long(out_fct_type out,  const char *funcname,
+@@ -309,7 +309,7 @@ static size_t safec_ntoa_long(out_fct_type out, const char *funcname,
+                               unsigned long value, bool negative,
                                unsigned long base, unsigned int prec,
-                               unsigned int width, unsigned int flags)
- {
+                               unsigned int width, unsigned int flags) {
 -    char buf[PRINTF_NTOA_BUFFER_SIZE];
 +    char buf[PRINTF_NTOA_BUFFER_SIZE + 1];
      size_t len = 0U;
diff --git a/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
index 2dabebf3b2..13d0cc71f5 100644
--- a/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
+++ b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
@@ -25,23 +25,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream: https://github.com/rurban/safeclib/commit/f59a0c8c1b5cf19cd0ed7f9bfb3a1e85f54113d0
 
-[backported to version 3.7.1]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/str/vsnprintf_s.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
-index ca838df1..8ef6989a 100644
+index fa53ab42..0b62c3cb 100644
 --- a/src/str/vsnprintf_s.c
 +++ b/src/str/vsnprintf_s.c
-@@ -369,7 +369,7 @@ static size_t safec_ftoa(out_fct_type out,  const char *funcname,
-                          double value, unsigned int prec, unsigned int width,
-                          unsigned int flags)
- {
+@@ -391,7 +391,7 @@ static size_t safec_ftoa(out_fct_type out, const char *funcname, char *buffer,
+                          size_t idx, size_t maxlen, double value,
+                          unsigned int prec, unsigned int width,
+                          unsigned int flags) {
 -    char buf[PRINTF_FTOA_BUFFER_SIZE];
-+    char buf[PRINTF_FTOA_BUFFER_SIZE + 1];
-     size_t len = 0U;
++    char buf[PRINTF_FTOA_BUFFER_SIZE + 1]; // Add extra byte for safety
+     size_t len = 0U, off = 0U;
      double tmp;
      double diff = 0.0;
 -- 
diff --git a/package/safeclib/0003-fix-armv7-asm-inline-error-GH-115.patch b/package/safeclib/0003-fix-armv7-asm-inline-error-GH-115.patch
deleted file mode 100644
index bf14812318..0000000000
--- a/package/safeclib/0003-fix-armv7-asm-inline-error-GH-115.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From 9c739800a8915d5f2a73c840190920e95ffa1c5c Mon Sep 17 00:00:00 2001
-From: Reini Urban <rurban@cpan.org>
-Date: Fri, 18 Feb 2022 09:46:45 +0100
-Subject: [PATCH] fix armv7 asm inline error GH #115
-
-some armv7 buildroot variants fail on asm.
-we already probe for that, so use it.
-Fixes GH #115
-
-Upstream: https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tests/perf_private.h | 49 +++++++++++++++++++++++++-------------------
- 1 file changed, 28 insertions(+), 21 deletions(-)
-
-diff --git a/tests/perf_private.h b/tests/perf_private.h
-index 3296cb3d..843674d3 100644
---- a/tests/perf_private.h
-+++ b/tests/perf_private.h
-@@ -1,9 +1,9 @@
- /*------------------------------------------------------------------
-  * perf_private.h - Internal benchmarking tools
-  *
-- * 2020  Reini Urban
-+ * 2020,2022  Reini Urban
-  *
-- * Copyright (c) 2017, 2020 Reini Urban
-+ * Copyright (c) 2017, 2020, 2022 Reini Urban
-  * All rights reserved.
-  *
-  * Permission is hereby granted, free of charge, to any person
-@@ -55,13 +55,16 @@ static inline uint64_t timer_start();
- static inline uint64_t timer_end();
- 
- static inline clock_t rdtsc() {
--#ifdef __x86_64__
-+#ifndef ASM_INLINE
-+#define NO_CYCLE_COUNTER
-+    return clock();
-+#elif defined __x86_64__
-     uint64_t a, d;
--    __asm__ volatile("rdtsc" : "=a"(a), "=d"(d));
-+    ASM_INLINE volatile("rdtsc" : "=a"(a), "=d"(d));
-     return (clock_t)(a | (d << 32));
- #elif defined(__i386__)
-     clock_t x;
--    __asm__ volatile("rdtsc" : "=A"(x));
-+    ASM_INLINE volatile("rdtsc" : "=A"(x));
-     return x;
- #elif defined(__ARM_ARCH) && (__ARM_ARCH >= 7) && (SIZEOF_SIZE_T == 4)
-   // V7 is the earliest arch that has a standard cyclecount (some say 6)
-@@ -69,11 +72,11 @@ static inline clock_t rdtsc() {
-   uint32_t pmuseren;
-   uint32_t pmcntenset;
-   // Read the user mode perf monitor counter access permissions.
--  asm volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
-+  ASM_INLINE volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
-   if (pmuseren & 1) {  // Allows reading perfmon counters for user mode code.
--    asm volatile("mrc p15, 0, %0, c9, c12, 1" : "=r"(pmcntenset));
-+    ASM_INLINE volatile("mrc p15, 0, %0, c9, c12, 1" : "=r"(pmcntenset));
-     if (pmcntenset & 0x80000000ul) {  // Is it counting?
--      asm volatile("mrc p15, 0, %0, c9, c13, 0" : "=r"(pmccntr));
-+      ASM_INLINE volatile("mrc p15, 0, %0, c9, c13, 0" : "=r"(pmccntr));
-       // The counter is set up to count every 64th cycle
-       return (int64_t)(pmccntr) * 64;  // Should optimize to << 6
-     }
-@@ -83,22 +86,22 @@ static inline clock_t rdtsc() {
-   uint64_t pmccntr;
-   uint64_t pmuseren = 1UL;
-   // Read the user mode perf monitor counter access permissions.
--  //asm volatile("mrs cntv_ctl_el0,  %0" : "=r" (pmuseren));
-+  //ASM_INLINE volatile("mrs cntv_ctl_el0,  %0" : "=r" (pmuseren));
-   if (pmuseren & 1) {  // Allows reading perfmon counters for user mode code.
--    asm volatile("mrs %0, cntvct_el0" : "=r" (pmccntr));
-+    ASM_INLINE volatile("mrs %0, cntvct_el0" : "=r" (pmccntr));
-     return (uint64_t)(pmccntr) * 64;  // Should optimize to << 6
-   }
-   return (uint64_t)rdtsc();
- #elif defined(__powerpc64__) || defined(__ppc64__)
-     uint64_t tb;
--    __asm__ volatile (\
-+    ASM_INLINE volatile (\
-       "mfspr %0, 268"
-       : "=r" (tb));
-     return tb;
- #elif defined(__powerpc__) || defined(__ppc__)
-     // This returns a time-base, which is not always precisely a cycle-count.
-     uint32_t tbu, tbl, tmp;
--    __asm__ volatile (\
-+    ASM_INLINE volatile (\
-       "0:\n"
-       "mftbu %0\n"
-       "mftbl %1\n"
-@@ -109,12 +112,12 @@ static inline clock_t rdtsc() {
-     return (((uint64_t) tbu << 32) | tbl);
- #elif defined(__sparc__)
-     uint64_t tick;
--    asm(".byte 0x83, 0x41, 0x00, 0x00");
--    asm("mov   %%g1, %0" : "=r" (tick));
-+    ASM_INLINE(".byte 0x83, 0x41, 0x00, 0x00");
-+    ASM_INLINE("mov   %%g1, %0" : "=r" (tick));
-     return tick;
- #elif defined(__ia64__)
-     uint64_t itc;
--    asm("mov %0 = ar.itc" : "=r" (itc));
-+    ASM_INLINE("mov %0 = ar.itc" : "=r" (itc));
-     return itc;
- #else
- #define NO_CYCLE_COUNTER
-@@ -126,9 +129,11 @@ static inline clock_t rdtsc() {
- // 3.2.1 The Improved Benchmarking Method
- static inline uint64_t timer_start()
- {
--#if defined (__i386__) || (defined(__x86_64__) && SIZEOF_SIZE_T == 4)
-+#ifndef ASM_INLINE
-+    return (uint64_t)rdtsc();
-+#elif defined (__i386__) || (defined(__x86_64__) && SIZEOF_SIZE_T == 4)
-   uint32_t cycles_high, cycles_low;
--  __asm__ volatile
-+  ASM_INLINE volatile
-       ("cpuid\n\t"
-        "rdtsc\n\t"
-        "mov %%edx, %0\n\t"
-@@ -137,7 +142,7 @@ static inline uint64_t timer_start()
-     return ((uint64_t)cycles_high << 32) | cycles_low;
- #elif defined __x86_64__
-   uint32_t cycles_high, cycles_low;
--  __asm__ volatile
-+  ASM_INLINE volatile
-       ("cpuid\n\t"
-        "rdtsc\n\t"
-        "mov %%edx, %0\n\t"
-@@ -151,9 +156,11 @@ static inline uint64_t timer_start()
- 
- static inline uint64_t timer_end()
- {
--#if defined (__i386__) || (defined(__x86_64__) && defined (HAVE_BIT32))
-+#ifndef ASM_INLINE
-+    return (uint64_t)rdtsc();
-+#elif defined (__i386__) || (defined(__x86_64__) && defined (HAVE_BIT32))
-   uint32_t cycles_high, cycles_low;
--  __asm__ volatile
-+ ASM_INLINE volatile
-       ("rdtscp\n\t"
-        "mov %%edx, %0\n\t"
-        "mov %%eax, %1\n\t"
-@@ -162,7 +169,7 @@ static inline uint64_t timer_end()
-     return ((uint64_t)cycles_high << 32) | cycles_low;
- #elif defined __x86_64__
-   uint32_t cycles_high, cycles_low;
--  __asm__ volatile
-+  ASM_INLINE volatile
-       ("rdtscp\n\t"
-        "mov %%edx, %0\n\t"
-        "mov %%eax, %1\n\t"
diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
index bca5d86261..0227ff2837 100644
--- a/package/safeclib/safeclib.hash
+++ b/package/safeclib/safeclib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/rurban/safeclib/releases/tag/v3.7.1
-sha256  71d3ec970f930bd980f2a41127228eeedfc53749e4c6b203329adc4ff7df32a7  safeclib-3.7.1.tar.xz
+# From https://github.com/rurban/safeclib/releases/tag/v3.9.1
+sha256  771b8de483c4f48c90c12bc2c0326571d3d094440ca29008e4cf70562c631c67  safeclib-3.9.1.tar.xz
 
 # Hash for license file
 sha256  c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b  COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index bc58c1a38c..6478796a7e 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAFECLIB_VERSION = 3.7.1
+SAFECLIB_VERSION = 3.9.1
 SAFECLIB_SITE = \
 	https://github.com/rurban/safeclib/releases/download/v$(SAFECLIB_VERSION)
 SAFECLIB_SOURCE = safeclib-$(SAFECLIB_VERSION).tar.xz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
