Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173DFC5475B
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 10:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E6440772;
	Sun,  3 Mar 2024 10:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhhWffIXcGtk; Sun,  3 Mar 2024 10:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FDD640836
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FDD640836;
	Sun,  3 Mar 2024 10:49:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E70861BF293
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D443660A9A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7T_I6x6wOEy for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 10:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A7B360770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A7B360770
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A7B360770
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 10:49:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6752813F838;
 Sun,  3 Mar 2024 11:49:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 11:49:29 +0100
Date: Sun, 3 Mar 2024 11:49:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZeRVuVX34CsaeBii@landeda>
References: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
 <20240303084014.156991-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240303084014.156991-4-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709462973;
 bh=0gxfR8h21fY+/IToJtckFr2wn3y0msrsI7bj+h+83MQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qEBES2QxF/fp/5VEvj4cCholNyoNUcJXJ+Eh3Dd+aZqivufyyP1+ejZds+daoIGD8
 nvR2WrfuK1ug+pRVcU4PEYWRUFQ1XqJhOgTioFtHjiwihNozAxJE3F+3dubAnOPv/b
 YsxIarR7+oh0TJv/E2UawganJhzAPzBo+ucquaMzfE/3ge7VKc3fTefuss/0k9bJrI
 OzBQkt1B7FvaBn3pZSxOYJxQfA2qW8vTTZr1oErKnawRSHUyTpKCBu/Q5+RHuF/GHm
 bzWkf7WJHcfoK8YASILrirTT42TBi7HV0l9qsGUmtL6Yh3OpdN2z8QfBw2GD13JuLm
 ilWyPs1WiU2Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qEBES2Qx
Subject: Re: [Buildroot] [PATCH next 3/4] package/binutils: drop support for
 binutils 2.39
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-03-03 09:40 +0100, Thomas Petazzoni via buildroot spake thusly:
> Now that we have integrated support for binutils 2.42, and made
> binutils 2.41 the default, following our tradition, we can drop
> support for binutils 2.39.
> 
> In addition to the usual things, there is an additional minor change
> in elf2flt.mk, which had a special condition applicable to binutils
> 2.39 or 2.40, which can be simplified to only apply to binutils 2.40
> now.

You had forgotten about one instance of BR2_BINUTILS_VERSION_2_39_X in
support/config-fragments/autobuild/br-arm-internal-glibc.config.

