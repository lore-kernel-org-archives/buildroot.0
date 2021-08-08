Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66E3C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:20:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CAEB60F11
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CAEB60F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 195CA4022D;
	Sun,  8 Aug 2021 21:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzBC1MjSOvDT; Sun,  8 Aug 2021 21:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D2F40243;
	Sun,  8 Aug 2021 21:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 486591BF42E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43D696060C
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T45uAEK_1Vf3 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 21:20:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86CC260598
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 21:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0D28F8D318; Sun,  8 Aug 2021 21:20:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 23:20:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84333281cd923308781fd40887c94cd33386b12a
X-Git-Newrev: 05442cd78492259944d73fb52d7bca3b5ff9e0e6
X-Patchwork-Hint: ignore
Message-Id: <20210808212008.0D28F8D318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bullet: fix musl build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=05442cd78492259944d73fb52d7bca3b5ff9e0e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on musl raised since bump to version
3.0.9 in commit 28b4947ed8f53c4edfbf8fef9304dc76480c01ca:

In file included from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btScalar.h:289,
                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btVector3.h:19,
                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btConvexHullComputer.h:18,
                 from /tmp/instance-5/output-1/build/bullet-3.09/Extras/VHACD/src/VHACD.cpp:28:
/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h: In constructor 'VHACD::Mutex::Mutex()':
/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h:97:54: error: 'PTHREAD_MUTEX_RECURSIVE_NP' was not declared in this scope; did you mean 'PTHREAD_MUTEX_RECURSIVE'?
   97 |   VHACD_VERIFY(pthread_mutexattr_settype(&mutexAttr, PTHREAD_MUTEX_RECURSIVE_NP) == 0);
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/79cd2024b3dfc8d3e896cdacf67fb891df81ca6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch b/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch
new file mode 100644
index 0000000000..d01bb97d99
--- /dev/null
+++ b/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch
@@ -0,0 +1,42 @@
+From dd37b97e79aea231ae026ac93c6ca4c7a2667582 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 7 Aug 2021 17:11:24 +0200
+Subject: [PATCH] Extras/VHACD/inc/vhacdMutex.h: fix musl build
+
+Fix the following build failure on musl (which does not provide
+PTHREAD_MUTEX_RECURSIVE_NP):
+
+In file included from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btScalar.h:289,
+                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btVector3.h:19,
+                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btConvexHullComputer.h:18,
+                 from /tmp/instance-5/output-1/build/bullet-3.09/Extras/VHACD/src/VHACD.cpp:28:
+/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h: In constructor 'VHACD::Mutex::Mutex()':
+/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h:97:54: error: 'PTHREAD_MUTEX_RECURSIVE_NP' was not declared in this scope; did you mean 'PTHREAD_MUTEX_RECURSIVE'?
+   97 |   VHACD_VERIFY(pthread_mutexattr_settype(&mutexAttr, PTHREAD_MUTEX_RECURSIVE_NP) == 0);
+      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/79cd2024b3dfc8d3e896cdacf67fb891df81ca6e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/bulletphysics/bullet3/pull/3930]
+---
+ Extras/VHACD/inc/vhacdMutex.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Extras/VHACD/inc/vhacdMutex.h b/Extras/VHACD/inc/vhacdMutex.h
+index 4d1ad2a7d..78c111383 100644
+--- a/Extras/VHACD/inc/vhacdMutex.h
++++ b/Extras/VHACD/inc/vhacdMutex.h
+@@ -69,7 +69,7 @@
+ #include <pthread.h>
+ #endif
+ 
+-#if defined(__APPLE__)
++#if defined(__APPLE__) || !defined(__GLIBC__)
+ #define PTHREAD_MUTEX_RECURSIVE_NP PTHREAD_MUTEX_RECURSIVE
+ #endif
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
