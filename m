Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BCAC6379F
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F8E94060D;
	Tue,  7 Feb 2023 17:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F8E94060D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jV4Cjiom70Gm; Tue,  7 Feb 2023 17:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 073D3408A3;
	Tue,  7 Feb 2023 17:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 073D3408A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A8881BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3194E81E92
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3194E81E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4X9ncHWXbynx for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:48:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CF3581E90
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF3581E90
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAF2D84323; Tue,  7 Feb 2023 17:48:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 18:38:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fbd2f6d2cf26225f73f584c3a0cacb1b2476f5f
X-Git-Newrev: 700fc2d7bdb53d33368046840ea91c6c4e6b12b0
X-Patchwork-Hint: ignore
Message-Id: <20230207174831.EAF2D84323@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: handle pkg-config in
 the Autotools standard way for nfsrahead
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

commit: https://git.buildroot.net/buildroot/commit/?id=700fc2d7bdb53d33368046840ea91c6c4e6b12b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While using the correct PKG_CHECK_MODULES() approach for libmount we
end up having host-nfs-utils needing libmount. But libmount is only
needed by nfsrahead that we don't need in host-nfs-utils. But we need
host-nfs-utils itself(rpcgen tool specifically) to build nfs-utils. To
solve this recursive situation:

1) Update the first patch with the upstreamed one that handles
   libmount using PKG_CHECK_MODULES().

2) Add another patch to allow to disable nfsrahead during building for
   host since this tool is not needed and requires libmount. This way
   the first patch approach can be correctly used.

3) Add --disable-nfsrahead to HOST_NFS_UTILS_CONF_OPTS

4) Remove en/disable-uuid since now it's required by default:
   http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=c5528f40f9db5061e06dcf1f9b7fce5185b376c6

Both patches have been committed:
https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=627c95b2b853161b359095e7fdf05d3b07d51379
https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=844d3ad5376603bc9c205a6084d38a2d25146179

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...fsrahead-fix-linking-while-static-linking.patch | 41 ++++++++-----
 ...figure.ac-allow-to-disable-nfsrahead-tool.patch | 68 ++++++++++++++++++++++
 package/nfs-utils/nfs-utils.mk                     |  7 +--
 3 files changed, 97 insertions(+), 19 deletions(-)

diff --git a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
index b8dcea63f7..e1d57f30cf 100644
--- a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
+++ b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
@@ -1,31 +1,46 @@
-From a69014a1b4e5b8068630abe3109f31eb64b6a076 Mon Sep 17 00:00:00 2001
+From d9abb221cea81dee5956bd987c6efa680c03571a Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 10 Aug 2022 00:10:51 +0200
+Date: Wed, 10 Aug 2022 23:38:17 +0200
 Subject: [PATCH] nfsrahead: fix linking while static linking
 
--lmount must preceed -lblkid and to obtain this let's add:
-`pkg-config --libs mount`
-in place of:
-`-lmount`
-This ways the library order will always be correct.
+-lmount must preceed -lblkid and to obtain this let's add in configure.ac:
+PKG_CHECK_MODULES([LIBMOUNT], [mount])
+and in tools/nfsrahead/Makefile.am let's substitute explicit `-lmount`
+with:
+$(LIBMOUNT_LIBS)
+This way all the required libraries will be present and in the right order
+when static linking.
 
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=627c95b2b853161b359095e7fdf05d3b07d51379]
 ---
-Pending Upstream:
-https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/
----
+ configure.ac                | 3 +++
  tools/nfsrahead/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ 2 files changed, 4 insertions(+), 1 deletion(-)
 
+diff --git a/configure.ac b/configure.ac
+index f1c46c5c..ff85200b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -273,6 +273,9 @@ AC_LIBCAP
+ dnl Check for -lxml2
+ AC_LIBXML2
+ 
++dnl Check for -lmount
++PKG_CHECK_MODULES([LIBMOUNT], [mount])
++
+ # Check whether user wants TCP wrappers support
+ AC_TCP_WRAPPERS
+ 
 diff --git a/tools/nfsrahead/Makefile.am b/tools/nfsrahead/Makefile.am
