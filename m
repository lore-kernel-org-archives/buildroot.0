From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Apr 2017 10:42:37 +0200
Subject: [Buildroot] [PATCH 1/2] binutils: rewrite 2.27 patches as proper
	git formatted
Message-ID: <20170410084238.13201-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0100, 0905 and 0906 was not properly git formatted. In addition,
patch 0500 had some fuzz so didn't apply cleanly.

While we're at it, regenerate the entire series with format-patch so
the commit hashes are correct.

As a side effect, the numbering is also consecutive. This makes it
slightly harder to find the corresponding patch in 2.26 or 2.28, but
it's still not rocket science, and anyway it is rarely necessary to do
that. It is much more likely that someone has to git-am the series.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...x-if-no-arm-data-associated-with-section.patch} | 15 ++++++++--
 .../{0120-sh-conf.patch => 0002-sh-conf.patch}     | 12 ++++----
 ...ensa.c-fixup-xg_reverse_shift_count-typo.patch} |  6 ++--
 ...00-ld-makefile.patch => 0004-ld-makefile.patch} | 10 +++----
 ...gth.patch => 0005-check-ldrunpath-length.patch} | 10 +++----
 ...ch => 0006-add-sysroot-fix-from-bug-3049.patch} | 10 +++----
 ....patch => 0007-poison-system-directories.patch} | 34 +++++++++++-----------
 ...Set-dynamic-tag-VMA-and-size-from-dynami.patch} | 11 ++++---
 ...x-LINKER-BUG-.rofixup-section-size-mismat.patch | 31 ++++++++++++++++++++
 ...ult-for-microblaze-when-gc-sections-is-u.patch} | 21 +++++++++----
 package/binutils/2.27/0905-bfin-rofixup-bug.patch  | 21 -------------
 11 files changed, 108 insertions(+), 73 deletions(-)
 rename package/binutils/2.27/{0100-elf32-arm-no-data-fix.patch => 0001-elf32-arm-fix-if-no-arm-data-associated-with-section.patch} (63%)
 rename package/binutils/2.27/{0120-sh-conf.patch => 0002-sh-conf.patch} (82%)
 rename package/binutils/2.27/{0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch => 0003-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch} (89%)
 rename package/binutils/2.27/{0300-ld-makefile.patch => 0004-ld-makefile.patch} (84%)
 rename package/binutils/2.27/{0301-check-ldrunpath-length.patch => 0005-check-ldrunpath-length.patch} (82%)
 rename package/binutils/2.27/{0500-add-sysroot-fix-from-bug-3049.patch => 0006-add-sysroot-fix-from-bug-3049.patch} (87%)
 rename package/binutils/2.27/{0600-poison-system-directories.patch => 0007-poison-system-directories.patch} (94%)
 rename package/binutils/2.27/{0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch => 0008-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch} (80%)
 create mode 100644 package/binutils/2.27/0009-blackfin-fix-LINKER-BUG-.rofixup-section-size-mismat.patch
 rename package/binutils/2.27/{0906-microblaze-pr21180.patch => 0010-Fix-ld-segfault-for-microblaze-when-gc-sections-is-u.patch} (67%)
 delete mode 100644 package/binutils/2.27/0905-bfin-rofixup-bug.patch

diff --git a/package/binutils/2.27/0100-elf32-arm-no-data-fix.patch b/package/binutils/2.27/0001-elf32-arm-fix-if-no-arm-data-associated-with-section.patch
similarity index 63%
rename from package/binutils/2.27/0100-elf32-arm-no-data-fix.patch
rename to package/binutils/2.27/0001-elf32-arm-fix-if-no-arm-data-associated-with-section.patch
index c6b0e7efe8..bae5e954f8 100644
--- a/package/binutils/2.27/0100-elf32-arm-no-data-fix.patch
+++ b/package/binutils/2.27/0001-elf32-arm-fix-if-no-arm-data-associated-with-section.patch
@@ -1,3 +1,8 @@
+From 8203b3c8a0bbb69a9927131eae4b98a0b2aff18d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 10 Apr 2017 10:08:04 +0200
+Subject: [PATCH] elf32-arm: fix if no arm data associated with section
+
 bfd/ChangeLog
 2016-08-23  Nick Clifton  <address@hidden>
 
