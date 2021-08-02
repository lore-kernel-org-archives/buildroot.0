Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B303EC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 13:48:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83F2F60FF2
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 13:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83F2F60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43B3F40355;
	Mon,  2 Aug 2021 13:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efp8mGGei_69; Mon,  2 Aug 2021 13:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C41844037E;
	Mon,  2 Aug 2021 13:47:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 167411BF59F
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 13:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1271C60817
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 13:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEABQhVdze_R for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 13:47:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE148606D9
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 13:47:54 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id hw6so17093337ejc.10
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f3Oc8yfP6wXW75iVawkrtxMNWNiquQdZGkBdH0dtly4=;
 b=gfcxdk3VoQth/Mlajk4IjuEF9PxC7I6N2LSOMyBaDxKw7l+KjtUyTUKeiJIQTKnq/A
 6cwRfVsiwFreprApb9lLLmY7FhDxQ+wIs1+Su6V4Jo6D9V8R1Ow6H+5fTAVrOZp9UkL1
 CSset9okdyEngcbgIEfV2H1dgnrCS+gMxpWBAfLxgkpKxKWyXtAMtyWQAoEaMMXni3Xx
 mK4PljurrJ/tdGomoFcAnp5+MW96r5E7hdUcDS462JyjHW6bTjqvk1gOmowL4//Z++I1
 Fax6OPEGuP339u8nlQbtAQaCA5sQCRfmggjwev72OzYmyfimaSQn1DhE2ubsSpCkE4b5
 7nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=f3Oc8yfP6wXW75iVawkrtxMNWNiquQdZGkBdH0dtly4=;
 b=XUcLFv7zzeVya/YgssFPbqDCXiE6Xeg7YrPrRzol2K0SomdLKlZXr9RCk9OgEsvc3e
 LsTLek+f6kGNTInHkVvFpDOdF70qp8lWnAuPZAecdjgx7qNxVQj6OBNIsKy2SjZ7Nj0s
 CYguJhHR3ZYfx6gN7/w9cja3C1Hrlg61DHQ9ZmMYcNE7GRYKE+IlIa0/n7KzVVdK2gUd
 yDCuro0mGxo7Hq6JT+pc9HJUExAt50lyxIW+jpPvGELGPh0Eb2MALJoRY2jgcr3GDaH6
 87LNDckx0P+YOOI0rE+iOMw4C4VmjCzCsTHNjCcm5parhaiN8FWWqUqYcJaXeKEot/tc
 VIyw==
X-Gm-Message-State: AOAM531Jt3qg4/67W0m3bdtTxRPjgS9dIzx5aAutyvxrzFPrjjhOpYdq
 TFtxpZdTEghMcp2yNJcEPUPp8g==
X-Google-Smtp-Source: ABdhPJyEaeNHCIJDNrAnIXkbeacP4RTXQtE849VbWKziwUIfH2Ue0RYx8hYljdCqJZtc7JTA4XO86w==
X-Received: by 2002:a17:906:c08e:: with SMTP id
 f14mr15407341ejz.380.1627912072803; 
 Mon, 02 Aug 2021 06:47:52 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id o16sm6116946edv.91.2021.08.02.06.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:47:52 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20210731185600.2238723-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c7044d0b-de8b-fa51-b8d9-c102d9b086fd@mind.be>
Date: Mon, 2 Aug 2021 15:47:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210731185600.2238723-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/3] package/binutils: add version 2.37
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 31/07/2021 20:55, Thomas Petazzoni wrote:
> State of the patches:
> 
> - 0001-sh-conf.patch
>   Refreshed
> 
> - 0002-poison-system-directories.patch
>   Refreshed, but needed some adaptations as the bfd_boolean type no
>   longer exists, and the standard "bool" type is now used instead.
> 
> - 0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
>   Drop, present in 2.37, merged upstream as
>   a76ef689b60405e494cb99e198acf3c82f467f7d
> 
> - 0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
>   Drop, present in 2.37, merged upstream as
>   0b3e14c90283c5d234884d0ebe8510bc3c9bc687
> 
> - 0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
>   Drop, present in 2.37, merged upstream as
>   3c3de29b048bca6b4aa4235c647b9328e71801b6
> 
> - 0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
>   Drop, present in 2.37, merged upstream as
>   284a1309021a0ef4c29f198470d95652f02b13f0
> 
> - 0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
>   Refreshed
> 
> - 0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
>   Refreshed
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> merge

 I removed this bit :-)

 With that, series applied to master, thanks.

 Question to the ARC maintainers: since some time now, upstream binutils has had
