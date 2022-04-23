Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C6EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 14:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 406F440484;
	Sat, 23 Apr 2022 14:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWWi_B6WxMpQ; Sat, 23 Apr 2022 14:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6614040520;
	Sat, 23 Apr 2022 14:12:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3371BF82F
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16F9A83299
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17-YnfusdA9Y for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 14:12:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EED0F831FB
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 14:12:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CAC3E83FA7; Sat, 23 Apr 2022 14:01:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 16:05:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e6163a1d88a70c647a27a1ba3a4ed29b076eefa
X-Git-Newrev: e93cec6d3c6bec31ab264812f23da7596f749f0f
X-Patchwork-Hint: ignore
Message-Id: <20220423140153.CAC3E83FA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: add version 2.38
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e93cec6d3c6bec31ab264812f23da7596f749f0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://sourceware.org/pipermail/binutils/2022-February/119721.html

i386-Allow-GOT32-relocations-against-ABS-symbols.patch is not required
as it is in release.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/2.38/0001-sh-conf.patch           |  48 ++++
 .../2.38/0002-poison-system-directories.patch      | 306 +++++++++++++++++++++
 ...lf32-or1k-fix-building-with-gcc-version-5.patch |  50 ++++
 ...R_OR1K_GOT16-signed-overflow-by-using-spe.patch |  75 +++++
 ...0005-binutils-2.38-vs.-ppc32-linux-kernel.patch |  55 ++++
 package/binutils/Config.in.host                    |   7 +
 package/binutils/binutils.hash                     |   1 +
 7 files changed, 542 insertions(+)

