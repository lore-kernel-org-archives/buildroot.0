Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFA7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F8BE60FC1;
	Thu, 21 Apr 2022 18:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y2BxQiqtj3lw; Thu, 21 Apr 2022 18:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB87860FAC;
	Thu, 21 Apr 2022 18:04:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 211E41C1189
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAC9860FA2
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7gwHEIAk7bi for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9D9860FAE
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E1C8F83FB8; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:53:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33a4b795b23a72a8517afc1ca5ceccaad66d426b
X-Git-Newrev: c44f745c8c2af821a00276141052a4e2e66128ed
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.E1C8F83FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/diffutils: fix build on arceb
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

commit: https://git.buildroot.net/buildroot/commit/?id=c44f745c8c2af821a00276141052a4e2e66128ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 3.8 in
commit 1f89c80417ad03127650b22c41ec4e30d42c549f:

sigsegv.c: In function 'sigsegv_handler':
sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
  979 |                       : vma.is_near_this (addr, &vma))
      |                            ^

Fixes:
 - http://autobuild.buildroot.org/results/8c5b8b37eb3c2667c75666079b056df7e0023e05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...gsegv-Fix-compilation-error-on-arceb-CPUs.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch b/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch
new file mode 100644
index 0000000000..20db798f3a
--- /dev/null
+++ b/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch
@@ -0,0 +1,41 @@
+From 1957bb5113a2bf02c7ecf0815125eec04b9476d2 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Sat, 16 Apr 2022 03:01:51 +0200
+Subject: sigsegv: Fix compilation error on arceb CPUs.
+
+Reported by Fabrice Fontaine <fontaine.fabrice@gmail.com> in
+<https://lists.gnu.org/archive/html/bug-gnulib/2022-04/msg00028.html>.
+
+* m4/stack-direction.m4 (SV_STACK_DIRECTION): Treat the 'arc' variants
+like 'arc'.
+
+[Retrieved (and backported) from:
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=1957bb5113a2bf02c7ecf0815125eec04b9476d2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog             | 8 ++++++++
+ m4/stack-direction.m4 | 4 ++--
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 1df823e..924c5de 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -1,4 +1,4 @@
+-# stack-direction.m4 serial 7
++# stack-direction.m4 serial 11
+ dnl Copyright (C) 2002-2021 Free Software Foundation, Inc.
+ dnl This file is free software, distributed under the terms of the GNU
+ dnl General Public License.  As a special exception to the GNU General
+@@ -18,7 +18,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       a29k | \
+       aarch64* | \
+       alpha* | \
+-      arc | \
++      arc | arceb | arc32 | arc64 | \
+       arm* | strongarm* | xscale* | \
+       avr | avr32 | \
+       bfin | \
+-- 
+cgit v1.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
