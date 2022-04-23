Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6849CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24E8960F16;
	Sat, 23 Apr 2022 16:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBCmxUuVRcs2; Sat, 23 Apr 2022 16:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE37461083;
	Sat, 23 Apr 2022 16:35:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D965B1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA39960E43
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDQxigP45wRa for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D414560E00
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7F0687FB06; Sat, 23 Apr 2022 16:22:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:15:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c6e771475eb9b7a0dec1cb587ae39f807d36c87
X-Git-Newrev: 2945215624ec66b4d691be527561a4a5b64e7028
X-Patchwork-Hint: ignore
Message-Id: <20220423162249.7F0687FB06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erofs-utils: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=2945215624ec66b4d691be527561a4a5b64e7028
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch to disable -Werror and fix the following build
failure with gcc 4.8 raised since bump to version 1.4 in commit
c2e32e655802ad917eb240b8c2b7ac343ab55ec1 and
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=cf8be8a4352a5df3b3acf545af289cb47faa6de0:

In file included from /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/string.h:636:0,
                 from ../include/erofs/internal.h:242,
                 from ../include/erofs/inode.h:11,
                 from main.c:12:
In function 'memset',
    inlined from 'erofsdump_filetype_distribution.constprop.2' at main.c:583:9:
/home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/bits/string3.h:81:30: error: call to '__warn_memset_zero_len' declared with attribute warning: memset used with constant zero length parameter; this could be due to transposed parameters [-Werror]
       __warn_memset_zero_len ();
                              ^

Fixes:
 - http://autobuild.buildroot.org/results/4c776ec935bbb016231b6701471887a7c9ea79e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/erofs-utils/0005-Add-disable-werror.patch | 136 ++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/package/erofs-utils/0005-Add-disable-werror.patch b/package/erofs-utils/0005-Add-disable-werror.patch
