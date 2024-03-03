Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F723C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEBBE81FB8;
	Sun,  3 Mar 2024 16:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7m67TnEChhb; Sun,  3 Mar 2024 16:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0B1981F9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0B1981F9C;
	Sun,  3 Mar 2024 16:16:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6651BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F38A940232
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipc0Odc22wTT for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:16:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1201240135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1201240135
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1201240135
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:16:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E674913F88E;
 Sun,  3 Mar 2024 17:16:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 17:16:42 +0100
Date: Sun, 3 Mar 2024 17:16:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <ZeSiakPahvLCdUpG@landeda>
References: <20240104171224.1469776-1-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240104171224.1469776-1-abrodkin@synopsys.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709482609;
 bh=pwEv2t0gWHIRGtFhdNL59yprBfGKGgkIqllaGB5WTdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QUiYbibj6Lewb8JKx1R9pFcx7Ojknxvx7vI+1360hvGaiBV8G/3iyteP/XuMmvezI
 aLOqhyILwbD6nWeIXLWiWqAedjUZcWCbZkr/TzNOvp6LSLAs8r4jegib9/4wmy+noF
 yXClZQoZpuX9QgVWa7f4jsVDf10qczsviXQp98lIcwOkTbF10WuMUbcIoh4hk+eZBS
 SRsN7KYnYGRky5JgEHagr7My5Z/x/doNVVGDpiNnFNByjWMipnijWXpsufVKeEoVEc
 FboHg12Kq4Ne3N6rN28SXTilXltUWabR1oY08vql722KVW9t/IubFDnPHOzumlyst4
 pds3yACXulZpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QUiYbibj
Subject: Re: [Buildroot] [PATCH] ARC: Switch toolchain components to
 arc-2023.09-release
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
 Waldemar Brodkorb <mail@waldemar-brodkorb.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alexey, All,

On 2024-01-04 09:12 -0800, Alexey Brodkin via buildroot spake thusly:
> With the most recent ARC GNU toolchain version released [1]
> we may switch to its stable and verified components for Buildroot's
> built-in toolchian.

I tried a basic build here on current master, and it fails to build in
glibc:

    $ cat defconfig
    BR2_arcle=y
    BR2_PER_PACKAGE_DIRECTORIES=y

    $ make
    [...]
    /home/ymorin/dev/buildroot/O/master/per-package/glibc/host/bin/arc-buildroot-linux-gnu-gcc \
    msort.c \
    [...] \
    -o /home/ymorin/dev/buildroot/O/master/build/glibc-2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0/build/stdlib/msort.o \
    -MD -MP -MF \
    /home/ymorin/dev/buildroot/O/master/build/glibc-2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0/build/stdlib/msort.o.dt \
    -MT /home/ymorin/dev/buildroot/O/master/build/glibc-2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0/build/stdlib/msort.o
    msort.c: Assembler messages:
    msort.c:200: Error: opcode 'dmb' not supported for target arc700

Regards,
Yann E. MORIN.

