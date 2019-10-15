From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Tue, 15 Oct 2019 12:02:58 +0300
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2019.09-eng002
Message-ID: <20191015090258.46280-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps ARC toolchain to arc-2019.09-eng002.
We want to test how new toolchain-eng002 builds packages,
so we can make fixes before release of toolcain.

Please note that it is an engineering build and it might have
all kinds of breakages, please don't use it for production builds

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com

---
 package/binutils/Config.in.host                    |   2 +-
 .../0001-poison-system-directories.patch           |  61 ++--
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   4 +-
 package/gcc/Config.in.host                         |   6 +-
 .../gcc/arc-2019.03-release/0001-ARC-PR89838.patch | 369 ---------------------
 .../0002-ARC-Fix-emitting-TLS-symbols.patch        |  61 ----
 .../0100-uclibc-conf.patch                         |   0
 package/gcc/gcc.hash                               |   2 +-
 package/gdb/Config.in.host                         |   2 +-
 package/gdb/gdb.hash                               |   2 +-
 .../glibc.hash                                     |   2 +-
 package/glibc/glibc.mk                             |   2 +-
 13 files changed, 44 insertions(+), 471 deletions(-)
 rename package/binutils/{arc-2019.03-release => arc-2019.09-eng002}/0001-poison-system-directories.patch (86%)
 delete mode 100644 package/gcc/arc-2019.03-release/0001-ARC-PR89838.patch
 delete mode 100644 package/gcc/arc-2019.03-release/0002-ARC-Fix-emitting-TLS-symbols.patch
 rename package/gcc/{arc-2019.03-release => arc-2019.09-eng002}/0100-uclibc-conf.patch (100%)
 rename package/glibc/{arc-2019.03-release => arc-2019.09-eng002}/glibc.hash (75%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index c5daee7f95..9def812dc1 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -37,7 +37,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2019.03-release"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2019.09-eng002"	if BR2_BINUTILS_VERSION_ARC
 	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
diff --git a/package/binutils/arc-2019.03-release/0001-poison-system-directories.patch b/package/binutils/arc-2019.09-eng002/0001-poison-system-directories.patch
similarity index 86%
rename from package/binutils/arc-2019.03-release/0001-poison-system-directories.patch
rename to package/binutils/arc-2019.09-eng002/0001-poison-system-directories.patch
index 90c7ac760a..f6a78c7cdd 100644
--- a/package/binutils/arc-2019.03-release/0001-poison-system-directories.patch
+++ b/package/binutils/arc-2019.09-eng002/0001-poison-system-directories.patch
@@ -1,7 +1,10 @@
-From 7d1e6ed1d57e839207e0ece7561bd4709032de9f Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:45:38 +0100
-Subject: [PATCH] poison-system-directories
+From 5f62ad7ce534e3384d6ed8892614979da297bd70 Mon Sep 17 00:00:00 2001
+From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
+Date: Mon, 14 Oct 2019 16:45:15 +0300
+Subject: [PATCH] [PATCH] poison-system-directories
+
+Patch adapted to arc-binutils-gdb-2019.09
+Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
 
 Patch adapted to binutils 2.23.2 and extended to use
 BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
@@ -78,7 +81,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  9 files changed, 89 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
-index d93c9b0..5da2742 100644
+index d93c9b08300..5da2742beac 100644
 --- a/ld/config.in
 +++ b/ld/config.in
 @@ -31,6 +31,9 @@
@@ -92,10 +95,10 @@ index d93c9b0..5da2742 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 300a272..d68890f 100755
+index 2d6ca5c0445..563f9921f7f 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -822,6 +822,7 @@ with_lib_path
+@@ -823,6 +823,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -103,7 +106,7 @@ index 300a272..d68890f 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1486,6 +1487,8 @@ Optional Features:
+@@ -1487,6 +1488,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -112,7 +115,7 @@ index 300a272..d68890f 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15803,7 +15806,18 @@ else
+@@ -15804,7 +15807,18 @@ else
  fi
  
  
@@ -132,7 +135,7 @@ index 300a272..d68890f 100755
  # Check whether --enable-got was given.
  if test "${enable_got+set}" = set; then :
 diff --git a/ld/configure.ac b/ld/configure.ac
-index d10c553..9f1b57b 100644
+index 41a51bbb7e9..dbaa98a9e17 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
@@ -153,7 +156,7 @@ index d10c553..9f1b57b 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index ba914b9..9df17da 100644
+index 55078a9637b..511e9bc34b7 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
 @@ -180,6 +180,14 @@ typedef struct
@@ -172,10 +175,10 @@ index ba914b9..9df17da 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texi b/ld/ld.texi
-index 40d79dd..137d46c 100644
+index fcbc335c95e..6ba7ebdb32a 100644
 --- a/ld/ld.texi
 +++ b/ld/ld.texi
-@@ -2479,6 +2479,18 @@ string identifying the original linked file does not change.
+@@ -2557,6 +2557,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -195,7 +198,7 @@ index 40d79dd..137d46c 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index b3d166c..3dcbf66 100644
+index 7f60319390e..0bcc06db964 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
@@ -223,23 +226,23 @@ index b3d166c..3dcbf66 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 04d6fd5..d7df005 100644
+index 32a7a6409e8..c02b64bf92f 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -148,6 +148,8 @@ enum option_values
-   OPTION_REQUIRE_DEFINED_SYMBOL,
-   OPTION_ORPHAN_HANDLING,
+@@ -150,6 +150,8 @@ enum option_values
    OPTION_FORCE_GROUP_ALLOCATION,
+   OPTION_PRINT_MAP_DISCARDED,
+   OPTION_NO_PRINT_MAP_DISCARDED,
 +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
 +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
  };
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index f31eeb2..25f8497 100644
+index 34c19223137..66d2c3f4bcf 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -268,6 +268,8 @@ main (int argc, char **argv)
+@@ -270,6 +270,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -249,12 +252,12 @@ index f31eeb2..25f8497 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 86a033a..f07f095 100644
+index 1c15ac29c0c..8b714e10a40 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -543,6 +543,14 @@ static const struct ld_option ld_options[] =
-   { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
-     '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
+@@ -549,6 +549,14 @@ static const struct ld_option ld_options[] =
+   { {"no-print-map-discarded", no_argument, NULL, OPTION_NO_PRINT_MAP_DISCARDED},
+     '\0', NULL, N_("Do not show discarded sections in map file output"),
      TWO_DASHES },
 +  { {"no-poison-system-directories", no_argument, NULL,
 +    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
@@ -267,7 +270,7 @@ index 86a033a..f07f095 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -555,6 +563,7 @@ parse_args (unsigned argc, char **argv)
+@@ -561,6 +569,7 @@ parse_args (unsigned argc, char **argv)
    int ingroup = 0;
    char *default_dirlist = NULL;
    char *shortopts;
@@ -275,7 +278,7 @@ index 86a033a..f07f095 100644
    struct option *longopts;
    struct option *really_longopts;
    int last_optind;
-@@ -1543,6 +1552,14 @@ parse_args (unsigned argc, char **argv)
+@@ -1549,6 +1558,14 @@ parse_args (unsigned argc, char **argv)
  	  }
  	  break;
  
@@ -290,7 +293,7 @@ index 86a033a..f07f095 100644
  	case OPTION_PUSH_STATE:
  	  input_flags.pushed = xmemdup (&input_flags,
  					sizeof (input_flags),
-@@ -1586,6 +1603,10 @@ parse_args (unsigned argc, char **argv)
+@@ -1600,6 +1617,10 @@ parse_args (unsigned argc, char **argv)
        command_line.soname = NULL;
      }
  
@@ -300,7 +303,7 @@ index 86a033a..f07f095 100644
 +
    while (ingroup)
      {
-       lang_leave_group ();
+       einfo (_("%P: missing --end-group; added as last command line option\n"));
 -- 
-2.7.4
+2.16.2
 
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 4b747fc2b0..4aea049d3a 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,7 +4,7 @@ sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe13
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  e2d8c109ed006eb143bab8360c9e29287c05a0b273448d256edee7458e356d45b27c9869ca6be96206df360c24ba607b21c185190d3a4731999dad515b157c18  binutils-gdb-arc-2019.03-release.tar.gz
+sha512  db6a0a855733a79ec71127b94981e6be63c4852dee5aed2bc9738da7d3c3796d88974e86ae9dc20cf28ea5e31897ddf8d68f695fcadfbdec1a8406b437d73df6  binutils-gdb-arc-2019.09-eng002.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d60c032bde..a4ed1a8f76 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,13 +9,13 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2019.03-release
+BINUTILS_VERSION = arc-2019.09-eng002
 else
 BINUTILS_VERSION = 2.31.1
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2019.03-release)
+ifeq ($(BINUTILS_VERSION),arc-2019.09-eng002)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fc0333d08f..c1fe996fd3 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -10,10 +10,10 @@ choice
 	  Select the version of gcc you wish to use.
 
 config BR2_GCC_VERSION_ARC
-	bool "gcc arc (8.x)"
+	bool "gcc arc (9.x)"
 	# Only supported architecture
 	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_GCC_VERSION_CSKY
 	bool "gcc csky"
@@ -86,7 +86,7 @@ config BR2_GCC_VERSION
 	default "7.4.0"     if BR2_GCC_VERSION_7_X
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
 	default "9.2.0"     if BR2_GCC_VERSION_9_X
-	default "arc-2019.03-release" if BR2_GCC_VERSION_ARC
+	default "arc-2019.09-eng002" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
diff --git a/package/gcc/arc-2019.03-release/0001-ARC-PR89838.patch b/package/gcc/arc-2019.03-release/0001-ARC-PR89838.patch
deleted file mode 100644
index e95f7954f9..0000000000
--- a/package/gcc/arc-2019.03-release/0001-ARC-PR89838.patch
+++ /dev/null
@@ -1,369 +0,0 @@
-From 228efbbb2f1d59ca7fc0ec09d4be75ce58fa583b Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@gmail.com>
-Date: Mon, 1 Apr 2019 13:03:55 +0300
-Subject: [PATCH] [ARC] PR89838
-
-gcc/
-xxxx-xx-xx  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.c (arc_symbol_binds_local_p): New function.
-	(arc_legitimize_pic_address): Simplify and cleanup the function.
-	(SYMBOLIC_CONST): Remove.
-	(prepare_pic_move): Likewise.
-	(prepare_move_operands): Handle complex mov cases here.
-	(arc_legitimize_address_0): Remove call to
-	arc_legitimize_pic_address.
-	(arc_legitimize_address): Remove call to
-	arc_legitimize_tls_address.
-	* config/arc/arc.md (movqi_insn): Allow Cm3 match.
-	(movhi_insn): Likewise.
-
-/gcc/testsuite
-xxxx-xx-xx  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* gcc.target/arc/pr89838.c: New file.
-
-Fix in upstream:
-   https://gcc.gnu.org/viewcvs/gcc?view=revision&sortby=date&revision=272645
-
-Signed-off-by: Evgeniy Didin <didin@synopsys.com>
----
- gcc/config/arc/arc.c  | 246 ++++++++++--------------------------------
- gcc/config/arc/arc.md |   8 +-
- 2 files changed, 60 insertions(+), 194 deletions(-)
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 78a37aa2a18..8b544efaa11 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -5990,137 +5990,46 @@ arc_legitimize_tls_address (rtx addr, enum tls_model model)
-     }
- }
- 
--/* Legitimize a pic address reference in ORIG.
--   The return value is the legitimated address.
--   If OLDX is non-zero, it is the target to assign the address to first.  */
-+/* Return true if SYMBOL_REF X binds locally.  */
- 
--static rtx
--arc_legitimize_pic_address (rtx orig, rtx oldx)
-+static bool
-+arc_symbol_binds_local_p (const_rtx x)
- {
--  rtx addr = orig;
--  rtx pat = orig;
--  rtx base;
-+  return (SYMBOL_REF_DECL (x)
-+	  ? targetm.binds_local_p (SYMBOL_REF_DECL (x))
-+	  : SYMBOL_REF_LOCAL_P (x));
-+}
- 
--  if (oldx == orig)
--    oldx = NULL;
-+/* Legitimize a pic address reference in ORIG.  The return value is
-+   the legitimated address.  */
-+
-+static rtx
-+arc_legitimize_pic_address (rtx addr)
-+{
-+  if (!flag_pic)
-+    return addr;
- 
--  if (GET_CODE (addr) == LABEL_REF)
--    ; /* Do nothing.  */
--  else if (GET_CODE (addr) == SYMBOL_REF)
-+  switch (GET_CODE (addr))
-     {
--      enum tls_model model = SYMBOL_REF_TLS_MODEL (addr);
--      if (model != 0)
--	return arc_legitimize_tls_address (addr, model);
--      else if (!flag_pic)
--	return orig;
--      else if (CONSTANT_POOL_ADDRESS_P (addr) || SYMBOL_REF_LOCAL_P (addr))
--	return arc_unspec_offset (addr, ARC_UNSPEC_GOTOFFPC);
-+    case SYMBOL_REF:
-+      /* TLS symbols are handled in different place.  */
-+      if (SYMBOL_REF_TLS_MODEL (addr))
-+	return addr;
- 
-       /* This symbol must be referenced via a load from the Global
- 	 Offset Table (@GOTPC).  */
--      pat = arc_unspec_offset (addr, ARC_UNSPEC_GOT);
--      pat = gen_const_mem (Pmode, pat);
-+      if (!arc_symbol_binds_local_p (addr))
-+	return gen_const_mem (Pmode, arc_unspec_offset (addr, ARC_UNSPEC_GOT));
- 
--      if (oldx == NULL)
--	oldx = gen_reg_rtx (Pmode);
--
--      emit_move_insn (oldx, pat);
--      pat = oldx;
--    }
--  else
--    {
--      if (GET_CODE (addr) == CONST)
--	{
--	  addr = XEXP (addr, 0);
--	  if (GET_CODE (addr) == UNSPEC)
--	    {
--	      /* Check that the unspec is one of the ones we generate?  */
--	      return orig;
--	    }
--	  /* fwprop is placing in the REG_EQUIV notes constant pic
--	     unspecs expressions.  Then, loop may use these notes for
--	     optimizations resulting in complex patterns that are not
--	     supported by the current implementation. The following
--	     two if-cases are simplifying the complex patters to
--	     simpler ones.  */
--	  else if (GET_CODE (addr) == MINUS)
--	    {
--	      rtx op0 = XEXP (addr, 0);
--	      rtx op1 = XEXP (addr, 1);
--	      gcc_assert (oldx);
--	      gcc_assert (GET_CODE (op1) == UNSPEC);
--
--	      emit_move_insn (oldx,
--			      gen_rtx_CONST (SImode,
--					     arc_legitimize_pic_address (op1,
--									 NULL_RTX)));
--	      emit_insn (gen_rtx_SET (oldx, gen_rtx_MINUS (SImode, op0, oldx)));
--	      return oldx;
--
--	    }
--	  else if (GET_CODE (addr) != PLUS)
--	    {
--	      rtx tmp = XEXP (addr, 0);
--	      enum rtx_code code = GET_CODE (addr);
--
--	      /* It only works for UNARY operations.  */
--	      gcc_assert (UNARY_P (addr));
--	      gcc_assert (GET_CODE (tmp) == UNSPEC);
--	      gcc_assert (oldx);
--
--	      emit_move_insn
--		(oldx,
--		 gen_rtx_CONST (SImode,
--				arc_legitimize_pic_address (tmp,
--							    NULL_RTX)));
--
--	      emit_insn (gen_rtx_SET (oldx,
--				      gen_rtx_fmt_ee (code, SImode,
--						      oldx, const0_rtx)));
--
--	      return oldx;
--	    }
--	  else
--	    {
--	      gcc_assert (GET_CODE (addr) == PLUS);
--	      if (GET_CODE (XEXP (addr, 0)) == UNSPEC)
--		return orig;
--	    }
--	}
--
--      if (GET_CODE (addr) == PLUS)
--	{
--	  rtx op0 = XEXP (addr, 0), op1 = XEXP (addr, 1);
--
--	  base = arc_legitimize_pic_address (op0, oldx);
--	  pat  = arc_legitimize_pic_address (op1,
--					     base == oldx ? NULL_RTX : oldx);
--
--	  if (base == op0 && pat == op1)
--	    return orig;
--
--	  if (GET_CODE (base) == PLUS)
--	    {
--	      gcc_assert (oldx != NULL_RTX);
--	      gcc_assert (REG_P (oldx));
--	      emit_insn (gen_rtx_SET (oldx, base));
--	      base = oldx;
--	    }
--	  if (GET_CODE (pat) == CONST_INT)
--	    pat = plus_constant (Pmode, base, INTVAL (pat));
--	  else
--	    {
--	      if (GET_CODE (pat) == PLUS && CONSTANT_P (XEXP (pat, 1)))
--		{
--		  base = gen_rtx_PLUS (Pmode, base, XEXP (pat, 0));
--		  pat = XEXP (pat, 1);
--		}
--	      pat = gen_rtx_PLUS (Pmode, base, pat);
--	    }
--	}
-+      /* Local symb: use @pcl to access it.  */
-+      /* Fall through.  */
-+    case LABEL_REF:
-+      return arc_unspec_offset (addr, ARC_UNSPEC_GOTOFFPC);
-+    default:
-+      break;
-     }
- 
-- return pat;
-+ return addr;
- }
- 
- /* Output address constant X to FILE, taking PIC into account.  */
-@@ -6282,28 +6191,6 @@ arc_output_pic_addr_const (FILE * file, rtx x, int code)
-     }
- }
- 
--#define SYMBOLIC_CONST(X)	\
--(GET_CODE (X) == SYMBOL_REF						\
-- || GET_CODE (X) == LABEL_REF						\
-- || (GET_CODE (X) == CONST && symbolic_reference_mentioned_p (X)))
--
--/* Emit insns to move operands[1] into operands[0].  */
--
--static void
--prepare_pic_move (rtx *operands, machine_mode)
--{
--  if (GET_CODE (operands[0]) == MEM && SYMBOLIC_CONST (operands[1])
--      && flag_pic)
--    operands[1] = force_reg (Pmode, operands[1]);
--  else
--    {
--      rtx temp = (reload_in_progress ? operands[0]
--		  : gen_reg_rtx (Pmode));
--      operands[1] = arc_legitimize_pic_address (operands[1], temp);
--    }
--}
--
--
- /* The function returning the number of words, at the beginning of an
-    argument, must be put in registers.  The returned value must be
-    zero for arguments that are passed entirely in registers or that
-@@ -9178,54 +9065,37 @@ prepare_move_operands (rtx *operands, machine_mode mode)
- 	}
-     }
- 
--  if (mode == SImode && SYMBOLIC_CONST (operands[1]))
-+  if (GET_CODE (operands[1]) == SYMBOL_REF)
-     {
--      prepare_pic_move (operands, SImode);
--
--      /* Disable any REG_EQUALs associated with the symref
--	 otherwise the optimization pass undoes the work done
--	 here and references the variable directly.  */
-+      enum tls_model model = SYMBOL_REF_TLS_MODEL (operands[1]);
-+      if (MEM_P (operands[0]) && flag_pic)
-+	operands[1] = force_reg (mode, operands[1]);
-+      else if (model)
-+	operands[1] = arc_legitimize_tls_address (operands[1], model);
-     }
- 
-+  operands[1] = arc_legitimize_pic_address (operands[1]);
-+
-+  /* Store instructions are limited, they only accept as address an
-+     immediate, a register or a register plus a small immediate.  */
-   if (MEM_P (operands[0])
--      && !(reload_in_progress || reload_completed))
-+      && !move_dest_operand (operands[0], mode))
-     {
--      operands[1] = force_reg (mode, operands[1]);
--      if (!move_dest_operand (operands[0], mode))
--	{
--	  rtx addr = copy_to_mode_reg (Pmode, XEXP (operands[0], 0));
--	  /* This is like change_address_1 (operands[0], mode, 0, 1) ,
--	     except that we can't use that function because it is static.  */
--	  rtx pat = change_address (operands[0], mode, addr);
--	  MEM_COPY_ATTRIBUTES (pat, operands[0]);
--	  operands[0] = pat;
--	}
--      if (!cse_not_expected)
--	{
--	  rtx pat = XEXP (operands[0], 0);
--
--	  pat = arc_legitimize_address_0 (pat, pat, mode);
--	  if (pat)
--	    {
--	      pat = change_address (operands[0], mode, pat);
--	      MEM_COPY_ATTRIBUTES (pat, operands[0]);
--	      operands[0] = pat;
--	    }
--	}
-+      rtx tmp0 = copy_to_mode_reg (Pmode, XEXP (operands[0], 0));
-+      rtx tmp1 = change_address (operands[0], mode, tmp0);
-+      MEM_COPY_ATTRIBUTES (tmp1, operands[0]);
-+      operands[0] = tmp1;
-     }
- 
--  if (MEM_P (operands[1]) && !cse_not_expected)
--    {
--      rtx pat = XEXP (operands[1], 0);
--
--      pat = arc_legitimize_address_0 (pat, pat, mode);
--      if (pat)
--	{
--	  pat = change_address (operands[1], mode, pat);
--	  MEM_COPY_ATTRIBUTES (pat, operands[1]);
--	  operands[1] = pat;
--	}
--    }
-+  /* Check if it is constant but it is not legitimized.  */
-+  if (CONSTANT_P (operands[1])
-+      && !arc_legitimate_constant_p (mode, operands[1]))
-+    operands[1] = force_reg (mode, XEXP (operands[1], 0));
-+  else if (MEM_P (operands[0])
-+	   && ((CONSTANT_P (operands[1])
-+		&& !satisfies_constraint_Cm3 (operands[1]))
-+	       || MEM_P (operands[1])))
-+    operands[1] = force_reg (mode, operands[1]);
- 
-   return false;
- }
-@@ -9630,11 +9500,10 @@ arc_legitimize_address_0 (rtx x, rtx oldx ATTRIBUTE_UNUSED,
- {
-   rtx addr, inner;
- 
--  if (flag_pic && SYMBOLIC_CONST (x))
--     (x) =  arc_legitimize_pic_address (x, 0);
-   addr = x;
-   if (GET_CODE (addr) == CONST)
-     addr = XEXP (addr, 0);
-+
-   if (GET_CODE (addr) == PLUS
-       && CONST_INT_P (XEXP (addr, 1))
-       && ((GET_CODE (XEXP (addr, 0)) == SYMBOL_REF
-@@ -9665,13 +9534,6 @@ arc_legitimize_address_0 (rtx x, rtx oldx ATTRIBUTE_UNUSED,
- static rtx
- arc_legitimize_address (rtx orig_x, rtx oldx, machine_mode mode)
- {
--  if (GET_CODE (orig_x) == SYMBOL_REF)
--    {
--      enum tls_model model = SYMBOL_REF_TLS_MODEL (orig_x);
--      if (model != 0)
--	return arc_legitimize_tls_address (orig_x, model);
--    }
--
-   rtx new_x = arc_legitimize_address_0 (orig_x, oldx, mode);
- 
-   if (new_x)
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index a7c5c600a99..dc5bcc0bb14 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -682,7 +682,9 @@ archs4x, archs4xd"
-   [(set (match_operand:QI 0 "move_dest_operand" "=Rcq,Rcq#q,    w,Rcq#q,   h, w, w,???w,h, w,Rcq,  S,!*x,  r,r, Ucm,m,???m,  m,Usc")
- 	(match_operand:QI 1 "move_src_operand"  "  cL,   cP,Rcq#q,    P,hCm1,cL, I,?Rac,i,?i,  T,Rcq,Usd,Ucm,m,?Rac,c,?Rac,Cm3,i"))]
-   "register_operand (operands[0], QImode)
--   || register_operand (operands[1], QImode)"
-+   || register_operand (operands[1], QImode)
-+   || (satisfies_constraint_Cm3 (operands[1])
-+       && memory_operand (operands[0], QImode))"
-   "@
-    mov%? %0,%1%&
-    mov%? %0,%1%&
-@@ -724,7 +726,9 @@ archs4x, archs4xd"
-        /* Don't use a LIMM that we could load with a single insn - we loose
- 	  delay-slot filling opportunities.  */
-        && !satisfies_constraint_I (operands[1])
--       && satisfies_constraint_Usc (operands[0]))"
-+       && satisfies_constraint_Usc (operands[0]))
-+   || (satisfies_constraint_Cm3 (operands[1])
-+       && memory_operand (operands[0], HImode))"
-   "@
-    mov%? %0,%1%&
-    mov%? %0,%1%&
--- 
-2.17.2
-
diff --git a/package/gcc/arc-2019.03-release/0002-ARC-Fix-emitting-TLS-symbols.patch b/package/gcc/arc-2019.03-release/0002-ARC-Fix-emitting-TLS-symbols.patch
deleted file mode 100644
index b6e5c0ee83..0000000000
--- a/package/gcc/arc-2019.03-release/0002-ARC-Fix-emitting-TLS-symbols.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From a971faaf8fb48acbf48ca800634fc78a27581517 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Wed, 26 Jun 2019 17:53:51 +0300
-Subject: [PATCH] [ARC] Fix emitting TLS symbols.
-
-When storing a TLS symbol to memory, always use an intermediate register
-to load it. Otherwise compiler generates instruction which couldn't be
-encoded and we see:
------------------------------>8---------------------------
-In file included from gethstent_r.c:34:
-../nss/getXXent_r.c: In function '__gethostent_r':
-../nss/getXXent_r.c:168:1: error: unrecognizable insn:
- }
- ^
-(insn 25 24 26 5 (set (mem:SI (plus:SI (reg/f:SI 149 virtual-outgoing-args)
-                (const_int 16 [0x10])) [0  S4 A32])
-        (plus:SI (reg:SI 25 r25)
-            (reg:SI 174))) "../nss/getXXent_r.c":160 -1
-     (nil))
-during RTL pass: vregs
-../nss/getXXent_r.c:168:1: internal compiler error: in extract_insn, at recog.c:2304
-In file included from getnetent_r.c:34:
-../nss/getXXent_r.c: In function '__getnetent_r':
-../nss/getXXent_r.c:168:1: error: unrecognizable insn:
- }
- ^
-(insn 25 24 26 5 (set (mem:SI (plus:SI (reg/f:SI 149 virtual-outgoing-args)
-                (const_int 16 [0x10])) [0  S4 A32])
-        (plus:SI (reg:SI 25 r25)
-            (reg:SI 174))) "../nss/getXXent_r.c":160 -1
-     (nil))
-during RTL pass: vregs
-../nss/getXXent_r.c:168:1: internal compiler error: in extract_insn, at recog.c:2304
------------------------------>8---------------------------
-
-Note this patch is not yet submitted to the GCC's master and gcc-9-branch but
-will be submitted soon. That said with bump of GCC for ARC this patch won't be
-needed any longer.
-
-Signed-off-by: Claudiu Zissulescu  <claziss@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- gcc/config/arc/arc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 8b544efaa11..989bec703df 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -9068,7 +9068,7 @@ prepare_move_operands (rtx *operands, machine_mode mode)
-   if (GET_CODE (operands[1]) == SYMBOL_REF)
-     {
-       enum tls_model model = SYMBOL_REF_TLS_MODEL (operands[1]);
--      if (MEM_P (operands[0]) && flag_pic)
-+      if (MEM_P (operands[0]))
- 	operands[1] = force_reg (mode, operands[1]);
-       else if (model)
- 	operands[1] = arc_legitimize_tls_address (operands[1], model);
--- 
-2.16.2
-
diff --git a/package/gcc/arc-2019.03-release/0100-uclibc-conf.patch b/package/gcc/arc-2019.09-eng002/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2019.03-release/0100-uclibc-conf.patch
rename to package/gcc/arc-2019.09-eng002/0100-uclibc-conf.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 5be1ec1a1d..756e133820 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,7 +8,7 @@ sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8
 sha512  a12dff52af876aee0fd89a8d09cdc455f35ec46845e154023202392adc164848faf8ee881b59b681b696e27c69fd143a214014db4214db62f9891a1c8365c040  gcc-9.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  c3f63fb601140f92d2dbef96b2dcc025ef754d2f049bfcc3d33e746c7b218b5138f2d8768cd580134858a8d347d234cf3ead276638f6de409f8f07c986e136b6  gcc-arc-2019.03-release.tar.gz
+sha512  7ab8f8ffb79f0b7b69e87aa5692ba29e71478c9e2a4521ba57fcd818e25a20869025c8985a5e09f2f24483aa695881ba9aed4d2df0fc8c8129d791526156db93  gcc-arc-2019.09-eng002.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
 # Locally calculated (fetched from https://github.com/c-sky/gcc)
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 7baa652a60..26dce98e02 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -79,7 +79,7 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2019.03-release-gdb" if BR2_arc
+	default "arc-2019.09-eng002-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "8.1.1"    if BR2_GDB_VERSION_8_1
 	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 7b0f98cc41..69ab252130 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -4,7 +4,7 @@ sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5
 sha512  47ac074d20a09a3fac8f4a41dce0a0cbe6ef702f7dc21ba8b7d650d306128dcae481e9a16bf65e596b3a541dc82ae57c02bcbb786d551b4ef3e2917b9b6f0ae1	gdb-8.3.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  45b4610b92d4c9fb8c3f516c0e86867f34dfd9e47af3af582b1470f2e4bcb04070dd8d69e033dc758e5587f012b9f472572c5075b3331d9d574bdc3edb9b11f9 	gdb-arc-2019.03-release-gdb.tar.gz
+sha512  2625e568ec85652cc223409162b4bd97dd292c5f7a597a57ccb2c6c88a69dfc5fbcf1f0750716ab94c932fa97c8900732f7d2fec940973bc3d6c88ef3f8c6d26 	gdb-arc-2019.09-eng002-gdb.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b	gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
diff --git a/package/glibc/arc-2019.03-release/glibc.hash b/package/glibc/arc-2019.09-eng002/glibc.hash
similarity index 75%
rename from package/glibc/arc-2019.03-release/glibc.hash
rename to package/glibc/arc-2019.09-eng002/glibc.hash
index 2fa706dc86..5a0b7629ea 100644
--- a/package/glibc/arc-2019.03-release/glibc.hash
+++ b/package/glibc/arc-2019.09-eng002/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  d8fd15462475f7e268147903cd7811705707b9bd9b29cd9dfe9a941ba48c7ea2  glibc-arc-2019.03-release.tar.gz
+sha256  7ae8409c6e0649f21a9dccd55b0d84cb34ab69c1e95cb1bf807a0713bcf7a086  glibc-arc-2019.09-eng002.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 9421f9fd81..c6acc43ff5 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2019.03-release
+GLIBC_VERSION =  arc-2019.09-eng002
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_RISCV_32),y)
 GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
-- 
2.16.2
