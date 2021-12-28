Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ADAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 13:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D94CD81D67;
	Tue, 28 Dec 2021 13:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykXsLyHvk6uy; Tue, 28 Dec 2021 13:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C13381B53;
	Tue, 28 Dec 2021 13:40:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6188C1BF363
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F4954052C
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mphOAewdIfvj for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 13:40:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD4814013A
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 13:40:45 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t26so38449735wrb.4
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 05:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeXeNPAzVuMK6AoezIlkwt3DdeIU/nM/4FJ5trFbSk4=;
 b=Qony7OeAILjHtMkCHrCT5tTx+MLvbYw0ZmT6PCQtqTcns+Xi/HaB0x7L0CSWJwUMVJ
 HbNZ43YsM4l5ItrTT28eJi4KU7jSJu6CCKOWecB3jmJX1oo3S6mDYMMDnFa6NoOyvFPH
 kJgJ7CZlQTf8ZZ4T1FoUsLY6J2gdkVxCPe1bdWnK4ZuoEcXV2OLLoWPdlORx+WI2p7pC
 kt54XfpUPgt26f2/b/n1aMZw7Fs54cbUNT41MZfB/kQ7nRNv+TrPF0gPzOUwpOS/A2DV
 T95s4oWtTOji/j3+BH4N1AJPkNnzIaBIOibrNa0N4wXmZuVFcGaSrU0FjMIiotdl8CrH
 COrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeXeNPAzVuMK6AoezIlkwt3DdeIU/nM/4FJ5trFbSk4=;
 b=ZOCtqlnLQLgyp14/5mBeCZgqZ7inyT80ZqVz3BnNHB/Q0ug8vNxkYOYQGI6DC95o5n
 JfcdtJ3uafSTI8LJsAkWxeWdo1UTh0564DbD9c2hueTMpjD42jocu4Nf/R3oEhxF4yOr
 YFzNO4cJUSvz776ueepRkiGsQhWwyCPyrqVGeGag1kiajo7ehszGCjmj1oH224j6hk5p
 ZLHJRZ40hTMHW3agc+1VJ+A9MrrMkYqrSPOLvyew5jHZzer4xYXuI4bTG/vk1dykb+8m
 E69d1yIptMdCxYhN5G4jsHkCm8F0aRunihQAdfHhNKsvdhO/5aX+srvBsEhynl+JjFv1
 UrSg==
X-Gm-Message-State: AOAM532RlwaCizc8l2skNOyn8pdqlQLA/k2gh8MQSlfhFsOHkZcdNnu1
 dH9oo/mL8igucYtJVKdRbheSbMne9TvFWw==
X-Google-Smtp-Source: ABdhPJzHxxiv8uY+kwEm59JqcgOlAu6R6ucS02ooAq9oI55vpIM4HthGSqEbhYDK1lMFatPIj95hKg==
X-Received: by 2002:a5d:6d05:: with SMTP id e5mr16399952wrq.46.1640698843858; 
 Tue, 28 Dec 2021 05:40:43 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id a3sm20262388wri.98.2021.12.28.05.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 05:40:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 14:39:59 +0100
Message-Id: <20211228133959.3690191-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: fix musl build
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since bump to version 6.14
in commit 5292d1cf9ad0605cc264fedc75c1b9a169aa183b:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: rngd-rngd_jitter.o: in function `rngd_notime_start':
rngd_jitter.c:(.text+0xdc2): undefined reference to `pthread_attr_setaffinity_np'

Fixes:
 - http://autobuild.buildroot.org/results/3ec7df86856aa9bee2f18a8faa44fd58bc8a6657

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ct-non-posix-extensions-for-pthreads.patch | 43 ++++++++++++++++
 ...-either-pthread-affinity-set-methods.patch | 49 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
 create mode 100644 package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch

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
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
