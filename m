Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD401C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 12:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93CC960616;
	Sun,  6 Sep 2026 12:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KA5aPjTXDq9H; Sun,  6 Sep 2026 12:19:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0BE3860627
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788697141;
	b=PCGAbnn5xbyLmEhl04dtMXlwuzeKUtOugr99htCUdUh9DyY17r2mmb+ZGgOOFXhtrQDn
	 pYHSqjcJit7GyCqHWkSXtftlY77EfS0w4aNkbCD2JYgjHpLk9RDA0L+iCtFv/TKQJ5YFG
	 G7sCSGBqVx/Fkum8GHmWeHaM4qCJ5i4FdrAiFklEIPqOwhFI5rTsyG9XcbuGTFTBRG0+Q
	 I2LpTi14w++WExv7pQ/N2qkC5bWTK/Flz77I153r1j20NhWVU1cPcOy6rccd8nJd5HR6+
	 3/+63Ai99rqhBdWp+8bAtBNLIBA2f1MtwkLAVJFAejMt0cTNexCL3IX1w62NTrKHFgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788697141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8QWXi8brkjQgkmDXi2mpM2lEBBFcwKC1B84UhPUhFks=;
	b=EBRXlB67p7h8ROGsm+VFoX2/BoQdiCjM+MxHVH2eWwTXJ8ngDLTbtBOnfQu9UDC72L4D
	 d/UKetf5tkMquz3ZaVCDDKvVKhbB5WdJLofC6+zIXcZ5vEpDw5YMBBCu0nhXvB4BCsri5
	 HwLT5gmVZ33LVhZ90PDqY6Jt+ZHaPoetK2g4mz6m+MtPaBGJfrZc1YYSR7iKQWBq8mjHd
	 nqv7BKsJdylC2/rautsW4PyAuOM5Jz1Pa8zMY1aNrjwe7gGhuS0a51pBoedSZz4vpHgMm
	 AJvSLiOugSq11aZ/z6B5Ihb0TaNjKR9HzRLSLGJFzPvR9zyKCRgYtjPb4mOJntNBC/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788697141;
	bh=8QWXi8brkjQgkmDXi2mpM2lEBBFcwKC1B84UhPUhFks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N4Fqj+R5sRTMZ+AkT6jfAelMIpPC1IjoSPIPwv0ntLcvHE7DjV7jpl30vtkNUUJ+9
	 Z0gquj+CmBsWKKgkU1G/L3P1tY/DHwE4GP+5xoTILBp6UrfS19/AbILtuF+Wi2Zx2e
	 HVeyqeKemKrlOrNKRlZNRyrxzUb/mW97UVlzvDMvVcFz6PfVAFic8qay6iR8a5sTl2
	 FcKT6KaZWUv4rB/pXVzNLSa0zZmilsV+YKopyU6V6muE9mtsZDBoRrSjbfYCidw58v
	 /CW8SNLKEDgKeBZAof2rRpZsCZuMQBqlLxVzMbDGY8JIkQtKV7CIQ7V3+ntt9LMRLQ
	 A+YMrJprEdUig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE3860627;
	Sun,  6 Sep 2026 12:19:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEE323AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B467D80D9C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMzLOOkogvk8 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 154ED80DD6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788697128;
 b=WjqDJWRq+M+cAuJ2JiwtA1nV19FSl/2IZ++lytwXZ+AzK4bb2JCFRirGYHAD4tmH3vOw
 6mckyw8E1XSl9K7SN7n8/MOb/1ylM1sR32DdzaN7hGRK47D6XmbvKiSN0nWXxCaTsBqkV
 /Nzm5hmsRraC1xl7MoFwEUNscXoli08tAHpyBCEvoodieX+tSlz8v1Ac8OxJXgkA93oQn
 OuDcleNPakDqO2dgf4PJrbHpJavHv9UDg8dJKIGOdPrq23cqaaw3YO3ZoYbWtHhDAUQko
 cv/gIS4uRiMsS/+7/GdNpkwF2e3JNObFizVWAJBPiyB4yDLmEQ1GBleh2l7Ck9yGOTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788697128;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=X2qVszEBygQJpmhI1KKofILf9TaLuXV1vYmjtIUarPg=;
 b=DNkG1UTTDcdl3lkvOxCaB1owjj2Vo0Nf3iCZKLYzsy4NXqbCVHU3shQ56Qm7AzKJepnz
 j67Su8sucY19n7Vyi70DQG0AAg98Wjglm2bY3Kfv6/q+TMS6gRewz5hR4srHOBb+C/6Um
 fjIqdHYInzNrn1+KJHMJcakhct+fXAHHmv76WPZS6XdcMP8H9thQJmETrcvAnHj/FIsQi
 vCHKStWADfsp7yOqsMe3VpDah6VHkYNeGepMgZTv5k2Hy8+Lh9Noezy3BTVI7jom2GR12
 JwheInGKkT12+x8g6a/FeE473IXDhMNjdYq0/hseiVX0iG/Q3yMwyK4IoGV9FmO8Esg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 154ED80DD6
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91F5E952A6; Sun,  6 Sep 2026 12:17:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 13:56:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7e943bf42224dafb4d8e28f49de63f31a42ac80
X-Git-Newrev: a4c3a288e64e5d0fd2578c4a21459842506a4035
X-Patchwork-Hint: ignore
Message-Id: <20260906121746.91F5E952A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: add support for binutils
 2.47
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4c3a288e64e5d0fd2578c4a21459842506a4035
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceware.org/pipermail/binutils/2026-July/150449.html

