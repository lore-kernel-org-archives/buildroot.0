Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62265C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:04:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CDEC60F6B
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CDEC60F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4E394027C;
	Sat, 13 Nov 2021 17:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fF104mO-t0M; Sat, 13 Nov 2021 17:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF4A140277;
	Sat, 13 Nov 2021 17:04:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F421C1BF95C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0D18605AD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-B7XFoH7qpW for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:04:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47B2C605AB
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:04:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E5E1F8CA19; Sat, 13 Nov 2021 17:00:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:03:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96e2fccd9c6d87920c280570e0183e5eda7c4fac
X-Git-Newrev: ea9a411a3f7a379fcdef2519a254138fffd937d6
X-Patchwork-Hint: ignore
Message-Id: <20211113170013.E5E1F8CA19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/diffutils: fix build on or1k
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea9a411a3f7a379fcdef2519a254138fffd937d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 3.8 in
commit 1f89c80417ad03127650b22c41ec4e30d42c549f:

sigsegv.c: In function 'sigsegv_handler':
sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
  979 |                       : vma.is_near_this (addr, &vma))
      |                            ^

Fixes:
 - http://autobuild.buildroot.org/results/5427e52489d29ed4f18b4a70b3c36f0f7bb0ddd9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../diffutils/0002-sigsegv-fix-build-on-or1k.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/diffutils/0002-sigsegv-fix-build-on-or1k.patch b/package/diffutils/0002-sigsegv-fix-build-on-or1k.patch
new file mode 100644
index 0000000000..73385fe9f7
--- /dev/null
+++ b/package/diffutils/0002-sigsegv-fix-build-on-or1k.patch
@@ -0,0 +1,32 @@
+From 496c1740e5475be85b65fdb2b143771f09ed27cb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Nov 2021 10:06:31 +0100
+Subject: sigsegv: fix build on or1k
+
+Fix the following build failure on or1k with diffutils 3.8
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e54aa6196947ed22ff66bcd714e4fc7bd0c5c3b4
+sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
+http://autobuild.buildroot.org/results/5427e52489d29ed4f18b4a70b3c36f0f7bb0ddd9
+
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=496c1740e5475be85b65fdb2b143771f09ed27cb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 70286c8f5..29e398d77 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -45,6 +45,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       nios2 | \
+       nds32* | \
+       ns32k | \
++      or1k | \
+       pdp11 | \
+       pj* | \
+       powerpc* | rs6000 | \
+-- 
+cgit v1.2.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
