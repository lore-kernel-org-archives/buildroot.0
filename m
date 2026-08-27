Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD2CC61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 20:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFABB60648;
	Thu, 27 Aug 2026 20:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwDv-sDqTJPi; Thu, 27 Aug 2026 20:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787862381;
	bh=M4ogEuAYBragwLDbh+/3Zg+Q4JBKitLfkxNgh3uffWk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iOLqnbiIL244oGW0NuPkjd8Kvflv0xtW15bIk7tBLCcpJZyGM9J3rHqjXRdvqUqZO
	 qplnl7rDzB0ic3eic0sI5hNaRc33GrrQc1/1VA2JfxN/zc6Uopex/Aq3X4zgtoHiNy
	 pOSnmAWYVrirzg4Kk3uIjCjVLeX6msRm7I7HsZDh1lH6yXF1uXAeF1VLn/5pqHRyaj
	 igq46UEUleaDbOSi73WQppjTGckeM2xhd6pfypgJpNyi3qTS58KqnRHhRgLCE4eT4F
	 KI0RGILsWJfUmIxEu9VOnbpz3iU0LMFCE5l+iLrwNlS0MhT2AewdTQajAfcKi9d7x3
	 fDKKOQnnfh4HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2487A60663;
	Thu, 27 Aug 2026 20:26:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2087334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88C6B80ED9
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXBKOP6FJrg6 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 20:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D5A80EDB
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:26:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EF4A920E2; Thu, 27 Aug 2026 20:25:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 22:23:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 240ea08d3f1568b463a9bce09da524bbf42e6b99
X-Git-Newrev: 7538f675d7024ec1f83086e39a40469098e59955
X-Patchwork-Hint: ignore
Message-Id: <20260827202521.9EF4A920E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: fix build with old host GCC
 since autoconf bump
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7538f675d7024ec1f83086e39a40469098e59955
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the bump of autoconf to version 2.73 in Buildroot commit, the
build of target bind fails if the host compiler is too old, because
the bind build system tries to use -std=gnu23 when building host tools
which isn't supported by older GCC releases, causing:

checking whether the C compiler works... no
configure: error: in '/home/thomas/autobuild/instance-2/output-1/build/bind-9.20.26':
configure: error: C compiler cannot create executables
See 'config.log' for more details
make: *** [package/pkg-generic.mk:263: /home/thomas/autobuild/instance-2/output-1/build/bind-9.20.26/.stamp_configured] Error 77

To fix this, we backport a number of patches from autoconf-archive, to
fix the m4/ax_prog_cc_for_build.m4 macro file, so that it works with
autoconf 2.73.

OpenEmbedded has a similar fix:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
but did not backport as carefully the autoconf-archive commits (and
their commit message reverts to sudo).

The patches can be dropped when we update to a newer version of bind
that itself has an updated copy of the m4/ax_prog_cc_for_build.m4
file.

Fixes:

  https://autobuild.buildroot.net/results/13e07755101b7cae2f84eef173ef752f92842e71/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...for_build-Properly-restore-ac_cv_c_compil.patch |  41 +++++++
 .../bind/0002-Fix-typos-found-by-codespell.patch   |  38 ++++++
 ...for_build-Fix-BUILD_-EXE-OBJ-EXT-for-Auto.patch | 131 +++++++++++++++++++++
 ...for_build-Tweak-ac_cv_c_compiler_gnu-code.patch |  93 +++++++++++++++
 ...for_build-Fix-ac_cv_prog_cc_c-99-11-regre.patch |  57 +++++++++
 ...for_build-Support-ac_-cv_-build_prog_cc_s.patch |  62 ++++++++++
 6 files changed, 422 insertions(+)

