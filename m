Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5490AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 13:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3F2340AFD;
	Wed,  9 Mar 2022 13:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BpdwGbnrY2vR; Wed,  9 Mar 2022 13:34:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C00040AF6;
	Wed,  9 Mar 2022 13:34:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 150621BF869
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B634960F9F
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_ovnZH0gUtq for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 13:30:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A91A160B5B
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 13:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2415F83917; Wed,  9 Mar 2022 13:21:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 22:02:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fc614345f1b8389df46b8f2d64cb3ae5a209b6d
X-Git-Newrev: 91cc129d72cf972c906829b1085c96797e41efd0
X-Patchwork-Hint: ignore
Message-Id: <20220309132156.2415F83917@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rng-tools: bump to version 6.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=91cc129d72cf972c906829b1085c96797e41efd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://github.com/nhorman/rng-tools/releases/tag/v6.15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-detect-non-posix-extensions-for-pthreads.patch | 43 -------------------
 ...se-of-either-pthread-affinity-set-methods.patch | 49 ----------------------
 package/rng-tools/rng-tools.hash                   |  2 +-
 package/rng-tools/rng-tools.mk                     |  2 +-
 4 files changed, 2 insertions(+), 94 deletions(-)

diff --git a/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch b/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
deleted file mode 100644
index ba6cf63d7c..0000000000
--- a/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d1840e54a15fc454936cada10cce7fd91d06232b Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@gmail.com>
-Date: Thu, 15 Jul 2021 08:43:01 -0400
-Subject: [PATCH] Adding ability to detect non-posix extensions for pthreads
-
-Theres a desire to build rngd with musl, which doesn't have all the gnu
-extensions (but it has some).  So test for those.  Note, this requires
-the addition of the USE_EXTENSIONS macro to enable -d_GNU_SOURCE
-
-Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
-
-[Retrieved from:
-https://github.com/nhorman/rng-tools/commit/d1840e54a15fc454936cada10cce7fd91d06232b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 0fe06fc..de7dca3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -25,6 +25,7 @@ AC_CANONICAL_TARGET dnl required for broken AX_PTHREAD
- AM_INIT_AUTOMAKE([foreign])
- AC_CONFIG_HEADERS([rng-tools-config.h])
- AC_CONFIG_MACRO_DIRS([m4])
-+AC_USE_SYSTEM_EXTENSIONS
- 
- dnl Parse options
- 
-@@ -100,6 +101,12 @@ AS_IF(
- 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
- )
- 
-+AC_CHECK_DECL(pthread_attr_setaffinity_np,
-+		[AC_DEFINE([HAVE_PTHREAD_ATTR_SETAFFINITY], 1,[Set ATTR_SETAFFINITY])],
-+		[ AC_CHECK_DECL(pthread_setaffinity_np,
-+		   [AC_DEFINE([HAVE_PTHREAD_SETAFFINITY],1, [Set PTHREAD_SETAFFINITY])], [ AC_MSG_ERROR([Neither pthread_setaffinity_np nor pthread_attr_setaffinity_np found])],[[#include <pthread.h>]])
-+		], [[#include <pthread.h>]])
-+
- AS_IF(
- 	[ test "x$with_nistbeacon" != "xno"],
- 	[
diff --git a/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch b/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
deleted file mode 100644
index 17285baa6a..0000000000
--- a/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5caa086dc14cecf68d1a5c31e87ba1efb2c00893 Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@gmail.com>
-Date: Thu, 15 Jul 2021 08:48:10 -0400
-Subject: [PATCH] Allow for use of either pthread affinity set methods
-
-musl has support for pthread_setaffinity_np, but not
-pthread_attr_setaffinity_np.  so check for hte existence of either
-function in configure, and use the appropriate one.
-
-Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
-
-[Retrieved from:
-https://github.com/nhorman/rng-tools/commit/5caa086dc14cecf68d1a5c31e87ba1efb2c00893]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- rngd_jitter.c | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/rngd_jitter.c b/rngd_jitter.c
-index ea29436..5c7e09e 100644
---- a/rngd_jitter.c
-+++ b/rngd_jitter.c
-@@ -67,12 +67,25 @@ static int rngd_notime_start(void *ctx,
- 	for(i=i-1;i>=0;i--) {
- 		CPU_SET(i,cpus);
- 	}
--	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
- 
-+        /*
-+	 * Note that only one of:
-+	 * HAVE_PTHREAD_ATTR_SETAFFINITY
-+	 * and
-+	 * HAVE_PTHREAD_SETAFFINITY
-+	 * Will ever be set, as per the configure.ac logic
-+	 */
-+#ifdef HAVE_PTHREAD_ATTR_SETAFFINITY
-+	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
-+#endif
- 	ret = -pthread_create(&thread_ctx->notime_thread_id,
- 				&thread_ctx->notime_pthread_attr,
- 				start_routine, arg);
- 
-+#ifdef HAVE_PTHREAD_SETAFFINITY
-+	pthread_setaffinity_np(&thread_ctx->notime_thread_id, cpusize, cpus);
-+#endif
-+
- 	CPU_FREE(cpus);
- 	return ret;
- }
diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index 6806a99fc6..be2ee13969 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4dd86f6ae37d917a8489f44070d39d7feddcc622429b95efd7aa85a1f3cfdf81  rng-tools-6.14.tar.gz
+sha256  bff0c58dff90ec10bd61f672e48618e045155eabd60b32d63a9c4ffbdad05f3a  rng-tools-6.15.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 8db97569d4..8b195ea875 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.14
+RNG_TOOLS_VERSION = 6.15
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
