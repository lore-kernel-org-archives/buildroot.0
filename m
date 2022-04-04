Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7101FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21D7D408FE;
	Mon,  4 Apr 2022 17:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-S47WOrnX25; Mon,  4 Apr 2022 17:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A889408D8;
	Mon,  4 Apr 2022 17:42:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FC151BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C68640182
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFXi5CQvQF89 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:40:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B29194011C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:40:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3C601803B6; Mon,  4 Apr 2022 17:31:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 19:27:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af457e6da30b78b53bd020a09c8487185e7316dd
X-Git-Newrev: 1a3de362aea62db32d02533d84fcf61cf0389152
X-Patchwork-Hint: ignore
Message-Id: <20220404173129.3C601803B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: fix uclibc-ng build
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a3de362aea62db32d02533d84fcf61cf0389152
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with uclibc-ng and grpc raised on arm
and ppc:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_random_internal_randen_hwaes.so.2111.0.0: undefined reference to `getauxval'

Strangely enough it seems there is only one autobuilder failure despite
the fact that libabseil-cpp is unconditionally using getauxval since its
addition in commit 93568440eda120b12bcbfe267af8f0182484c3b6:
https://github.com/abseil/abseil-cpp/blob/20200225/absl/random/internal/randen_detect.cc

Perhaps this build failure is an unexpected side effect of commit
8251d8c2559b25f11684776fc343059cf100657d

Fixes:
 - http://autobuild.buildroot.org/results/775f3ca3dedebff29e212b29dfa896b7613b7a02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-fix-build-with-uclibc-ng.patch            | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch b/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch
new file mode 100644
index 0000000000..0797d8e51b
--- /dev/null
+++ b/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch
@@ -0,0 +1,62 @@
+From b9ad9bbfed92199a1a58504306d026cd2597539e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 30 Mar 2022 21:56:20 +0200
+Subject: [PATCH] Fix build with uclibc-ng (#1145)
+
+uclibc-ng doesn't provide getauxval which results in the following build
+failure on arm or ppc with any user of abseil-cpp such as grpc:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_random_internal_randen_hwaes.so.2111.0.0: undefined reference to `getauxval'
+
+To fix this build failure, check that __UCLIBC__ is not defined before
+using getauxval (as Babel is not able to check function availability)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/775f3ca3dedebff29e212b29dfa896b7613b7a02
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/abseil/abseil-cpp/commit/b9ad9bbfed92199a1a58504306d026cd2597539e]
+---
+ absl/debugging/internal/vdso_support.cc | 2 +-
+ absl/random/internal/randen_detect.cc   | 7 ++++++-
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/absl/debugging/internal/vdso_support.cc b/absl/debugging/internal/vdso_support.cc
+index c655cf452..e63ac4a3b 100644
+--- a/absl/debugging/internal/vdso_support.cc
++++ b/absl/debugging/internal/vdso_support.cc
+@@ -33,7 +33,7 @@
+ #endif
+ #include <unistd.h>
+ 
+-#if defined(__GLIBC__) && \
++#if !defined(__UCLIBC__) && defined(__GLIBC__) && \
+     (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
+ #define ABSL_HAVE_GETAUXVAL
+ #endif
+diff --git a/absl/random/internal/randen_detect.cc b/absl/random/internal/randen_detect.cc
+index 9bb58fc68..6dababa35 100644
+--- a/absl/random/internal/randen_detect.cc
++++ b/absl/random/internal/randen_detect.cc
+@@ -24,6 +24,11 @@
+ 
+ #include "absl/random/internal/platform.h"
+ 
++#if !defined(__UCLIBC__) && defined(__GLIBC__) && \
++    (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
++#define ABSL_HAVE_GETAUXVAL
++#endif
++
+ #if defined(ABSL_ARCH_X86_64)
+ #define ABSL_INTERNAL_USE_X86_CPUID
+ #elif defined(ABSL_ARCH_PPC) || defined(ABSL_ARCH_ARM) || \
+@@ -31,7 +36,7 @@
+ #if defined(__ANDROID__)
+ #define ABSL_INTERNAL_USE_ANDROID_GETAUXVAL
+ #define ABSL_INTERNAL_USE_GETAUXVAL
+-#elif defined(__linux__)
++#elif defined(__linux__) && defined(ABSL_HAVE_GETAUXVAL)
+ #define ABSL_INTERNAL_USE_LINUX_GETAUXVAL
+ #define ABSL_INTERNAL_USE_GETAUXVAL
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
