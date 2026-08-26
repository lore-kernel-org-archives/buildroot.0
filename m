Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A2BC61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF9040383;
	Wed, 26 Aug 2026 21:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyAypnUa3TN5; Wed, 26 Aug 2026 21:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787780844;
	bh=4TjIKDFJI8dYCJxkcC40JmOEourrGZFONV/fOznXrAI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LpeSwxdcpdnqegeQiTDthYnyRwJJruzRxHNvUn0/HSCaqdujh/FopaZ8F96kQ9JD+
	 Fq1Rd1O2prqfN3yZ5SzNwTlL2oSG4k9nbvQJ6lHwNN/K8AuOCXPgXOeQw8sL+m707f
	 CJrMGGKqwTUyX+KUnoW9q1cFkU1sYdMcX6Ki023tKnwVvxo+qwpMI5MVQwtPjNc6UH
	 M6m8epNQud96PwCFu+hCMR9mbo6Nbv03ZgzLatWABH2kWvAb2IVuG8Ho2SNTb/HSuD
	 fYsmGl9NYkYv6X1/3LQ7ZkRwCEwkG7ooDVF0yXiqycdN+QobU4cypO2NJrs2q7dZ58
	 bQFnf3WYFtKow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91C30403BD;
	Wed, 26 Aug 2026 21:47:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C31E4230
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4B2C403BD
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mw2jblN3uYnN for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8405F40383
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:47:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45F37920E5; Wed, 26 Aug 2026 21:46:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 23:44:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f57da3c953dcdf32e3468362358e482536e309f5
X-Git-Newrev: d21a1ac8868fa6360a123684e21d5cfc772477ae
X-Patchwork-Hint: ignore
Message-Id: <20260826214625.45F37920E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flex: fix build with old host GCC
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d21a1ac8868fa6360a123684e21d5cfc772477ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the bump of autoconf to version 2.73 in Buildroot commit [1], the
build of target flex fails if the host compiler is too old, because
the flex build system tries to use -std=gnu23 which isn't supported by
older GCC releases, causing:

gcc: error: unrecognized command-line option '-std=gnu23'; did you mean '-std=gnu2x'?
gcc: error: unrecognized command-line option '-std=gnu23'; did you mean '-std=gnu2x'?
make[3]: *** [Makefile:1162: stage1flex-buf.o] Error 1

(Indeed the *target* flex package does build some host tools using the
host GCC compiler.)

To fix this issue, we backport an upstream commit that isn't yet in
any flex release.

