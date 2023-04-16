Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD680C77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 20:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50E90418B7;
	Sun, 16 Apr 2023 20:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50E90418B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mmRFqyZyjvW; Sun, 16 Apr 2023 20:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138584190A;
	Sun, 16 Apr 2023 20:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 138584190A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D47B1C415A
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 20:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 705FA4190B
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705FA4190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n68SYs1K6wHp for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 20:44:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27E924190A
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 20:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27E924190A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06A33818AF; Sun, 16 Apr 2023 20:44:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 22:42:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e1c238b7202c3b04d9eab94e429c5580c77444b
X-Git-Newrev: 1ace31aec59dc06375ba192b5838c4cc99072e81
X-Patchwork-Hint: ignore
Message-Id: <20230416204413.06A33818AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump version to
 20230127
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ace31aec59dc06375ba192b5838c4cc99072e81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport mount_attr fix for glibc-based toolchain.

Fixes:
 - http://autobuild.buildroot.org/results/4dbb72e1bf081afd3cd944571b9beeefc7608865

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...001-configure.ac-fix-mount_attr-detection.patch | 54 ++++++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.hash           |  5 +-
 package/ltp-testsuite/ltp-testsuite.mk             |  2 +-
 3 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch b/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch
new file mode 100644
index 0000000000..740d3a6d6a
--- /dev/null
+++ b/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch
@@ -0,0 +1,54 @@
+From 30353a1eb3ee8940f38d6a0e8f5f39352fd8a179 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Feb 2023 20:25:54 +0100
+Subject: [PATCH] configure.ac: fix mount_attr detection
+Upstream: https://github.com/linux-test-project/ltp/commit/30353a1eb3ee8940f38d6a0e8f5f39352fd8a179
+
+Commit b857f8723f30a4b9554bf6b0ff8fa52fd07e8b60 tried to fix build with
+latest glibc which provides mount_attr in sys/mount.h. Unfortunately,
+the following build failure is still raised because sys/mount is now
+unconditionally included in include/lapi/fsmount.h:
+
+In file included from fsconfig01.c:9:
+../../../../include/lapi/fsmount.h:55:8: error: redefinition of 'struct mount_attr'
+   55 | struct mount_attr {
+      |        ^~~~~~~~~~
+In file included from ../../../../include/lapi/fsmount.h:14:
+/home/autobuild/autobuild/instance-4/output-1/host/armeb-buildroot-linux-gnueabi/sysroot/usr/include/sys/mount.h:210:8: note: originally defined here
+  210 | struct mount_attr
+      |        ^~~~~~~~~~
+
+Fixes: b857f8723 ("lapi/fsmount: resolve conflict in different header files")
+Fixes: http://autobuild.buildroot.org/results/4dbb72e1bf081afd3cd944571b9beeefc7608865
+Link: https://lore.kernel.org/ltp/20230226192554.669332-1-fontaine.fabrice@gmail.com/
+Reviewed-by: Li Wang <liwang@redhat.com>
+[ pvorel: fix from b857f8723 is needed for glibc before glibc-2.37~426,
+i.e. without fix 774058d729 ("linux: Fix sys/mount.h usage with kernel headers")
+(which was backported to 2.35 and 2.34 maintenance). ]
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 114468ae3..4c8763376 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -224,10 +224,10 @@ AC_CHECK_TYPES([struct __kernel_old_timeval, struct __kernel_old_timespec, struc
+ 
+ AC_CHECK_TYPES([struct futex_waitv],,,[#include <linux/futex.h>])
+ AC_CHECK_TYPES([struct mount_attr],,,[
+-#ifdef HAVE_LINUX_MOUNT_H
+-# include <linux/mount.h>
+-#else
++#ifdef HAVE_MOUNT_SETATTR
+ # include <sys/mount.h>
++#elif HAVE_LINUX_MOUNT_H
++# include <linux/mount.h>
+ #endif
+ ])
+ 
+-- 
+2.40.0
+
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 8b411a8ffe..59ba5d0045 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,5 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20220527/ltp-full-20220527.tar.bz2.sha1
-sha1  c8d658cd3ab1f5a5c7b5bf56398d3a9525012c6b  ltp-full-20220930.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20230127/ltp-full-20230127.tar.xz.sha256
+sha256  254412a52c7238f35a247337da186f485e76fb64c6549ed849b3442fc7a417ef  ltp-full-20230127.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  533ab63915b916640667ecce17ee4998006d80d394d4b1f1d105a7aa1df50d38  ltp-full-20220930.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 34412d562f..78271b0730 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20220930
+LTP_TESTSUITE_VERSION = 20230127
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