ARC support. Can we switch to that instead of having the specific 2.34-based
version for ARC?

 Regards,
 Arnout

> ---
>  package/binutils/2.37/0001-sh-conf.patch      |  48 +++
>  .../2.37/0002-poison-system-directories.patch | 306 ++++++++++++++++++
>  ...or1k-fix-building-with-gcc-version-5.patch |  50 +++
>  ...tive-relocation-against-dynamic-on-P.patch |  59 ++++
>  package/binutils/Config.in.host               |   8 +
>  package/binutils/binutils.hash                |   1 +
>  6 files changed, 472 insertions(+)
>  create mode 100644 package/binutils/2.37/0001-sh-conf.patch
>  create mode 100644 package/binutils/2.37/0002-poison-system-directories.patch
>  create mode 100644 package/binutils/2.37/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
>  create mode 100644 package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
> 
> diff --git a/package/binutils/2.37/0001-sh-conf.patch b/package/binutils/2.37/0001-sh-conf.patch
> new file mode 100644
> index 0000000000..fcc597e4d9
> --- /dev/null
> +++ b/package/binutils/2.37/0001-sh-conf.patch
> @@ -0,0 +1,48 @@
> +From 33f3c1f804efc2e4f97849081589efb70cda31e5 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Fri, 25 Dec 2015 11:38:13 +0100
> +Subject: [PATCH] sh-conf
> +
> +Likewise, binutils has no idea about any of these new targets either, so we
> +fix that up too.. now we're able to actually build a real toolchain for
> +sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
> +inept targets than that one, really. Go look, I promise).
> +
> +[Romain: rebase on top of 2.32]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + configure    | 2 +-
> + configure.ac | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 3dd206525a7..6881ce632f5 100755
> +--- a/configure
> ++++ b/configure
> +@@ -3892,7 +3892,7 @@ case "${target}" in
> +   nvptx*-*-*)
> +     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
> +     ;;
> +-  sh-*-*)
> ++  sh*-*-*)
> +     case "${target}" in
> +       sh*-*-elf)
> +          ;;
> +diff --git a/configure.ac b/configure.ac
> +index 797a624621e..1f9256bbf18 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1175,7 +1175,7 @@ case "${target}" in
> +   nvptx*-*-*)
> +     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
> +     ;;
> +-  sh-*-*)
> ++  sh*-*-*)
> +     case "${target}" in
> +       sh*-*-elf)
> +          ;;
> +-- 
> +2.31.1
> +
> diff --git a/package/binutils/2.37/0002-poison-system-directories.patch b/package/binutils/2.37/0002-poison-system-directories.patch
> new file mode 100644
> index 0000000000..1a5fe46575
> --- /dev/null
> +++ b/package/binutils/2.37/0002-poison-system-directories.patch
> @@ -0,0 +1,306 @@
> +From 4d8705ddb55897e8a74b617ab95736d520d9e1ea Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Fri, 25 Dec 2015 11:45:38 +0100
> +Subject: [PATCH] poison-system-directories
> +
> +Patch adapted to binutils 2.23.2 and extended to use
> +BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
> +
> +[Romain: rebase on top of 2.33.1]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +[Gustavo: adapt to binutils 2.25]
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +
> +Upstream-Status: Inappropriate [distribution: codesourcery]
> +
> +Patch originally created by Mark Hatle, forward-ported to
> +binutils 2.21 by Scott Garman.
> +
> +purpose:  warn for uses of system directories when cross linking
> +
> +Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
> +
> +2008-07-02  Joseph Myers  <joseph@codesourcery.com>
> +
> +    ld/
> +    * ld.h (args_type): Add error_poison_system_directories.
> +    * ld.texinfo (--error-poison-system-directories): Document.
> +    * ldfile.c (ldfile_add_library_path): Check
> +    command_line.error_poison_system_directories.
> +    * ldmain.c (main): Initialize
> +    command_line.error_poison_system_directories.
> +    * lexsup.c (enum option_values): Add
> +    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
> +    (ld_options): Add --error-poison-system-directories.
> +    (parse_args): Handle new option.
> +
> +2007-06-13  Joseph Myers  <joseph@codesourcery.com>
> +
> +    ld/
> +    * config.in: Regenerate.
> +    * ld.h (args_type): Add poison_system_directories.
> +    * ld.texinfo (--no-poison-system-directories): Document.
> +    * ldfile.c (ldfile_add_library_path): Check
> +    command_line.poison_system_directories.
> +    * ldmain.c (main): Initialize
> +    command_line.poison_system_directories.
> +    * lexsup.c (enum option_values): Add
> +    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
> +    (ld_options): Add --no-poison-system-directories.
> +    (parse_args): Handle new option.
> +
> +2007-04-20  Joseph Myers  <joseph@codesourcery.com>
> +
> +    Merge from Sourcery G++ binutils 2.17:
> +
> +    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
> +    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
> +    ld/
> +    * configure.ac (--enable-poison-system-directories): New option.
> +    * configure, config.in: Regenerate.
> +    * ldfile.c (ldfile_add_library_path): If
> +    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
> +    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> +---
> + ld/config.in    |  3 +++
> + ld/configure    | 14 ++++++++++++++
> + ld/configure.ac | 10 ++++++++++
> + ld/ld.h         |  8 ++++++++
> + ld/ld.texi      | 12 ++++++++++++
> + ld/ldfile.c     | 17 +++++++++++++++++
> + ld/ldlex.h      |  2 ++
> + ld/ldmain.c     |  2 ++
> + ld/lexsup.c     | 21 +++++++++++++++++++++
> + 9 files changed, 89 insertions(+)
> +
> +diff --git a/ld/config.in b/ld/config.in
> +index 26d55a00d47..ffad464783c 100644
> +--- a/ld/config.in
> ++++ b/ld/config.in
> +@@ -43,6 +43,9 @@
> +    language is requested. */
> + #undef ENABLE_NLS
> + 
> ++/* Define to warn for use of native system library directories */
> ++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> ++
> + /* Additional extension a shared object might have. */
> + #undef EXTRA_SHLIB_EXTENSION
> + 
> +diff --git a/ld/configure b/ld/configure
> +index c197aaef3cb..882263aa43f 100755
> +--- a/ld/configure
> ++++ b/ld/configure
> +@@ -829,6 +829,7 @@ with_lib_path
> + enable_targets
> + enable_64_bit_bfd
> + with_sysroot
> ++enable_poison_system_directories
> + enable_gold
> + enable_got
> + enable_compressed_debug_sections
> +@@ -1498,6 +1499,8 @@ Optional Features:
> +   --enable-checking       enable run-time checks
> +   --enable-targets        alternative target configurations
> +   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
> ++  --enable-poison-system-directories
> ++                          warn for use of native system library directories
> +   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
> +   --enable-got=<type>     GOT handling scheme (target, single, negative,
> +                           multigot)
> +@@ -15236,7 +15239,18 @@ else
> + fi
> + 
> + 
> ++# Check whether --enable-poison-system-directories was given.
> ++if test "${enable_poison_system_directories+set}" = set; then :
> ++  enableval=$enable_poison_system_directories;
> ++else
> ++  enable_poison_system_directories=no
> ++fi
> ++
> ++if test "x${enable_poison_system_directories}" = "xyes"; then
> + 
> ++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> ++
> ++fi
> + 
> + # Check whether --enable-got was given.
> + if test "${enable_got+set}" = set; then :
> +diff --git a/ld/configure.ac b/ld/configure.ac
> +index 8ea97c43cd4..0f246db67d8 100644
> +--- a/ld/configure.ac
> ++++ b/ld/configure.ac
> +@@ -106,6 +106,16 @@ AC_SUBST(use_sysroot)
> + AC_SUBST(TARGET_SYSTEM_ROOT)
> + AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
> + 
> ++AC_ARG_ENABLE([poison-system-directories],
> ++         AS_HELP_STRING([--enable-poison-system-directories],
> ++                [warn for use of native system library directories]),,
> ++         [enable_poison_system_directories=no])
> ++if test "x${enable_poison_system_directories}" = "xyes"; then
> ++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> ++       [1],
> ++       [Define to warn for use of native system library directories])
> ++fi
> ++
> + dnl Use --enable-gold to decide if this linker should be the default.
> + dnl "install_as_default" is set to false if gold is the default linker.
> + dnl "installed_linker" is the installed BFD linker name.
> +diff --git a/ld/ld.h b/ld/ld.h
> +index 35fafebfaed..74e66405de6 100644
> +--- a/ld/ld.h
> ++++ b/ld/ld.h
> +@@ -162,6 +162,14 @@ typedef struct
> +      in the linker script.  */
> +   bool force_group_allocation;
> + 
> ++  /* If TRUE (the default) warn for uses of system directories when
> ++     cross linking.  */
> ++  bool poison_system_directories;
> ++
> ++  /* If TRUE (default FALSE) give an error for uses of system
> ++     directories when cross linking instead of a warning.  */
> ++  bool error_poison_system_directories;
> ++
> +   /* Big or little endian as set on command line.  */
> +   enum endian_enum endian;
> + 
> +diff --git a/ld/ld.texi b/ld/ld.texi
> +index dd8f571d4e4..3ab210b41b9 100644
> +--- a/ld/ld.texi
> ++++ b/ld/ld.texi
> +@@ -2863,6 +2863,18 @@ string identifying the original linked file does not change.
> + 
> + Passing @code{none} for @var{style} disables the setting from any
> + @code{--build-id} options earlier on the command line.
> ++
> ++@kindex --no-poison-system-directories
> ++@item --no-poison-system-directories
> ++Do not warn for @option{-L} options using system directories such as
> ++@file{/usr/lib} when cross linking.  This option is intended for use
> ++in chroot environments when such directories contain the correct
> ++libraries for the target system rather than the host.
> ++
> ++@kindex --error-poison-system-directories
> ++@item --error-poison-system-directories
> ++Give an error instead of a warning for @option{-L} options using
> ++system directories when cross linking.
> + @end table
> + 
> + @c man end
> +diff --git a/ld/ldfile.c b/ld/ldfile.c
> +index 9d0af06f1f6..7cdd3b1c1b1 100644
> +--- a/ld/ldfile.c
> ++++ b/ld/ldfile.c
> +@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
> +     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
> +   else
> +     new_dirs->name = xstrdup (name);
> ++
> ++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> ++  if (command_line.poison_system_directories
> ++  && ((!strncmp (name, "/lib", 4))
> ++      || (!strncmp (name, "/usr/lib", 8))
> ++      || (!strncmp (name, "/usr/local/lib", 14))
> ++      || (!strncmp (name, "/usr/X11R6/lib", 14))))
> ++   {
> ++     if (command_line.error_poison_system_directories)
> ++       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
> ++            "cross-compilation\n"), name);
> ++     else
> ++       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
> ++            "cross-compilation\n"), name);
> ++   }
> ++#endif
> ++
> + }
> + 
> + /* Try to open a BFD for a lang_input_statement.  */
> +diff --git a/ld/ldlex.h b/ld/ldlex.h
> +index 9e8bf5fb835..2f0fadfe0a3 100644
> +--- a/ld/ldlex.h
> ++++ b/ld/ldlex.h
> +@@ -163,6 +163,8 @@ enum option_values
> +   OPTION_CTF_VARIABLES,
> +   OPTION_NO_CTF_VARIABLES,
> +   OPTION_CTF_SHARE_TYPES,
> ++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
> ++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
> + };
> + 
> + /* The initial parser states.  */
> +diff --git a/ld/ldmain.c b/ld/ldmain.c
> +index 42660eb9a3c..1aef9387f93 100644
> +--- a/ld/ldmain.c
> ++++ b/ld/ldmain.c
> +@@ -321,6 +321,8 @@ main (int argc, char **argv)
> +   command_line.warn_mismatch = true;
> +   command_line.warn_search_mismatch = true;
> +   command_line.check_section_addresses = -1;
> ++  command_line.poison_system_directories = true;
> ++  command_line.error_poison_system_directories = false;
> + 
> +   /* We initialize DEMANGLING based on the environment variable
> +      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
> +diff --git a/ld/lexsup.c b/ld/lexsup.c
> +index 00274c500d0..4f23b3a2da2 100644
> +--- a/ld/lexsup.c
> ++++ b/ld/lexsup.c
> +@@ -595,6 +595,14 @@ static const struct ld_option ld_options[] =
> + 		   "                                <method> is: share-unconflicted (default),\n"
> + 		   "                                             share-duplicated"),
> +     TWO_DASHES },
> ++  { {"no-poison-system-directories", no_argument, NULL,
> ++    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
> ++    '\0', NULL, N_("Do not warn for -L options using system directories"),
> ++    TWO_DASHES },
> ++  { {"error-poison-system-directories", no_argument, NULL,
> ++    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
> ++    '\0', NULL, N_("Give an error for -L options using system directories"),
> ++    TWO_DASHES },
> + };
> + 
> + #define OPTION_COUNT ARRAY_SIZE (ld_options)
> +@@ -607,6 +615,7 @@ parse_args (unsigned argc, char **argv)
> +   int ingroup = 0;
> +   char *default_dirlist = NULL;
> +   char *shortopts;
> ++  char *BR_paranoid_env;
> +   struct option *longopts;
> +   struct option *really_longopts;
> +   int last_optind;
> +@@ -1643,6 +1652,14 @@ parse_args (unsigned argc, char **argv)
> + 	  }
> + 	  break;
> + 
> ++	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
> ++	  command_line.poison_system_directories = false;
> ++	  break;
> ++
> ++	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
> ++	  command_line.error_poison_system_directories = true;
> ++	  break;
> ++
> + 	case OPTION_PUSH_STATE:
> + 	  input_flags.pushed = xmemdup (&input_flags,
> + 					sizeof (input_flags),
> +@@ -1788,6 +1805,10 @@ parse_args (unsigned argc, char **argv)
> +       command_line.soname = NULL;
> +     }
> + 
> ++  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> ++  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
> ++    command_line.error_poison_system_directories = true;
> ++
> +   while (ingroup)
> +     {
> +       einfo (_("%P: missing --end-group; added as last command line option\n"));
> +-- 
> +2.31.1
> +
> diff --git a/package/binutils/2.37/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.37/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> new file mode 100644
> index 0000000000..bfd531b818
> --- /dev/null
> +++ b/package/binutils/2.37/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> @@ -0,0 +1,50 @@
> +From ef4ba1da823e8366ea4f126f50885a44ebf4dcf0 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 9 Jun 2021 17:28:27 +0200
> +Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
> +
> +Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
> +an old compiler(i.e. gcc 4.9) build fails on:
> +```
> +elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
> +C99 or C11 mode
> +    for (size_t i = 0; i < insn_count; i++)
> +    ^
> +```
> +
> +So let's declare `size_t i` at the top of the function instead of inside
> +for loop.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + bfd/elf32-or1k.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
> +index 4ae7f324d33..32063ab0289 100644
> +--- a/bfd/elf32-or1k.c
> ++++ b/bfd/elf32-or1k.c
> +@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> + {
> +   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
> +   unsigned output_insns[PLT_MAX_INSN_COUNT];
> ++  size_t i;
> + 
> +   /* Copy instructions into the output buffer.  */
> +-  for (size_t i = 0; i < insn_count; i++)
> ++  for (i = 0; i < insn_count; i++)
> +     output_insns[i] = insns[i];
> + 
> +   /* Honor the no-delay-slot setting.  */
> +@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> +     }
> + 
> +   /* Write out the output buffer.  */
> +-  for (size_t i = 0; i < (insn_count+1); i++)
> ++  for (i = 0; i < (insn_count+1); i++)
> +     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
> + }
> + 
> +-- 
> +2.31.1
> +
> diff --git a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
> new file mode 100644
> index 0000000000..779baeab63
> --- /dev/null
> +++ b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
> @@ -0,0 +1,59 @@
> +From 203b80f8dbdd3ddb860114b03351a0dea28c978f Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Sat, 10 Jul 2021 17:57:34 +0200
> +Subject: [PATCH] or1k: fix pc-relative relocation against dynamic on PC
> + relative 26 bit relocation
> +
> +When building openal we were seeing the assert failure:
> +
> +/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
> +pc-relative relocation against dynamic symbol alSourcePausev
> +/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
> +pc-relative relocation against dynamic symbol alSourceStopv
> +/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
> +pc-relative relocation against dynamic symbol alSourceRewindv
> +/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
> +pc-relative relocation against dynamic symbol alSourcePlayv
> +collect2: error: ld returned 1 exit status
> +
> +This happens because in R_OR1K_INSN_REL_26 case we can't reference local
> +symbol as previously done but we need to make sure that calls to actual
> +symbol always call the version of current object.
> +
> +bfd/Changelog:
> +
> +	* elf32-or1k.c (or1k_elf_relocate_section): use a separate entry
> +	  in switch case R_OR1K_INSN_REL_26 where we need to check for
> +	  !SYMBOL_CALLS_LOCAL() instead of !SYMBOL_REFERENCES_LOCAL().
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + bfd/elf32-or1k.c | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
> +index 32063ab0289..67252394173 100644
> +--- a/bfd/elf32-or1k.c
> ++++ b/bfd/elf32-or1k.c
> +@@ -1543,6 +1543,18 @@ or1k_elf_relocate_section (bfd *output_bfd,
> + 	  break;
> + 
> + 	case R_OR1K_INSN_REL_26:
> ++	  /* For a non-shared link, these will reference plt or call the
> ++	     version of actual object.  */
> ++	  if (bfd_link_pic (info) && !SYMBOL_CALLS_LOCAL (info, h))
> ++	    {
> ++	      _bfd_error_handler
> ++		(_("%pB: pc-relative relocation against dynamic symbol %s"),
> ++		 input_bfd, name);
> ++	      ret_val = FALSE;
> ++	      bfd_set_error (bfd_error_bad_value);
> ++	    }
> ++	  break;
> ++
> + 	case R_OR1K_PCREL_PG21:
> + 	case R_OR1K_LO13:
> + 	case R_OR1K_SLO13:
> +-- 
> +2.31.1
> +
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index d6909617c7..6190ee4d97 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -38,6 +38,13 @@ config BR2_BINUTILS_VERSION_2_36_X
>  	# https://github.com/uclinux-dev/elf2flt/issues/12
>  	depends on !BR2_BINFMT_FLAT
>  
> +config BR2_BINUTILS_VERSION_2_37_X
> +	bool "binutils 2.37"
> +	depends on !BR2_csky
> +	# https://github.com/uclinux-dev/elf2flt/pull/16
> +	# https://github.com/uclinux-dev/elf2flt/issues/12
> +	depends on !BR2_BINFMT_FLAT
> +
>  config BR2_BINUTILS_VERSION_ARC
>  	bool "binutils arc (2.34.50)"
>  	depends on BR2_arc
> @@ -56,6 +63,7 @@ config BR2_BINUTILS_VERSION
>  	default "2.34"		if BR2_BINUTILS_VERSION_2_34_X
>  	default "2.35.2"	if BR2_BINUTILS_VERSION_2_35_X
>  	default "2.36.1"	if BR2_BINUTILS_VERSION_2_36_X
> +	default "2.37"		if BR2_BINUTILS_VERSION_2_37_X
>  
>  config BR2_BINUTILS_ENABLE_LTO
>  	bool
> diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
> index 20462b3809..cc62fdcdaf 100644
> --- a/package/binutils/binutils.hash
> +++ b/package/binutils/binutils.hash
> @@ -3,6 +3,7 @@ sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724a
>  sha512  2c7976939dcf5e8c5b7374cccd39bfe803b1bec73c6abfa0eb17c24e1942574c6bdb874c66a092a82adc443182eacd8a5a8001c19a76101f0c7ba40c27de0bbd  binutils-2.34.tar.xz
>  sha512  9974ede5978d32e0d68fef23da48fa00bd06b0bff7ec45b00ca075c126d6bbe0cf2defc03ecc3f17bc6cc85b64271a13009c4049d7ba17de26e84e3a6e2c0348  binutils-2.35.2.tar.xz
>  sha512  cc24590bcead10b90763386b6f96bb027d7594c659c2d95174a6352e8b98465a50ec3e4088d0da038428abe059bbc4ae5f37b269f31a40fc048072c8a234f4e9  binutils-2.36.1.tar.xz
> +sha512  5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d561ec954fe7469a68f1b66f1a3cd53d5a3af7293635a90d69edd15e7  binutils-2.37.tar.xz
>  
>  # Locally calculated (fetched from Github)
>  sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
