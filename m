Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91344C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 207BF405F3;
	Wed, 10 Aug 2022 21:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 207BF405F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTeKAWCASZpf; Wed, 10 Aug 2022 21:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F32140527;
	Wed, 10 Aug 2022 21:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F32140527
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 647D91BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4687E40527
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4687E40527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-uV3POXo8k5 for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:14:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44C80404C4
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44C80404C4
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7392E870B7; Wed, 10 Aug 2022 21:00:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 23:14:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3485757c37ea443688589bd073c21c60f38d3a5b
X-Git-Newrev: 11477df6b144c43c005f62b005a17630061cb781
X-Patchwork-Hint: ignore
Message-Id: <20220810210030.7392E870B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 2.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=11477df6b144c43c005f62b005a17630061cb781
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nfs-utils 2.6.2 adds nfsrahead tool to set readahead through sysfs, but
this tool is mandatory and requires libmount that in order requires
libblkid. Also we need a local patch that is already pending upstream to
avoid failing static linking:
https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/

So let's select:
- BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
- BR2_PACKAGE_UTIL_LINUX_LIBBLKID
and add the pending patch for fixing static linking failure due to wrong
order of libraries in linker list(-lblkid must follow -lmount). This is
achieved by using pkg-config that is already a dependency of this package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...fsrahead-fix-linking-while-static-linking.patch | 34 ++++++++++++++++++++++
 package/nfs-utils/Config.in                        |  2 ++
 package/nfs-utils/nfs-utils.hash                   |  4 +--
 package/nfs-utils/nfs-utils.mk                     |  2 +-
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
new file mode 100644
index 0000000000..b8dcea63f7
--- /dev/null
+++ b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
@@ -0,0 +1,34 @@
+From a69014a1b4e5b8068630abe3109f31eb64b6a076 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 10 Aug 2022 00:10:51 +0200
+Subject: [PATCH] nfsrahead: fix linking while static linking
+
+-lmount must preceed -lblkid and to obtain this let's add:
+`pkg-config --libs mount`
+in place of:
+`-lmount`
+This ways the library order will always be correct.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+Pending Upstream:
+https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/
+---
+ tools/nfsrahead/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/nfsrahead/Makefile.am b/tools/nfsrahead/Makefile.am
+index 845ea0d5..280a2eb4 100644
+--- a/tools/nfsrahead/Makefile.am
++++ b/tools/nfsrahead/Makefile.am
+@@ -1,6 +1,6 @@
+ libexec_PROGRAMS = nfsrahead
+ nfsrahead_SOURCES = main.c
+-nfsrahead_LDFLAGS= -lmount
++nfsrahead_LDFLAGS= `pkg-config --libs mount`
+ nfsrahead_LDADD = ../../support/nfs/libnfsconf.la
+ 
+ man5_MANS = nfsrahead.man
+-- 
+2.34.1
+
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index f00debc420..f3cb17918e 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  The NFS Linux kernel server.
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index a73bf80e70..2efe693875 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.1/sha256sums.asc
-sha256  60dfcd94a9f3d72a12bc7058d811787ec87a6d593d70da2123faf9aad3d7a1df  nfs-utils-2.6.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.2/sha256sums.asc
+sha256  5200873e81c4d610e2462fc262fe18135f2dbe78b7979f95accd159ae64d5011  nfs-utils-2.6.2.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 44653e2707..ed205a26b1 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.6.1
+NFS_UTILS_VERSION = 2.6.2
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
