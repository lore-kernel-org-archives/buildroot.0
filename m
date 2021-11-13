Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1AFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:25:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 239A16108E
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 239A16108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4E9A40277;
	Sat, 13 Nov 2021 14:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7TY6UDlat4p; Sat, 13 Nov 2021 14:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECBB040264;
	Sat, 13 Nov 2021 14:25:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0DEC1BF349
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE06B402B8
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZ6q8A9SPWz5 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:25:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBB5140448
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:25:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A18458C9A9; Sat, 13 Nov 2021 14:21:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:25:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4074fbd0aad1dc7c623aee68c8267d4f11e19fdc
X-Git-Newrev: 9dfe03df0d951935f135cc9335fe54f964482480
X-Patchwork-Hint: ignore
Message-Id: <20211113142149.A18458C9A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/diffutils: fix build on
 microblazeel
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

commit: https://git.buildroot.net/buildroot/commit/?id=9dfe03df0d951935f135cc9335fe54f964482480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 3.8 in
commit 1f89c80417ad03127650b22c41ec4e30d42c549f:

sigsegv.c: In function 'sigsegv_handler':
sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
  979 |                       : vma.is_near_this (addr, &vma))
      |                            ^

Fixes:
 - http://autobuild.buildroot.org/results/5ecd55b7c72f9630a7acc72341ccb60e94ddb574

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ck-direction.m4-fix-build-on-microblazeel.patch | 39 ++++++++++++++++++++++
 package/diffutils/diffutils.mk                     |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch b/package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch
new file mode 100644
index 0000000000..6e60beecbd
--- /dev/null
+++ b/package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch
@@ -0,0 +1,39 @@
+From 7fd9de7f12718db0ace575c15c3a0e061ef6c542 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Nov 2021 09:46:41 +0100
+Subject: [PATCH] m4/stack-direction.m4: fix build on microblazeel
+
+Fix the following build failure on microblazeel with diffutils raised
+since version 3.8 and
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e54aa6196947ed22ff66bcd714e4fc7bd0c5c3b4
+
+sigsegv.c: In function 'sigsegv_handler':
+sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
+  979 |                       : vma.is_near_this (addr, &vma))
+      |                            ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5ecd55b7c72f9630a7acc72341ccb60e94ddb574
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to bug-gnulib@gnu.org]
+---
+ m4/stack-direction.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index c90d69733..70286c8f5 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -37,7 +37,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       m68* | \
+       m88k | \
+       mcore | \
+-      microblaze | \
++      microblaze* | \
+       mips* | \
+       mmix | \
+       mn10200 | \
+-- 
+2.33.0
+
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index db8a5070a9..3d86541295 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -10,6 +10,8 @@ DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
+# We're patching m4/stack-direction.m4
+DIFFUTILS_AUTORECONF = YES
 
 # Since glibc >= 2.26, don't try to use getopt_long replacement bundled
 # with diffutils. It will conflict with the one from glibc.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
