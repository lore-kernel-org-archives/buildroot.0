Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C3C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2314F40E47;
	Tue,  1 Nov 2022 20:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2314F40E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Gk9QpeVS3FC; Tue,  1 Nov 2022 20:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1B5640879;
	Tue,  1 Nov 2022 20:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1B5640879
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D50B1BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28EB38148A
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EB38148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzqYJemD87sg for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:35:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B0481458
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B0481458
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AABC286C09; Tue,  1 Nov 2022 20:35:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 21:34:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98d65199db0643e5da56050381c73e6a580a2f89
X-Git-Newrev: df4a3c1833da3b3e7dadcac57cd7802f0831c542
X-Patchwork-Hint: ignore
Message-Id: <20221101203546.AABC286C09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catatonit: fix build with kernel <
 5.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=df4a3c1833da3b3e7dadcac57cd7802f0831c542
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with kernel < 5.0 raised since the
addition of the package in commit
e3975ec7d4b478ec6c1ba56b63cbb5bccfb9dd09:

catatonit.c:39:11: fatal error: linux/close_range.h: No such file or directory
   39 | # include <linux/close_range.h>
      |           ^~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ed9a847905083175c7fcb2f2df28f9ac5b9c3313

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../catatonit/0002-fix-build-with-kernel-5.9.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/catatonit/0002-fix-build-with-kernel-5.9.patch b/package/catatonit/0002-fix-build-with-kernel-5.9.patch
new file mode 100644
index 0000000000..a4c66389db
--- /dev/null
+++ b/package/catatonit/0002-fix-build-with-kernel-5.9.patch
@@ -0,0 +1,52 @@
+From 1fefcbffe4ade02d625bf058a7c07aeaf9fa7a2f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 1 Nov 2022 14:16:01 +0100
+Subject: [PATCH] fix build with kernel < 5.9
+
+linux/close_range.h is only available since kernel 5.9 and
+https://github.com/torvalds/linux/commit/60997c3d45d9a67daf01c56d805ae4fec37e0bd8
+resulting in the following build failure:
+
+catatonit.c:39:11: fatal error: linux/close_range.h: No such file or directory
+   39 | # include <linux/close_range.h>
+      |           ^~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ed9a847905083175c7fcb2f2df28f9ac5b9c3313
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/openSUSE/catatonit/pull/24]
+---
+ catatonit.c  | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/catatonit.c b/catatonit.c
+index a38263a..474c525 100644
+--- a/catatonit.c
++++ b/catatonit.c
+@@ -35,7 +35,7 @@
+ #include <limits.h>
+ #include <dirent.h>
+ 
+-#ifdef HAVE_CLOSE_RANGE
++#ifdef HAVE_LINUX_CLOSE_RANGE_H
+ # include <linux/close_range.h>
+ #else
+ # include <sys/syscall.h>
+diff --git a/configure.ac b/configure.ac
+index 94c5c84..a746ea1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,7 +22,7 @@ LT_PREREQ([2.4.2])
+ LT_INIT([disable-shared])
+ 
+ AC_CHECK_HEADERS([errno.h fcntl.h signal.h stdarg.h stdio.h stdlib.h unistd.h])
+-AC_CHECK_HEADERS([sys/prctl.h sys/signalfd.h sys/stat.h sys/types.h sys/wait.h])
++AC_CHECK_HEADERS([linux/close_range.h sys/prctl.h sys/signalfd.h sys/stat.h sys/types.h sys/wait.h])
+ 
+ AC_CHECK_FUNCS([close_range])
+ 
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