@@ -6,12 +11,15 @@ bfd/ChangeLog
 
 [Thomas: taken from https://lists.gnu.org/archive/html/bug-binutils/2016-08/msg00165.html.]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ bfd/elf32-arm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/bfd/elf32-arm.c b/bfd/elf32-arm.c
-index 1eba21b..4478238 100644
+index 3d4a458fe46..dbd291138cd 100644
 --- a/bfd/elf32-arm.c
 +++ b/bfd/elf32-arm.c
-@@ -18688,7 +18688,7 @@ elf32_arm_count_additional_relocs (asection *sec)
+@@ -18172,7 +18172,7 @@ elf32_arm_count_additional_relocs (asection *sec)
  {
    struct _arm_elf_section_data *arm_data;
    arm_data = get_arm_elf_section_data (sec);
@@ -20,3 +28,6 @@ index 1eba21b..4478238 100644
  }
  
  /* Called to set the sh_flags, sh_link and sh_info fields of OSECTION which
+-- 
+2.11.0
+
diff --git a/package/binutils/2.27/0120-sh-conf.patch b/package/binutils/2.27/0002-sh-conf.patch
similarity index 82%
rename from package/binutils/2.27/0120-sh-conf.patch
rename to package/binutils/2.27/0002-sh-conf.patch
index cc14ef4029..c5b32f5c92 100644
--- a/package/binutils/2.27/0120-sh-conf.patch
+++ b/package/binutils/2.27/0002-sh-conf.patch
@@ -1,4 +1,4 @@
-From 1ceee199e9a32034c6def7700fdbb26335ca76a3 Mon Sep 17 00:00:00 2001
+From d9f9e9975752c94c329c235b2345494dfeaff447 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 25 Dec 2015 11:38:13 +0100
 Subject: [PATCH] sh-conf
@@ -16,10 +16,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 34b66f7..905bc7b 100755
+index ad3dfb70c5d..e11caef44bb 100755
 --- a/configure
 +++ b/configure
-@@ -3939,7 +3939,7 @@ case "${target}" in
+@@ -3946,7 +3946,7 @@ case "${target}" in
    or1k*-*-*)
      noconfigdirs="$noconfigdirs gdb"
      ;;
@@ -29,10 +29,10 @@ index 34b66f7..905bc7b 100755
        sh*-*-elf)
           ;;
 diff --git a/configure.ac b/configure.ac
-index 4977d97..1e69ee2 100644
+index 55830b232b4..eaa3fef370c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1276,7 +1276,7 @@ case "${target}" in
+@@ -1282,7 +1282,7 @@ case "${target}" in
    or1k*-*-*)
      noconfigdirs="$noconfigdirs gdb"
      ;;
@@ -42,5 +42,5 @@ index 4977d97..1e69ee2 100644
        sh*-*-elf)
           ;;
 -- 
-2.4.3
+2.11.0
 
diff --git a/package/binutils/2.27/0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch b/package/binutils/2.27/0003-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch
similarity index 89%
rename from package/binutils/2.27/0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch
rename to package/binutils/2.27/0003-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch
index 7973607884..299b048a20 100644
--- a/package/binutils/2.27/0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch
+++ b/package/binutils/2.27/0003-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch
@@ -1,4 +1,4 @@
-From 78fb7e37eb8bb08ae537d6c487996ff17c810332 Mon Sep 17 00:00:00 2001
+From 01363149e9158e3a37dec8c0b3894eac44914b98 Mon Sep 17 00:00:00 2001
 From: Trevor Saunders <tbsaunde+binutils@tbsaunde.org>
 Date: Mon, 26 Sep 2016 12:42:11 -0400
 Subject: [PATCH] tc-xtensa.c: fixup xg_reverse_shift_count typo
@@ -16,7 +16,7 @@ Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
-index d062044..ca261ae 100644
+index d062044d42f..ca261ae19c4 100644
 --- a/gas/config/tc-xtensa.c
 +++ b/gas/config/tc-xtensa.c
 @@ -2228,7 +2228,7 @@ xg_reverse_shift_count (char **cnt_argp)
@@ -29,5 +29,5 @@ index d062044..ca261ae 100644
    free (cnt_arg);
    *cnt_argp = new_arg;
 -- 
-2.1.4
+2.11.0
 
diff --git a/package/binutils/2.27/0300-ld-makefile.patch b/package/binutils/2.27/0004-ld-makefile.patch
similarity index 84%
rename from package/binutils/2.27/0300-ld-makefile.patch
rename to package/binutils/2.27/0004-ld-makefile.patch
index 73cc098024..295357b119 100644
--- a/package/binutils/2.27/0300-ld-makefile.patch
+++ b/package/binutils/2.27/0004-ld-makefile.patch
@@ -1,4 +1,4 @@
-From d76a7549b43974fe8564971a3f40459bc495a8a7 Mon Sep 17 00:00:00 2001
+From 847c27a320cd21cf33b045f2434a900168f11a0c Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 25 Dec 2015 11:40:53 +0100
 Subject: [PATCH] ld-makefile
@@ -11,7 +11,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 0b3b049..3871c74 100644
+index 0598923ba7f..b478ba76469 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -57,7 +57,7 @@ endif
@@ -24,10 +24,10 @@ index 0b3b049..3871c74 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index ed98f87..530e4c9 100644
+index 7c78198665a..5eb67e0cd55 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -413,7 +413,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+@@ -451,7 +451,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -37,5 +37,5 @@ index ed98f87..530e4c9 100644
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
 -- 
-2.4.3
+2.11.0
 
diff --git a/package/binutils/2.27/0301-check-ldrunpath-length.patch b/package/binutils/2.27/0005-check-ldrunpath-length.patch
similarity index 82%
rename from package/binutils/2.27/0301-check-ldrunpath-length.patch
rename to package/binutils/2.27/0005-check-ldrunpath-length.patch
index 3b4c204c7f..ca14e90515 100644
--- a/package/binutils/2.27/0301-check-ldrunpath-length.patch
+++ b/package/binutils/2.27/0005-check-ldrunpath-length.patch
@@ -1,4 +1,4 @@
-From ebe1cba46df52d7bf86def3d681271fd05fb453b Mon Sep 17 00:00:00 2001
+From 223f6254efbfeb2c856e0c24bb8132c2185583c1 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 25 Dec 2015 11:41:47 +0100
 Subject: [PATCH] check-ldrunpath-length
@@ -10,10 +10,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index 0405d4f..efd3300 100644
+index 47fa549a9af..709a4db5b33 100644
 --- a/ld/emultempl/elf32.em
 +++ b/ld/emultempl/elf32.em
-@@ -1242,6 +1242,8 @@ fragment <<EOF
+@@ -1244,6 +1244,8 @@ fragment <<EOF
  	      && command_line.rpath == NULL)
  	    {
  	      lib_path = (const char *) getenv ("LD_RUN_PATH");
@@ -22,7 +22,7 @@ index 0405d4f..efd3300 100644
  	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
  						      force))
  		break;
-@@ -1523,6 +1525,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+@@ -1525,6 +1527,8 @@ gld${EMULATION_NAME}_before_allocation (void)
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -32,5 +32,5 @@ index 0405d4f..efd3300 100644
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
 -- 
-2.4.3
+2.11.0
 
diff --git a/package/binutils/2.27/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.27/0006-add-sysroot-fix-from-bug-3049.patch
similarity index 87%
rename from package/binutils/2.27/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/2.27/0006-add-sysroot-fix-from-bug-3049.patch
index f67a43efdf..64af654fe0 100644
--- a/package/binutils/2.27/0500-add-sysroot-fix-from-bug-3049.patch
+++ b/package/binutils/2.27/0006-add-sysroot-fix-from-bug-3049.patch
@@ -1,4 +1,4 @@
-From 30628870e583375f8927c04398c7219c6e9f703c Mon Sep 17 00:00:00 2001
+From 68c46119f9b820feb144c184cdf551549e211e60 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 25 Dec 2015 11:42:48 +0100
 Subject: [PATCH] add sysroot fix from bug #3049
@@ -16,12 +16,12 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 96f9ecc..1439309 100644
+index e3977377b8d..7000b466227 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -335,18 +335,25 @@ ldfile_open_file_search (const char *arch,
+@@ -336,18 +336,25 @@ ldfile_open_file_search (const char *arch,
       directory first.  */
-   if (! entry->flags.maybe_archive)
+   if (!entry->flags.maybe_archive)
      {
 -      if (entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename))
 +      /* For absolute pathnames, try to always open the file in the
@@ -48,5 +48,5 @@ index 96f9ecc..1439309 100644
  
        if (IS_ABSOLUTE_PATH (entry->filename))
 -- 
-2.4.3
+2.11.0
 
diff --git a/package/binutils/2.27/0600-poison-system-directories.patch b/package/binutils/2.27/0007-poison-system-directories.patch
similarity index 94%
rename from package/binutils/2.27/0600-poison-system-directories.patch
rename to package/binutils/2.27/0007-poison-system-directories.patch
index d16994ec0c..69800feedc 100644
--- a/package/binutils/2.27/0600-poison-system-directories.patch
+++ b/package/binutils/2.27/0007-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From be366461dd49e760440fb28eaee5164eb281adcc Mon Sep 17 00:00:00 2001
+From e6e85c64b31b8e9dde0f2f9cbd785bbef5a7aa41 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 25 Dec 2015 11:45:38 +0100
 Subject: [PATCH] poison-system-directories
@@ -78,10 +78,10 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  9 files changed, 89 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
-index 276fb77..35c58eb 100644
+index 2c6d698b6ce..d3cb7e882de 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -14,6 +14,9 @@
+@@ -17,6 +17,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -92,10 +92,10 @@ index 276fb77..35c58eb 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index a446283..d1f9504 100755
+index c6f871dd429..4535e7487e2 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -786,6 +786,7 @@ with_lib_path
+@@ -788,6 +788,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -103,7 +103,7 @@ index a446283..d1f9504 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1442,6 +1443,8 @@ Optional Features:
+@@ -1445,6 +1446,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -112,7 +112,7 @@ index a446283..d1f9504 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15491,7 +15494,18 @@ else
+@@ -15498,7 +15501,18 @@ else
  fi
  
  
@@ -132,7 +132,7 @@ index a446283..d1f9504 100755
  # Check whether --enable-got was given.
  if test "${enable_got+set}" = set; then :
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 188172d..2cd8443 100644
+index d17281f0a0c..9fb3db96b5f 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
@@ -153,10 +153,10 @@ index 188172d..2cd8443 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index d84ec4e..3476b26 100644
+index 85a48ad58d9..a8fdddfdff6 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -164,6 +164,14 @@ typedef struct {
+@@ -169,6 +169,14 @@ typedef struct
    /* If set, display the target memory usage (per memory region).  */
    bfd_boolean print_memory_usage;
  
@@ -172,10 +172,10 @@ index d84ec4e..3476b26 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texinfo b/ld/ld.texinfo
-index 1dd7492..fb1438e 100644
+index bc16764b055..838c75deb50 100644
 --- a/ld/ld.texinfo
 +++ b/ld/ld.texinfo
-@@ -2332,6 +2332,18 @@ string identifying the original linked file does not change.
+@@ -2357,6 +2357,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -195,7 +195,7 @@ index 1dd7492..fb1438e 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 1439309..086b354 100644
+index 7000b466227..8035c749867 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -114,6 +114,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
@@ -223,7 +223,7 @@ index 1439309..086b354 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 6f11e7b..0ca3110 100644
+index cf943e425f9..12cfcaa295e 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
 @@ -144,6 +144,8 @@ enum option_values
@@ -236,7 +236,7 @@ index 6f11e7b..0ca3110 100644
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index bb0b9cc..a23c56c 100644
+index e7a8dff9d26..3ccf2af73bc 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
 @@ -257,6 +257,8 @@ main (int argc, char **argv)
@@ -249,7 +249,7 @@ index bb0b9cc..a23c56c 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 4cad209..be7d584 100644
+index 6d28e9142b0..6d62961a26c 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
 @@ -530,6 +530,14 @@ static const struct ld_option ld_options[] =
@@ -302,5 +302,5 @@ index 4cad209..be7d584 100644
      {
        lang_leave_group ();
 -- 
-2.4.3
+2.11.0
 
diff --git a/package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch b/package/binutils/2.27/0008-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch
similarity index 80%
rename from package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch
rename to package/binutils/2.27/0008-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch
index f1ec259988..87d5b90f1f 100644
--- a/package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch
+++ b/package/binutils/2.27/0008-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch
@@ -1,4 +1,4 @@
-From c646b02fdcae5f37bd88f33a0c4683ef13ad5c82 Mon Sep 17 00:00:00 2001
+From 54b8d576ce487b47a6ac2719fa894d169f5b2788 Mon Sep 17 00:00:00 2001
 From: Alan Modra <amodra@gmail.com>
 Date: Mon, 31 Oct 2016 12:46:38 +1030
 Subject: [PATCH] Revert part "Set dynamic tag VMA and size from dynamic
@@ -10,12 +10,15 @@ Subject: [PATCH] Revert part "Set dynamic tag VMA and size from dynamic
 
 Signed-off-by: Alan Modra <amodra@gmail.com>
 Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ bfd/elf32-microblaze.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/bfd/elf32-microblaze.c b/bfd/elf32-microblaze.c
-index 477e7b3..5c66808 100644
+index 5496d1613aa..d964e17c162 100644
 --- a/bfd/elf32-microblaze.c
 +++ b/bfd/elf32-microblaze.c
-@@ -3396,13 +3396,13 @@ microblaze_elf_finish_dynamic_sections (bfd *output_bfd,
+@@ -3400,13 +3400,13 @@ microblaze_elf_finish_dynamic_sections (bfd *output_bfd,
              {
                asection *s;
  
@@ -32,5 +35,5 @@ index 477e7b3..5c66808 100644
                      dyn.d_un.d_val = s->size;
                  }
 -- 
-2.1.4
+2.11.0
 
diff --git a/package/binutils/2.27/0009-blackfin-fix-LINKER-BUG-.rofixup-section-size-mismat.patch b/package/binutils/2.27/0009-blackfin-fix-LINKER-BUG-.rofixup-section-size-mismat.patch
new file mode 100644
index 0000000000..24531504c2
--- /dev/null
+++ b/package/binutils/2.27/0009-blackfin-fix-LINKER-BUG-.rofixup-section-size-mismat.patch
@@ -0,0 +1,31 @@
+From fcaceb77b8cf259858f3eb972e7a2876d0f3f487 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 10 Apr 2017 10:16:08 +0200
+Subject: [PATCH] blackfin: fix LINKER BUG: .rofixup section size mismatch
+
+Workaround from adi-toolchain commit:
+af414ec1fb628ddb1562f062f3db49823ca14ca2
+[#6798] binutils-2.21/bfd: temp workaround for rofixup mismatch errors.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ bfd/elf32-bfin.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-bfin.c b/bfd/elf32-bfin.c
+index b9d368fe5c7..38d8f133eb0 100644
+--- a/bfd/elf32-bfin.c
++++ b/bfd/elf32-bfin.c
+@@ -4879,7 +4879,8 @@ bfinfdpic_check_relocs (bfd *abfd, struct bfd_link_info *info,
+ 
+ 	case R_BFIN_FUNCDESC:
+ 	  picrel->fd++;
+-	  picrel->relocsfd++;
++	  if (bfd_get_section_flags (abfd, sec) & SEC_ALLOC)
++	    picrel->relocsfd++;
+ 	  break;
+ 
+         /* This relocation describes the C++ object vtable hierarchy.
+-- 
+2.11.0
+
diff --git a/package/binutils/2.27/0906-microblaze-pr21180.patch b/package/binutils/2.27/0010-Fix-ld-segfault-for-microblaze-when-gc-sections-is-u.patch
similarity index 67%
rename from package/binutils/2.27/0906-microblaze-pr21180.patch
rename to package/binutils/2.27/0010-Fix-ld-segfault-for-microblaze-when-gc-sections-is-u.patch
index 48e5e14b45..2b80dad6e3 100644
--- a/package/binutils/2.27/0906-microblaze-pr21180.patch
+++ b/package/binutils/2.27/0010-Fix-ld-segfault-for-microblaze-when-gc-sections-is-u.patch
@@ -1,13 +1,21 @@
-Fix ld segfault for microblaze when --gc-sections is used
+From 801d8979ec70c10a0bc958594a8a06b5443f91ad Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 10 Apr 2017 10:16:58 +0200
+Subject: [PATCH] Fix ld segfault for microblaze when --gc-sections is used
+
 Upstream: pending
 https://sourceware.org/bugzilla/show_bug.cgi?id=21180
 
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ bfd/elf32-microblaze.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
 
-diff -Nur binutils-2.27.orig/bfd/elf32-microblaze.c binutils-2.27/bfd/elf32-microblaze.c
---- binutils-2.27.orig/bfd/elf32-microblaze.c	2016-08-03 09:36:50.000000000 +0200
-+++ binutils-2.27/bfd/elf32-microblaze.c	2017-02-23 19:43:12.612313590 +0100
-@@ -3297,13 +3297,20 @@
+diff --git a/bfd/elf32-microblaze.c b/bfd/elf32-microblaze.c
+index d964e17c162..c58c4329c42 100644
+--- a/bfd/elf32-microblaze.c
++++ b/bfd/elf32-microblaze.c
+@@ -3297,13 +3297,20 @@ microblaze_elf_finish_dynamic_symbol (bfd *output_bfd,
  	      || h->dynindx == -1))
          {
            asection *sec = h->root.u.def.section;
@@ -31,3 +39,6 @@ diff -Nur binutils-2.27.orig/bfd/elf32-microblaze.c binutils-2.27/bfd/elf32-micr
          }
        else
          {
+-- 
+2.11.0
+
diff --git a/package/binutils/2.27/0905-bfin-rofixup-bug.patch b/package/binutils/2.27/0905-bfin-rofixup-bug.patch
deleted file mode 100644
index da9d586551..0000000000
--- a/package/binutils/2.27/0905-bfin-rofixup-bug.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fixes: LINKER BUG: .rofixup section size mismatch
-
-Workaround from adi-toolchain commit:
-af414ec1fb628ddb1562f062f3db49823ca14ca2
-[#6798] binutils-2.21/bfd: temp workaround for rofixup mismatch errors.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur binutils-2.26.1.orig/bfd/elf32-bfin.c binutils-2.26.1/bfd/elf32-bfin.c
---- binutils-2.26.1.orig/bfd/elf32-bfin.c	2015-11-13 09:27:40.000000000 +0100
-+++ binutils-2.26.1/bfd/elf32-bfin.c	2016-07-31 00:50:48.357995132 +0200
-@@ -4879,7 +4879,8 @@
- 
- 	case R_BFIN_FUNCDESC:
- 	  picrel->fd++;
--	  picrel->relocsfd++;
-+	  if (bfd_get_section_flags (abfd, sec) & SEC_ALLOC)
-+	    picrel->relocsfd++;
- 	  break;
- 
-         /* This relocation describes the C++ object vtable hierarchy.
-- 
2.11.0