I fixed that, in the same manner you fixed it back in 3bb260cf3860.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |   3 -
>  Config.in.legacy                              |   6 +
>  package/binutils/2.39/0001-sh-conf.patch      |  48 ---
>  .../2.39/0002-poison-system-directories.patch | 298 ------------------
>  ...or1k-fix-building-with-gcc-version-5.patch |  50 ---
>  package/binutils/Config.in.host               |   5 -
>  package/binutils/binutils.hash                |   1 -
>  package/elf2flt/elf2flt.mk                    |   2 +-
>  8 files changed, 7 insertions(+), 406 deletions(-)
>  delete mode 100644 package/binutils/2.39/0001-sh-conf.patch
>  delete mode 100644 package/binutils/2.39/0002-poison-system-directories.patch
>  delete mode 100644 package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index c18cc4d417..6a45e1593c 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -193,9 +193,6 @@ package/berkeleydb/0001-cwd-db_config.patch Upstream
>  package/berkeleydb/0002-atomic_compare_exchange.patch Upstream
>  package/bind/0001-cross.patch Upstream
>  package/bind/S81named Indent Shellcheck Variables
> -package/binutils/2.39/0001-sh-conf.patch Upstream
> -package/binutils/2.39/0002-poison-system-directories.patch Upstream
> -package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch Upstream
>  package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch Upstream
>  package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch Upstream
>  package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch Upstream
> diff --git a/Config.in.legacy b/Config.in.legacy
> index a869279af7..94756a70ff 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2024.02"
>  
> +config BR2_BINUTILS_VERSION_2_39_X
> +	bool "binutils 2.39 has been removed"
> +	select BR2_LEGACY
> +	help
> +	  binutils 2.39 has been removed, use a newer version.
> +
>  config BR2_PACKAGE_TINYMEMBENCH
>  	bool "tinymembench removed"
>  	select BR2_LEGACY
> diff --git a/package/binutils/2.39/0001-sh-conf.patch b/package/binutils/2.39/0001-sh-conf.patch
> deleted file mode 100644
> index fcc597e4d9..0000000000
> --- a/package/binutils/2.39/0001-sh-conf.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 33f3c1f804efc2e4f97849081589efb70cda31e5 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Fri, 25 Dec 2015 11:38:13 +0100
> -Subject: [PATCH] sh-conf
> -
> -Likewise, binutils has no idea about any of these new targets either, so we
> -fix that up too.. now we're able to actually build a real toolchain for
> -sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
> -inept targets than that one, really. Go look, I promise).
> -
> -[Romain: rebase on top of 2.32]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> -[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - configure    | 2 +-
> - configure.ac | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index 3dd206525a7..6881ce632f5 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3892,7 +3892,7 @@ case "${target}" in
> -   nvptx*-*-*)
> -     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
> -     ;;
> --  sh-*-*)
> -+  sh*-*-*)
> -     case "${target}" in
> -       sh*-*-elf)
> -          ;;
> -diff --git a/configure.ac b/configure.ac
> -index 797a624621e..1f9256bbf18 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1175,7 +1175,7 @@ case "${target}" in
> -   nvptx*-*-*)
> -     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
> -     ;;
> --  sh-*-*)
> -+  sh*-*-*)
> -     case "${target}" in
> -       sh*-*-elf)
> -          ;;
> --- 
> -2.31.1
> -
> diff --git a/package/binutils/2.39/0002-poison-system-directories.patch b/package/binutils/2.39/0002-poison-system-directories.patch
> deleted file mode 100644
> index 1d9447b5c2..0000000000
> --- a/package/binutils/2.39/0002-poison-system-directories.patch
> +++ /dev/null
> @@ -1,298 +0,0 @@
> -From 4d8705ddb55897e8a74b617ab95736d520d9e1ea Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Fri, 25 Dec 2015 11:45:38 +0100
> -Subject: [PATCH] poison-system-directories
> -
> -Patch adapted to binutils 2.23.2 and extended to use
> -BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
> -
> -[Waldemar: rebase on top of 2.39]
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -[Romain: rebase on top of 2.33.1]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> -[Gustavo: adapt to binutils 2.25]
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -Upstream-Status: Inappropriate [distribution: codesourcery]
> -
> -Patch originally created by Mark Hatle, forward-ported to
> -binutils 2.21 by Scott Garman.
> -
> -purpose:  warn for uses of system directories when cross linking
> -
> -Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
> -
> -2008-07-02  Joseph Myers  <joseph@codesourcery.com>
> -
> -    ld/
> -    * ld.h (args_type): Add error_poison_system_directories.
> -    * ld.texinfo (--error-poison-system-directories): Document.
> -    * ldfile.c (ldfile_add_library_path): Check
> -    command_line.error_poison_system_directories.
> -    * ldmain.c (main): Initialize
> -    command_line.error_poison_system_directories.
> -    * lexsup.c (enum option_values): Add
> -    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
> -    (ld_options): Add --error-poison-system-directories.
> -    (parse_args): Handle new option.
> -
> -2007-06-13  Joseph Myers  <joseph@codesourcery.com>
> -
> -    ld/
> -    * config.in: Regenerate.
> -    * ld.h (args_type): Add poison_system_directories.
> -    * ld.texinfo (--no-poison-system-directories): Document.
> -    * ldfile.c (ldfile_add_library_path): Check
> -    command_line.poison_system_directories.
> -    * ldmain.c (main): Initialize
> -    command_line.poison_system_directories.
> -    * lexsup.c (enum option_values): Add
> -    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
> -    (ld_options): Add --no-poison-system-directories.
> -    (parse_args): Handle new option.
> -
> -2007-04-20  Joseph Myers  <joseph@codesourcery.com>
> -
> -    Merge from Sourcery G++ binutils 2.17:
> -
> -    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
> -    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
> -    ld/
> -    * configure.ac (--enable-poison-system-directories): New option.
> -    * configure, config.in: Regenerate.
> -    * ldfile.c (ldfile_add_library_path): If
> -    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
> -    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ----
> - ld/config.in    |  3 +++
> - ld/configure    | 14 ++++++++++++++
> - ld/configure.ac | 10 ++++++++++
> - ld/ld.h         |  8 ++++++++
> - ld/ld.texi      | 12 ++++++++++++
> - ld/ldfile.c     | 17 +++++++++++++++++
> - ld/ldlex.h      |  2 ++
> - ld/ldmain.c     |  2 ++
> - ld/lexsup.c     | 21 +++++++++++++++++++++
> - 9 files changed, 89 insertions(+)
> -
> -diff -Nur binutils-2.39.orig/ld/config.in binutils-2.39/ld/config.in
> ---- binutils-2.39.orig/ld/config.in	2022-08-05 11:56:56.000000000 +0200
> -+++ binutils-2.39/ld/config.in	2022-08-11 13:00:55.310472243 +0200
> -@@ -55,6 +55,9 @@
> -    language is requested. */
> - #undef ENABLE_NLS
> - 
> -+/* Define to warn for use of native system library directories */
> -+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> -+
> - /* Additional extension a shared object might have. */
> - #undef EXTRA_SHLIB_EXTENSION
> - 
> -diff -Nur binutils-2.39.orig/ld/configure binutils-2.39/ld/configure
> ---- binutils-2.39.orig/ld/configure	2022-08-05 11:56:54.000000000 +0200
> -+++ binutils-2.39/ld/configure	2022-08-11 13:00:55.370470806 +0200
> -@@ -836,6 +836,7 @@
> - enable_targets
> - enable_64_bit_bfd
> - with_sysroot
> -+enable_poison_system_directories
> - enable_gold
> - enable_got
> - enable_compressed_debug_sections
> -@@ -1514,6 +1515,8 @@
> -   --enable-checking       enable run-time checks
> -   --enable-targets        alternative target configurations
> -   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
> -+  --enable-poison-system-directories
> -+                          warn for use of native system library directories
> -   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
> -   --enable-got=<type>     GOT handling scheme (target, single, negative,
> -                           multigot)
> -@@ -15370,7 +15373,18 @@
> - fi
> - 
> - 
> -+# Check whether --enable-poison-system-directories was given.
> -+if test "${enable_poison_system_directories+set}" = set; then :
> -+  enableval=$enable_poison_system_directories;
> -+else
> -+  enable_poison_system_directories=no
> -+fi
> -+
> -+if test "x${enable_poison_system_directories}" = "xyes"; then
> - 
> -+$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> -+
> -+fi
> - 
> - # Check whether --enable-got was given.
> - if test "${enable_got+set}" = set; then :
> -diff -Nur binutils-2.39.orig/ld/configure.ac binutils-2.39/ld/configure.ac
> ---- binutils-2.39.orig/ld/configure.ac	2022-07-08 11:46:48.000000000 +0200
> -+++ binutils-2.39/ld/configure.ac	2022-08-11 13:00:55.370470806 +0200
> -@@ -102,6 +102,16 @@
> - AC_SUBST(TARGET_SYSTEM_ROOT)
> - AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
> - 
> -+AC_ARG_ENABLE([poison-system-directories],
> -+         AS_HELP_STRING([--enable-poison-system-directories],
> -+                [warn for use of native system library directories]),,
> -+         [enable_poison_system_directories=no])
> -+if test "x${enable_poison_system_directories}" = "xyes"; then
> -+  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> -+       [1],
> -+       [Define to warn for use of native system library directories])
> -+fi
> -+
> - dnl Use --enable-gold to decide if this linker should be the default.
> - dnl "install_as_default" is set to false if gold is the default linker.
> - dnl "installed_linker" is the installed BFD linker name.
> -diff -Nur binutils-2.39.orig/ld/ldfile.c binutils-2.39/ld/ldfile.c
> ---- binutils-2.39.orig/ld/ldfile.c	2022-07-08 11:46:48.000000000 +0200
> -+++ binutils-2.39/ld/ldfile.c	2022-08-11 13:00:55.394470231 +0200
> -@@ -117,6 +117,23 @@
> -     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
> -   else
> -     new_dirs->name = xstrdup (name);
> -+
> -+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> -+  if (command_line.poison_system_directories
> -+  && ((!strncmp (name, "/lib", 4))
> -+      || (!strncmp (name, "/usr/lib", 8))
> -+      || (!strncmp (name, "/usr/local/lib", 14))
> -+      || (!strncmp (name, "/usr/X11R6/lib", 14))))
> -+   {
> -+     if (command_line.error_poison_system_directories)
> -+       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
> -+            "cross-compilation\n"), name);
> -+     else
> -+       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
> -+            "cross-compilation\n"), name);
> -+   }
> -+#endif
> -+
> - }
> - 
> - /* Try to open a BFD for a lang_input_statement.  */
> -diff -Nur binutils-2.39.orig/ld/ld.h binutils-2.39/ld/ld.h
> ---- binutils-2.39.orig/ld/ld.h	2022-07-08 11:46:48.000000000 +0200
> -+++ binutils-2.39/ld/ld.h	2022-08-11 13:00:55.382470519 +0200
> -@@ -162,6 +162,14 @@
> -      in the linker script.  */
> -   bool force_group_allocation;
> - 
> -+  /* If TRUE (the default) warn for uses of system directories when
> -+     cross linking.  */
> -+  bool poison_system_directories;
> -+
> -+  /* If TRUE (default FALSE) give an error for uses of system
> -+     directories when cross linking instead of a warning.  */
> -+  bool error_poison_system_directories;
> -+
> -   /* Big or little endian as set on command line.  */
> -   enum endian_enum endian;
> - 
> -diff -Nur binutils-2.39.orig/ld/ldlex.h binutils-2.39/ld/ldlex.h
> ---- binutils-2.39.orig/ld/ldlex.h	2022-07-08 11:46:48.000000000 +0200
> -+++ binutils-2.39/ld/ldlex.h	2022-08-11 13:03:35.462636396 +0200
> -@@ -164,6 +164,8 @@
> -   OPTION_CTF_VARIABLES,
> -   OPTION_NO_CTF_VARIABLES,
> -   OPTION_CTF_SHARE_TYPES,
> -+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
> -+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
> -   OPTION_WARN_EXECSTACK,
> -   OPTION_NO_WARN_EXECSTACK,
> -   OPTION_WARN_RWX_SEGMENTS,
> -diff -Nur binutils-2.39.orig/ld/ldmain.c binutils-2.39/ld/ldmain.c
> ---- binutils-2.39.orig/ld/ldmain.c	2022-07-08 11:46:48.000000000 +0200
> -+++ binutils-2.39/ld/ldmain.c	2022-08-11 13:00:55.402470040 +0200
> -@@ -321,6 +321,8 @@
> -   command_line.warn_mismatch = true;
> -   command_line.warn_search_mismatch = true;
> -   command_line.check_section_addresses = -1;
> -+  command_line.poison_system_directories = true;
> -+  command_line.error_poison_system_directories = false;
> - 
> -   /* We initialize DEMANGLING based on the environment variable
> -      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
> -diff -Nur binutils-2.39.orig/ld/ld.texi binutils-2.39/ld/ld.texi
> ---- binutils-2.39.orig/ld/ld.texi	2022-07-08 11:46:48.000000000 +0200
> -+++ binutils-2.39/ld/ld.texi	2022-08-11 13:02:44.627853889 +0200
> -@@ -2936,6 +2936,18 @@
> - Passing @code{none} for @var{style} disables the setting from any
> - @code{--build-id} options earlier on the command line.
> - 
> -+@kindex --no-poison-system-directories
> -+@item --no-poison-system-directories
> -+Do not warn for @option{-L} options using system directories such as
> -+@file{/usr/lib} when cross linking.  This option is intended for use
> -+in chroot environments when such directories contain the correct
> -+libraries for the target system rather than the host.
> -+
> -+@kindex --error-poison-system-directories
> -+@item --error-poison-system-directories
> -+Give an error instead of a warning for @option{-L} options using
> -+system directories when cross linking.
> -+
> - @kindex --package-metadata=@var{JSON}
> - @item --package-metadata=@var{JSON}
> - Request the creation of a @code{.note.package} ELF note section.  The
> -diff -Nur binutils-2.39.orig/ld/lexsup.c binutils-2.39/ld/lexsup.c
> ---- binutils-2.39.orig/ld/lexsup.c	2022-07-08 11:46:48.000000000 +0200
> -+++ binutils-2.39/ld/lexsup.c	2022-08-11 13:00:55.434469274 +0200
> -@@ -608,6 +608,14 @@
> - 		   "                                <method> is: share-unconflicted (default),\n"
> - 		   "                                             share-duplicated"),
> -     TWO_DASHES },
> -+  { {"no-poison-system-directories", no_argument, NULL,
> -+    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
> -+    '\0', NULL, N_("Do not warn for -L options using system directories"),
> -+    TWO_DASHES },
> -+  { {"error-poison-system-directories", no_argument, NULL,
> -+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
> -+    '\0', NULL, N_("Give an error for -L options using system directories"),
> -+    TWO_DASHES },
> - };
> - 
> - #define OPTION_COUNT ARRAY_SIZE (ld_options)
> -@@ -620,6 +628,7 @@
> -   int ingroup = 0;
> -   char *default_dirlist = NULL;
> -   char *shortopts;
> -+  char *BR_paranoid_env;
> -   struct option *longopts;
> -   struct option *really_longopts;
> -   int last_optind;
> -@@ -1679,6 +1688,14 @@
> - 	  }
> - 	  break;
> - 
> -+	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
> -+	  command_line.poison_system_directories = false;
> -+	  break;
> -+
> -+	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
> -+	  command_line.error_poison_system_directories = true;
> -+	  break;
> -+
> - 	case OPTION_PUSH_STATE:
> - 	  input_flags.pushed = xmemdup (&input_flags,
> - 					sizeof (input_flags),
> -@@ -1824,6 +1841,10 @@
> -       command_line.soname = NULL;
> -     }
> - 
> -+  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> -+  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
> -+    command_line.error_poison_system_directories = true;
> -+
> -   while (ingroup)
> -     {
> -       einfo (_("%P: missing --end-group; added as last command line option\n"));
> --- 
> -2.31.1
> diff --git a/package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> deleted file mode 100644
> index bfd531b818..0000000000
> --- a/package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From ef4ba1da823e8366ea4f126f50885a44ebf4dcf0 Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Wed, 9 Jun 2021 17:28:27 +0200
> -Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
> -
> -Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
> -an old compiler(i.e. gcc 4.9) build fails on:
> -```
> -elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
> -C99 or C11 mode
> -    for (size_t i = 0; i < insn_count; i++)
> -    ^
> -```
> -
> -So let's declare `size_t i` at the top of the function instead of inside
> -for loop.
> -
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ----
> - bfd/elf32-or1k.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
> -index 4ae7f324d33..32063ab0289 100644
> ---- a/bfd/elf32-or1k.c
> -+++ b/bfd/elf32-or1k.c
> -@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> - {
> -   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
> -   unsigned output_insns[PLT_MAX_INSN_COUNT];
> -+  size_t i;
> - 
> -   /* Copy instructions into the output buffer.  */
> --  for (size_t i = 0; i < insn_count; i++)
> -+  for (i = 0; i < insn_count; i++)
> -     output_insns[i] = insns[i];
> - 
> -   /* Honor the no-delay-slot setting.  */
> -@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> -     }
> - 
> -   /* Write out the output buffer.  */
> --  for (size_t i = 0; i < (insn_count+1); i++)
> -+  for (i = 0; i < (insn_count+1); i++)
> -     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
> - }
> - 
> --- 
> -2.31.1
> -
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 7c2797e5fd..85ec9b1d11 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -15,10 +15,6 @@ choice
>  	help
>  	  Select the version of binutils you wish to use.
>  
> -config BR2_BINUTILS_VERSION_2_39_X
> -	bool "binutils 2.39"
> -	select BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
> -
>  config BR2_BINUTILS_VERSION_2_40_X
>  	bool "binutils 2.40"
>  
> @@ -37,7 +33,6 @@ endchoice
>  config BR2_BINUTILS_VERSION
>  	string
>  	default "arc-2023.09-release"	if BR2_BINUTILS_VERSION_ARC
> -	default "2.39"		if BR2_BINUTILS_VERSION_2_39_X
>  	default "2.40"		if BR2_BINUTILS_VERSION_2_40_X
>  	default "2.41"		if BR2_BINUTILS_VERSION_2_41_X
>  	default "2.42"		if BR2_BINUTILS_VERSION_2_42_X
> diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
> index e4c6a0b0b6..ac724d5c15 100644
> --- a/package/binutils/binutils.hash
> +++ b/package/binutils/binutils.hash
> @@ -1,5 +1,4 @@
>  # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
> -sha512  68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3  binutils-2.39.tar.xz
>  sha512  a37e042523bc46494d99d5637c3f3d8f9956d9477b748b3b1f6d7dfbb8d968ed52c932e88a4e946c6f77b8f48f1e1b360ca54c3d298f17193f3b4963472f6925  binutils-2.40.tar.xz
>  sha512  5df45d0bd6ddabdce4f35878c041e46a92deef01e7dea5facc97fd65cc06b59abc6fba0eb454b68e571c7e14038dc823fe7f2263843e6e627b7444eaf0fe9374  binutils-2.41.tar.xz
>  sha512  155f3ba14cd220102f4f29a4f1e5cfee3c48aa03b74603460d05afb73c70d6657a9d87eee6eb88bf13203fe6f31177a5c9addc04384e956e7da8069c8ecd20a6  binutils-2.42.tar.xz
> diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
> index 0def282c02..aa5595843f 100644
> --- a/package/elf2flt/elf2flt.mk
> +++ b/package/elf2flt/elf2flt.mk
> @@ -23,7 +23,7 @@ HOST_ELF2FLT_AUTORECONF = YES
>  # considered because Buildroot only supports ARC CPUs with a MMU and
>  # therefore host-elf2flt is never used on ARC. libiberty.a has
>  # remained at the same location.
> -ifeq ($(BR2_BINUTILS_VERSION_2_39_X)$(BR2_BINUTILS_VERSION_2_40_X),y)
> +ifeq ($(BR2_BINUTILS_VERSION_2_40_X),y)
>  HOST_ELF2FLT_LIBBFD_PATH = $(HOST_BINUTILS_DIR)/bfd/libbfd.a
>  else
>  HOST_ELF2FLT_LIBBFD_PATH = $(HOST_BINUTILS_DIR)/bfd/.libs/libbfd.a
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