Fixes:

  https://autobuild.buildroot.net/results/aac730b57adb5b54964f1054de781750952ef7d4/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a6e8c07a330a389e9578d8f1110e41becac264d2

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: add link to commit]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...e-AX_PROG_CC_FOR_BUILD-to-fix-BUILD_EXEEX.patch | 184 +++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/package/flex/0005-build-Update-AX_PROG_CC_FOR_BUILD-to-fix-BUILD_EXEEX.patch b/package/flex/0005-build-Update-AX_PROG_CC_FOR_BUILD-to-fix-BUILD_EXEEX.patch
new file mode 100644
index 0000000000..c3a90637b9
--- /dev/null
+++ b/package/flex/0005-build-Update-AX_PROG_CC_FOR_BUILD-to-fix-BUILD_EXEEX.patch
@@ -0,0 +1,184 @@
+From 5f441f438f086553698e899fa0a475dbb0237d02 Mon Sep 17 00:00:00 2001
+From: Explorer09 <explorer09@gmail.com>
+Date: Wed, 8 May 2024 21:04:01 +0800
+Subject: [PATCH] build: Update AX_PROG_CC_FOR_BUILD to fix BUILD_EXEEXT
+ problems
+
+Upstream: 787edd41833e14e986ff093f7216e7005aca5fe2
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 102 ++++++++++++++++++++++++++++---------
+ 1 file changed, 77 insertions(+), 25 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 77fd346..3d28252 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -1,5 +1,5 @@
+ # ===========================================================================
+-#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
++#   https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
+ # ===========================================================================
+ #
+ # SYNOPSIS
+@@ -32,28 +32,34 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 8
++#serial 21
++# With patches not yet merged upstream
++# <https://savannah.gnu.org/patch/index.php?10452>
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+ AC_REQUIRE([AC_PROG_CC])dnl
+ AC_REQUIRE([AC_PROG_CPP])dnl
+-AC_REQUIRE([AC_EXEEXT])dnl
+-AC_REQUIRE([AC_CANONICAL_HOST])dnl
++AC_REQUIRE([AC_CANONICAL_BUILD])dnl
+ 
+ dnl Use the standard macros, but make them use other variable names
+ dnl
+ pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
+ pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
++pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
++pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
+-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
+-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
+ pushdef([ac_exeext], ac_build_exeext)dnl
+ pushdef([ac_objext], ac_build_objext)dnl
+ pushdef([CC], CC_FOR_BUILD)dnl
+ pushdef([CPP], CPP_FOR_BUILD)dnl
++pushdef([GCC], GCC_FOR_BUILD)dnl
+ pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
+ pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
+ pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
+@@ -67,27 +73,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
+ pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
+ pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
+ pushdef([ac_cv_host_os], ac_cv_build_os)dnl
+-pushdef([ac_cpp], ac_build_cpp)dnl
+-pushdef([ac_compile], ac_build_compile)dnl
+-pushdef([ac_link], ac_build_link)dnl
++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
++pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencies_compiler_type)dnl
++pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
++pushdef([cross_compiling], cross_compiling_build)dnl
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
++dnl
++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
++dnl AC_PROG_CC) indirectly.
++dnl
++ac_cv_host_c_compiler_gnu=$ac_cv_c_compiler_gnu
++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
++  [ac_cv_c_compiler_gnu=$ac_cv_build_c_compiler_gnu],
++  [AS_UNSET([ac_cv_c_compiler_gnu])])
++
++cross_compiling_build=no
+ 
+-save_cross_compiling=$cross_compiling
+-save_ac_tool_prefix=$ac_tool_prefix
+-cross_compiling=no
+-ac_tool_prefix=
++ac_build_tool_prefix=
++AS_IF([test -n "$build"],      [ac_build_tool_prefix="$build-"],
++      [test -n "$build_alias"],[ac_build_tool_prefix="$build_alias-"])
+ 
++AC_LANG_PUSH([C])
+ AC_PROG_CC
++_AC_COMPILER_EXEEXT
++_AC_COMPILER_OBJEXT
+ AC_PROG_CPP
+-AC_EXEEXT
+ 
+-ac_tool_prefix=$save_ac_tool_prefix
+-cross_compiling=$save_cross_compiling
++BUILD_EXEEXT=$ac_cv_exeext
++BUILD_OBJEXT=$ac_cv_objext
+ 
+ dnl Restore the old definitions
+ dnl
+-popdef([ac_link])dnl
+-popdef([ac_compile])dnl
+-popdef([ac_cpp])dnl
++popdef([cross_compiling])dnl
++popdef([am_cv_prog_cc_c_o])dnl
++popdef([am_cv_CC_dependencies_compiler_type])dnl
++popdef([ac_tool_prefix])dnl
+ popdef([ac_cv_host_os])dnl
+ popdef([ac_cv_host_vendor])dnl
+ popdef([ac_cv_host_cpu])dnl
+@@ -101,24 +138,39 @@ popdef([host])dnl
+ popdef([LDFLAGS])dnl
+ popdef([CPPFLAGS])dnl
+ popdef([CFLAGS])dnl
++popdef([GCC])dnl
+ popdef([CPP])dnl
+ popdef([CC])dnl
+ popdef([ac_objext])dnl
+ popdef([ac_exeext])dnl
+-popdef([ac_cv_objext])dnl
+-popdef([ac_cv_exeext])dnl
++popdef([ac_prog_cc_stdc])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+ popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_stdc])dnl
++popdef([ac_cv_prog_cc_c23])dnl
++popdef([ac_cv_prog_cc_c11])dnl
++popdef([ac_cv_prog_cc_c99])dnl
++popdef([ac_cv_prog_cc_c89])dnl
+ popdef([ac_cv_prog_gcc])dnl
+ popdef([ac_cv_prog_CPP])dnl
++dnl
++ac_cv_exeext=$ac_cv_host_exeext
++EXEEXT=$ac_cv_host_exeext
++ac_cv_objext=$ac_cv_host_objext
++OBJEXT=$ac_cv_host_objext
++ac_cv_c_compiler_gnu=$ac_cv_host_c_compiler_gnu
++ac_compiler_gnu=$ac_cv_host_c_compiler_gnu
++
++dnl restore global variables ac_ext, ac_cpp, ac_compile,
++dnl ac_link, ac_compiler_gnu (dependant on the current
++dnl language after popping):
++AC_LANG_POP([C])
+ 
+ dnl Finally, set Makefile variables
+ dnl
+-BUILD_EXEEXT=$ac_build_exeext
+-BUILD_OBJEXT=$ac_build_objext
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
