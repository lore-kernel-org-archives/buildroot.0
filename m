Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C811AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 572C660B66;
	Tue, 28 Dec 2021 21:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbpF9UHb8E_G; Tue, 28 Dec 2021 21:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7822F60B73;
	Tue, 28 Dec 2021 21:03:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E481A1BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CFBF40586
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XT8IU7qjLDFt for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:02:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F225A403AC
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:02:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DC08582BDC; Tue, 28 Dec 2021 20:56:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 21:47:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72de4a84fb53f708330f98eb84c1c7e07d8cea71
X-Git-Newrev: d94e2b6dd4f291a77bbfd06eabb7ce85c9bb6aa9
X-Patchwork-Hint: ignore
Message-Id: <20211228205626.DC08582BDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rng-tools: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d94e2b6dd4f291a77bbfd06eabb7ce85c9bb6aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version 6.14
in commit 5292d1cf9ad0605cc264fedc75c1b9a169aa183b:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: rngd-rngd_jitter.o: in function `rngd_notime_start':
rngd_jitter.c:(.text+0xdc2): undefined reference to `pthread_attr_setaffinity_np'

Fixes:
 - http://autobuild.buildroot.org/results/3ec7df86856aa9bee2f18a8faa44fd58bc8a6657

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-detect-non-posix-extensions-for-pthreads.patch | 43 +++++++++++++++++++
 ...se-of-either-pthread-affinity-set-methods.patch | 49 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch b/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
new file mode 100644
index 0000000000..ba6cf63d7c
--- /dev/null
+++ b/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
@@ -0,0 +1,43 @@
+From d1840e54a15fc454936cada10cce7fd91d06232b Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@gmail.com>
+Date: Thu, 15 Jul 2021 08:43:01 -0400
+Subject: [PATCH] Adding ability to detect non-posix extensions for pthreads
+
+Theres a desire to build rngd with musl, which doesn't have all the gnu
+extensions (but it has some).  So test for those.  Note, this requires
+the addition of the USE_EXTENSIONS macro to enable -d_GNU_SOURCE
+
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+
+[Retrieved from:
+https://github.com/nhorman/rng-tools/commit/d1840e54a15fc454936cada10cce7fd91d06232b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 0fe06fc..de7dca3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,6 +25,7 @@ AC_CANONICAL_TARGET dnl required for broken AX_PTHREAD
+ AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_HEADERS([rng-tools-config.h])
+ AC_CONFIG_MACRO_DIRS([m4])
++AC_USE_SYSTEM_EXTENSIONS
+ 
+ dnl Parse options
+ 
+@@ -100,6 +101,12 @@ AS_IF(
+ 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
+ )
+ 
++AC_CHECK_DECL(pthread_attr_setaffinity_np,
++		[AC_DEFINE([HAVE_PTHREAD_ATTR_SETAFFINITY], 1,[Set ATTR_SETAFFINITY])],
++		[ AC_CHECK_DECL(pthread_setaffinity_np,
++		   [AC_DEFINE([HAVE_PTHREAD_SETAFFINITY],1, [Set PTHREAD_SETAFFINITY])], [ AC_MSG_ERROR([Neither pthread_setaffinity_np nor pthread_attr_setaffinity_np found])],[[#include <pthread.h>]])
++		], [[#include <pthread.h>]])
++
+ AS_IF(
+ 	[ test "x$with_nistbeacon" != "xno"],
+ 	[
diff --git a/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch b/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
new file mode 100644
index 0000000000..17285baa6a
--- /dev/null
+++ b/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
@@ -0,0 +1,49 @@
+From 5caa086dc14cecf68d1a5c31e87ba1efb2c00893 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@gmail.com>
+Date: Thu, 15 Jul 2021 08:48:10 -0400
+Subject: [PATCH] Allow for use of either pthread affinity set methods
+
+musl has support for pthread_setaffinity_np, but not
+pthread_attr_setaffinity_np.  so check for hte existence of either
+function in configure, and use the appropriate one.
+
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+
+[Retrieved from:
+https://github.com/nhorman/rng-tools/commit/5caa086dc14cecf68d1a5c31e87ba1efb2c00893]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ rngd_jitter.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index ea29436..5c7e09e 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -67,12 +67,25 @@ static int rngd_notime_start(void *ctx,
+ 	for(i=i-1;i>=0;i--) {
+ 		CPU_SET(i,cpus);
+ 	}
+-	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
+ 
++        /*
++	 * Note that only one of:
++	 * HAVE_PTHREAD_ATTR_SETAFFINITY
++	 * and
++	 * HAVE_PTHREAD_SETAFFINITY
++	 * Will ever be set, as per the configure.ac logic
++	 */
++#ifdef HAVE_PTHREAD_ATTR_SETAFFINITY
++	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
++#endif
+ 	ret = -pthread_create(&thread_ctx->notime_thread_id,
+ 				&thread_ctx->notime_pthread_attr,
+ 				start_routine, arg);
+ 
++#ifdef HAVE_PTHREAD_SETAFFINITY
++	pthread_setaffinity_np(&thread_ctx->notime_thread_id, cpusize, cpus);
++#endif
++
+ 	CPU_FREE(cpus);
+ 	return ret;
+ }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
