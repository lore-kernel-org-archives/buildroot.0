Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BC7C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 10:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E52812C9;
	Sun, 30 Oct 2022 10:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28E52812C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVYxkLd7nwYD; Sun, 30 Oct 2022 10:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD83812CE;
	Sun, 30 Oct 2022 10:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD83812CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B9651BF2B7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52F9440357
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52F9440357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0nF2PsDnCyJ for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 10:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD90C40285
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 10:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD90C40285
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C65DA8746C; Sun, 30 Oct 2022 10:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:51:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ce9af6ccfa3136e62d0c429adb38460bece058f
X-Git-Newrev: 952fa08764acc8d78985d2cc91d37112324b67cb
X-Patchwork-Hint: ignore
Message-Id: <20221030105150.C65DA8746C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/f2fs-tools: add lz4 and lzo
 optional dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=952fa08764acc8d78985d2cc91d37112324b67cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lz4 and lzo are optional dependencies (enabled by default) since bump to
version 1.14.0 in commit cf566658f28f3e4b362cc8f9235e6b7768af355c and
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=b585244e726c1024f7b842033689992a383808cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure-ac-fix-cross-compilation.patch  | 88 ++++++++++++++++++++++
 package/f2fs-tools/f2fs-tools.mk                   | 18 ++++-
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch b/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch
new file mode 100644
index 0000000000..0e3d4da191
--- /dev/null
+++ b/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch
@@ -0,0 +1,88 @@
+From 32e7d272344024c216f155c3463dd2d548f3fafd Mon Sep 17 00:00:00 2001
+From: Nick Hainke <vincent@systemli.org>
+Date: Mon, 4 Jul 2022 11:29:19 +0200
+Subject: configure.ac: fix cross compilation
+
+AC_CHECK_LIB seems to not work correctly with OpenWrt. Add possibility
+to disable lz4 and lzo2 manually.
+
+Fixes errors in the form of:
+  Package f2fsck is missing dependencies for the following libraries:
+  liblz4.so.1
+  liblzo2.so.2
+
+Signed-off-by: Nick Hainke <vincent@systemli.org>
+Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
+[Retrieved from:
+https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=32e7d272344024c216f155c3463dd2d548f3fafd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 44 ++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 34 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ea39461..dbe9ad3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -50,6 +50,18 @@ AC_ARG_WITH([blkid],
+ 	[],
+ 	[with_blkid=check])
+ 
++AC_ARG_WITH([lzo2],
++	[AS_HELP_STRING([--without-lzo2],
++	  [Ignore presence of liblzo2 and disable lzo2 support])],
++	[],
++	[with_lzo2=check])
++
++AC_ARG_WITH([lz4],
++	[AS_HELP_STRING([--without-lz4],
++	  [Ignore presence of liblz4 and disable lz4 support])],
++	[],
++	[with_lz4=check])
++
+ # Checks for programs.
+ AC_PROG_CC
+ AM_PROG_AR
+@@ -71,17 +83,29 @@ AS_IF([test "x$with_blkid" != xno],
+         fi
+ 	], -lblkid)])
+ 
+-AC_CHECK_LIB([lzo2], [main],
+-	[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
+-		AC_DEFINE([HAVE_LIBLZO2], [1],
+-		[Define if you have liblzo2])
+-	], [], [])
++AS_IF([test "x$with_lzo2" != xno],
++	[AC_CHECK_LIB([lzo2], [main],
++		[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
++			AC_DEFINE([HAVE_LIBLZO2], [1],
++			[Define if you have liblzo2])
++		],
++		[if test "x$with_lzo2" != xcheck; then
++			AC_MSG_FAILURE(
++                [--with-lzo2 was given, but test for lzo2 failed])
++        fi
++	], -llzo2)])
+ 
+-AC_CHECK_LIB([lz4], [main],
+-	[AC_SUBST([liblz4_LIBS], ["-llz4"])
+-		AC_DEFINE([HAVE_LIBLZ4], [1],
+-		[Define if you have liblz4])
+-	], [], [])
++AS_IF([test "x$with_lz4" != xno],
++	[AC_CHECK_LIB([lz4], [main],
++		[AC_SUBST([liblz4_LIBS], ["-llz4"])
++			AC_DEFINE([HAVE_LIBLZ4], [1],
++			[Define if you have liblz4])
++		],
++		[if test "x$with_lz4" != xcheck; then
++			AC_MSG_FAILURE(
++                [--with-lz4 was given, but test for lz4 failed])
++        fi
++	], -llz4)])
+ 
+ AS_IF([test "x$with_selinux" != xno],
+ 	[AC_CHECK_LIB([selinux], [getcon],
+-- 
+cgit 
+
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 2c4ee9185b..60f1004d77 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -22,6 +22,20 @@ else
 F2FS_TOOLS_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+F2FS_TOOLS_CONF_OPTS += --with-lz4
+F2FS_TOOLS_DEPENDENCIES += lz4
+else
+F2FS_TOOLS_CONF_OPTS += --without-lz4
+endif
+
+ifeq ($(BR2_PACKAGE_LZO),y)
+F2FS_TOOLS_CONF_OPTS += --with-lzo2
+F2FS_TOOLS_DEPENDENCIES += lzo
+else
+F2FS_TOOLS_CONF_OPTS += --without-lzo2
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
 # util-linux is a dependency already, no need to list it again
 F2FS_TOOLS_CONF_OPTS += --with-blkid
@@ -34,7 +48,9 @@ endif
 # blkid support even if we have host-util-linux
 HOST_F2FS_TOOLS_CONF_OPTS = \
 	--without-selinux \
-	--without-blkid
+	--without-blkid \
+	--without-lz4 \
+	--without-lzo2
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