diff --git a/package/binutils/2.38/0001-sh-conf.patch b/package/binutils/2.38/0001-sh-conf.patch
new file mode 100644
index 0000000000..fcc597e4d9
--- /dev/null
+++ b/package/binutils/2.38/0001-sh-conf.patch
@@ -0,0 +1,48 @@
+From 33f3c1f804efc2e4f97849081589efb70cda31e5 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:38:13 +0100
+Subject: [PATCH] sh-conf
+
+Likewise, binutils has no idea about any of these new targets either, so we
+fix that up too.. now we're able to actually build a real toolchain for
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
+inept targets than that one, really. Go look, I promise).
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
+index 3dd206525a7..6881ce632f5 100755
+--- a/configure
++++ b/configure
+@@ -3892,7 +3892,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index 797a624621e..1f9256bbf18 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1175,7 +1175,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.31.1
+
diff --git a/package/binutils/2.38/0002-poison-system-directories.patch b/package/binutils/2.38/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..1a5fe46575
--- /dev/null
+++ b/package/binutils/2.38/0002-poison-system-directories.patch
@@ -0,0 +1,306 @@
+From 4d8705ddb55897e8a74b617ab95736d520d9e1ea Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Romain: rebase on top of 2.33.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
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
+index 26d55a00d47..ffad464783c 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -43,6 +43,9 @@
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
+index c197aaef3cb..882263aa43f 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -829,6 +829,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1498,6 +1499,8 @@ Optional Features:
+   --enable-checking       enable run-time checks
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15236,7 +15239,18 @@ else
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
+index 8ea97c43cd4..0f246db67d8 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -106,6 +106,16 @@ AC_SUBST(use_sysroot)
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
+index 35fafebfaed..74e66405de6 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -162,6 +162,14 @@ typedef struct
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
+index dd8f571d4e4..3ab210b41b9 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -2863,6 +2863,18 @@ string identifying the original linked file does not change.
+ 
+ Passing @code{none} for @var{style} disables the setting from any
+ @code{--build-id} options earlier on the command line.
++
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
+ @end table
+ 
+ @c man end
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 9d0af06f1f6..7cdd3b1c1b1 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
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
+index 9e8bf5fb835..2f0fadfe0a3 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -163,6 +163,8 @@ enum option_values
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+ };
+ 
+ /* The initial parser states.  */
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 42660eb9a3c..1aef9387f93 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -321,6 +321,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = true;
+   command_line.warn_search_mismatch = true;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = true;
++  command_line.error_poison_system_directories = false;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 00274c500d0..4f23b3a2da2 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -595,6 +595,14 @@ static const struct ld_option ld_options[] =
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
+@@ -607,6 +615,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1643,6 +1652,14 @@ parse_args (unsigned argc, char **argv)
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
+@@ -1788,6 +1805,10 @@ parse_args (unsigned argc, char **argv)
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
+2.31.1
+
diff --git a/package/binutils/2.38/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.38/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
new file mode 100644
index 0000000000..bfd531b818
--- /dev/null
+++ b/package/binutils/2.38/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
@@ -0,0 +1,50 @@
+From ef4ba1da823e8366ea4f126f50885a44ebf4dcf0 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 9 Jun 2021 17:28:27 +0200
+Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
+
+Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
+an old compiler(i.e. gcc 4.9) build fails on:
+```
+elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
+C99 or C11 mode
+    for (size_t i = 0; i < insn_count; i++)
+    ^
+```
+
+So let's declare `size_t i` at the top of the function instead of inside
+for loop.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..32063ab0289 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+ {
+   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
+   unsigned output_insns[PLT_MAX_INSN_COUNT];
++  size_t i;
+ 
+   /* Copy instructions into the output buffer.  */
+-  for (size_t i = 0; i < insn_count; i++)
++  for (i = 0; i < insn_count; i++)
+     output_insns[i] = insns[i];
+ 
+   /* Honor the no-delay-slot setting.  */
+@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+     }
+ 
+   /* Write out the output buffer.  */
+-  for (size_t i = 0; i < (insn_count+1); i++)
++  for (i = 0; i < (insn_count+1); i++)
+     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
+ }
+ 
+-- 
+2.31.1
+
diff --git a/package/binutils/2.38/0004-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch b/package/binutils/2.38/0004-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
new file mode 100644
index 0000000000..8609db95b7
--- /dev/null
+++ b/package/binutils/2.38/0004-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
@@ -0,0 +1,75 @@
+From 362a20108782b87cd780a989c0dbd014fc2def8b Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 Jan 2022 09:03:28 +0900
+Subject: [PATCH] or1k: Avoid R_OR1K_GOT16 signed overflow by using special
+ howto
+
+Previously when fixing PR 21464 we masked out upper bits of the
+relocation value in order to avoid overflow complaints when acceptable.
+It turns out this does not work when the relocation value ends up being
+signed.
+
+To fix this this patch introduces a special howto with
+complain_on_overflow set to complain_overflow_dont.  This is used in
+place of the normal R_OR1K_GOT16 howto when we detect R_OR1K_GOT_AHI16
+relocations.
+
+bfd/ChangeLog:
+
+	PR 28735
+	* elf32-or1k.c (or1k_elf_got16_no_overflow_howto): Define.
+	(or1k_elf_relocate_section): Use new howto instead of trying to
+	mask out relocation bits.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..7fd88d72442 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -828,6 +828,23 @@ static reloc_howto_type or1k_elf_howto_table[] =
+ 	 false),		/* pcrel_offset */
+ };
+ 
++/* A copy of the R_OR1K_GOT16 used in the presense of R_OR1K_GOT_AHI16
++   relocations when we know we can ignore overflows.  */
++static reloc_howto_type or1k_elf_got16_no_overflow_howto =
++  HOWTO (R_OR1K_GOT16,		/* type */
++	 0,			/* rightshift */
++	 2,			/* size (0 = byte, 1 = short, 2 = long) */
++	 16,			/* bitsize */
++	 false,			/* pc_relative */
++	 0,			/* bitpos */
++	 complain_overflow_dont, /* complain_on_overflow */
++	 bfd_elf_generic_reloc, /* special_function */
++	 "R_OR1K_GOT16",	/* name */
++	 false,			/* partial_inplace */
++	 0,			/* src_mask */
++	 0xffff,		/* dst_mask */
++	 false);		/* pcrel_offset */
++
+ /* Map BFD reloc types to Or1k ELF reloc types.  */
+ 
+ struct or1k_reloc_map
+@@ -1506,12 +1523,11 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    if (r_type == R_OR1K_GOT_AHI16)
+ 	      saw_gotha = true;
+ 
+-	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
++	    /* If we have a R_OR1K_GOT16 following a R_OR1K_GOT_AHI16
+ 	       relocation we assume the code is doing the right thing to avoid
+-	       overflows.  Here we mask the lower 16-bit of the relocation to
+-	       avoid overflow validation failures.  */
++	       overflows.  */
+ 	    if (r_type == R_OR1K_GOT16 && saw_gotha)
+-	      relocation &= 0xffff;
++	      howto = &or1k_elf_got16_no_overflow_howto;
+ 
+ 	  /* Addend should be zero.  */
+ 	  if (rel->r_addend != 0)
+-- 
+2.25.1
+
diff --git a/package/binutils/2.38/0005-binutils-2.38-vs.-ppc32-linux-kernel.patch b/package/binutils/2.38/0005-binutils-2.38-vs.-ppc32-linux-kernel.patch
new file mode 100644
index 0000000000..c62652c95f
--- /dev/null
+++ b/package/binutils/2.38/0005-binutils-2.38-vs.-ppc32-linux-kernel.patch
@@ -0,0 +1,55 @@
+From ed9b2e40ebffec835d63473367da8dd8f80d7d5b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 21 Feb 2022 10:58:57 +1030
+Subject: [PATCH] binutils 2.38 vs. ppc32 linux kernel
+
+Commit b25f942e18d6 made .machine more strict.  Weaken it again.
+
+	* config/tc-ppc.c (ppc_machine): Treat an early .machine specially,
+	keeping sticky options to work around gcc bugs.
+
+(cherry picked from commit cebc89b9328eab994f6b0314c263f94e7949a553)
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ gas/config/tc-ppc.c | 25 ++++++++++++++++++++++++-
+ 1 file changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/gas/config/tc-ppc.c b/gas/config/tc-ppc.c
+index 054f9c72161..89bc7d3f9b9 100644
+--- a/gas/config/tc-ppc.c
++++ b/gas/config/tc-ppc.c
+@@ -5965,7 +5965,30 @@ ppc_machine (int ignore ATTRIBUTE_UNUSED)
+ 	     options do not count as a new machine, instead they add
+ 	     to currently selected opcodes.  */
+ 	  ppc_cpu_t machine_sticky = 0;
+-	  new_cpu = ppc_parse_cpu (ppc_cpu, &machine_sticky, cpu_string);
++	  /* Unfortunately, some versions of gcc emit a .machine
++	     directive very near the start of the compiler's assembly
++	     output file.  This is bad because it overrides user -Wa
++	     cpu selection.  Worse, there are versions of gcc that
++	     emit the *wrong* cpu, not even respecting the -mcpu given
++	     to gcc.  See gcc pr101393.  And to compound the problem,
++	     as of 20220222 gcc doesn't pass the correct cpu option to
++	     gas on the command line.  See gcc pr59828.  Hack around
++	     this by keeping sticky options for an early .machine.  */
++	  asection *sec;
++	  for (sec = stdoutput->sections; sec != NULL; sec = sec->next)
++	    {
++	      segment_info_type *info = seg_info (sec);
++	      /* Are the frags for this section perturbed from their
++		 initial state?  Even .align will count here.  */
++	      if (info != NULL
++		  && (info->frchainP->frch_root != info->frchainP->frch_last
++		      || info->frchainP->frch_root->fr_type != rs_fill
++		      || info->frchainP->frch_root->fr_fix != 0))
++		break;
++	    }
++	  new_cpu = ppc_parse_cpu (ppc_cpu,
++				   sec == NULL ? &sticky : &machine_sticky,
++				   cpu_string);
+ 	  if (new_cpu != 0)
+ 	    ppc_cpu = new_cpu;
+ 	  else
+-- 
+2.30.2
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index ea1f020989..17de6e4e41 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -36,6 +36,12 @@ config BR2_BINUTILS_VERSION_2_37_X
 	# https://github.com/uclinux-dev/elf2flt/issues/12
 	depends on !BR2_BINFMT_FLAT
 
