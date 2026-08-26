Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8366C61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 15:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF11605F4;
	Wed, 26 Aug 2026 15:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NA7asl_ZBgxf; Wed, 26 Aug 2026 15:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787758870;
	bh=PX8vyLeo+w+wFtjvUgKS/9EYXv3YE7MsHvQwOi09W4I=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=s+wRTZiSxFzz1XY1gA/KQpv19NTnpKRFzgQZ/zkWXE3oYp1knwx625YqO7jYo/+Qd
	 0OS0nHVL3pXLcr3vJkI3Aq/lJ1/VktsNjoauSUicz/Vv4W3mD+3WsQpkJsj7P21C6g
	 SPNzyW2CEtokFcNv+EmfS+0LiDqIsYO3g8sMpqWuYNwqg9a0k8mVsAIDwPPtnH6+qw
	 ttcs7YiPuvsPcuGBTKNgZglO3JV3RlO5KPFrHRRimwK2UON6YbzRSsjfSbrF0/wq5J
	 O9fAwugVlvMZlY+pqLbTvgFBMr5j89HPTv60FIkOxdNzFWTpCVR/y3inJ8t4A1xdGu
	 kAcEogEI5fK8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56B9F6067F;
	Wed, 26 Aug 2026 15:41:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 587BD3C3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A5BC40118
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZDgiTaduOl7 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 15:41:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC37C40115
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:41:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 07CA54E413C6
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:41:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D0E70604EC
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:41:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD87411C7833D; 
 Wed, 26 Aug 2026 17:41:02 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2026 17:41:00 +0200
Message-ID: <20260826154100.4144157-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/flex: fix build with old host GCC since
 autoconf bump
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of autoconf to version 2.73 in Buildroot commit, the
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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...PROG_CC_FOR_BUILD-to-fix-BUILD_EXEEX.patch | 184 ++++++++++++++++++
 1 file changed, 184 insertions(+)
 create mode 100644 package/flex/0005-build-Update-AX_PROG_CC_FOR_BUILD-to-fix-BUILD_EXEEX.patch

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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
