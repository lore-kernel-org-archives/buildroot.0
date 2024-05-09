Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0846EC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E89C4156D;
	Thu,  9 May 2024 14:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jdDSI0sjAal; Thu,  9 May 2024 14:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B9D41561
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7B9D41561;
	Thu,  9 May 2024 14:31:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21C531BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BD98606D0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43EcFtvP9Igz for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B983606C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B983606C7
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:31:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3389486BB8; Thu,  9 May 2024 14:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 16:15:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69d06fda2aa1030b6ceb767ccec62ced1cc0c8b3
X-Git-Newrev: 10a59697e9a05954380d8dfb440a1c22efd6edf2
X-Patchwork-Hint: ignore
Message-Id: <20240509143147.3389486BB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress-ng: fix uclibc-ng build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10a59697e9a05954380d8dfb440a1c22efd6edf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc-ng build failure raised since bump to version
0.17.07 in commit 6fb179b906a1755d77bda9e501c5335ac163f3cb and
https://github.com/ColinIanKing/stress-ng/commit/e75ecbc8994e94b9e151b1191c1888bd2821fe72:

In file included from core-sched.c:25:
core-sched.c: In function 'stress_set_sched':
core-sched.c:170:22: error: 'struct shim_sched_attr' has no member named '__sched_priority'; did you mean 'sched_priority'?
  170 |                 attr.sched_priority = (unsigned int)sched_priority;
      |                      ^~~~~~~~~~~~~~

Fixes: 6fb179b906a1755d77bda9e501c5335ac163f3cb
 - http://autobuild.buildroot.org/results/d7d38dbb10f7f188da8dccc44a84a3c46a720bed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-core-sched.c-fix-uclibc-ng-build.patch    | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch b/package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch
new file mode 100644
index 0000000000..c9c4e22603
--- /dev/null
+++ b/package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch
@@ -0,0 +1,40 @@
+From f8dc9f790251562c3a4635edd29d7674298cd5f7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 4 May 2024 17:52:32 +0200
+Subject: [PATCH] core-sched.c: fix uclibc-ng build
+
+Since version 0.17.02 and commit
+e75ecbc8994e94b9e151b1191c1888bd2821fe72, sched.h is not included before
+including core-shim.h. The issue is that core-shim.h defines its own
+sched_priority parameter in shim_sched_attr. When sched.h is included
+after core-shim.h, the build will fail because __sched_priority will not
+be found:
+
+In file included from core-sched.c:25:
+core-sched.c: In function 'stress_set_sched':
+core-sched.c:170:22: error: 'struct shim_sched_attr' has no member named '__sched_priority'; did you mean 'sched_priority'?
+  170 |                 attr.sched_priority = (unsigned int)sched_priority;
+      |                      ^~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d7d38dbb10f7f188da8dccc44a84a3c46a720bed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/ColinIanKing/stress-ng/commit/f8dc9f790251562c3a4635edd29d7674298cd5f7
+---
+ core-shim.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/core-shim.h b/core-shim.h
+index bed4cf2f6..475aac512 100644
+--- a/core-shim.h
++++ b/core-shim.h
+@@ -23,6 +23,8 @@
+ #include <sys/uio.h>
+ #endif
+ 
++#include <sched.h>
++
+ /*
+  *  BeagleBoneBlack with 4.1.15 kernel does not
+  *  define the following, these should be defined
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
