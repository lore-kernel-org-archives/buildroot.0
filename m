Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC6FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3023682EA1;
	Sat, 23 Apr 2022 16:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id klRX2k8rXCWa; Sat, 23 Apr 2022 16:33:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 474C78284B;
	Sat, 23 Apr 2022 16:33:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD3D91BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B9874183D
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65U6RLxMN_IY for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DE3A414D1
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4193884202; Sat, 23 Apr 2022 16:22:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:15:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e831353d8f476cefd8320e38f2eb0d9f00359f3a
X-Git-Newrev: 26470f64109326037f521e2cfa2c2a3c0fe5cedb
X-Patchwork-Hint: ignore
Message-Id: <20220423162249.4193884202@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbb: fix nios2 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=26470f64109326037f521e2cfa2c2a3c0fe5cedb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on nios2 raised since bump to version
2021.5.0 in commit 3c66ac07a0783b21f95e699b3762edd15e27bdf9:

In file included from /home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/tools_api/ittnotify_static.c:17,
                 from /home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/itt_notify.cpp:43:
/home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/tools_api/ittnotify_config.h: In function 'long int __itt_interlocked_increment(volatile long int*)':
/home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/tools_api/ittnotify_config.h:348:12: error: '__TBB_machine_fetchadd4' was not declared in this scope
  348 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
      |            ^~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2b55d1d171f21030be8312f984ea02ec8c8348a8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0003-Define-ITT_ARCH_IA64-when-undefiend.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch b/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch
new file mode 100644
index 0000000000..5b7f002499
--- /dev/null
+++ b/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch
@@ -0,0 +1,27 @@
+From 6fad69889da67bc4d4baff4afa94f77da45e006d Mon Sep 17 00:00:00 2001
+From: Felix Yan <felixonmars@archlinux.org>
+Date: Thu, 7 Oct 2021 14:16:16 +0800
+Subject: [PATCH] Define ITT_ARCH_IA64 when undefiend (#550)
+
+[Retrieved from:
+https://github.com/oneapi-src/oneTBB/commit/6fad69889da67bc4d4baff4afa94f77da45e006d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/tbb/tools_api/ittnotify_config.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/tbb/tools_api/ittnotify_config.h b/src/tbb/tools_api/ittnotify_config.h
+index 8ecc23781..f904a8e9d 100644
+--- a/src/tbb/tools_api/ittnotify_config.h
++++ b/src/tbb/tools_api/ittnotify_config.h
+@@ -147,6 +147,10 @@
+ #  define ITT_ARCH_IA32E 2
+ #endif /* ITT_ARCH_IA32E */
+ 
++#ifndef ITT_ARCH_IA64
++#  define ITT_ARCH_IA64 3
++#endif /* ITT_ARCH_IA64 */
++
+ #ifndef ITT_ARCH_ARM
+ #  define ITT_ARCH_ARM  4
+ #endif /* ITT_ARCH_ARM */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