We bring and rebased patches 0001 and 0002 that we carry for binutils
2.46.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils/2.47/0001-sh-conf.patch           |  52 ++++
 .../2.47/0002-poison-system-directories.patch      | 312 +++++++++++++++++++++
 package/binutils/Config.in.host                    |   4 +
 package/binutils/binutils.hash                     |   1 +
 4 files changed, 369 insertions(+)

diff --git a/package/binutils/2.47/0001-sh-conf.patch b/package/binutils/2.47/0001-sh-conf.patch
new file mode 100644
index 0000000000..8d9f8497c1
--- /dev/null
+++ b/package/binutils/2.47/0001-sh-conf.patch
@@ -0,0 +1,52 @@
+From 0bf75276c392cac7794e78e1572abcd793d99e4e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:38:13 +0100
+Subject: [PATCH] sh-conf
+
+Likewise, binutils has no idea about any of these new targets either, so we
+fix that up too.. now we're able to actually build a real toolchain for
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
+inept targets than that one, really. Go look, I promise).
+
+Upstream: N/A [Buildroot specific]
+
+[Romain: rebase on top of 2.32]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Bernd: rebased for version 2.47]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index bbfb5979546..bcd95684ae1 100755
+--- a/configure
++++ b/configure
+@@ -4197,7 +4197,7 @@
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index f9694cdf901..d6a3623ba50 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1366,7 +1366,7 @@
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.51.1
+
diff --git a/package/binutils/2.47/0002-poison-system-directories.patch b/package/binutils/2.47/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..933d15106e
--- /dev/null
+++ b/package/binutils/2.47/0002-poison-system-directories.patch
@@ -0,0 +1,312 @@
+From 92f4bd0e1713577e30491e99a0226088eaeae740 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Waldemar: rebase on top of 2.43]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Waldemar: rebase on top of 2.39]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: rebase on top of 2.33.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Bernd: rebased for version 2.47]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
+Upstream: N/A [Buildroot specific]
+
+Patch originally created by Mark Hatle, forward-ported to
+binutils 2.21 by Scott Garman.
+
+purpose:  warn for uses of system directories when cross linking
+
+Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
+
+2008-07-02  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * ld.h (args_type): Add error_poison_system_directories.
+    * ld.texinfo (--error-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.error_poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.error_poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --error-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-06-13  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * config.in: Regenerate.
+    * ld.h (args_type): Add poison_system_directories.
+    * ld.texinfo (--no-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --no-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-04-20  Joseph Myers  <joseph@codesourcery.com>
+
+    Merge from Sourcery G++ binutils 2.17:
+
+    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
+    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
+    ld/
+    * configure.ac (--enable-poison-system-directories): New option.
+    * configure, config.in: Regenerate.
+    * ldfile.c (ldfile_add_library_path): If
+    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
+    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ ld/config.in    |  3 +++
+ ld/configure    | 14 ++++++++++++++
+ ld/configure.ac | 10 ++++++++++
+ ld/ld.h         |  8 ++++++++
+ ld/ld.texi      | 12 ++++++++++++
+ ld/ldfile.c     | 16 ++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 88 insertions(+)
+
+diff --git a/ld/config.in b/ld/config.in
+index 790efd336be..2b237bcda5e 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -86,6 +86,9 @@
+    language is requested. */
+ #undef ENABLE_NLS
+ 
++/* Define to warn for use of native system library directories */
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++
+ /* Additional extension a shared object might have. */
+ #undef EXTRA_SHLIB_EXTENSION
+ 
+diff --git a/ld/configure b/ld/configure
+index cd410bd64d1..7e9913949d4 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -843,6 +843,7 @@ enable_checking
+ with_lib_path
+ enable_targets
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1537,6 +1538,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
+   --enable-checking       enable run-time checks
+   --enable-targets        alternative target configurations
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15768,7 +15771,18 @@ else
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
+ 
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
+ 
+ # Check whether --enable-got was given.
+ if test "${enable_got+set}" = set; then :
+diff --git a/ld/configure.ac b/ld/configure.ac
+index f528ae42ef7..dcf1e17fae6 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -115,6 +115,16 @@ AC_SUBST(use_sysroot)
+ AC_SUBST(TARGET_SYSTEM_ROOT)
+ AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
+ 
++AC_ARG_ENABLE([poison-system-directories],
++         AS_HELP_STRING([--enable-poison-system-directories],
++                [warn for use of native system library directories]),,
++         [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++       [1],
++       [Define to warn for use of native system library directories])
++fi
++
+ dnl Use --enable-gold to decide if this linker should be the default.
+ dnl "install_as_default" is set to false if gold is the default linker.
+ dnl "installed_linker" is the installed BFD linker name.
+diff --git a/ld/ld.h b/ld/ld.h
+index c8688153bd4..0b16caf347a 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -166,6 +166,14 @@ typedef struct
+      in the linker script.  */
+   bool force_group_allocation;
+ 
++  /* If TRUE (the default) warn for uses of system directories when
++     cross linking.  */
++  bool poison_system_directories;
++
++  /* If TRUE (default FALSE) give an error for uses of system
++     directories when cross linking instead of a warning.  */
++  bool error_poison_system_directories;
++
+   /* Big or little endian as set on command line.  */
+   enum endian_enum endian;
+ 
+diff --git a/ld/ld.texi b/ld/ld.texi
+index cf750d15259..1acaa26f107 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -3427,6 +3427,18 @@ bit string identifying the original linked file does not change.
+ Passing @code{none} for @var{style} disables the setting from any
+ @code{--build-id} options earlier on the command line.
+ 
++@kindex --no-poison-system-directories
++@item --no-poison-system-directories
++Do not warn for @option{-L} options using system directories such as
++@file{/usr/lib} when cross linking.  This option is intended for use
++in chroot environments when such directories contain the correct
++libraries for the target system rather than the host.
++
++@kindex --error-poison-system-directories
++@item --error-poison-system-directories
++Give an error instead of a warning for @option{-L} options using
++system directories when cross linking.
++
+ @kindex --package-metadata=@var{JSON}
+ @item --package-metadata=@var{JSON}
+ Request the creation of a @code{.note.package} ELF note section.  The
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 75fd360d5e3..3526ea8146c 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -326,6 +326,22 @@ ldfile_add_library_path (const char *name, bool cmdline)
+     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
+   else
+     new_dirs->name = xstrdup (name);
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (command_line.poison_system_directories
++  && ((!strncmp (name, "/lib", 4))
++      || (!strncmp (name, "/usr/lib", 8))
++      || (!strncmp (name, "/usr/local/lib", 14))
++      || (!strncmp (name, "/usr/X11R6/lib", 14))))
++   {
++     if (command_line.error_poison_system_directories)
++       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++     else
++       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++   }
++#endif
+ }
+ 
+ static void
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index c8d61478c60..4b175dca108 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -174,6 +174,8 @@ enum option_values
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+   OPTION_ERROR_EXECSTACK,
+   OPTION_NO_ERROR_EXECSTACK,
+   OPTION_WARN_EXECSTACK_OBJECTS,
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 67c60c3f80d..c2365e4006c 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -760,6 +760,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = true;
+   command_line.warn_search_mismatch = true;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = true;
++  command_line.error_poison_system_directories = false;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index bde20465835..422866f4ea9 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -653,6 +653,14 @@ static const struct ld_option ld_options[] =
+ 		   "                                <method> is: share-unconflicted (default),\n"
+ 		   "                                             share-duplicated"),
+     TWO_DASHES },
++  { {"no-poison-system-directories", no_argument, NULL,
++    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Do not warn for -L options using system directories"),
++    TWO_DASHES },
++  { {"error-poison-system-directories", no_argument, NULL,
++    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Give an error for -L options using system directories"),
++    TWO_DASHES },
+ };
+ 
+ #define OPTION_COUNT ARRAY_SIZE (ld_options)
+@@ -665,6 +673,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1849,6 +1858,14 @@ parse_args (unsigned argc, char **argv)
+ 	  }
+ 	  break;
+ 
++	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
++	  command_line.poison_system_directories = false;
++	  break;
++
++	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++	  command_line.error_poison_system_directories = true;
++	  break;
++
+ 	case OPTION_PUSH_STATE:
+ 	  input_flags.pushed = xmemdup (&input_flags,
+ 					sizeof (input_flags),
+@@ -1999,6 +2016,10 @@ parse_args (unsigned argc, char **argv)
+       command_line.soname = NULL;
+     }
+ 
++  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
++    command_line.error_poison_system_directories = true;
++
+   while (ingroup)
+     {
+       einfo (_("%P: missing --end-group; added as last command line option\n"));
+-- 
+2.51.1
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 251dbf96f5..fc8733bfec 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -20,6 +20,9 @@ config BR2_BINUTILS_VERSION_2_45_X
 config BR2_BINUTILS_VERSION_2_46_X
 	bool "binutils 2.46.1"
 
+config BR2_BINUTILS_VERSION_2_47_X
+	bool "binutils 2.47"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -27,6 +30,7 @@ config BR2_BINUTILS_VERSION
 	default "2.44"		if BR2_BINUTILS_VERSION_2_44_X
 	default "2.45.1"	if BR2_BINUTILS_VERSION_2_45_X
 	default "2.46.1"	if BR2_BINUTILS_VERSION_2_46_X
+	default "2.47"		if BR2_BINUTILS_VERSION_2_47_X
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 37d14af006..214a0db791 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd2b29ff2563cec53e3d42f73e2c60cc5708e80d4a730efdcc6ae14ad7  binutils-2.44.tar.xz
 sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
 sha512  a5c65e56e400ed3fb8906a995dbb93eb5bea54b16344244653d7f44ef29ceb60270da263b19d25302c37759784e14fcb4b9421b29e0e2c7f450bd99f6bb4595c  binutils-2.46.1.tar.xz
+sha512  3126a1064374d8da40d4d70630c204ed1e75d542c447d53fca9778c7ceff095c28e9b445e15a313fef9729082d7966471ee6b5b715d479aa6d568528743e1d98  binutils-2.47.tar.xz
 
 # locally computed
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
