Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9902CC64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 14:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F7476005E;
	Mon, 27 Feb 2023 14:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F7476005E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dm6A_dT0NfFX; Mon, 27 Feb 2023 14:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD8C60B8F;
	Mon, 27 Feb 2023 14:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD8C60B8F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC9DE1BF86B
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86CE880C34
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86CE880C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id waZWwRFsUz1U for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 848EB80C1E
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 848EB80C1E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D29686BEE; Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 14:41:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a34ac4453553a5d86b91e038db3acf0e7eb6931f
X-Git-Newrev: 93f5ba38533edb66e9446086266da6f9be904a80
X-Patchwork-Hint: ignore
Message-Id: <20230227145800.6D29686BEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: fix build without NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=93f5ba38533edb66e9446086266da6f9be904a80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without NPTL raised since the addition
of the package in commit 1e64fa2956171cdc9d6e6c8896b4b589ce573513:

/tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp: In function 'CPLSpinLock* CPLCreateSpinLock()':
/tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp:2265:9: error: 'pthread_spin_init' was not declared in this scope; did you mean 'pthread_cond_init'?
 2265 |         pthread_spin_init(&(psSpin->spin), PTHREAD_PROCESS_PRIVATE) == 0 )
      |         ^~~~~~~~~~~~~~~~~
      |         pthread_cond_init

Fixes:
 - http://autobuild.buildroot.org/results/aa2a88990a07e551c40efb0c2180768add600c4f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gdal/0001-fix-uclibc-build-without-NPTL.patch  | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/package/gdal/0001-fix-uclibc-build-without-NPTL.patch b/package/gdal/0001-fix-uclibc-build-without-NPTL.patch
new file mode 100644
index 0000000000..6ecbfc7f95
--- /dev/null
+++ b/package/gdal/0001-fix-uclibc-build-without-NPTL.patch
@@ -0,0 +1,102 @@
+From 0d3ee8a7661dcd85a9d7b636124af32de8d1b2f1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Feb 2023 11:31:23 +0100
+Subject: [PATCH] fix uclibc build without NPTL
+
+Check for pthread_spin_lock instead of pthread_spin_lock_t to avoid the
+following uclibc build failure:
+
+/tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp: In function 'CPLSpinLock* CPLCreateSpinLock()':
+/tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp:2265:9: error: 'pthread_spin_init' was not declared in this scope; did you mean 'pthread_cond_init'?
+ 2265 |         pthread_spin_init(&(psSpin->spin), PTHREAD_PROCESS_PRIVATE) == 0 )
+      |         ^~~~~~~~~~~~~~~~~
+      |         pthread_cond_init
+/tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp: In function 'int CPLAcquireSpinLock(CPLSpinLock*)':
+/tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp:2283:12: error: 'pthread_spin_lock' was not declared in this scope; did you mean 'pthread_spinlock_t'?
+ 2283 |     return pthread_spin_lock( &(psSpin->spin) ) == 0;
+      |            ^~~~~~~~~~~~~~~~~
+      |            pthread_spinlock_t
+
+Fixes:
+ - http://autobuild.buildroot.org/results/aa2a88990a07e551c40efb0c2180768add600c4f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OSGeo/gdal/pull/7318]
+---
+ cmake/helpers/configure.cmake  | 4 ++--
+ cmake/template/cpl_config.h.in | 4 ++--
+ port/cpl_config.h.in           | 4 ++--
+ port/cpl_multiproc.cpp         | 4 ++--
+ 4 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/cmake/helpers/configure.cmake b/cmake/helpers/configure.cmake
+index 08549df434..62a4f636ba 100644
+--- a/cmake/helpers/configure.cmake
++++ b/cmake/helpers/configure.cmake
+@@ -110,9 +110,9 @@ else ()
+     "
+         #define _GNU_SOURCE
+         #include <pthread.h>
+-        int main() { pthread_spinlock_t spin; return 1; }
++        int main() { pthread_spinlock_t spin; return pthread_spin_lock(&spin); }
+         "
+-    HAVE_PTHREAD_SPINLOCK)
++    HAVE_PTHREAD_SPIN_LOCK)
+ 
+   check_c_source_compiles(
+     "
+diff --git a/cmake/template/cpl_config.h.in b/cmake/template/cpl_config.h.in
+index cfa7da94aa..d1fd80bda9 100644
+--- a/cmake/template/cpl_config.h.in
++++ b/cmake/template/cpl_config.h.in
+@@ -61,8 +61,8 @@
+ /* Define to 1 if you have the `PTHREAD_MUTEX_ADAPTIVE_NP' constant. */
+ #cmakedefine HAVE_PTHREAD_MUTEX_ADAPTIVE_NP 1
+ 
+-/* Define to 1 if you have the `pthread_spinlock_t' type. */
+-#cmakedefine HAVE_PTHREAD_SPINLOCK 1
++/* Define to 1 if you have the `pthread_spin_lock' function. */
++#cmakedefine HAVE_PTHREAD_SPIN_LOCK 1
+ 
+ /* Define to 1 if you have the `pthread_atfork' function. */
+ #cmakedefine HAVE_PTHREAD_ATFORK 1
+diff --git a/port/cpl_config.h.in b/port/cpl_config.h.in
+index ea28efb3f0..09a48f242d 100644
+--- a/port/cpl_config.h.in
++++ b/port/cpl_config.h.in
+@@ -51,8 +51,8 @@
+ /* Define to 1 if you have the `PTHREAD_MUTEX_ADAPTIVE_NP' constant. */
+ #undef HAVE_PTHREAD_MUTEX_ADAPTIVE_NP
+ 
+-/* Define to 1 if you have the `pthread_spinlock_t' type. */
+-#undef HAVE_PTHREAD_SPINLOCK
++/* Define to 1 if you have the `pthread_spin_lock' function. */
++#undef HAVE_PTHREAD_SPIN_LOCK
+ 
+ /* Define to 1 if you have the 5 args `mremap' function. */
+ #undef HAVE_5ARGS_MREMAP
+diff --git a/port/cpl_multiproc.cpp b/port/cpl_multiproc.cpp
+index 7f5bcd9127..474ff5bb29 100644
+--- a/port/cpl_multiproc.cpp
++++ b/port/cpl_multiproc.cpp
+@@ -2232,7 +2232,7 @@ void CPLCleanupTLS()
+ /*                          CPLCreateSpinLock()                         */
+ /************************************************************************/
+ 
+-#if defined(HAVE_PTHREAD_SPINLOCK)
++#if defined(HAVE_PTHREAD_SPIN_LOCK)
+ #define HAVE_SPINLOCK_IMPL
+ 
+ struct _CPLSpinLock
+@@ -2310,7 +2310,7 @@ void CPLDestroySpinLock(CPLSpinLock *psSpin)
+     pthread_spin_destroy(&(psSpin->spin));
+     free(psSpin);
+ }
+-#endif  // HAVE_PTHREAD_SPINLOCK
++#endif  // HAVE_PTHREAD_SPIN_LOCK
+ 
+ #endif  // def CPL_MULTIPROC_PTHREAD
+ 
+-- 
+2.39.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