+config BR2_BINUTILS_VERSION_2_38_X
+	bool "binutils 2.38"
+	# https://github.com/uclinux-dev/elf2flt/pull/16
+	# https://github.com/uclinux-dev/elf2flt/issues/12
+	depends on !BR2_BINFMT_FLAT
+
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
 	depends on BR2_arc
@@ -49,6 +55,7 @@ config BR2_BINUTILS_VERSION
 	default "2.35.2"	if BR2_BINUTILS_VERSION_2_35_X
 	default "2.36.1"	if BR2_BINUTILS_VERSION_2_36_X
 	default "2.37"		if BR2_BINUTILS_VERSION_2_37_X
+	default "2.38"		if BR2_BINUTILS_VERSION_2_38_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index d1be6cbce8..fe31b34d40 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -3,6 +3,7 @@ sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724a
 sha512  9974ede5978d32e0d68fef23da48fa00bd06b0bff7ec45b00ca075c126d6bbe0cf2defc03ecc3f17bc6cc85b64271a13009c4049d7ba17de26e84e3a6e2c0348  binutils-2.35.2.tar.xz
 sha512  cc24590bcead10b90763386b6f96bb027d7594c659c2d95174a6352e8b98465a50ec3e4088d0da038428abe059bbc4ae5f37b269f31a40fc048072c8a234f4e9  binutils-2.36.1.tar.xz
 sha512  5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d561ec954fe7469a68f1b66f1a3cd53d5a3af7293635a90d69edd15e7  binutils-2.37.tar.xz
+sha512  8bf0b0d193c9c010e0518ee2b2e5a830898af206510992483b427477ed178396cd210235e85fd7bd99a96fc6d5eedbeccbd48317a10f752b7336ada8b2bb826d  binutils-2.38.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
