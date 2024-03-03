Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6943CC54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 08:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96B6E82361;
	Sun,  3 Mar 2024 08:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBXPLn3tgy6v; Sun,  3 Mar 2024 08:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B0758226C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B0758226C;
	Sun,  3 Mar 2024 08:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 301301BF38B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1932C4014D
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8psB4E_Ly5o for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 08:40:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DACA240136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DACA240136
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DACA240136
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 08:40:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9B7231BF205;
 Sun,  3 Mar 2024 08:40:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 09:40:09 +0100
Message-ID: <20240303084014.156991-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
References: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709455219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5DxMF1y0E3nj2KRTmiDI+nrlj/VMvJkAfQP03Lix54=;
 b=JqE+rnRNxu2HfJdgOIBOrJz/BWeOj5GO2+qtMxSSULNNKph0AyskxQAgnJbzD2dcHIzP6p
 pJZCe4aiJzD6ucICVqfX54KABUkdPjBvfvECm6hR5iR30LaXDY0EhMmgYo2/EPaln+gBWf
 hHxDwScj3LdWw1xm8b//Gg8NcSfVFPquIDv546FAPR31cqj3AOWFKUZGlrqZ/qVq8PJOQy
 XrQGdLmOrhW12t7e6Gkaw0DCXW/eg9M8EZV117M4241IFj48BIJOJqC+E5x69ZVVJIqwAu
 R7v6C0FfxZ6b506zyg2qjuyLriymsf7khht6vnMqiAQlfJRI6veDBz63I4Rt5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JqE+rnRN
Subject: [Buildroot] [PATCH next 1/4] package/binutils: add support for 2.42
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note that the hash of the tarball does not need to be added, as it was
already added as part of commit
11b439ce1bd28506051fff14646f8bbdbbbe58d8 ("package/binutils-bare-metal:
new package").

Our existing 2 patches are simply rebased, with minor conflict
resolution required.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/2.42/0001-sh-conf.patch      |  50 +++
 .../2.42/0002-poison-system-directories.patch | 309 ++++++++++++++++++
 package/binutils/Config.in.host               |   4 +
 3 files changed, 363 insertions(+)
 create mode 100644 package/binutils/2.42/0001-sh-conf.patch
 create mode 100644 package/binutils/2.42/0002-poison-system-directories.patch

diff --git a/package/binutils/2.42/0001-sh-conf.patch b/package/binutils/2.42/0001-sh-conf.patch
new file mode 100644
index 0000000000..c381017850
--- /dev/null
+++ b/package/binutils/2.42/0001-sh-conf.patch
@@ -0,0 +1,50 @@
+From d71fb5a9999ee7c8963342caa0d5cbb16872ab07 Mon Sep 17 00:00:00 2001
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
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 670684d83d1..967c6708a0c 100755
+--- a/configure
++++ b/configure
+@@ -4042,7 +4042,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index 88b4800e298..2c8d08ff6ec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1269,7 +1269,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.43.0
+
diff --git a/package/binutils/2.42/0002-poison-system-directories.patch b/package/binutils/2.42/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..5c790999d4
--- /dev/null
+++ b/package/binutils/2.42/0002-poison-system-directories.patch
@@ -0,0 +1,309 @@
+From 00f6b0a7d31085831429834b2bc8f511b8fab6ce Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Waldemar: rebase on top of 2.39]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: rebase on top of 2.33.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
+ ld/ldfile.c     | 17 +++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 89 insertions(+)
+
+diff --git a/ld/config.in b/ld/config.in
+index 52d62f06ff0..b5944e7ba55 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -70,6 +70,9 @@
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
+index ba1e5e2a215..2220d7afe2a 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -844,6 +844,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1534,6 +1535,8 @@ Optional Features:
+   --enable-checking       enable run-time checks
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15587,7 +15590,18 @@ else
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
+index 4a11787ae71..104a531fb0f 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -103,6 +103,16 @@ AC_SUBST(use_sysroot)
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
+index 54d9079678c..9f0163b2911 100644
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
+index 4fda259a552..11fd8f7547b 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -3108,6 +3108,18 @@ string identifying the original linked file does not change.
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
+index dc9875d8813..49d899ee49d 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -327,6 +327,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
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
++
+ }
+ 
+ /* Try to open a BFD for a lang_input_statement.  */
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index 161a9d4d8dc..4ca50b9c299 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -168,6 +168,8 @@ enum option_values
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+   OPTION_ERROR_EXECSTACK,
+   OPTION_NO_ERROR_EXECSTACK,
+   OPTION_WARN_EXECSTACK_OBJECTS,
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index e90c2021b33..43fe888eba8 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -325,6 +325,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = true;
+   command_line.warn_search_mismatch = true;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = true;
++  command_line.error_poison_system_directories = false;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 099dff8ecde..01626712c77 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -642,6 +642,14 @@ static const struct ld_option ld_options[] =
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
+@@ -654,6 +662,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1769,6 +1778,14 @@ parse_args (unsigned argc, char **argv)
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
+@@ -1922,6 +1939,10 @@ parse_args (unsigned argc, char **argv)
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
+2.43.0
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 2f1ddf4bdc..f1cc175cf9 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -25,6 +25,9 @@ config BR2_BINUTILS_VERSION_2_40_X
 config BR2_BINUTILS_VERSION_2_41_X
 	bool "binutils 2.41"
 
+config BR2_BINUTILS_VERSION_2_42_X
+	bool "binutils 2.42"
+
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.41)"
 	depends on BR2_arc
@@ -37,6 +40,7 @@ config BR2_BINUTILS_VERSION
 	default "2.39"		if BR2_BINUTILS_VERSION_2_39_X
 	default "2.40"		if BR2_BINUTILS_VERSION_2_40_X
 	default "2.41"		if BR2_BINUTILS_VERSION_2_41_X
+	default "2.42"		if BR2_BINUTILS_VERSION_2_42_X
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
