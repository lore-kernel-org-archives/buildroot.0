Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC49C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 16:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0EBF81DA3;
	Tue, 10 May 2022 16:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bziI9xXtgKRZ; Tue, 10 May 2022 16:04:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8E8E812CE;
	Tue, 10 May 2022 16:04:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F64F1BF2C9
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 16:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EE49812CE
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 16:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPG9fGMWqWei for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 16:03:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA0D08186E
 for <buildroot@buildroot.org>; Tue, 10 May 2022 16:03:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D1E0E85C72; Tue, 10 May 2022 15:52:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 18:01:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1183fd1411161f0483960063103377915e84c68e
X-Git-Newrev: b054353e59488713f841cd9ac9384b8a23f2e83a
X-Patchwork-Hint: ignore
Message-Id: <20220510155237.D1E0E85C72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: bump to version 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b054353e59488713f841cd9ac9384b8a23f2e83a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove merged patch,
and AUTORECONF becomes useless.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-configure.ac-fix-static-build-with-hwloc.patch | 54 ----------------------
 package/htop/htop.hash                             |  4 +-
 package/htop/htop.mk                               |  3 +-
 3 files changed, 3 insertions(+), 58 deletions(-)

diff --git a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch b/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
deleted file mode 100644
index 0ac79766c5..0000000000
--- a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 4ccad4604586c921b4ad831b254496c2cdece9fc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 2 Apr 2022 17:27:01 +0200
-Subject: [PATCH] configure.ac: fix static build with hwloc
-
-Retrieve hwloc dependencies through pkg-config to avoid the following
-static build failure:
-
-checking for hwloc_get_proc_cpubind in -lhwloc... no
-configure: error: can not find required library libhwloc
-
-This build failure is raised because without pkg-config, hwloc
-dependencies such as libxml2 are not retrieved:
-
-configure:8999: checking for hwloc_get_proc_cpubind in -lhwloc
-configure:9022: /home/autobuild/autobuild/instance-0/output-1/host/bin/powerpc-buildroot-linux-uclibc-gcc -o conftest -D_GNU_SOURCE -I/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lhwloc  -llzma -L/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib -lncurses -lm   >&5
-/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib/libhwloc.a(topology-xml-libxml.o): in function `hwloc_libxml_free_buffer':
-topology-xml-libxml.c:(.text+0x6a): undefined reference to `xmlFree'
-
-Fixes:
- - http://autobuild.buildroot.org/results/5d815ec08c580005a863df6ac9ac29deff7d4128
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/htop-dev/htop/commit/4ccad4604586c921b4ad831b254496c2cdece9fc]
----
- configure.ac | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4ecac1ecf..6bb7eb69f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -456,8 +456,18 @@ case "$enable_hwloc" in
-    no)
-       ;;
-    yes)
--      AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
--      AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
-+      m4_ifdef([PKG_PROG_PKG_CONFIG], [
-+         PKG_PROG_PKG_CONFIG()
-+         PKG_CHECK_MODULES(HWLOC, hwloc, [
-+               CFLAGS="$CFLAGS $HWLOC_CFLAGS" LIBS="$LIBS $HWLOC_LIBS"
-+            ], [
-+               AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
-+               AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
-+            ])
-+         ], [
-+            AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
-+            AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
-+         ])
-       ;;
-    *)
-       AC_MSG_ERROR([bad value '$enable_hwloc' for --enable-hwloc])
diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index d7c39be4d0..908dd32c4d 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.1.2/htop-3.1.2.tar.xz.sha256
-sha256  884bce5b58cb113127860b9e368609019e92416a81550fdf0752052f3a64b388  htop-3.1.2.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.2.0/htop-3.2.0.tar.xz.sha256
+sha256  e0f645d4ac324f2c4c48aaa7a3a96d007b95516559550be0b56e423fc5b6d783  htop-3.2.0.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 1e7b171a17..f4d9032d4a 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.1.2
+HTOP_VERSION = 3.2.0
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-HTOP_AUTORECONF = YES
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
