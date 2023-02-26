Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B80C6FA8E
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 12:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DBB660BE6;
	Sun, 26 Feb 2023 12:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DBB660BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezYi3pC677sT; Sun, 26 Feb 2023 12:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA16A60ACE;
	Sun, 26 Feb 2023 12:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA16A60ACE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F38451BF3A7
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 12:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE62B4023F
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 12:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE62B4023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRW6DmfLlp8J for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 12:07:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3672400CB
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3672400CB
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 12:07:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q16so3527199wrw.2
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 04:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Ofu04MeWaREbq1ED2DVcCBRrxf/SPdz0UFaKjvkkcM=;
 b=a2BARHQCInyZe1UkuJAMDND470sZx4rDzPu6z3KVYRctMm8p05u2M3VQa+ckrB+l9D
 HPdn9tKnnBY6fy0C3fL6m7Hlu4V9FCABAzr50sBSPaSwdK5qEmKrz/nbEMhJh4Zv/ndx
 KIYODuWDagS0OgyqJ/+Z+WwQb3Y5Dx9P1aLva+4oq5sJTrFLAoOialrr+K7xmcCu+o12
 2M+3AwSoqVlayv7bigq5Obaz8S4fEpFRYjNv8Fj1eHxZz1iw2g0cU61r5Z08yExWtWny
 cpML5rEf9RHEGIFYExozK5Et2fPiiBttnenU3XdKWur5ftZDkh6+0HlJPkx0ZStxHITR
 42Dg==
X-Gm-Message-State: AO0yUKU45IjwJe6/mQiRF+wrVP8dU83xufjTQm0RYa7Fx/T3DjENnwZ+
 VqrNUNIgFoZjWUFCj1u/AORCQ3RS8aU=
X-Google-Smtp-Source: AK7set87wDek7GKu69aw18uKCwkqVsWvOUkLa4S80AAc2nTji18JhX085nOTNJ+6oju9ViyaJS0zzQ==
X-Received: by 2002:adf:f5d2:0:b0:2c7:bbe:456c with SMTP id
 k18-20020adff5d2000000b002c70bbe456cmr11263550wrp.63.1677413264247; 
 Sun, 26 Feb 2023 04:07:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d2-20020adfe842000000b002c552c6c8c2sm4264053wrn.87.2023.02.26.04.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 04:07:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 13:07:32 +0100
Message-Id: <20230226120732.39710-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Ofu04MeWaREbq1ED2DVcCBRrxf/SPdz0UFaKjvkkcM=;
 b=p3ZoN34i+JbU68nH9szFTefqkRuTRV51XyZWJw71lW6xtMD/uOeM9c2+bAfWqadwox
 fLokjcTwjj9dg+4sd5mHqsrKzvUAtupbMO/HkcGnyOljm8DbR1lJjmqFCXSGMZ19RABc
 wD1NPoSVhMTvx8s1F7CD7/DMQU6+fmjtCuZapMPG0eWYi4USV8syPUUJSAFGWPhKcq04
 Zy12DWGpCdOR9FJqZIq306nQQSDvnVJgf4q763jbpQJ/JAZ6gsKgspwvua0emw0jEDBy
 E6FmK6BqNF4USPF6tuW5zEOdZF+SFtQMHPCfcrVuJBxY2g1zgDFzYKbXTfjnYS3kEHJK
 X7Vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=p3ZoN34i
Subject: [Buildroot] [PATCH 1/1] package/gdal: fix build without NPTL
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .../0001-fix-uclibc-build-without-NPTL.patch  | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 package/gdal/0001-fix-uclibc-build-without-NPTL.patch

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
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