-index 845ea0d5..280a2eb4 100644
+index 845ea0d5..7e08233a 100644
 --- a/tools/nfsrahead/Makefile.am
 +++ b/tools/nfsrahead/Makefile.am
 @@ -1,6 +1,6 @@
  libexec_PROGRAMS = nfsrahead
  nfsrahead_SOURCES = main.c
 -nfsrahead_LDFLAGS= -lmount
-+nfsrahead_LDFLAGS= `pkg-config --libs mount`
++nfsrahead_LDFLAGS= $(LIBMOUNT_LIBS)
  nfsrahead_LDADD = ../../support/nfs/libnfsconf.la
  
  man5_MANS = nfsrahead.man
diff --git a/package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch b/package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch
new file mode 100644
index 0000000000..ee5e3fa251
--- /dev/null
+++ b/package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch
@@ -0,0 +1,68 @@
+From 9a0002978eb32b78d22f053302e012a4255dc4ef Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 19 Sep 2022 23:43:28 +0200
+Subject: [PATCH] configure.ac: allow to disable nfsrahead tool
+
+This allows to make libmount not mandatory but depending on nfsrahead
+since it only requires it. This is useful when cross-compiling because
+in that case we need rpcgen only built for host but not nfsrahead that
+also require libmount. So this reduces the dependencies for host
+building.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=844d3ad5376603bc9c205a6084d38a2d25146179]
+---
+ configure.ac      | 13 ++++++++++---
+ tools/Makefile.am |  6 +++++-
+ 2 files changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ff85200b..5d9cbf31 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -249,6 +249,16 @@ AC_ARG_ENABLE(nfsdcld,
+ 	enable_nfsdcld=$enableval,
+ 	enable_nfsdcld="yes")
+ 
++AC_ARG_ENABLE(nfsrahead,
++	[AS_HELP_STRING([--disable-nfsrahead],[disable nfsrahead command @<:@default=no@:>@])],
++	enable_nfsrahead=$enableval,
++	enable_nfsrahead="yes")
++	AM_CONDITIONAL(CONFIG_NFSRAHEAD, [test "$enable_nfsrahead" = "yes" ])
++	if test "$enable_nfsrahead" = yes; then
++		dnl Check for -lmount
++		PKG_CHECK_MODULES([LIBMOUNT], [mount])
++	fi
++
+ AC_ARG_ENABLE(nfsdcltrack,
+ 	[AS_HELP_STRING([--disable-nfsdcltrack],[disable NFSv4 clientid tracking programs @<:@default=no@:>@])],
+ 	enable_nfsdcltrack=$enableval,
+@@ -273,9 +283,6 @@ AC_LIBCAP
+ dnl Check for -lxml2
+ AC_LIBXML2
+ 
+-dnl Check for -lmount
+-PKG_CHECK_MODULES([LIBMOUNT], [mount])
+-
+ # Check whether user wants TCP wrappers support
+ AC_TCP_WRAPPERS
+ 
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 40c17c37..48fd0cdf 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -12,6 +12,10 @@ if CONFIG_NFSDCLD
+ OPTDIRS += nfsdclddb
+ endif
+ 
+-SUBDIRS = locktest rpcdebug nlmtest mountstats nfs-iostat rpcctl nfsdclnts nfsrahead $(OPTDIRS)
++if CONFIG_NFSRAHEAD
++OPTDIRS += nfsrahead
++endif
++
++SUBDIRS = locktest rpcdebug nlmtest mountstats nfs-iostat rpcctl nfsdclnts $(OPTDIRS)
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+-- 
+2.34.1
+
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index ed205a26b1..1a4a99f566 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -34,6 +34,7 @@ HOST_NFS_UTILS_CONF_OPTS = \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--disable-caps \
+	--disable-nfsrahead \
 	--without-systemd \
 	--with-rpcgen=internal \
 	--with-tirpcinclude=$(HOST_DIR)/include/tirpc
@@ -68,12 +69,6 @@ else
 NFS_UTILS_CONF_OPTS += --disable-caps
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
-NFS_UTILS_CONF_OPTS += --enable-uuid
-else
-NFS_UTILS_CONF_OPTS += --disable-uuid
-endif
-
 define NFS_UTILS_INSTALL_FIXUP
 	cd $(TARGET_DIR) && rm -f $(NFS_UTILS_TARGETS_)
 	touch $(TARGET_DIR)/etc/exports
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