new file mode 100644
index 0000000000..8b286c3265
--- /dev/null
+++ b/package/erofs-utils/0005-Add-disable-werror.patch
@@ -0,0 +1,136 @@
+From eb79816f85db164af732a5bcbb42d09214845874 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 21 Apr 2022 00:10:18 +0200
+Subject: erofs-utils: add --disable-werror
+
+Add an option to disable -Werror to fix the following build failure [1] with
+gcc 4.8 raised since version 1.4 and [2]
+
+In file included from /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/string.h:636:0,
+                 from ../include/erofs/internal.h:242,
+                 from ../include/erofs/inode.h:11,
+                 from main.c:12:
+In function 'memset',
+    inlined from 'erofsdump_filetype_distribution.constprop.2' at main.c:583:9:
+/home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/bits/string3.h:81:30: error: call to '__warn_memset_zero_len' declared with attribute warning: memset used with constant zero length parameter; this could be due to transposed parameters [-Werror]
+       __warn_memset_zero_len ();
+
+[1] http://autobuild.buildroot.org/results/4c776ec935bbb016231b6701471887a7c9ea79e9
+[2] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=cf8be8a4352a
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Link: https://lore.kernel.org/r/20220420221018.1396105-1-fontaine.fabrice@gmail.com
+Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+[Retrieved (and backported) from:
+https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?h=dev&id=eb79816f85db164af732a5bcbb42d09214845874]
+---
+ configure.ac     | 13 ++++++++++++-
+ dump/Makefile.am |  2 +-
+ fsck/Makefile.am |  2 +-
+ fuse/Makefile.am |  2 +-
+ lib/Makefile.am  |  2 +-
+ mkfs/Makefile.am |  2 +-
+ 6 files changed, 17 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fa917e6..53bf882 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -11,7 +11,7 @@ AC_CONFIG_SRCDIR([config.h.in])
+ AC_CONFIG_HEADERS([config.h])
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_AUX_DIR(config)
+-AM_INIT_AUTOMAKE([foreign -Wall -Werror])
++AM_INIT_AUTOMAKE([foreign -Wall])
+ 
+ # Checks for programs.
+ AM_PROG_AR
+@@ -65,6 +65,12 @@ AC_ARG_ENABLE([debug],
+     [enable_debug="$enableval"],
+     [enable_debug="no"])
+ 
++AC_ARG_ENABLE([werror],
++    [AS_HELP_STRING([--enable-werror],
++                    [enable -Werror @<:@default=no@:>@])],
++    [enable_werror="$enableval"],
++    [enable_werror="no"])
++
+ AC_ARG_ENABLE(lz4,
+    [AS_HELP_STRING([--disable-lz4], [disable LZ4 compression support @<:@default=enabled@:>@])],
+    [enable_lz4="$enableval"], [enable_lz4="yes"])
+@@ -197,6 +203,11 @@ AS_IF([test "x$enable_debug" != "xno"], [], [
+   CPPFLAGS="$CPPFLAGS -DNDEBUG"
+ ])
+ 
++# Configure -Werror
++AS_IF([test "x$enable_werror" != "xyes"], [], [
++  CPPFLAGS="$CPPFLAGS -Werror"
++])
++
+ # Configure libuuid
+ AS_IF([test "x$with_uuid" != "xno"], [
+   PKG_CHECK_MODULES([libuuid], [uuid])
+diff --git a/dump/Makefile.am b/dump/Makefile.am
+index 9f0cd3f..c2bef6d 100644
+--- a/dump/Makefile.am
++++ b/dump/Makefile.am
+@@ -5,6 +5,6 @@ AUTOMAKE_OPTIONS = foreign
+ bin_PROGRAMS     = dump.erofs
+ AM_CPPFLAGS = ${libuuid_CFLAGS}
+ dump_erofs_SOURCES = main.c
+-dump_erofs_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
++dump_erofs_CFLAGS = -Wall -I$(top_srcdir)/include
+ dump_erofs_LDADD = $(top_builddir)/lib/liberofs.la ${libselinux_LIBS} \
+ 	${libuuid_LIBS} ${liblz4_LIBS} ${liblzma_LIBS}
+diff --git a/fsck/Makefile.am b/fsck/Makefile.am
+index 55b31ea..e6a1fb6 100644
+--- a/fsck/Makefile.am
++++ b/fsck/Makefile.am
+@@ -5,6 +5,6 @@ AUTOMAKE_OPTIONS = foreign
+ bin_PROGRAMS     = fsck.erofs
+ AM_CPPFLAGS = ${libuuid_CFLAGS}
+ fsck_erofs_SOURCES = main.c
+-fsck_erofs_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
++fsck_erofs_CFLAGS = -Wall -I$(top_srcdir)/include
+ fsck_erofs_LDADD = $(top_builddir)/lib/liberofs.la ${libselinux_LIBS} \
+ 	${libuuid_LIBS} ${liblz4_LIBS} ${liblzma_LIBS}
+diff --git a/fuse/Makefile.am b/fuse/Makefile.am
+index 5aa5ac0..3179a2b 100644
+--- a/fuse/Makefile.am
++++ b/fuse/Makefile.am
+@@ -4,7 +4,7 @@ AUTOMAKE_OPTIONS = foreign
+ noinst_HEADERS = $(top_srcdir)/fuse/macosx.h
+ bin_PROGRAMS     = erofsfuse
+ erofsfuse_SOURCES = dir.c main.c
+-erofsfuse_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
++erofsfuse_CFLAGS = -Wall -I$(top_srcdir)/include
+ erofsfuse_CFLAGS += -DFUSE_USE_VERSION=26 ${libfuse_CFLAGS} ${libselinux_CFLAGS}
+ erofsfuse_LDADD = $(top_builddir)/lib/liberofs.la ${libfuse_LIBS} ${liblz4_LIBS} \
+ 	${libselinux_LIBS} ${liblzma_LIBS}
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 4a25013..3fad357 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -28,7 +28,7 @@ noinst_HEADERS += compressor.h
+ liberofs_la_SOURCES = config.c io.c cache.c super.c inode.c xattr.c exclude.c \
+ 		      namei.c data.c compress.c compressor.c zmap.c decompress.c \
+ 		      compress_hints.c hashmap.c sha256.c blobchunk.c
+-liberofs_la_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
++liberofs_la_CFLAGS = -Wall -I$(top_srcdir)/include
+ if ENABLE_LZ4
+ liberofs_la_CFLAGS += ${LZ4_CFLAGS}
+ liberofs_la_SOURCES += compressor_lz4.c
+diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
+index 2a4bc1d..709d9bf 100644
+--- a/mkfs/Makefile.am
++++ b/mkfs/Makefile.am
+@@ -4,6 +4,6 @@ AUTOMAKE_OPTIONS = foreign
+ bin_PROGRAMS     = mkfs.erofs
+ AM_CPPFLAGS = ${libuuid_CFLAGS} ${libselinux_CFLAGS}
+ mkfs_erofs_SOURCES = main.c
+-mkfs_erofs_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
++mkfs_erofs_CFLAGS = -Wall -I$(top_srcdir)/include
+ mkfs_erofs_LDADD = ${libuuid_LIBS} $(top_builddir)/lib/liberofs.la ${libselinux_LIBS} \
+ 	${liblz4_LIBS} ${liblzma_LIBS}
+-- 
+cgit 
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