> And while for ARCompact (i.e. ARC700) & ARCv2 (ARC HS38 & HS48)
> processors upstream components work just fine, in this new release
> of ARC GNU toolchain we have also support for newer ARCv3 procesors.
> 
> And so that update is more of an enabler for introduction of ARCv3
> in the next series of patches.
> 
> [1] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2023.09-release
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> ---
>  .checkpackageignore                           |   4 -
>  package/binutils/Config.in.host               |   5 +-
>  .../0001-poison-system-directories.patch      | 310 ------------------
>  package/binutils/binutils.hash                |   2 +-
>  package/binutils/binutils.mk                  |   4 +-
>  package/gcc/Config.in.host                    |   4 +-
>  .../0001-arc-Refurbish-adc-sbc-patterns.patch | 243 --------------
>  ...er-Remove-cyclades-from-libsanitizer.patch | 121 -------
>  ...-machine-names-in-__has_include-.-PR.patch | 124 -------
>  .../0100-uclibc-conf.patch                    |  29 --
>  package/gcc/gcc.hash                          |   2 +-
>  package/gdb/Config.in                         |   4 +-
>  package/gdb/Config.in.host                    |   2 +-
>  ...t-define-basic_string_view-to_string.patch | 114 -------
>  package/gdb/gdb.hash                          |   2 +-
>  package/gdb/gdb.mk                            |  20 +-
>  16 files changed, 22 insertions(+), 968 deletions(-)
>  delete mode 100644 package/binutils/arc-2020.09-release/0001-poison-system-directories.patch
>  delete mode 100644 package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch
>  delete mode 100644 package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch
>  delete mode 100644 package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
>  delete mode 100644 package/gcc/arc-2020.09-release/0100-uclibc-conf.patch
>  delete mode 100644 package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index aa8a6abc4f..96220ee3fb 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -202,7 +202,6 @@ package/bind/S81named Indent Shellcheck Variables
>  package/binutils/2.39/0001-sh-conf.patch Upstream
>  package/binutils/2.39/0002-poison-system-directories.patch Upstream
>  package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch Upstream
> -package/binutils/arc-2020.09-release/0001-poison-system-directories.patch Upstream
>  package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch Upstream
>  package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch Upstream
>  package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch Upstream
> @@ -451,9 +450,6 @@ package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch Upstream
>  package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch Upstream
>  package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch Upstream
>  package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch Upstream
> -package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch Upstream
> -package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch Sob Upstream
> -package/gcc/arc-2020.09-release/0100-uclibc-conf.patch Upstream
>  package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch Upstream
>  package/gdal/0001-fix-uclibc-build-without-NPTL.patch Upstream
>  package/gdb/12.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch Upstream
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index bc7dc4443c..2f1ddf4bdc 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -26,15 +26,14 @@ config BR2_BINUTILS_VERSION_2_41_X
>  	bool "binutils 2.41"
>  
>  config BR2_BINUTILS_VERSION_ARC
> -	bool "binutils arc (2.34.50)"
> +	bool "binutils arc (2.41)"
>  	depends on BR2_arc
> -	select BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
>  
>  endchoice
>  
>  config BR2_BINUTILS_VERSION
>  	string
> -	default "arc-2020.09-release"	if BR2_BINUTILS_VERSION_ARC
> +	default "arc-2023.09-release"	if BR2_BINUTILS_VERSION_ARC
>  	default "2.39"		if BR2_BINUTILS_VERSION_2_39_X
>  	default "2.40"		if BR2_BINUTILS_VERSION_2_40_X
>  	default "2.41"		if BR2_BINUTILS_VERSION_2_41_X
> diff --git a/package/binutils/arc-2020.09-release/0001-poison-system-directories.patch b/package/binutils/arc-2020.09-release/0001-poison-system-directories.patch
> deleted file mode 100644
> index 7a76ef2963..0000000000
> --- a/package/binutils/arc-2020.09-release/0001-poison-system-directories.patch
> +++ /dev/null
> @@ -1,310 +0,0 @@
> -From 5f62ad7ce534e3384d6ed8892614979da297bd70 Mon Sep 17 00:00:00 2001
> -From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> -Date: Mon, 14 Oct 2019 16:45:15 +0300
> -Subject: [PATCH] [PATCH] poison-system-directories
> -
> -Patch adapted to arc-binutils-gdb-2019.09
> -Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> -
> -Patch adapted to binutils 2.23.2 and extended to use
> -BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
> -
> -[Romain: rebase on top of 2.26]
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
> -diff --git a/ld/config.in b/ld/config.in
> -index d93c9b08300..5da2742beac 100644
> ---- a/ld/config.in
> -+++ b/ld/config.in
> -@@ -31,6 +31,9 @@
> -    language is requested. */
> - #undef ENABLE_NLS
> - 
> -+/* Define to warn for use of native system library directories */
> -+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> -+
> - /* Additional extension a shared object might have. */
> - #undef EXTRA_SHLIB_EXTENSION
> - 
> -diff --git a/ld/configure b/ld/configure
> -index 2d6ca5c0445..563f9921f7f 100755
> ---- a/ld/configure
> -+++ b/ld/configure
> -@@ -823,6 +823,7 @@ with_lib_path
> - enable_targets
> - enable_64_bit_bfd
> - with_sysroot
> -+enable_poison_system_directories
> - enable_gold
> - enable_got
> - enable_compressed_debug_sections
> -@@ -1487,6 +1488,8 @@ Optional Features:
> -   --disable-largefile     omit support for large files
> -   --enable-targets        alternative target configurations
> -   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
> -+  --enable-poison-system-directories
> -+                          warn for use of native system library directories
> -   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
> -   --enable-got=<type>     GOT handling scheme (target, single, negative,
> -                           multigot)
> -@@ -15804,7 +15807,18 @@ else
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
> -diff --git a/ld/configure.ac b/ld/configure.ac
> -index 41a51bbb7e9..dbaa98a9e17 100644
> ---- a/ld/configure.ac
> -+++ b/ld/configure.ac
> -@@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
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
> -diff --git a/ld/ld.h b/ld/ld.h
> -index 55078a9637b..511e9bc34b7 100644
> ---- a/ld/ld.h
> -+++ b/ld/ld.h
> -@@ -180,6 +180,14 @@ typedef struct
> -      in the linker script.  */
> -   bfd_boolean force_group_allocation;
> - 
> -+  /* If TRUE (the default) warn for uses of system directories when
> -+     cross linking.  */
> -+  bfd_boolean poison_system_directories;
> -+
> -+  /* If TRUE (default FALSE) give an error for uses of system
> -+     directories when cross linking instead of a warning.  */
> -+  bfd_boolean error_poison_system_directories;
> -+
> -   /* Big or little endian as set on command line.  */
> -   enum endian_enum endian;
> - 
> -diff --git a/ld/ld.texi b/ld/ld.texi
> -index fcbc335c95e..6ba7ebdb32a 100644
> ---- a/ld/ld.texi
> -+++ b/ld/ld.texi
> -@@ -2557,6 +2557,18 @@ string identifying the original linked file does not change.
> - 
> - Passing @code{none} for @var{style} disables the setting from any
> - @code{--build-id} options earlier on the command line.
> -+
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
> - @end table
> - 
> - @c man end
> -diff --git a/ld/ldfile.c b/ld/ldfile.c
> -index 7f60319390e..0bcc06db964 100644
> ---- a/ld/ldfile.c
> -+++ b/ld/ldfile.c
> -@@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
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
> -diff --git a/ld/ldlex.h b/ld/ldlex.h
> -index 32a7a6409e8..c02b64bf92f 100644
> ---- a/ld/ldlex.h
> -+++ b/ld/ldlex.h
> -@@ -152,6 +152,8 @@ enum option_values
> -   OPTION_NO_PRINT_MAP_DISCARDED,
> -   OPTION_NON_CONTIGUOUS_REGIONS,
> -   OPTION_NON_CONTIGUOUS_REGIONS_WARNINGS,
> -+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
> -+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
> - };
> -
> - 
> - /* The initial parser states.  */
> -diff --git a/ld/ldmain.c b/ld/ldmain.c
> -index 34c19223137..66d2c3f4bcf 100644
> ---- a/ld/ldmain.c
> -+++ b/ld/ldmain.c
> -@@ -270,6 +270,8 @@ main (int argc, char **argv)
> -   command_line.warn_mismatch = TRUE;
> -   command_line.warn_search_mismatch = TRUE;
> -   command_line.check_section_addresses = -1;
> -+  command_line.poison_system_directories = TRUE;
> -+  command_line.error_poison_system_directories = FALSE;
> - 
> -   /* We initialize DEMANGLING based on the environment variable
> -      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
> -diff --git a/ld/lexsup.c b/ld/lexsup.c
> -index 1c15ac29c0c..8b714e10a40 100644
> ---- a/ld/lexsup.c
> -+++ b/ld/lexsup.c
> -@@ -549,6 +549,14 @@ static const struct ld_option ld_options[] =
> -   { {"no-print-map-discarded", no_argument, NULL, OPTION_NO_PRINT_MAP_DISCARDED},
> -     '\0', NULL, N_("Do not show discarded sections in map file output"),
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
> -@@ -561,6 +569,7 @@ parse_args (unsigned argc, char **argv)
> -   int ingroup = 0;
> -   char *default_dirlist = NULL;
> -   char *shortopts;
> -+  char *BR_paranoid_env;
> -   struct option *longopts;
> -   struct option *really_longopts;
> -   int last_optind;
> -@@ -1549,6 +1558,14 @@ parse_args (unsigned argc, char **argv)
> - 	  }
> - 	  break;
> - 
> -+	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
> -+	  command_line.poison_system_directories = FALSE;
> -+	  break;
> -+
> -+	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
> -+	  command_line.error_poison_system_directories = TRUE;
> -+	  break;
> -+
> - 	case OPTION_PUSH_STATE:
> - 	  input_flags.pushed = xmemdup (&input_flags,
> - 					sizeof (input_flags),
> -@@ -1600,6 +1617,10 @@ parse_args (unsigned argc, char **argv)
> -       command_line.soname = NULL;
> -     }
> - 
> -+  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> -+  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
> -+    command_line.error_poison_system_directories = TRUE;
> -+
> -   while (ingroup)
> -     {
> -       einfo (_("%P: missing --end-group; added as last command line option\n"));
> --- 
> -2.16.2
> -
> diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
> index 564a4c3bd7..519a0ca887 100644
> --- a/package/binutils/binutils.hash
> +++ b/package/binutils/binutils.hash
> @@ -4,7 +4,7 @@ sha512  a37e042523bc46494d99d5637c3f3d8f9956d9477b748b3b1f6d7dfbb8d968ed52c932e8
>  sha512  5df45d0bd6ddabdce4f35878c041e46a92deef01e7dea5facc97fd65cc06b59abc6fba0eb454b68e571c7e14038dc823fe7f2263843e6e627b7444eaf0fe9374  binutils-2.41.tar.xz
>  
>  # Locally calculated (fetched from Github)
> -sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
> +sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  binutils-gdb-arc-2023.09-release.tar.gz
>  
>  # locally computed
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 4bc1b69fa0..6846933646 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -9,13 +9,13 @@
>  BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
>  ifeq ($(BINUTILS_VERSION),)
>  ifeq ($(BR2_arc),y)
> -BINUTILS_VERSION = arc-2020.09-release
> +BINUTILS_VERSION = arc-2023.09-release
>  else
>  BINUTILS_VERSION = 2.40
>  endif
>  endif # BINUTILS_VERSION
>  
> -ifeq ($(BINUTILS_VERSION),arc-2020.09-release)
> +ifeq ($(BINUTILS_VERSION),arc-2023.09-release)
>  BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
>  BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
>  BINUTILS_FROM_GIT = y
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index ebdcdba62e..fabc6173f5 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -10,7 +10,7 @@ choice
>  	  Select the version of gcc you wish to use.
>  
>  config BR2_GCC_VERSION_ARC
> -	bool "gcc arc (10.x)"
> +	bool "gcc arc (13.1)"
>  	# Only supported architecture
>  	depends on BR2_arc
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> @@ -79,7 +79,7 @@ config BR2_GCC_VERSION
>  	default "11.4.0"    if BR2_GCC_VERSION_11_X
>  	default "12.3.0"    if BR2_GCC_VERSION_12_X
>  	default "13.2.0"    if BR2_GCC_VERSION_13_X
> -	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
> +	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
>  
>  config BR2_EXTRA_GCC_CONFIG_OPTIONS
>  	string "Additional gcc options"
> diff --git a/package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch b/package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch
> deleted file mode 100644
> index 3292b26a4e..0000000000
> --- a/package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch
> +++ /dev/null
> @@ -1,243 +0,0 @@
> -From b92c22b144d063c4436a6693045ceb57d344c495 Mon Sep 17 00:00:00 2001
> -From: Claudiu Zissulescu <claziss@synopsys.com>
> -Date: Wed, 11 Nov 2020 12:31:10 +0200
> -Subject: [PATCH] arc: Refurbish adc/sbc patterns
> -
> -The adc/sbc patterns were unecessary spliting, remove that and
> -associated functions.
> -
> -gcc/ChangeLog:
> -
> -2020-10-11  Claudiu Zissulescu  <claziss@synopsys.com>
> -
> -	* config/arc/arc-protos.h (arc_scheduling_not_expected): Remove
> -	it.
> -	(arc_sets_cc_p): Likewise.
> -	(arc_need_delay): Likewise.
> -	* config/arc/arc.c (arc_sets_cc_p): Likewise.
> -	(arc_need_delay): Likewise.
> -	(arc_scheduling_not_expected): Likewise.
> -	* config/arc/arc.md: Convert adc/sbc patterns to simple
> -	instruction definitions.
> -
> -Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> -
> -Downloaded from upstream commit
> -https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/b92c22b144d063c4436a6693045ceb57d344c495
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - gcc/config/arc/arc-protos.h |  3 --
> - gcc/config/arc/arc.c        | 53 ---------------------
> - gcc/config/arc/arc.md       | 95 +++++++++++--------------------------
> - 3 files changed, 29 insertions(+), 122 deletions(-)
> -
> -diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
> -index c72d78e3b9e..de4cf47c818 100644
> ---- a/gcc/config/arc/arc-protos.h
> -+++ b/gcc/config/arc/arc-protos.h
> -@@ -90,10 +90,7 @@ extern void split_subsi (rtx *);
> - extern void arc_split_move (rtx *);
> - extern const char *arc_short_long (rtx_insn *insn, const char *, const char *);
> - extern rtx arc_regno_use_in (unsigned int, rtx);
> --extern bool arc_scheduling_not_expected (void);
> --extern bool arc_sets_cc_p (rtx_insn *insn);
> - extern int arc_label_align (rtx_insn *label);
> --extern bool arc_need_delay (rtx_insn *insn);
> - extern bool arc_text_label (rtx_insn *insn);
> - 
> - extern bool arc_short_comparison_p (rtx, int);
> -diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
> -index 5a7b0cb6696..c3ee9181f93 100644
> ---- a/gcc/config/arc/arc.c
> -+++ b/gcc/config/arc/arc.c
> -@@ -10341,59 +10341,6 @@ arc_attr_type (rtx_insn *insn)
> -   return get_attr_type (insn);
> - }
> - 
> --/* Return true if insn sets the condition codes.  */
> --
> --bool
> --arc_sets_cc_p (rtx_insn *insn)
> --{
> --  if (NONJUMP_INSN_P (insn))
> --    if (rtx_sequence *seq = dyn_cast <rtx_sequence *> (PATTERN (insn)))
> --      insn = seq->insn (seq->len () - 1);
> --  return arc_attr_type (insn) == TYPE_COMPARE;
> --}
> --
> --/* Return true if INSN is an instruction with a delay slot we may want
> --   to fill.  */
> --
> --bool
> --arc_need_delay (rtx_insn *insn)
> --{
> --  rtx_insn *next;
> --
> --  if (!flag_delayed_branch)
> --    return false;
> --  /* The return at the end of a function needs a delay slot.  */
> --  if (NONJUMP_INSN_P (insn) && GET_CODE (PATTERN (insn)) == USE
> --      && (!(next = next_active_insn (insn))
> --	  || ((!NONJUMP_INSN_P (next) || GET_CODE (PATTERN (next)) != SEQUENCE)
> --	      && arc_attr_type (next) == TYPE_RETURN))
> --      && (!TARGET_PAD_RETURN
> --	  || (prev_active_insn (insn)
> --	      && prev_active_insn (prev_active_insn (insn))
> --	      && prev_active_insn (prev_active_insn (prev_active_insn (insn))))))
> --    return true;
> --  if (NONJUMP_INSN_P (insn)
> --      ? (GET_CODE (PATTERN (insn)) == USE
> --	 || GET_CODE (PATTERN (insn)) == CLOBBER
> --	 || GET_CODE (PATTERN (insn)) == SEQUENCE)
> --      : JUMP_P (insn)
> --      ? (GET_CODE (PATTERN (insn)) == ADDR_VEC
> --	 || GET_CODE (PATTERN (insn)) == ADDR_DIFF_VEC)
> --      : !CALL_P (insn))
> --    return false;
> --  return num_delay_slots (insn) != 0;
> --}
> --
> --/* Return true if the scheduling pass(es) has/have already run,
> --   i.e. where possible, we should try to mitigate high latencies
> --   by different instruction selection.  */
> --
> --bool
> --arc_scheduling_not_expected (void)
> --{
> --  return cfun->machine->arc_reorg_started;
> --}
> --
> - /* Code has a minimum p2 alignment of 1, which we must restore after
> -    an ADDR_DIFF_VEC.  */
> - 
> -diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
> -index f91adbc0d94..c635b69ddd5 100644
> ---- a/gcc/config/arc/arc.md
> -+++ b/gcc/config/arc/arc.md
> -@@ -2847,43 +2847,25 @@ archs4x, archs4xd"
> -    (set_attr "type" "compare")
> -    (set_attr "length" "4,4,8")])
> - 
> --; w/c/c comes first (rather than w/0/C_0) to prevent the middle-end
> --; needlessly prioritizing the matching constraint.
> --; Rcw/0/C_0 comes before w/c/L so that the lower latency conditional
> --; execution is used where possible.
> --(define_insn_and_split "adc"
> --  [(set (match_operand:SI 0 "dest_reg_operand" "=w,Rcw,w,Rcw,w")
> --	(plus:SI (plus:SI (ltu:SI (reg:CC_C CC_REG) (const_int 0))
> --			  (match_operand:SI 1 "nonmemory_operand"
> --							 "%c,0,c,0,cCal"))
> --		 (match_operand:SI 2 "nonmemory_operand" "c,C_0,L,I,cCal")))]
> -+(define_insn "adc"
> -+  [(set (match_operand:SI 0 "register_operand"    "=r,  r,r,r,  r,r")
> -+	(plus:SI
> -+	 (plus:SI
> -+	  (ltu:SI (reg:CC_C CC_REG) (const_int 0))
> -+	  (match_operand:SI 1 "nonmemory_operand" "%r,  0,r,0,Cal,r"))
> -+	 (match_operand:SI 2 "nonmemory_operand"   "r,C_0,L,I,  r,Cal")))]
> -   "register_operand (operands[1], SImode)
> -    || register_operand (operands[2], SImode)"
> -   "@
> --	adc %0,%1,%2
> --	add.cs %0,%1,1
> --	adc %0,%1,%2
> --	adc %0,%1,%2
> --	adc %0,%1,%2"
> --  ; if we have a bad schedule after sched2, split.
> --  "reload_completed
> --   && !optimize_size && (!TARGET_ARC600_FAMILY)
> --   && arc_scheduling_not_expected ()
> --   && arc_sets_cc_p (prev_nonnote_insn (insn))
> --   /* If next comes a return or other insn that needs a delay slot,
> --      expect the adc to get into the delay slot.  */
> --   && next_nonnote_insn (insn)
> --   && !arc_need_delay (next_nonnote_insn (insn))
> --   /* Restore operands before emitting.  */
> --   && (extract_insn_cached (insn), 1)"
> --  [(set (match_dup 0) (match_dup 3))
> --   (cond_exec
> --     (ltu (reg:CC_C CC_REG) (const_int 0))
> --     (set (match_dup 0) (plus:SI (match_dup 0) (const_int 1))))]
> --  "operands[3] = simplify_gen_binary (PLUS, SImode, operands[1], operands[2]);"
> -+    adc\\t%0,%1,%2
> -+    add.cs\\t%0,%1,1
> -+    adc\\t%0,%1,%2
> -+    adc\\t%0,%1,%2
> -+    adc\\t%0,%1,%2
> -+    adc\\t%0,%1,%2"
> -   [(set_attr "cond" "use")
> -    (set_attr "type" "cc_arith")
> --   (set_attr "length" "4,4,4,4,8")])
> -+   (set_attr "length" "4,4,4,4,8,8")])
> - 
> - ; combiner-splitter cmp / scc -> cmp / adc
> - (define_split
> -@@ -3015,7 +2997,7 @@ archs4x, archs4xd"
> -       DONE;
> -     }
> -   emit_insn (gen_sub_f (l0, l1, l2));
> --  emit_insn (gen_sbc (h0, h1, h2, gen_rtx_REG (CCmode, CC_REG)));
> -+  emit_insn (gen_sbc (h0, h1, h2));
> -   DONE;
> -   ")
> - 
> -@@ -3030,44 +3012,25 @@ archs4x, archs4xd"
> -    (set_attr "type" "cc_arith")
> -    (set_attr "length" "4")])
> - 
> --; w/c/c comes first (rather than Rcw/0/C_0) to prevent the middle-end
> --; needlessly prioritizing the matching constraint.
> --; Rcw/0/C_0 comes before w/c/L so that the lower latency conditional execution
> --; is used where possible.
> --(define_insn_and_split "sbc"
> --  [(set (match_operand:SI 0 "dest_reg_operand" "=w,Rcw,w,Rcw,w")
> --	(minus:SI (minus:SI (match_operand:SI 1 "nonmemory_operand"
> --						"c,0,c,0,cCal")
> --			    (ltu:SI (match_operand:CC_C 3 "cc_use_register")
> --				    (const_int 0)))
> --		  (match_operand:SI 2 "nonmemory_operand" "c,C_0,L,I,cCal")))]
> -+(define_insn "sbc"
> -+  [(set (match_operand:SI 0 "dest_reg_operand"   "=r,r,r,r,r,r")
> -+	(minus:SI
> -+	 (minus:SI
> -+	  (match_operand:SI 1 "nonmemory_operand" "r,  0,r,0,  r,Cal")
> -+	  (ltu:SI (reg:CC_C CC_REG) (const_int 0)))
> -+	 (match_operand:SI 2 "nonmemory_operand"  "r,C_0,L,I,Cal,r")))]
> -   "register_operand (operands[1], SImode)
> -    || register_operand (operands[2], SImode)"
> -   "@
> --	sbc %0,%1,%2
> --	sub.cs %0,%1,1
> --	sbc %0,%1,%2
> --	sbc %0,%1,%2
> --	sbc %0,%1,%2"
> --  ; if we have a bad schedule after sched2, split.
> --  "reload_completed
> --   && !optimize_size && (!TARGET_ARC600_FAMILY)
> --   && arc_scheduling_not_expected ()
> --   && arc_sets_cc_p (prev_nonnote_insn (insn))
> --   /* If next comes a return or other insn that needs a delay slot,
> --      expect the adc to get into the delay slot.  */
> --   && next_nonnote_insn (insn)
> --   && !arc_need_delay (next_nonnote_insn (insn))
> --   /* Restore operands before emitting.  */
> --   && (extract_insn_cached (insn), 1)"
> --  [(set (match_dup 0) (match_dup 4))
> --   (cond_exec
> --     (ltu (reg:CC_C CC_REG) (const_int 0))
> --     (set (match_dup 0) (plus:SI (match_dup 0) (const_int -1))))]
> --  "operands[4] = simplify_gen_binary (MINUS, SImode, operands[1], operands[2]);"
> -+    sbc\\t%0,%1,%2
> -+    sub.cs\\t%0,%1,1
> -+    sbc\\t%0,%1,%2
> -+    sbc\\t%0,%1,%2
> -+    sbc\\t%0,%1,%2
> -+    sbc\\t%0,%1,%2"
> -   [(set_attr "cond" "use")
> -    (set_attr "type" "cc_arith")
> --   (set_attr "length" "4,4,4,4,8")])
> -+   (set_attr "length" "4,4,4,4,8,8")])
> - 
> - (define_insn "sub_f"
> -   [(set (reg:CC CC_REG)
> diff --git a/package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch b/package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> deleted file mode 100644
> index 051d4db341..0000000000
> --- a/package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> +++ /dev/null
> @@ -1,121 +0,0 @@
> -From 1557c3d919623a95c2aa090d3018c31401f63f88 Mon Sep 17 00:00:00 2001
> -From: Tamar Christina <tamar.christina@arm.com>
> -Date: Fri, 21 May 2021 12:16:56 +0100
> -Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
> -
> -The Linux kernel has removed the interface to cyclades from
> -the latest kernel headers[1] due to them being orphaned for the
> -past 13 years.
> -
> -libsanitizer uses this header when compiling against glibc, but
> -glibcs itself doesn't seem to have any references to cyclades.
> -
> -Further more it seems that the driver is broken in the kernel and
> -the firmware doesn't seem to be available anymore.
> -
> -As such since this is breaking the build of libsanitizer (and so the
> -GCC bootstrap[2]) I propose to remove this.
> -
> -[1] https://lkml.org/lkml/2021/3/2/153
> -[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
> -
> -libsanitizer/ChangeLog:
> -
> -	PR sanitizer/100379
> -	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
> -	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
> -	* sanitizer_common/sanitizer_platform_limits_posix.cc: Likewise.
> -	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
> ----
> - .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
> - .../sanitizer_platform_limits_posix.cpp               | 11 -----------
> - .../sanitizer_platform_limits_posix.h                 | 10 ----------
> - 3 files changed, 30 deletions(-)
> -
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> -index 490a04b2181..42e43a04441 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> -+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> -@@ -366,15 +366,6 @@ static void ioctl_table_fill() {
> - 
> - #if SANITIZER_LINUX && !SANITIZER_ANDROID
> -   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
> --  _(CYGETDEFTHRESH, WRITE, sizeof(int));
> --  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
> --  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
> --  _(CYGETTHRESH, WRITE, sizeof(int));
> --  _(CYGETTIMEOUT, WRITE, sizeof(int));
> --  _(CYSETDEFTHRESH, NONE, 0);
> --  _(CYSETDEFTIMEOUT, NONE, 0);
> --  _(CYSETTHRESH, NONE, 0);
> --  _(CYSETTIMEOUT, NONE, 0);
> -   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
> -   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
> -   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -index aa845df4dde..badf6a401cc 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -@@ -130,7 +130,6 @@ typedef struct user_fpregs elf_fpregset_t;
> - # include <sys/procfs.h>
> - #endif
> - #include <sys/user.h>
> --#include <linux/cyclades.h>
> - #include <linux/if_eql.h>
> - #include <linux/if_plip.h>
> - #include <linux/lp.h>
> -@@ -443,7 +442,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> - 
> - #if SANITIZER_LINUX && !SANITIZER_ANDROID
> -   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
> --  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
> - #if EV_VERSION > (0x010000)
> -   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
> - #else
> -@@ -809,15 +807,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> - #endif // SANITIZER_LINUX
> - 
> - #if SANITIZER_LINUX && !SANITIZER_ANDROID
> --  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
> --  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
> --  unsigned IOCTL_CYGETMON = CYGETMON;
> --  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
> --  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
> --  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
> --  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
> --  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
> --  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
> -   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
> -   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
> -   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -index d82fd5e4005..dc6423bc297 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> -@@ -974,7 +974,6 @@ extern unsigned struct_vt_mode_sz;
> - 
> - #if SANITIZER_LINUX && !SANITIZER_ANDROID
> - extern unsigned struct_ax25_parms_struct_sz;
> --extern unsigned struct_cyclades_monitor_sz;
> - extern unsigned struct_input_keymap_entry_sz;
> - extern unsigned struct_ipx_config_data_sz;
> - extern unsigned struct_kbdiacrs_sz;
> -@@ -1319,15 +1318,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
> - #endif  // SANITIZER_LINUX
> - 
> - #if SANITIZER_LINUX && !SANITIZER_ANDROID
> --extern unsigned IOCTL_CYGETDEFTHRESH;
> --extern unsigned IOCTL_CYGETDEFTIMEOUT;
> --extern unsigned IOCTL_CYGETMON;
> --extern unsigned IOCTL_CYGETTHRESH;
> --extern unsigned IOCTL_CYGETTIMEOUT;
> --extern unsigned IOCTL_CYSETDEFTHRESH;
> --extern unsigned IOCTL_CYSETDEFTIMEOUT;
> --extern unsigned IOCTL_CYSETTHRESH;
> --extern unsigned IOCTL_CYSETTIMEOUT;
> - extern unsigned IOCTL_EQL_EMANCIPATE;
> - extern unsigned IOCTL_EQL_ENSLAVE;
> - extern unsigned IOCTL_EQL_GETMASTRCFG;
> --- 
> -2.31.1
> -
> diff --git a/package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch b/package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
> deleted file mode 100644
> index 8b6be49e68..0000000000
> --- a/package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
> +++ /dev/null
> @@ -1,124 +0,0 @@
> -From 65754c50a57e5a891cee75bb744eb93fdb3c443e Mon Sep 17 00:00:00 2001
> -From: Xi Ruoyao <xry111@mengyan1223.wang>
> -Date: Mon, 28 Jun 2021 13:54:58 +0800
> -Subject: [PATCH] fixinc: don't "fix" machine names in __has_include(...)
> - [PR91085]
> -
> -fixincludes/
> -
> -	PR other/91085
> -	* fixfixes.c (check_has_inc): New static function.
> -	  (machine_name_fix): Don't replace header names in
> -	  __has_include(...).
> -	* inclhack.def (machine_name): Adjust test.
> -	* tests/base/testing.h: Update.
> -
> -Upstream: 6bf383c37e6131a8e247e8a0997d55d65c830b6d
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - fixincludes/fixfixes.c           | 45 ++++++++++++++++++++++++++++++--
> - fixincludes/inclhack.def         |  3 ++-
> - fixincludes/tests/base/testing.h |  2 +-
> - 3 files changed, 46 insertions(+), 4 deletions(-)
> -
> -diff --git a/fixincludes/fixfixes.c b/fixincludes/fixfixes.c
> -index 034e15d9985..3ff87812036 100644
> ---- a/fixincludes/fixfixes.c
> -+++ b/fixincludes/fixfixes.c
> -@@ -477,6 +477,39 @@ FIX_PROC_HEAD( char_macro_def_fix )
> -   fputs (text, stdout);
> - }
> - 
> -+/* Check if the pattern at pos is actually in a "__has_include(...)"
> -+   directive.  Return the pointer to the ')' of this
> -+   "__has_include(...)" if it is, NULL otherwise.  */
> -+static const char *
> -+check_has_inc (const char *begin, const char *pos, const char *end)
> -+{
> -+  static const char has_inc[] = "__has_include";
> -+  const size_t has_inc_len = sizeof (has_inc) - 1;
> -+  const char *p;
> -+
> -+  for (p = memmem (begin, pos - begin, has_inc, has_inc_len);
> -+       p != NULL;
> -+       p = memmem (p, pos - p, has_inc, has_inc_len))
> -+    {
> -+      p += has_inc_len;
> -+      while (p < end && ISSPACE (*p))
> -+        p++;
> -+
> -+      /* "__has_include" may appear as "defined(__has_include)",
> -+         search for the next appearance then.  */
> -+      if (*p != '(')
> -+        continue;
> -+
> -+      /* To avoid too much complexity, just hope there is never a
> -+         ')' in a header name.  */
> -+      p = memchr (p, ')', end - p);
> -+      if (p == NULL || p > pos)
> -+        return p;
> -+    }
> -+
> -+  return NULL;
> -+}
> -+
> - /* Fix for machine name #ifdefs that are not in the namespace reserved
> -    by the C standard.  They won't be defined if compiling with -ansi,
> -    and the headers will break.  We go to some trouble to only change
> -@@ -524,7 +557,7 @@ FIX_PROC_HEAD( machine_name_fix )
> -       /* If the 'name_pat' matches in between base and limit, we have
> -          a bogon.  It is not worth the hassle of excluding comments
> -          because comments on #if/#ifdef lines are rare, and strings on
> --         such lines are illegal.
> -+         such lines are only legal in a "__has_include" directive.
> - 
> -          REG_NOTBOL means 'base' is not at the beginning of a line, which
> -          shouldn't matter since the name_re has no ^ anchor, but let's
> -@@ -544,8 +577,16 @@ FIX_PROC_HEAD( machine_name_fix )
> -             break;
> - 
> -           p = base + match[0].rm_so;
> --          base += match[0].rm_eo;
> - 
> -+          /* Check if the match is in __has_include(...) (PR 91085). */
> -+          q = check_has_inc (base, p, limit);
> -+          if (q) 
> -+            {
> -+              base = q + 1;
> -+              goto again;
> -+            }
> -+
> -+          base += match[0].rm_eo;
> -           /* One more test: if on the same line we have the same string
> -              with the appropriate underscores, then leave it alone.
> -              We want exactly two leading and trailing underscores.  */
> -diff --git a/fixincludes/inclhack.def b/fixincludes/inclhack.def
> -index f58e7771e1c..71bd717c233 100644
> ---- a/fixincludes/inclhack.def
> -+++ b/fixincludes/inclhack.def
> -@@ -3114,7 +3114,8 @@ fix = {
> -     c_fix     = machine_name;
> - 
> -     test_text = "/* MACH_DIFF: */\n"
> --    "#if defined( i386 ) || defined( sparc ) || defined( vax )"
> -+    "#if defined( i386 ) || defined( sparc ) || defined( vax ) || "
> -+    "defined( linux ) || __has_include ( <linux.h> )"
> -     "\n/* no uniform test, so be careful  :-) */";
> - };
> - 
> -diff --git a/fixincludes/tests/base/testing.h b/fixincludes/tests/base/testing.h
> -index cf95321fb86..8b3accaf04e 100644
> ---- a/fixincludes/tests/base/testing.h
> -+++ b/fixincludes/tests/base/testing.h
> -@@ -64,7 +64,7 @@ BSD43__IOWR('T', 1) /* Some are multi-line */
> - 
> - #if defined( MACHINE_NAME_CHECK )
> - /* MACH_DIFF: */
> --#if defined( i386 ) || defined( sparc ) || defined( vax )
> -+#if defined( i386 ) || defined( sparc ) || defined( vax ) || defined( linux ) || __has_include ( <linux.h> )
> - /* no uniform test, so be careful  :-) */
> - #endif  /* MACHINE_NAME_CHECK */
> - 
> --- 
> -2.37.3
> -
> diff --git a/package/gcc/arc-2020.09-release/0100-uclibc-conf.patch b/package/gcc/arc-2020.09-release/0100-uclibc-conf.patch
> deleted file mode 100644
> index d354baf81f..0000000000
> --- a/package/gcc/arc-2020.09-release/0100-uclibc-conf.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 326b880b20e5f8187dbda736b4c4c662cbfb00ca Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Tue, 2 May 2017 22:36:15 +0200
> -Subject: [PATCH] uclibc-conf
> -
> -[Romain: convert to git patch]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - contrib/regression/objs-gcc.sh | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/contrib/regression/objs-gcc.sh b/contrib/regression/objs-gcc.sh
> -index 60b0497..6dc7ead 100755
> ---- a/contrib/regression/objs-gcc.sh
> -+++ b/contrib/regression/objs-gcc.sh
> -@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-gnu ]
> -  then
> -   make all-gdb all-dejagnu all-ld || exit 1
> -   make install-gdb install-dejagnu install-ld || exit 1
> -+elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
> -+ then
> -+  make all-gdb all-dejagnu all-ld || exit 1
> -+  make install-gdb install-dejagnu install-ld || exit 1
> - elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
> -   make bootstrap || exit 1
> -   make install || exit 1
> --- 
> -2.9.3
> -
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 478b0b1620..5061a603bc 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -10,7 +10,7 @@ sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea78
>  sha512  d99e4826a70db04504467e349e9fbaedaa5870766cda7c5cab50cdebedc4be755ebca5b789e1232a34a20be1a0b60097de9280efe47bdb71c73251e30b0862a2  gcc-13.2.0.tar.xz
>  
>  # Locally calculated (fetched from Github)
> -sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
> +sha512  4dca20f517a42bb027fec605965b09fb917a535eebf3fe3e811d93476b02b1962df5ad4665f117bd44c2ec8e8015d51a44c00591761fe5f259c201ac5c7d920f  gcc-arc-2023.09-release.tar.gz
>  # Locally calculated (fetched from Github)
>  sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
>  
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index 7251dce668..574ad5462f 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -58,8 +58,8 @@ config BR2_PACKAGE_GDB_DEBUGGER
>  	bool "full debugger"
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_sh
> -	select BR2_PACKAGE_GMP if !BR2_arc
> -	select BR2_PACKAGE_MPFR if BR2_GDB_VERSION_14
> +	select BR2_PACKAGE_GMP
> +	select BR2_PACKAGE_MPFR if (BR2_GDB_VERSION_14 || BR2_arc)
>  	select BR2_PACKAGE_NCURSES
>  	select BR2_PACKAGE_ZLIB
>  
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index da35fd94f7..891e45948e 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -62,7 +62,7 @@ endif
>  # If cross-gdb is not enabled, the latest stable version is chosen.
>  config BR2_GDB_VERSION
>  	string
> -	default "arc-2020.09-release-gdb" if BR2_arc
> +	default "arc-2023.09-release" if BR2_arc
>  	default "12.1"     if BR2_GDB_VERSION_12
>  	default "13.2"     if BR2_GDB_VERSION_13 || !BR2_PACKAGE_HOST_GDB
>  	# When making 14.x the default, or 14.x becomes the oldest version,
> diff --git a/package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch b/package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch
> deleted file mode 100644
> index 210ba6d609..0000000000
> --- a/package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From 5ac588997c3c2d032d5d5145d9245eb37354c23b Mon Sep 17 00:00:00 2001
> -From: Tom Tromey <tromey@adacore.com>
> -Date: Tue, 30 Jun 2020 07:53:03 -0600
> -Subject: [PATCH] Do not define basic_string_view::to_string
> -
> -gdb's copy of basic_string_view includes a to_string method.  However,
> -according to cppreference, this is not a method on the real
> -std::basic_string_view:
> -
> -https://en.cppreference.com/w/cpp/string/basic_string_view
> -
> -This difference matters because gdb_string_view.h will use the
> -standard implementation when built with a C++17 or later.  This caused
> -PR build/26183.
> -
> -This patch fixes the problem by changing the method to be a standalone
> -helper function, and then rewriting the uses.  Tested by rebuilding
> -with a version of GCC that defaults to C++17.
> -
> -(Note that the build still is not clean; and also I noticed that the
> -libstdc++ string_view forbids the use of nullptr ... I wonder if gdb
> -violates that.)
> -
> -gdb/ChangeLog
> -2020-06-30  Tom Tromey  <tromey@adacore.com>
> -
> -	PR build/26183:
> -	* ada-lang.c (ada_lookup_name_info::ada_lookup_name_info): Use
> -	gdb::to_string.
> -
> -gdbsupport/ChangeLog
> -2020-06-30  Tom Tromey  <tromey@adacore.com>
> -
> -	PR build/26183:
> -	* gdb_string_view.h (basic_string_view::to_string): Remove.
> -	(gdb::to_string): New function.
> -
> -Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5ac588997c3c2d032d5d5145d9245eb37354c23b
> -Bug report: https://sourceware.org/bugzilla/show_bug.cgi?id=26183
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - gdb/ChangeLog                |  6 ++++++
> - gdb/ada-lang.c               |  8 ++++----
> - gdbsupport/ChangeLog         |  6 ++++++
> - gdbsupport/gdb_string_view.h | 17 ++++++++++-------
> - 4 files changed, 26 insertions(+), 11 deletions(-)
> -
> -diff --git a/gdb/ada-lang.c b/gdb/ada-lang.c
> -index 9b0c2efbfe2..98508c168bc 100644
> ---- a/gdb/ada-lang.c
> -+++ b/gdb/ada-lang.c
> -@@ -13553,10 +13553,10 @@ ada_lookup_name_info::ada_lookup_name_info (const lookup_name_info &lookup_name)
> -     {
> -       if (user_name.back () == '>')
> - 	m_encoded_name
> --	  = user_name.substr (1, user_name.size () - 2).to_string ();
> -+	  = gdb::to_string (user_name.substr (1, user_name.size () - 2));
> -       else
> - 	m_encoded_name
> --	  = user_name.substr (1, user_name.size () - 1).to_string ();
> -+	  = gdb::to_string (user_name.substr (1, user_name.size () - 1));
> -       m_encoded_p = true;
> -       m_verbatim_p = true;
> -       m_wild_match_p = false;
> -@@ -13575,10 +13575,10 @@ ada_lookup_name_info::ada_lookup_name_info (const lookup_name_info &lookup_name)
> - 	  if (encoded != NULL)
> - 	    m_encoded_name = encoded;
> - 	  else
> --	    m_encoded_name = user_name.to_string ();
> -+	    m_encoded_name = gdb::to_string (user_name);
> - 	}
> -       else
> --	m_encoded_name = user_name.to_string ();
> -+	m_encoded_name = gdb::to_string (user_name);
> - 
> -       /* Handle the 'package Standard' special case.  See description
> - 	 of m_standard_p.  */
> -diff --git a/gdbsupport/gdb_string_view.h b/gdbsupport/gdb_string_view.h
> -index c0ae7a8a2d9..65124e67e54 100644
> ---- a/gdbsupport/gdb_string_view.h
> -+++ b/gdbsupport/gdb_string_view.h
> -@@ -245,13 +245,6 @@ namespace gdb {
> - 	  return { this->_M_str, this->_M_len };
> - 	}
> - 
> --      template<typename _Allocator = std::allocator<_CharT>>
> --	std::basic_string<_CharT, _Traits, _Allocator>
> --	to_string(const _Allocator& __alloc = _Allocator()) const
> --	{
> --	  return { this->_M_str, this->_M_len, __alloc };
> --	}
> --
> -       size_type
> -       copy(_CharT* __str, size_type __n, size_type __pos = 0) const
> -       {
> -@@ -560,4 +553,14 @@ namespace gdb {
> - 
> - #endif // __cplusplus < 201703L
> - 
> -+namespace gdb {
> -+
> -+static inline std::string
> -+to_string(const gdb::string_view &view)
> -+{
> -+  return { view.data (), view.size () };
> -+}
> -+
> -+}
> -+
> - #endif /* COMMON_GDB_STRING_VIEW_H */
> --- 
> -2.39.3
> -
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index ba90bff5d6..c62da28cbf 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -6,4 +6,4 @@ sha512  8185d3e11ab60dafff5860a5016577bfe7dd7547ef01ebc867bc247603d82b74ff74c4f2
>  sha512  575e198105076fc4a88f68591aa114ab9c1196e84386a3f7b9b58fe5f30cdeed33f6a5f957b68f08c47284ec922bb60c964627e238471419673fd913575ce427  gdb-14.1.tar.xz
>  
>  # Locally calculated (fetched from Github)
> -sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
> +sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index c67a292619..f96086eed2 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -8,7 +8,7 @@ GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
>  GDB_SITE = $(BR2_GNU_MIRROR)/gdb
>  GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
>  
> -ifeq ($(BR2_arc),y)
> +ifeq ($(GDB_VERSION),arc-2023.09-release)
>  GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
>  GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
>  GDB_FROM_GIT = y
> @@ -56,11 +56,8 @@ GDB_DEPENDENCIES += host-flex host-bison
>  HOST_GDB_DEPENDENCIES += host-flex host-bison
>  endif
>  
> -# All newer versions of GDB need host-gmp, so it's only for older
> -# versions that the dependency can be avoided.
> -ifeq ($(BR2_arc),)
> +# All newer versions of GDB need host-gmp
>  HOST_GDB_DEPENDENCIES += host-gmp
> -endif
>  
>  # When gdb sources are fetched from the binutils-gdb repository, they
>  # also contain the binutils sources, but binutils shouldn't be built,
> @@ -158,9 +155,8 @@ GDB_CONF_OPTS += \
>  endif
>  
>  # Starting from GDB 11.x, gmp is needed as a dependency to build full
> -# gdb. So we avoid the dependency only for the special version used on
> -# ARC.
> -ifeq ($(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),:y)
> +# gdb.
> +ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
>  GDB_CONF_OPTS += \
>  	--with-libgmp-prefix=$(STAGING_DIR)/usr
>  GDB_DEPENDENCIES += gmp
> @@ -168,7 +164,9 @@ endif
>  
>  # Starting from GDB 14.x, mpfr is needed as a dependency to build full
>  # gdb.
> -ifeq ($(BR2_GDB_VERSION_14)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
> +# GDB fork from ARC GNU tools 2023.09 is based on GDB14 branch and so
> +# requires MPFR as well.
> +ifeq ($(BR2_GDB_VERSION_14)$(BR2_arc)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
>  GDB_DEPENDENCIES += mpfr
>  GDB_CONF_OPTS += --with-mpfr=$(STAGING_DIR)
>  else
> @@ -272,7 +270,9 @@ HOST_GDB_CONF_OPTS = \
>  	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
>  
>  # GDB newer than 14.x need host-mpfr
> -ifeq ($(BR2_GDB_VERSION_14),y)
> +# GDB fork from ARC GNU tools 2023.09 is based on GDB14 branch and so
> +# requires MPFR as well.
> +ifeq ($(BR2_GDB_VERSION_14)$(BR2_arc),y)
>  HOST_GDB_DEPENDENCIES += host-mpfr
>  HOST_GDB_CONF_OPTS += --with-mpfr=$(HOST_DIR)
>  else
> -- 
> 2.31.1
> 
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
