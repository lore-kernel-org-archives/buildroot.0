Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B36C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 14:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9AE781298;
	Mon, 24 Mar 2025 14:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrkqZzLSNGUM; Mon, 24 Mar 2025 14:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BDC6821EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BDC6821EE;
	Mon, 24 Mar 2025 14:07:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6D94C0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C07E408B6
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0FFYj4LJYyK for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 14:07:53 +0000 (UTC)
X-Greylist: delayed 313 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Mar 2025 14:07:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA76D40983
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA76D40983
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA76D40983
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:07:52 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id BA99A3F897;
 Mon, 24 Mar 2025 15:02:32 +0100 (CET)
Received: from UDERZO.insia.net (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id 1310A5F497;
 Mon, 24 Mar 2025 15:03:54 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Mon, 24 Mar 2025 10:02:16 -0400
Message-Id: <20250324140216.7901-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1742824952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3UAf80ORJfuAGM+N34y5pZJRHRze6kPQKfkIF0NHN3I=;
 b=dAo5leGO6KgRmB8woVzsiNkaM0t8IAo4okOid/G+TdWU4Boks9rfYV8pGr9HxfMqxWGNhX
 eh75P+pTX/24lEHohblrwyLYmfinLm6vhsCOJ3dRkA2xTYHFETPT2YXdZkEpVZyg7oyE0T
 BrS+lQWzZCaUWurNUlLtLSmS8BY4lpZ7ClHKWCjwQkEN4DZTVi+di8gcjbZKbGPfk1grXP
 3uSllantH8G0JtF+DNUfrd+scIkNLwYKE87KgltMbRX/rKZUsjuJunyYPTofoGwChiXVdF
 08VnsSOayrKPFoGVe4YDCPMeUpVg7IiENZr2MAGOV3caUtrxbxfPLQ3ohsc4IA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=dAo5leGO
Subject: [Buildroot] [PATCH] package/heimdal: Upgrade existing package and
 add target package.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
---
 package/Config.in                             |   1 +
 ...01-Import-AX_PROG_CC_FOR_BUILD-macro.patch | 176 ++++++++++++++++++
 ...JSON-PP-part-of-core-instead-of-JSON.patch |  57 ------
 .../0002-Use-AX_PROG_CC_FOR_BUILD.patch       |  23 +++
 ...file.m4-Fix-build-with-autoconf-2.72.patch |  27 ---
 ...lace-make-roken-with-roken-h-process.patch |  57 ++++++
 ...0004-cf-remove-comm_err-header-check.patch |  48 +++++
 package/heimdal/0005-Fix-ar-warnings.patch    |  43 +++++
 package/heimdal/Config.in                     |  11 ++
 package/heimdal/heimdal.hash                  |   2 +-
 package/heimdal/heimdal.mk                    |  35 ++--
 ...-slc-and-compile_et-in-bin-directory.patch |  44 +++++
 12 files changed, 421 insertions(+), 103 deletions(-)
 create mode 100644 package/heimdal/0001-Import-AX_PROG_CC_FOR_BUILD-macro.patch
 delete mode 100644 package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
 create mode 100644 package/heimdal/0002-Use-AX_PROG_CC_FOR_BUILD.patch
 delete mode 100644 package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
 create mode 100644 package/heimdal/0003-Replace-make-roken-with-roken-h-process.patch
 create mode 100644 package/heimdal/0004-cf-remove-comm_err-header-check.patch
 create mode 100644 package/heimdal/0005-Fix-ar-warnings.patch
 create mode 100644 package/heimdal/Config.in
 create mode 100644 package/heimdal/host/0001-Install-slc-and-compile_et-in-bin-directory.patch

diff --git a/package/Config.in b/package/Config.in
index d8751fc19f..394c4d5997 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2025,6 +2025,7 @@ menu "Networking"
 	source "package/gupnp/Config.in"
 	source "package/gupnp-av/Config.in"
 	source "package/gupnp-dlna/Config.in"
+	source "package/heimdal/Config.in"
 	source "package/ibrcommon/Config.in"
 	source "package/ibrdtn/Config.in"
 	source "package/libcgi/Config.in"
diff --git a/package/heimdal/0001-Import-AX_PROG_CC_FOR_BUILD-macro.patch b/package/heimdal/0001-Import-AX_PROG_CC_FOR_BUILD-macro.patch
new file mode 100644
index 0000000000..b39dc1cfd6
--- /dev/null
+++ b/package/heimdal/0001-Import-AX_PROG_CC_FOR_BUILD-macro.patch
@@ -0,0 +1,176 @@
+From 4d0d834f96cfab796fdb4653b3646feb0d306c95 Mon Sep 17 00:00:00 2001
+From: Nicolas Williams <nico@twosigma.com>
+Date: Sat, 24 Jun 2023 00:12:20 -0500
+Subject: [PATCH] cf: Import AX_PROG_CC_FOR_BUILD macro
+
+Some versions of autoconf-archive have a broken AX_PROG_CC_FOR_BUILD.
+
+Signed-off-by: Nicolas Williams <nico@twosigma.com>
+Upstream: https://github.com/heimdal/heimdal/pull/1174/commits/4d0d834f96cfab796fdb4653b3646feb0d306c95
+---
+ cf/ax_prog_cc_for_build.m4 | 156 +++++++++++++++++++++++++++++++++++++
+ 1 file changed, 156 insertions(+)
+ create mode 100644 cf/ax_prog_cc_for_build.m4
+
+diff --git a/cf/ax_prog_cc_for_build.m4 b/cf/ax_prog_cc_for_build.m4
+new file mode 100644
+index 0000000000..fb986652f6
+--- /dev/null
++++ b/cf/ax_prog_cc_for_build.m4
+@@ -0,0 +1,156 @@
++# ===========================================================================
++#   https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_PROG_CC_FOR_BUILD
++#
++# DESCRIPTION
++#
++#   This macro searches for a C compiler that generates native executables,
++#   that is a C compiler that surely is not a cross-compiler. This can be
++#   useful if you have to generate source code at compile-time like for
++#   example GCC does.
++#
++#   The macro sets the CC_FOR_BUILD and CPP_FOR_BUILD macros to anything
++#   needed to compile or link (CC_FOR_BUILD) and preprocess (CPP_FOR_BUILD).
++#   The value of these variables can be overridden by the user by specifying
++#   a compiler with an environment variable (like you do for standard CC).
++#
++#   It also sets BUILD_EXEEXT and BUILD_OBJEXT to the executable and object
++#   file extensions for the build platform, and GCC_FOR_BUILD to `yes' if
++#   the compiler we found is GCC. All these variables but GCC_FOR_BUILD are
++#   substituted in the Makefile.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
++#
++#   Copying and distribution of this file, with or without modification, are
++#   permitted in any medium without royalty provided the copyright notice
++#   and this notice are preserved. This file is offered as-is, without any
++#   warranty.
++
++#serial 21
++
++AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
++AU_ALIAS([AC_HEIM_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
++AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
++AC_REQUIRE([AC_PROG_CC])dnl
++AC_REQUIRE([AC_PROG_CPP])dnl
++AC_REQUIRE([AC_CANONICAL_BUILD])dnl
++
++dnl Use the standard macros, but make them use other variable names
++dnl
++pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
++pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
++pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
++pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
++pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
++pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
++pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
++pushdef([ac_cv_c_compiler_gnu], ac_cv_build_c_compiler_gnu)dnl
++pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
++pushdef([ac_cv_objext], ac_cv_build_objext)dnl
++pushdef([ac_exeext], ac_build_exeext)dnl
++pushdef([ac_objext], ac_build_objext)dnl
++pushdef([CC], CC_FOR_BUILD)dnl
++pushdef([CPP], CPP_FOR_BUILD)dnl
++pushdef([GCC], GCC_FOR_BUILD)dnl
++pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
++pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
++pushdef([EXEEXT], BUILD_EXEEXT)dnl
++pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
++pushdef([OBJEXT], BUILD_OBJEXT)dnl
++pushdef([host], build)dnl
++pushdef([host_alias], build_alias)dnl
++pushdef([host_cpu], build_cpu)dnl
++pushdef([host_vendor], build_vendor)dnl
++pushdef([host_os], build_os)dnl
++pushdef([ac_cv_host], ac_cv_build)dnl
++pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
++pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
++pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
++pushdef([ac_cv_host_os], ac_cv_build_os)dnl
++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
++pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencies_compiler_type)dnl
++pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
++pushdef([cross_compiling], cross_compiling_build)dnl
++
++cross_compiling_build=no
++
++ac_build_tool_prefix=
++AS_IF([test -n "$build"],      [ac_build_tool_prefix="$build-"],
++      [test -n "$build_alias"],[ac_build_tool_prefix="$build_alias-"])
++
++AC_LANG_PUSH([C])
++
++dnl The pushdef([ac_cv_c_compiler_gnu], ...) currently does not cover
++dnl the use of this variable in _AC_LANG_COMPILER_GNU called by
++dnl AC_PROG_CC. Unset this cache variable temporarily as a workaround.
++was_set_c_compiler_gnu=${[ac_cv_c_compiler_gnu]+y}
++AS_IF([test ${was_set_c_compiler_gnu}],
++    [saved_c_compiler_gnu=$[ac_cv_c_compiler_gnu]
++    AS_UNSET([[ac_cv_c_compiler_gnu]])])
++
++AC_PROG_CC
++
++dnl Restore ac_cv_c_compiler_gnu
++AS_IF([test ${was_set_c_compiler_gnu}],
++  [[ac_cv_c_compiler_gnu]=$[saved_c_compiler_gnu]])
++
++_AC_COMPILER_EXEEXT
++_AC_COMPILER_OBJEXT
++AC_PROG_CPP
++
++dnl Restore the old definitions
++dnl
++popdef([cross_compiling])dnl
++popdef([am_cv_prog_cc_c_o])dnl
++popdef([am_cv_CC_dependencies_compiler_type])dnl
++popdef([ac_tool_prefix])dnl
++popdef([ac_cv_host_os])dnl
++popdef([ac_cv_host_vendor])dnl
++popdef([ac_cv_host_cpu])dnl
++popdef([ac_cv_host_alias])dnl
++popdef([ac_cv_host])dnl
++popdef([host_os])dnl
++popdef([host_vendor])dnl
++popdef([host_cpu])dnl
++popdef([host_alias])dnl
++popdef([host])dnl
++popdef([OBJEXT])dnl
++popdef([LDFLAGS])dnl
++popdef([EXEEXT])dnl
++popdef([CPPFLAGS])dnl
++popdef([CFLAGS])dnl
++popdef([GCC])dnl
++popdef([CPP])dnl
++popdef([CC])dnl
++popdef([ac_objext])dnl
++popdef([ac_exeext])dnl
++popdef([ac_cv_objext])dnl
++popdef([ac_cv_exeext])dnl
++popdef([ac_cv_c_compiler_gnu])dnl
++popdef([ac_cv_prog_cc_g])dnl
++popdef([ac_cv_prog_cc_cross])dnl
++popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_c89])dnl
++popdef([ac_cv_prog_gcc])dnl
++popdef([ac_cv_prog_CPP])dnl
++
++dnl restore global variables ac_ext, ac_cpp, ac_compile,
++dnl ac_link, ac_compiler_gnu (dependant on the current
++dnl language after popping):
++AC_LANG_POP([C])
++
++dnl Finally, set Makefile variables
++dnl
++AC_SUBST(BUILD_EXEEXT)dnl
++AC_SUBST(BUILD_OBJEXT)dnl
++AC_SUBST([CFLAGS_FOR_BUILD])dnl
++AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
++AC_SUBST([LDFLAGS_FOR_BUILD])dnl
++])
diff --git a/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch b/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
deleted file mode 100644
index 7323ac70df..0000000000
--- a/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From f6fdb0a28e3bfcb3fd0aa1c81ad59c5411c0d660 Mon Sep 17 00:00:00 2001
-From: Andrew Sim <andrewsimz@gmail.com>
-Date: Sat, 10 Jun 2023 09:00:24 +0200
-Subject: [PATCH] Use perl module JSON:PP, part of core, instead of JSON
- package
-
-This patch removes the need for an external package.
-
-Ported from
-https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
-https://github.com/openwrt/packages/commit/402f4ba4eff65b80a9deaa6085256112bec4d67b#diff-208d4e0345c9d29fbec23d6f655ba794afd3052f5cb8dd73944db72ce81b847b
-
-Upstream: https://github.com/heimdal/heimdal/pull/1176
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- cf/make-proto.pl | 4 ++--
- configure.ac     | 1 -
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/cf/make-proto.pl b/cf/make-proto.pl
-index 36a040ce6..4af21916b 100644
---- a/cf/make-proto.pl
-+++ b/cf/make-proto.pl
-@@ -4,7 +4,7 @@
- use Getopt::Std;
- use File::Compare;
- 
--use JSON;
-+use JSON::PP
- 
- my $comment = 0;
- my $doxygen = 0;
-@@ -70,7 +70,7 @@ if($opt_x) {
-     my $EXP;
-     local $/;
-     open(EXP, '<', $opt_x) || die "open ${opt_x}";
--    my $obj = JSON->new->utf8->decode(<EXP>);
-+    my $obj = JSON::PP->new->utf8->decode(<EXP>);
-     close $EXP;
- 
-     foreach my $x (keys %$obj) {
-diff --git a/configure.ac b/configure.ac
-index cedb4c01f..cecd030e6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -56,7 +56,6 @@ if ! test -f "$srcdir/lib/asn1/der-protos.h" ||
-     AC_KRB_PROG_PERL
-     AC_KRB_PERL_MOD(Getopt::Std)
-     AC_KRB_PERL_MOD(File::Compare)
--    AC_KRB_PERL_MOD(JSON)
- fi
- 
- AC_KRB_PROG_YACC
--- 
-2.39.2
-
diff --git a/package/heimdal/0002-Use-AX_PROG_CC_FOR_BUILD.patch b/package/heimdal/0002-Use-AX_PROG_CC_FOR_BUILD.patch
new file mode 100644
index 0000000000..27ec78587f
--- /dev/null
+++ b/package/heimdal/0002-Use-AX_PROG_CC_FOR_BUILD.patch
@@ -0,0 +1,23 @@
+From f6769797507d73d05e6a2ac2f54ff9f8f49b377c Mon Sep 17 00:00:00 2001
+From: Nicolas Williams <nico@twosigma.com>
+Date: Sat, 24 Jun 2023 00:15:31 -0500
+Subject: [PATCH] cf: Use AX_PROG_CC_FOR_BUILD
+
+Signed-off-by: Nicolas Williams <nico@twosigma.com>
+Upstream: https://github.com/heimdal/heimdal/pull/1174/commits/f6769797507d73d05e6a2ac2f54ff9f8f49b377c
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 86aed5e9eb..2b02dec450 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,6 +18,7 @@ dnl Checks for programs.
+ AC_PROG_CC
+ AM_PROG_CC_C_O
+ AC_PROG_CPP
++AC_HEIM_PROG_CC_FOR_BUILD
+ AM_PATH_PYTHON
+ AC_CHECK_PROG(CLANG_FORMAT, clang-format, [clang-format], [no])
+ test "$CLANG_FORMAT" = no && CLANG_FORMAT=true
diff --git a/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch b/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
deleted file mode 100644
index 5b36c5a784..0000000000
--- a/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1b57b62d82a478c1fade350f0fb1d57031a8734e Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 10 Feb 2024 09:33:48 +0100
-Subject: [PATCH] cf/largefile.m4: Fix build with autoconf-2.72
-
-Fixes https://github.com/heimdal/heimdal/issues/1201
-
-Upstream: https://github.com/heimdal/heimdal/commit/1b57b62d82a478c1fade350f0fb1d57031a8734e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- cf/largefile.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cf/largefile.m4 b/cf/largefile.m4
-index 5c54897be4..cdbbc55431 100644
---- a/cf/largefile.m4
-+++ b/cf/largefile.m4
-@@ -10,7 +10,7 @@ dnl with generated code, such as lex
- if test "$enable_largefile" != no -a "$ac_cv_sys_large_files" != no; then
- 	CPPFLAGS="$CPPFLAGS -D_LARGE_FILES=$ac_cv_sys_large_files"
- fi
--if test "$enable_largefile" != no -a "$ac_cv_sys_file_offset_bits" != no; then
-+if test "$enable_largefile" != no -a "$ac_cv_sys_file_offset_bits" != no && test -n "$ac_cv_sys_file_offset_bits"; then
- 	CPPFLAGS="$CPPFLAGS -D_FILE_OFFSET_BITS=$ac_cv_sys_file_offset_bits"
- fi
- ])
diff --git a/package/heimdal/0003-Replace-make-roken-with-roken-h-process.patch b/package/heimdal/0003-Replace-make-roken-with-roken-h-process.patch
new file mode 100644
index 0000000000..90acca6683
--- /dev/null
+++ b/package/heimdal/0003-Replace-make-roken-with-roken-h-process.patch
@@ -0,0 +1,57 @@
+From 28df1d8a8b5ce2a35214faad3254649a0a470bfe Mon Sep 17 00:00:00 2001
+From: Nicolas Williams <nico@twosigma.com>
+Date: Sat, 24 Jun 2023 22:25:00 -0500
+Subject: [PATCH] roken: Replace make-roken with cf/roken-h-process.pl
+
+Signed-off-by: Nicolas Williams <nico@twosigma.com>
+Upstream: https://github.com/heimdal/heimdal/pull/1174/commits/28df1d8a8b5ce2a35214faad3254649a0a470bfe
+---
+ lib/roken/Makefile.am | 21 +++++++++------------
+ lib/roken/roken.awk   | 10 +++++++---
+ lib/roken/roken.h.in  | 19 +++++++++++++------
+ 3 files changed, 29 insertions(+), 21 deletions(-)
+
+diff --git a/lib/roken/Makefile.am b/lib/roken/Makefile.am
+index 1f530c7aee..1bdb809b64 100644
+--- a/lib/roken/Makefile.am
++++ b/lib/roken/Makefile.am
+@@ -240,30 +240,27 @@ SUFFIXES += .hin
+ .hin.h:
+ 	cp $< $@
+ 
+-# Make make-roken deprecated in 1.4 when we know that roken-h-process.pl works
+-if !CROSS_COMPILE
+-
++# Replace make-roken with cf/roken-h-process.pl some day?
+ noinst_PROGRAMS += make-roken
+ BUILT_SOURCES += make-roken.c
+ 
+ nodist_make_roken_SOURCES = make-roken.c
+ 
+-roken.h: make-roken$(EXEEXT)
+-	@./make-roken$(EXEEXT) > tmp.h ;\
++roken.h: make-roken$(BUILD_EXEEXT)
++	./make-roken$(BUILD_EXEEXT) > tmp.h ;\
+ 	if [ -f roken.h ] && cmp -s tmp.h roken.h ; then rm -f tmp.h ; \
+ 	else rm -f roken.h; mv tmp.h roken.h; fi
+ 
+ make-roken.c: roken.h.in roken.awk
+ 	$(AWK) -f $(srcdir)/roken.awk $(srcdir)/roken.h.in > make-roken.c
+ 
+-else
+-
+-roken.h: $(top_srcdir)/cf/roken-h-process.pl roken.h.in
+-	perl $(top_srcdir)/cf/roken-h-process.pl \
+-	-c $(top_builddir)/include/config.h  \
+-	-p $(srcdir)/roken.h.in -o roken.h
++make-roken: make-roken.c
++	$(CC_FOR_BUILD) -o $@ -DHAVE_CONFIG_H -I$(top_builddir)/include $<
+ 
+-endif
++#roken.h: $(top_srcdir)/cf/roken-h-process.pl roken.h.in
++#	perl $(top_srcdir)/cf/roken-h-process.pl \
++#	-c $(top_builddir)/include/config.h  \
++#	-p $(srcdir)/roken.h.in -o roken.h
+ 
+ 
+ EXTRA_DIST = \
diff --git a/package/heimdal/0004-cf-remove-comm_err-header-check.patch b/package/heimdal/0004-cf-remove-comm_err-header-check.patch
new file mode 100644
index 0000000000..97cef5f792
--- /dev/null
+++ b/package/heimdal/0004-cf-remove-comm_err-header-check.patch
@@ -0,0 +1,48 @@
+From acf1a8105010ecbc21a92d046028b37535c5085e Mon Sep 17 00:00:00 2001
+From: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Date: Fri, 24 Jan 2025 16:10:14 +0100
+Subject: [PATCH] cf: remove comm_err header check to cross-compile heimdal
+
+Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Upstream: N/A
+---
+ cf/check-compile-et.m4 | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/cf/check-compile-et.m4 b/cf/check-compile-et.m4
+index e580cbb49..49870e575 100644
+--- a/cf/check-compile-et.m4
++++ b/cf/check-compile-et.m4
+@@ -22,11 +22,6 @@ error_code CODE2, "CODE2"
+ end
+ EOF
+ if ${COMPILE_ET} conftest_et.et >/dev/null 2>&1; then
+-  dnl XXX Some systems have <et/com_err.h>.
+-  save_CPPFLAGS="${CPPFLAGS}"
+-  if test -d "/usr/include/et"; then
+-    CPPFLAGS="-I/usr/include/et ${CPPFLAGS}"
+-  fi
+   dnl Check that the `prefix' and `index' directives were honored.
+   AC_LANG(C)
+   AC_RUN_IFELSE([AC_LANG_SOURCE([
+@@ -38,7 +33,7 @@ int main(int argc, char **argv){
+ #error compile_et does not handle error_table N M
+ #endif
+ return (CONFTEST_CODE2 - CONFTEST_CODE1) != 127;}
+-  ])], [krb_cv_compile_et="yes"],[CPPFLAGS="${save_CPPFLAGS}"],
++  ])], [krb_cv_compile_et="yes"],[CPPFLAGS="${CPPFLAGS}"],
+   [krb_cv_compile_et="yes" krb_cv_compile_et_cross=yes] )
+ fi
+ AC_MSG_RESULT(${krb_cv_compile_et})
+@@ -69,7 +64,7 @@ elif test "${krb_cv_compile_et}" = "yes"; then
+     p = error_message(0);
+     initialize_error_table_r(0,0,0,0);
+     com_right_r(0, 0, 0, 0);
+-  ]])],[krb_cv_com_err="yes"],[krb_cv_com_err="no"; CPPFLAGS="${save_CPPFLAGS}"])
++  ]])],[krb_cv_com_err="yes"],[krb_cv_com_err="no"; CPPFLAGS="${CPPFLAGS}"])
+   AC_MSG_RESULT(${krb_cv_com_err})
+   LIBS="${krb_cv_save_LIBS}"
+ else
+-- 
+2.39.5
+
diff --git a/package/heimdal/0005-Fix-ar-warnings.patch b/package/heimdal/0005-Fix-ar-warnings.patch
new file mode 100644
index 0000000000..6ecb9bc040
--- /dev/null
+++ b/package/heimdal/0005-Fix-ar-warnings.patch
@@ -0,0 +1,43 @@
+From 3b64e38690eabd6bd84dde189964a68b6770a76e Mon Sep 17 00:00:00 2001
+From: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Date: Wed, 12 Feb 2025 11:04:56 -0500
+Subject: [PATCH] heimdal: Fix "ar: `u' modifier ignored since `D' is the
+ default (see `U')" warnings.
+
+Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Upstream: N/A
+---
+ Makefile.am  | 2 +-
+ configure.ac | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b9bdcf499..970dc413b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -13,7 +13,7 @@ if HEIMDAL_DOCUMENTATION
+ SUBDIRS+= doc
+ endif
+ 
+-
++ARFLAGS = cr
+ 
+ ## ACLOCAL = @ACLOCAL@ -I cf
+ ACLOCAL_AMFLAGS = -I cf
+diff --git a/configure.ac b/configure.ac
+index ef9010abf..276859edf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -23,6 +23,9 @@ AM_PATH_PYTHON
+ AC_CHECK_PROG(CLANG_FORMAT, clang-format, [clang-format], [no])
+ test "$CLANG_FORMAT" = no && CLANG_FORMAT=true
+ 
++AR_FLAGS="cr"
++AC_SUBST(AR_FLAGS)
++
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
+ AC_PREFIX_DEFAULT(/usr/heimdal)
+-- 
+2.39.5
+
diff --git a/package/heimdal/Config.in b/package/heimdal/Config.in
new file mode 100644
index 0000000000..5c71168436
--- /dev/null
+++ b/package/heimdal/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HEIMDAL
+	bool "my-heimdal"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBXCRYPT
+	help
+	  Heimdal is an implementation of:
+	  - ASN.1/DER
+	  - PKIX
+	  - Kerberos
+
+	  https://github.com/heimdal/heimdal.git
diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index 250ddbbd4d..aa99a04b07 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2576c5e2d793db53c86e108fd117b278437bb02d6c6db2bec4d1b86958f1980a  heimdal-f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17.tar.gz
+sha256  8267f973eded7aa8ee82992f6cb518c6fe27939d4a3d74a16f7bdf1e148359f8  heimdal-fd2d434.tar.gz
 sha256  0c4b07bf5b98f7a1d01f8e60722d6c6747ef052c2aa6d2043daf690d4e1b0a7f  LICENSE
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index f6c52f63aa..686a351c7d 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,15 +4,20 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
+HEIMDAL_VERSION = fd2d434
 HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
-HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf host-libxcrypt host-flex host-bison
-HOST_HEIMDAL_AUTORECONF = YES
+HEIMDAL_DEPENDENCIES=  ncurses libxcrypt host-heimdal
+HOST_HEIMDAL_DEPENDENCIES = host-ncurses host-pkgconf host-libxcrypt host-flex host-bison
+HEIMDAL_AUTORECONF= YES
 HEIMDAL_INSTALL_STAGING = YES
-# static because of -fPIC issues with e2fsprogs on x86_64 host
+HEIMDAL_LICENSE = BSD-3-Clause
+HEIMDAL_LICENSE_FILES = LICENSE
+HEIMDAL_CPE_ID_VALID = YES
+
+HEIMDAL_CONF_ENV = MAKEINFO=true
+HOST_HEIMDAL_CONF_ENV = $(HEIMDAL_CONF_ENV) ac_cv_prog_COMPILE_ET=no
+
 HOST_HEIMDAL_CONF_OPTS = \
-	--disable-shared \
-	--enable-static \
 	--without-openldap \
 	--without-capng \
 	--with-db-type-preference= \
@@ -28,19 +33,13 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--disable-ndbm-db \
 	--disable-heimdal-documentation
 
-# Don't use compile_et from e2fsprogs as it raises a build failure with samba4
-HOST_HEIMDAL_CONF_ENV = ac_cv_prog_COMPILE_ET=no MAKEINFO=true LIBS=-lcrypt
-HEIMDAL_LICENSE = BSD-3-Clause
-HEIMDAL_LICENSE_FILES = LICENSE
-HEIMDAL_CPE_ID_VALID = YES
-
-# We need compile_et for samba4
-define HOST_HEIMDAL_INSTALL_COMPILE_ET
-	$(INSTALL) -m 0755 $(@D)/lib/com_err/compile_et \
-		$(HOST_DIR)/bin/compile_et
+define HOST_HEIMDAL_APPLY_ADDITIONAL_PATCHES
+	$(APPLY_PATCHES) $(@D) $(HOST_HEIMDAL_PKGDIR)/host \*.patch
 endef
+HOST_HEIMDAL_POST_PATCH_HOOKS+=  HOST_HEIMDAL_APPLY_ADDITIONAL_PATCHES
 
-HOST_HEIMDAL_POST_INSTALL_HOOKS += \
-	HOST_HEIMDAL_INSTALL_COMPILE_ET
+HEIMDAL_CONF_OPTS=$(HOST_HEIMDAL_CONF_OPTS) \
+	--with-cross-tools="$(HOST_DIR)/bin"
 
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/heimdal/host/0001-Install-slc-and-compile_et-in-bin-directory.patch b/package/heimdal/host/0001-Install-slc-and-compile_et-in-bin-directory.patch
new file mode 100644
index 0000000000..12b5f97d4e
--- /dev/null
+++ b/package/heimdal/host/0001-Install-slc-and-compile_et-in-bin-directory.patch
@@ -0,0 +1,44 @@
+From 905c9cd3efb657cee7ab3a1cfffc41b60b578a51 Mon Sep 17 00:00:00 2001
+From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
+Date: Fri, 17 Jan 2025 10:00:54 +0100
+Subject: [PATCH] Install slc and compile_et in bin directory
+
+We need these binaries to cross-compile heimdal.
+Moreover samba4 package is relying on compile_et provided by heimdal.
+
+Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
+Upstream: N/A
+---
+ lib/com_err/Makefile.am | 2 +-
+ lib/sl/Makefile.am      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/com_err/Makefile.am b/lib/com_err/Makefile.am
+index 187e7747b..680603dfe 100644
+--- a/lib/com_err/Makefile.am
++++ b/lib/com_err/Makefile.am
+@@ -14,7 +14,7 @@ endif
+ 
+ libcom_err_la_LIBADD = $(LIB_libintl)
+ 
+-noinst_PROGRAMS = compile_et
++bin_PROGRAMS = compile_et
+ 
+ include_HEADERS = com_err.h com_right.h
+ 
+diff --git a/lib/sl/Makefile.am b/lib/sl/Makefile.am
+index c962c7a57..f3b6363cf 100644
+--- a/lib/sl/Makefile.am
++++ b/lib/sl/Makefile.am
+@@ -26,7 +26,7 @@ check_PROGRAMS = $(TESTS)
+ 
+ # install these?
+ 
+-libexec_heimdal_PROGRAMS = slc
++bin_PROGRAMS = slc
+ 
+ slc_SOURCES = slc-gram.y slc-lex.l slc.h
+ 
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