diff --git a/package/bind/0001-ax_prog_cc_for_build-Properly-restore-ac_cv_c_compil.patch b/package/bind/0001-ax_prog_cc_for_build-Properly-restore-ac_cv_c_compil.patch
new file mode 100644
index 0000000000..23560a002e
--- /dev/null
+++ b/package/bind/0001-ax_prog_cc_for_build-Properly-restore-ac_cv_c_compil.patch
@@ -0,0 +1,41 @@
+From 2755b093cd69fb980ecb22d905cc6658c895d44a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ondr=CC=8Cej=20Sury=CC=81?= <ondrej@isc.org>
+Date: Tue, 26 Apr 2022 15:24:18 +0200
+Subject: [PATCH] ax_prog_cc_for_build: Properly restore ac_cv_c_compiler_gnu
+
+The ac_cv_c_compiler_gnu wasn't properly restored to original
+state (f.e. yes), but value of the "save" variable was used:
+
+ac_cv_c_compiler_gnu=${ac_cv_c_compiler_gnu=saved_ac_cv_c_compiler_gnu}
+
+Additionally, we don't need to cache the saved_ac_cv_c_compiler_gnu
+and was_set_ac_cv_c_compiler_gnu, so remove the ac_cv_ from their names.
+
+This would not manifest on a single run, but any repeated run with cache
+file (./configure -C) would be broken.
+
+Upstream: https://github.com/autoconf-archive/autoconf-archive/commit/13018ae91007cfa1b1a3877db8ef5cb233af1ae6
+[Thomas: partial backport only. Most of the commit is already in bind,
+except the serial number update, which is needed for follow-up commits
+to apply cleanly]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index f6518db..1db8d73 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -32,7 +32,7 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 20
++#serial 21
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+-- 
+2.55.0
+
diff --git a/package/bind/0002-Fix-typos-found-by-codespell.patch b/package/bind/0002-Fix-typos-found-by-codespell.patch
new file mode 100644
index 0000000000..1cbb5eac29
--- /dev/null
+++ b/package/bind/0002-Fix-typos-found-by-codespell.patch
@@ -0,0 +1,38 @@
+From ce23f1b3db8be19ca74589958a9af56c3ee888d0 Mon Sep 17 00:00:00 2001
+From: Dimitri Papadopoulos
+ <3234522+DimitriPapadopoulos@users.noreply.github.com>
+Date: Mon, 25 Dec 2023 13:04:00 +0100
+Subject: [PATCH] Fix typos found by codespell
+
+Upstream: https://github.com/autoconf-archive/autoconf-archive/commit/7d383b7aea765a8bc557ec6e88461c6da2db034e
+[Thomas: partial backport, only changes to ax_prog_cc_for_build.m4 were kept]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 1db8d73..2f44436 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -32,7 +32,7 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 21
++#serial 22
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+@@ -141,7 +141,7 @@ popdef([ac_cv_prog_gcc])dnl
+ popdef([ac_cv_prog_CPP])dnl
+ 
+ dnl restore global variables ac_ext, ac_cpp, ac_compile,
+-dnl ac_link, ac_compiler_gnu (dependant on the current
++dnl ac_link, ac_compiler_gnu (dependent on the current
+ dnl language after popping):
+ AC_LANG_POP([C])
+ 
+-- 
+2.55.0
+
diff --git a/package/bind/0003-ax_prog_cc_for_build-Fix-BUILD_-EXE-OBJ-EXT-for-Auto.patch b/package/bind/0003-ax_prog_cc_for_build-Fix-BUILD_-EXE-OBJ-EXT-for-Auto.patch
new file mode 100644
index 0000000000..92f10a883e
--- /dev/null
+++ b/package/bind/0003-ax_prog_cc_for_build-Fix-BUILD_-EXE-OBJ-EXT-for-Auto.patch
@@ -0,0 +1,131 @@
+From 13a06f535e2bf7176b0adf6a0d92dc40731275b0 Mon Sep 17 00:00:00 2001
+From: Kang-Che Sung <explorer09@gmail.com>
+Date: Wed, 16 Oct 2024 21:54:20 +0800
+Subject: [PATCH] ax_prog_cc_for_build: Fix BUILD_{EXE,OBJ}EXT for Autoconf
+ 2.70
+
+Autoconf 2.70 introduced a change in AC_SUBST behavior that the variable
+name in AC_SUBST no longer gets macro expanded. This breaks the rename
+syntaxes of BUILD_EXEEXT and BUILD_OBJEXT in AX_PROG_CC_FOR_BUILD.
+Change to an alternative approach of assigning BUILD_EXEEXT and
+BUILD_OBJEXT manually. The values of EXEEXT and OBJEXT have to be fixed
+too at the end of the AX_PROG_CC_FOR_BUILD code.
+
+Upstream: https://github.com/autoconf-archive/autoconf-archive/commit/6702aeaa9c824d463c3f31d5c31c5eff2646f552
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 40 +++++++++++++++++++++++++++-----------
+ 1 file changed, 29 insertions(+), 11 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 2f44436..22e02d5 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -32,7 +32,7 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 22
++#serial 23
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+@@ -51,8 +51,6 @@ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
+ pushdef([ac_cv_c_compiler_gnu], ac_cv_build_c_compiler_gnu)dnl
+-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
+-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
+ pushdef([ac_exeext], ac_build_exeext)dnl
+ pushdef([ac_objext], ac_build_objext)dnl
+ pushdef([CC], CC_FOR_BUILD)dnl
+@@ -60,9 +58,7 @@ pushdef([CPP], CPP_FOR_BUILD)dnl
+ pushdef([GCC], GCC_FOR_BUILD)dnl
+ pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
+ pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
+-pushdef([EXEEXT], BUILD_EXEEXT)dnl
+ pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
+-pushdef([OBJEXT], BUILD_OBJEXT)dnl
+ pushdef([host], build)dnl
+ pushdef([host_alias], build_alias)dnl
+ pushdef([host_cpu], build_cpu)dnl
+@@ -77,6 +73,24 @@ pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
+ pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencies_compiler_type)dnl
+ pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
+ pushdef([cross_compiling], cross_compiling_build)dnl
++dnl
++dnl These variables are problematic to rename by M4 macros, so we save
++dnl their values in alternative names, and restore the values later.
++dnl
++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
++dnl variables. It's not a good idea to rename ac_cv_exeext and
++dnl ac_cv_objext either as they're related.
++dnl Renaming ac_exeext and ac_objext is safe though.
++dnl
++ac_cv_host_exeext=$ac_cv_exeext
++AS_VAR_SET_IF([ac_cv_build_exeext],
++  [ac_cv_exeext=$ac_cv_build_exeext],
++  [AS_UNSET([ac_cv_exeext])])
++ac_cv_host_objext=$ac_cv_objext
++AS_VAR_SET_IF([ac_cv_build_objext],
++  [ac_cv_objext=$ac_cv_build_objext],
++  [AS_UNSET([ac_cv_objext])])
+ 
+ cross_compiling_build=no
+ 
+@@ -104,6 +118,9 @@ _AC_COMPILER_EXEEXT
+ _AC_COMPILER_OBJEXT
+ AC_PROG_CPP
+ 
++BUILD_EXEEXT=$ac_cv_exeext
++BUILD_OBJEXT=$ac_cv_objext
++
+ dnl Restore the old definitions
+ dnl
+ popdef([cross_compiling])dnl
+@@ -120,9 +137,7 @@ popdef([host_vendor])dnl
+ popdef([host_cpu])dnl
+ popdef([host_alias])dnl
+ popdef([host])dnl
+-popdef([OBJEXT])dnl
+ popdef([LDFLAGS])dnl
+-popdef([EXEEXT])dnl
+ popdef([CPPFLAGS])dnl
+ popdef([CFLAGS])dnl
+ popdef([GCC])dnl
+@@ -130,8 +145,6 @@ popdef([CPP])dnl
+ popdef([CC])dnl
+ popdef([ac_objext])dnl
+ popdef([ac_exeext])dnl
+-popdef([ac_cv_objext])dnl
+-popdef([ac_cv_exeext])dnl
+ popdef([ac_cv_c_compiler_gnu])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+@@ -139,6 +152,11 @@ popdef([ac_cv_prog_cc_works])dnl
+ popdef([ac_cv_prog_cc_c89])dnl
+ popdef([ac_cv_prog_gcc])dnl
+ popdef([ac_cv_prog_CPP])dnl
++dnl
++ac_cv_exeext=$ac_cv_host_exeext
++EXEEXT=$ac_cv_host_exeext
++ac_cv_objext=$ac_cv_host_objext
++OBJEXT=$ac_cv_host_objext
+ 
+ dnl restore global variables ac_ext, ac_cpp, ac_compile,
+ dnl ac_link, ac_compiler_gnu (dependent on the current
+@@ -147,8 +165,8 @@ AC_LANG_POP([C])
+ 
+ dnl Finally, set Makefile variables
+ dnl
+-AC_SUBST(BUILD_EXEEXT)dnl
+-AC_SUBST(BUILD_OBJEXT)dnl
++AC_SUBST([BUILD_EXEEXT])dnl
++AC_SUBST([BUILD_OBJEXT])dnl
+ AC_SUBST([CFLAGS_FOR_BUILD])dnl
+ AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
+ AC_SUBST([LDFLAGS_FOR_BUILD])dnl
+-- 
+2.55.0
+
diff --git a/package/bind/0004-ax_prog_cc_for_build-Tweak-ac_cv_c_compiler_gnu-code.patch b/package/bind/0004-ax_prog_cc_for_build-Tweak-ac_cv_c_compiler_gnu-code.patch
new file mode 100644
index 0000000000..517687865d
--- /dev/null
+++ b/package/bind/0004-ax_prog_cc_for_build-Tweak-ac_cv_c_compiler_gnu-code.patch
@@ -0,0 +1,93 @@
+From 9ee4288eec9a850730419064a6e8fb1b5c3e3883 Mon Sep 17 00:00:00 2001
+From: Kang-Che Sung <explorer09@gmail.com>
+Date: Wed, 16 Oct 2024 21:55:04 +0800
+Subject: [PATCH] ax_prog_cc_for_build: Tweak ac_cv_c_compiler_gnu code
+
+Adjust the code of setting ac_cv_c_compiler_gnu to align with the code
+of ac_cv_exeext and ac_cv_objext. The solution is now permanent rather
+than just a workaround.
+
+Upstream: https://github.com/autoconf-archive/autoconf-archive/commit/55aac85bdf705fd8f0a6b0fab1f0638052400f8f
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 28 +++++++++++-----------------
+ 1 file changed, 11 insertions(+), 17 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 22e02d5..9001fb4 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -32,7 +32,7 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 23
++#serial 24
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+@@ -50,7 +50,6 @@ pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
+-pushdef([ac_cv_c_compiler_gnu], ac_cv_build_c_compiler_gnu)dnl
+ pushdef([ac_exeext], ac_build_exeext)dnl
+ pushdef([ac_objext], ac_build_objext)dnl
+ pushdef([CC], CC_FOR_BUILD)dnl
+@@ -91,6 +90,14 @@ ac_cv_host_objext=$ac_cv_objext
+ AS_VAR_SET_IF([ac_cv_build_objext],
+   [ac_cv_objext=$ac_cv_build_objext],
+   [AS_UNSET([ac_cv_objext])])
++dnl
++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
++dnl AC_PROG_CC) indirectly.
++dnl
++ac_cv_host_c_compiler_gnu=$ac_cv_c_compiler_gnu
++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
++  [ac_cv_c_compiler_gnu=$ac_cv_build_c_compiler_gnu],
++  [AS_UNSET([ac_cv_c_compiler_gnu])])
+ 
+ cross_compiling_build=no
+ 
+@@ -99,21 +106,7 @@ AS_IF([test -n "$build"],      [ac_build_tool_prefix="$build-"],
+       [test -n "$build_alias"],[ac_build_tool_prefix="$build_alias-"])
+ 
+ AC_LANG_PUSH([C])
+-
+-dnl The pushdef([ac_cv_c_compiler_gnu], ...) currently does not cover
+-dnl the use of this variable in _AC_LANG_COMPILER_GNU called by
+-dnl AC_PROG_CC. Unset this cache variable temporarily as a workaround.
+-was_set_c_compiler_gnu=${[ac_cv_c_compiler_gnu]+y}
+-AS_IF([test ${was_set_c_compiler_gnu}],
+-    [saved_c_compiler_gnu=$[ac_cv_c_compiler_gnu]
+-    AS_UNSET([[ac_cv_c_compiler_gnu]])])
+-
+ AC_PROG_CC
+-
+-dnl Restore ac_cv_c_compiler_gnu
+-AS_IF([test ${was_set_c_compiler_gnu}],
+-  [[ac_cv_c_compiler_gnu]=$[saved_c_compiler_gnu]])
+-
+ _AC_COMPILER_EXEEXT
+ _AC_COMPILER_OBJEXT
+ AC_PROG_CPP
+@@ -145,7 +138,6 @@ popdef([CPP])dnl
+ popdef([CC])dnl
+ popdef([ac_objext])dnl
+ popdef([ac_exeext])dnl
+-popdef([ac_cv_c_compiler_gnu])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+ popdef([ac_cv_prog_cc_works])dnl
+@@ -157,6 +149,8 @@ ac_cv_exeext=$ac_cv_host_exeext
+ EXEEXT=$ac_cv_host_exeext
+ ac_cv_objext=$ac_cv_host_objext
+ OBJEXT=$ac_cv_host_objext
++ac_cv_c_compiler_gnu=$ac_cv_host_c_compiler_gnu
++ac_compiler_gnu=$ac_cv_host_c_compiler_gnu
+ 
+ dnl restore global variables ac_ext, ac_cpp, ac_compile,
+ dnl ac_link, ac_compiler_gnu (dependent on the current
+-- 
+2.55.0
+
diff --git a/package/bind/0005-ax_prog_cc_for_build-Fix-ac_cv_prog_cc_c-99-11-regre.patch b/package/bind/0005-ax_prog_cc_for_build-Fix-ac_cv_prog_cc_c-99-11-regre.patch
new file mode 100644
index 0000000000..4f46e66c1e
--- /dev/null
+++ b/package/bind/0005-ax_prog_cc_for_build-Fix-ac_cv_prog_cc_c-99-11-regre.patch
@@ -0,0 +1,57 @@
+From 205b621a9b01bd05921a5795d6b64b24f87377c7 Mon Sep 17 00:00:00 2001
+From: Kang-Che Sung <explorer09@gmail.com>
+Date: Wed, 16 Oct 2024 21:55:25 +0800
+Subject: [PATCH] ax_prog_cc_for_build: Fix ac_cv_prog_cc_c{99,11} regression
+
+Fix regression where the ac_cv_prog_cc_c99 and ac_cv_prog_cc_c11 macros
+are not popped after the AX_PROG_CC_FOR_BUILD call. This can cause
+subsequents calls of AC_PROG_CC to use wrong cache variables to
+indicate C standard support.
+
+(Regression from serial 19 (16790f97456a6c9b4319dd6ef7b73c9ebc8cae84).
+Note: It's unlikely for projects to call AC_PROG_CC again after
+AX_PROG_CC_FOR_BUILD, but such usage is valid.)
+
+Upstream: https://github.com/autoconf-archive/autoconf-archive/commit/12ab63676b4bad9481cf36c119c1c4ffab0c0bc2
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 9001fb4..fd9b953 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -32,7 +32,7 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 24
++#serial 25
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+@@ -43,10 +43,10 @@ AC_REQUIRE([AC_CANONICAL_BUILD])dnl
+ dnl Use the standard macros, but make them use other variable names
+ dnl
+ pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
++pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
+ pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
+ pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
+ pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
+-pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
+@@ -141,6 +141,8 @@ popdef([ac_exeext])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+ popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_c11])dnl
++popdef([ac_cv_prog_cc_c99])dnl
+ popdef([ac_cv_prog_cc_c89])dnl
+ popdef([ac_cv_prog_gcc])dnl
+ popdef([ac_cv_prog_CPP])dnl
+-- 
+2.55.0
+
diff --git a/package/bind/0006-ax_prog_cc_for_build-Support-ac_-cv_-build_prog_cc_s.patch b/package/bind/0006-ax_prog_cc_for_build-Support-ac_-cv_-build_prog_cc_s.patch
new file mode 100644
index 0000000000..fafcba10e0
--- /dev/null
+++ b/package/bind/0006-ax_prog_cc_for_build-Support-ac_-cv_-build_prog_cc_s.patch
@@ -0,0 +1,62 @@
+From 00d6e2057fe3fa1f2b74c76605a09b227b7a1af9 Mon Sep 17 00:00:00 2001
+From: Kang-Che Sung <explorer09@gmail.com>
+Date: Wed, 16 Oct 2024 21:56:44 +0800
+Subject: [PATCH] ax_prog_cc_for_build: Support ac_{,cv_}build_prog_cc_stdc
+
+Improve compatibility with Autoconf 2.70 and later. Add support for
+these variables for indicating build compiler capabilities:
+* ac_cv_build_prog_cc_stdc (corresponding to ac_cv_prog_cc_stdc;
+  Autoconf 2.70)
+* ac_build_prog_cc_stdc (corresponding to ac_prog_cc_stdc;
+  Autoconf 2.70)
+* ac_cv_build_prog_cc_c23 (corresponding to ac_cv_prog_cc_c23;
+  Autoconf 2.73)
+
+Upstream: https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96721f516fef4226e5eca8da341159765
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index fd9b953..4d1de99 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -32,7 +32,7 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 25
++#serial 26
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+@@ -47,9 +47,12 @@ pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
+ pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
+ pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
+ pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
+ pushdef([ac_exeext], ac_build_exeext)dnl
+ pushdef([ac_objext], ac_build_objext)dnl
+ pushdef([CC], CC_FOR_BUILD)dnl
+@@ -138,9 +141,12 @@ popdef([CPP])dnl
+ popdef([CC])dnl
+ popdef([ac_objext])dnl
+ popdef([ac_exeext])dnl
++popdef([ac_prog_cc_stdc])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+ popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_stdc])dnl
++popdef([ac_cv_prog_cc_c23])dnl
+ popdef([ac_cv_prog_cc_c11])dnl
+ popdef([ac_cv_prog_cc_c99])dnl
+ popdef([ac_cv_prog_cc_c89])dnl
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
