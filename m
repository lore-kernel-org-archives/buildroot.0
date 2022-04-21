Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30583C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C633B832DB;
	Thu, 21 Apr 2022 21:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKfztrlufCow; Thu, 21 Apr 2022 21:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2A8C83033;
	Thu, 21 Apr 2022 21:02:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EB941BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B0A841153
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jm_ziYrSh7OG for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96A9841149
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6B10C840FF; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:32:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cd09d9d3763f977b086f15642471c135a76d717
X-Git-Newrev: ce6374f8cd8b99ff4dab680406420d0b23fe63b1
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.6B10C840FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glorytun: fix aarch64 build with
 uclibc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce6374f8cd8b99ff4dab680406420d0b23fe63b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following aarch64 build failure with uclibc:

mud/aegis256/aegis256.c:51:10: fatal error: sys/auxv.h: No such file or directory
   51 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/4e1bbd72b9b7e0f9963f6693c3d7bc9a1d24fab4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Add-support-for-Apple-silicon.patch       | 51 ++++++++++++++++++++++
 ...-aegis256.c-fix-aarch64-build-with-uclibc.patch | 43 ++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/package/glorytun/0001-Add-support-for-Apple-silicon.patch b/package/glorytun/0001-Add-support-for-Apple-silicon.patch
new file mode 100644
index 0000000000..6d4b8273f3
--- /dev/null
+++ b/package/glorytun/0001-Add-support-for-Apple-silicon.patch
@@ -0,0 +1,51 @@
+From 577ae0352d191fa604f861ea2f0847e7c5eda617 Mon Sep 17 00:00:00 2001
+From: Frank Denis <github@pureftpd.org>
+Date: Wed, 1 Jul 2020 22:51:43 +0200
+Subject: [PATCH] Add support for Apple silicon
+
+[Retrieved from:
+https://github.com/angt/aegis256/commit/577ae0352d191fa604f861ea2f0847e7c5eda617]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ aegis256.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/mud/aegis256/aegis256.c b/mud/aegis256/aegis256.c
+index 9a580bf..75a772c 100644
+--- a/mud/aegis256/aegis256.c
++++ b/mud/aegis256/aegis256.c
+@@ -36,7 +36,7 @@ typedef __m128i       x128;
+ #define store128(X,Y) _mm_storeu_si128((x128 *)(X), (Y))
+ #define set2x64(X,Y)  _mm_set_epi64x((long long)(X), (long long)(Y))
+ 
+-#elif defined(__linux__) && (defined(__ARM_NEON_FP) || defined(__aarch64__))
++#elif (defined(__APPLE__) || defined(__linux__)) && (defined(__ARM_NEON_FP) || defined(__aarch64__))
+ 
+ #ifdef __clang__
+ #pragma clang attribute push (__attribute__((target("crypto"))),apply_to=function)
+@@ -48,7 +48,9 @@ typedef __m128i       x128;
+ #endif
+ 
+ #ifdef __ARM_FEATURE_CRYPTO
++#ifdef __linux__
+ #include <sys/auxv.h>
++#endif
+ #include <arm_neon.h>
+ 
+ typedef uint8x16_t    x128;
+@@ -62,11 +64,15 @@ typedef uint8x16_t    x128;
+ int
+ aegis256_is_available(void)
+ {
++#ifdef __linux__
+     return (getauxval(AT_HWCAP) & HWCAP_AES)
+ #ifdef HWCAP2_AES
+         || (getauxval(AT_HWCAP2) & HWCAP2_AES)
+ #endif
+         ;
++#else // __APPLE__
++    return 1;
++#endif
+ }
+ 
+ #endif // __ARM_FEATURE_CRYPTO
diff --git a/package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch b/package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch
new file mode 100644
index 0000000000..37ae8a3301
--- /dev/null
+++ b/package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch
@@ -0,0 +1,43 @@
+From eb22e270a962d4a2da1972304fd8b1216211c9d1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 16 Apr 2022 23:32:55 +0200
+Subject: [PATCH] aegis256.c: fix aarch64 build with uclibc
+
+Fix the following aarch64 build failure with uclibc:
+
+mud/aegis256/aegis256.c:51:10: fatal error: sys/auxv.h: No such file or directory
+   51 | #include <sys/auxv.h>
+      |          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4e1bbd72b9b7e0f9963f6693c3d7bc9a1d24fab4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/angt/aegis256/commit/eb22e270a962d4a2da1972304fd8b1216211c9d1]
+---
+ aegis256.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mud/aegis256/aegis256.c b/mud/aegis256/aegis256.c
+index 75a772c..4e73fab 100644
+--- a/mud/aegis256/aegis256.c
++++ b/mud/aegis256/aegis256.c
+@@ -48,7 +48,7 @@ typedef __m128i       x128;
+ #endif
+ 
+ #ifdef __ARM_FEATURE_CRYPTO
+-#ifdef __linux__
++#if defined(__linux__) && __has_include("sys/auxv.h")
+ #include <sys/auxv.h>
+ #endif
+ #include <arm_neon.h>
+@@ -64,7 +64,7 @@ typedef uint8x16_t    x128;
+ int
+ aegis256_is_available(void)
+ {
+-#ifdef __linux__
++#if defined(__linux__) && __has_include("sys/auxv.h")
+     return (getauxval(AT_HWCAP) & HWCAP_AES)
+ #ifdef HWCAP2_AES
+         || (getauxval(AT_HWCAP2) & HWCAP2_AES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
