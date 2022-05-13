Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BE3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26D394017F;
	Fri, 13 May 2022 22:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyzEVXcsdp1a; Fri, 13 May 2022 22:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1201401BE;
	Fri, 13 May 2022 22:17:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA751C1189
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01E2440949
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbGPD6WEwl2Q for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E2D640930
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EBD7585E29; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef7642c5065784a28a29d9a21cc66398d2bd1cf1
X-Git-Newrev: 2712e320287106c6892abedecb427fb8d5f7d81d
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.EBD7585E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmalloc: Add patch to fix powerpc
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=2712e320287106c6892abedecb427fb8d5f7d81d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following build failure on powerpc64le:

 http://autobuild.buildroot.net/results/1f84facd106abdd59be87b9f6e1eb24bcef0a846

 Assembler messages:
 Error: missing operand

The code will fail to build on any powerpc platform with optimisation
disabled as package contains incorrect syntax behind !defined(__OPTIMIZE__).

The patch has been submitted to the project:

 https://github.com/j256/dmalloc/pull/113

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../dmalloc/0002-return-Fix-PowerPC-assembly.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/dmalloc/0002-return-Fix-PowerPC-assembly.patch b/package/dmalloc/0002-return-Fix-PowerPC-assembly.patch
new file mode 100644
index 0000000000..e6aa811644
--- /dev/null
+++ b/package/dmalloc/0002-return-Fix-PowerPC-assembly.patch
@@ -0,0 +1,54 @@
+From 6d87fc890c3de81ee33baf25d7c3c86532f26060 Mon Sep 17 00:00:00 2001
+From: Joel Stanley <joel@jms.id.au>
+Date: Mon, 9 May 2022 20:27:58 +0930
+Subject: [PATCH] return: Fix PowerPC assembly
+
+The original assembly used suspicious syntax. However, due to the
+!defined(__OPTIMIZE__) guard this code was rarely built.
+
+There nothing to stop the compiler using r0 between the two asm blocks,
+which may have been the cause of the note mentioning it failed when
+build with optimisation enabled.
+
+Write a single asm statement that places the result in the given
+location.
+
+This builds for powerpc64le and passes tests.
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+Upstream: https://github.com/j256/dmalloc/pull/113
+---
+ return.h | 13 +++----------
+ 1 file changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/return.h b/return.h
+index 55b9369fe12d..fafbe3754f0f 100644
+--- a/return.h
++++ b/return.h
+@@ -260,20 +260,13 @@ asm void ASM_GET_RET_ADDR(file)
+ /*************************************/
+ 
+ /*
+- * For Powerpc 603 based system running LynxOS 2.3.1 using gcc/gas.
+- */
+-#if defined(__powerpc__) && defined(__GNUC__) && !defined(__OPTIMIZE__)
+-
+-/*
+- * This won't compile if "-O2" is used, but it seems to work fine with
+- * "-O0".  I'm no assembler expert; I was happy enough to come up with
+- * something that works at all...  :-)
++ * For PowerPC using gcc/gas.
+  */
++#if defined(__powerpc__) && defined(__GNUC__)
+ 
+ #define GET_RET_ADDR(file) \
+ do { \
+-  asm("mflr 0"); \
+-  asm("stw 0,%0" : "=g" (file)); \
++  asm("mflr %0" : "=r" (file)); \
+ } while(0)
+ 
+ #endif /* __powerpc__ && __GNUC__ && !__OPTIMIZE__ */
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
