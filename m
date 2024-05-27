Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C8EC25B7C
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 06:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A233E608A2;
	Mon, 27 May 2024 06:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNoy4zyDuTqU; Mon, 27 May 2024 06:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8B5960887
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8B5960887;
	Mon, 27 May 2024 06:03:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 774841D1879
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDE31404D5
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbTyi9rRTa_F for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 06:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B770405BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B770405BE
 for <buildroot@buildroot.org>; Mon, 27 May 2024 06:03:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0223F87634; Mon, 27 May 2024 06:03:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 07:58:58 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 47bc873569d40d776093750dff5646abb686a3b3
X-Git-Newrev: 40205fa62b4fa578b9158810c0681f665142fb2f
X-Patchwork-Hint: ignore
Message-Id: <20240527060333.0223F87634@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/oprofile: fix
 static build with binutils >= 2.40
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

commit: https://git.buildroot.net/buildroot/commit/?id=40205fa62b4fa578b9158810c0681f665142fb2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

sframe library was added by binutils 2.40 and
https://github.com/bminor/binutils-gdb/commit/19e559f1c91bfaedbd2f91d85ee161f3f03fda3c
resulting in the following static build failure:

/home/buildroot/autobuild/run/instance-1/output-1/build/binutils-2.41/bfd/elf-sframe.c:220: undefined reference to `sframe_decode'

[...]

configure: error: bfd library not found

Fixes:
 - http://autobuild.buildroot.org/results/a9f3e09e6543b3773440c011e93bd41e357691e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5272c6bea1247e87a32947bd960757a19fdf8b90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix-static-build-with-binutils-2.40.patch | 62 ++++++++++++++++++++++
 package/oprofile/oprofile.mk                       |  7 +++
 2 files changed, 69 insertions(+)

diff --git a/package/oprofile/0002-fix-static-build-with-binutils-2.40.patch b/package/oprofile/0002-fix-static-build-with-binutils-2.40.patch
new file mode 100644
index 0000000000..3134363abc
--- /dev/null
+++ b/package/oprofile/0002-fix-static-build-with-binutils-2.40.patch
@@ -0,0 +1,62 @@
+From 1e4cd78bca2bd6e0d17b6cb9caf1b172d7bac564 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 6 May 2024 08:41:49 +0200
+Subject: [PATCH] fix static build with binutils >= 2.40
+
+sframe library was added by binutils 2.40 and
+https://github.com/bminor/binutils-gdb/commit/19e559f1c91bfaedbd2f91d85ee161f3f03fda3c
+resulting in the following static build failure:
+
+/home/buildroot/autobuild/run/instance-1/output-1/build/binutils-2.41/bfd/elf-sframe.c:220: undefined reference to `sframe_decode'
+
+[...]
+
+configure: error: bfd library not found
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a9f3e09e6543b3773440c011e93bd41e357691e4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://sourceforge.net/p/oprofile/bugs/295
+---
+ configure.ac   | 2 +-
+ m4/binutils.m4 | 7 +++++--
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index dc447f89..72ef0a21 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -334,7 +334,7 @@ AX_CHECK_DOCBOOK
+ dnl finally restore the original libs setting
+ LIBS="$ORIG_SAVE_LIBS"
+ LIBERTY_LIBS="-liberty $DL_LIB $INTL_LIB"
+-BFD_LIBS="-lbfd -liberty $DL_LIB $INTL_LIB $Z_LIB"
++BFD_LIBS="-lbfd -liberty $DL_LIB $INTL_LIB $SFRAME_LIB $Z_LIB"
+ POPT_LIBS="-lpopt"
+ AC_SUBST(LIBERTY_LIBS)
+ AC_SUBST(BFD_LIBS)
+diff --git a/m4/binutils.m4 b/m4/binutils.m4
+index c50e2f3c..e1ccd8e7 100644
+--- a/m4/binutils.m4
++++ b/m4/binutils.m4
+@@ -10,11 +10,14 @@ AC_CHECK_FUNCS(xmemdup)
+ AC_CHECK_LIB(dl, dlopen, LIBS="$LIBS -ldl"; DL_LIB="-ldl", DL_LIB="")
+ AC_CHECK_LIB(intl, main, LIBS="$LIBS -lintl"; INTL_LIB="-lintl", INTL_LIB="")
+ 
+-AC_CHECK_LIB(bfd, bfd_openr, LIBS="-lbfd $LIBS"; Z_LIB="",
++AC_CHECK_LIB(bfd, bfd_openr, LIBS="-lbfd $LIBS"; SFRAME_LIB=""; Z_LIB="",
+ 	[AC_CHECK_LIB(z, compress,
+ dnl Use a different bfd function here so as not to use cached result from above
+ 		[AC_CHECK_LIB(bfd, bfd_fdopenr, LIBS="-lbfd -lz $LIBS"; Z_LIB="-lz",
+-			[AC_MSG_ERROR([bfd library not found])], -lz)
++dnl Use a different bfd function here so as not to use cached result from above
++			[AC_CHECK_LIB(bfd, bfd_close, LIBS="-lbfd -lsframe -lz $LIBS"; SFRAME_LIB="-lsframe"; Z_LIB="-lz",
++				[AC_MSG_ERROR([bfd library not found])], -lsframe -lz)
++			], -lz)
+ 		],
+ 		[AC_MSG_ERROR([libz library not found; required by libbfd])])
+ 	]
+-- 
+2.43.0
+
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 512fbf9ea1..590e63b4ac 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -12,6 +12,13 @@ OPROFILE_CPE_ID_VENDOR = maynard_johnson
 OPROFILE_CONF_OPTS = \
 	--disable-account-check \
 	--with-kernel=$(STAGING_DIR)/usr
+# 0002-fix-static-build-with-binutils-2.40.patch
+OPROFILE_AUTORECONF = YES
+
+define OPROFILE_CREATE_MISSING_FILES
+	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/ChangeLog
+endef
+OPROFILE_POST_EXTRACT_HOOKS += OPROFILE_CREATE_MISSING_FILES
 
 OPROFILE_DEPENDENCIES = popt binutils host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
