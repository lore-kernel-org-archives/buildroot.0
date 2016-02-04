From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Thu,  4 Feb 2016 15:14:00 +0300
Subject: [Buildroot] [PATCH v3] toolchain: bump ARC toolchain components to
	arc-2015.12
Message-ID: <1454588040-23636-1-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change introduces newer ARC toolchain in Buildroot.

That new arc-2015.12 release doesn't bring any significant changes
but mostly is focused on fixes and minor improvements here and there.
Most noticeable changes are:
 * GCC: Source update to v4.8.5
 * GDB: Updated to upstream 7.10 release.

You may find more info on fixes and improvements in that release at:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.12

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
change v2->v3:
- use diff.renames copy
---
 package/binutils/Config.in.host                    |   2 +-
 .../0001-PR-other-56780.patch                      |   0
 .../600-poison-system-directories.patch            |   0
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 ...900-UPDATE-Fix-handling-complex-PIC-moves.patch | 103 ---------------------
 ...01-UPDATE1-Fix-handling-complex-PIC-moves.patch |  83 -----------------
 ...950-Don-t-allow-mcompact-casesi-for-ARCv2.patch | 100 --------------------
 .../100-libstdcxx-uclibc-c99.patch                 |   0
 .../851-PR-other-56780.patch                       |   0
 package/gcc/gcc.hash                               |   2 +-
 package/gdb/Config.in.host                         |   2 +-
 package/gdb/gdb.hash                               |   2 +-
 14 files changed, 7 insertions(+), 293 deletions(-)
 rename package/binutils/{arc-2015.12-rc1 => arc-2015.12}/0001-PR-other-56780.patch (100%)
 rename package/binutils/{arc-2015.12-rc1 => arc-2015.12}/600-poison-system-directories.patch (100%)
 delete mode 100644 package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch
 delete mode 100644 package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
 delete mode 100644 package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
 rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/100-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/851-PR-other-56780.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 7a04d39..df3c385 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,7 +28,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2015.12-rc1"	if BR2_arc
+	default "arc-2015.12"	if BR2_arc
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_X
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
diff --git a/package/binutils/arc-2015.12-rc1/0001-PR-other-56780.patch b/package/binutils/arc-2015.12/0001-PR-other-56780.patch
similarity index 100%
rename from package/binutils/arc-2015.12-rc1/0001-PR-other-56780.patch
rename to package/binutils/arc-2015.12/0001-PR-other-56780.patch
diff --git a/package/binutils/arc-2015.12-rc1/600-poison-system-directories.patch b/package/binutils/arc-2015.12/600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2015.12-rc1/600-poison-system-directories.patch
rename to package/binutils/arc-2015.12/600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 5d4ddb3..4af5498 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
 sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none   xxx  binutils-arc-2015.12-rc1.tar.gz
+none   xxx  binutils-arc-2015.12.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 7c5955e..5635a09 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2015.12-rc1
+BINUTILS_VERSION = arc-2015.12
 else
 BINUTILS_VERSION = 2.24
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4184ac7..cad6896 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -114,7 +114,7 @@ config BR2_GCC_VERSION
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.3.0"     if BR2_GCC_VERSION_5_X
-	default "arc-2015.12-rc1" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2015.12" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch b/package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch
deleted file mode 100644
index 48228dc..0000000
--- a/package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From b55922d45fd16f5e8fc7c3885da42b2b9b37754d Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Mon, 18 Jan 2016 16:43:18 +0100
-Subject: [PATCH] UPDATE: Fix handling complex PIC moves.
-
-fwprop is putting in the REG_EQUIV notes which are involving the
-constant pic unspecs.  Then, loop may use those notes for
-optimizations rezulting in complex patterns that are not supported by
-the current implementation. The following piece of code tries to
-convert the complex instruction in simpler ones.
-
-The fix is done in development tree: [arc-4.8-dev b55922d] 
-and will be a part of the next release of ARC GNU tools.
-Once that new release happens this patch must be removed.
-
-
-gcc/
-2016-01-18  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.c (arc_legitimize_pic_address): Handle MINUS
-	operations when doing PIC moves. Make this function static.
-	(arc_legitimate_pc_offset_p): Use
-	arc_raw_symbolic_reference_mentioned_p.
-	* config/arc/arc-protos.h (arc_legitimize_pic_address): Remove.
-
- gcc/config/arc/arc-protos.h |  1 -
- gcc/config/arc/arc.c        | 33 +++++++++++++++++++--------------
- 2 files changed, 19 insertions(+), 15 deletions(-)
-
- 	* config/arc/arc.c (arc_legitimize_pic_address): Handle complex
-diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
-index 464e0ab..5986e06 100644
---- a/gcc/config/arc/arc-protos.h
-+++ b/gcc/config/arc/arc-protos.h
-@@ -53,7 +53,6 @@ extern unsigned int arc_compute_frame_size ();
- extern bool arc_ccfsm_branch_deleted_p (void);
- extern void arc_ccfsm_record_branch_deleted (void);
- 
--extern rtx arc_legitimize_pic_address (rtx, rtx);
- void arc_asm_output_aligned_decl_local (FILE *, tree, const char *,
- 					unsigned HOST_WIDE_INT,
- 					unsigned HOST_WIDE_INT,
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index a89c8ee..f7cae9f 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -5243,19 +5243,7 @@ arc_legitimate_pc_offset_p (rtx addr)
-   if (GET_CODE (addr) != CONST)
-     return false;
-   addr = XEXP (addr, 0);
--  if (GET_CODE (addr) == PLUS)
--    {
--      if (GET_CODE (XEXP (addr, 1)) != CONST_INT)
--	return false;
--      addr = XEXP (addr, 0);
--    }
--  return (GET_CODE (addr) == UNSPEC
--	  && XVECLEN (addr, 0) == 1
--	  && (XINT (addr, 1) == ARC_UNSPEC_GOT
--	      || XINT (addr, 1) == ARC_UNSPEC_GOTOFFPC
--	      || XINT (addr, 1) == UNSPEC_TLS_GD
--	      || XINT (addr, 1) == UNSPEC_TLS_IE)
--	  && GET_CODE (XVECEXP (addr, 0, 0)) == SYMBOL_REF);
-+  return flag_pic && !arc_raw_symbolic_reference_mentioned_p (addr, false);
- }
- 
- /* Return true if ADDR is a valid pic address.
-@@ -5522,7 +5510,7 @@ arc_legitimize_tls_address (rtx addr, enum tls_model model)
-    The return value is the legitimated address.
-    If OLDX is non-zero, it is the target to assign the address to first.  */
- 
--rtx
-+static rtx
- arc_legitimize_pic_address (rtx orig, rtx oldx)
- {
-   rtx addr = orig;
-@@ -5569,6 +5557,23 @@ arc_legitimize_pic_address (rtx orig, rtx oldx)
- 	      /* Check that the unspec is one of the ones we generate?  */
- 	      return orig;
- 	    }
-+	  else if (GET_CODE (addr) == MINUS)
-+	    {
-+	      /* The same story with fwprop.  */
-+	      rtx op0 = XEXP (addr, 0);
-+	      rtx op1 = XEXP (addr, 1);
-+	      gcc_assert (oldx);
-+	      gcc_assert (GET_CODE (op1) == UNSPEC);
-+
-+	      emit_move_insn (oldx,
-+			      gen_rtx_CONST (SImode,
-+					     arc_legitimize_pic_address (op1,
-+									 NULL_RTX)));
-+	      emit_insn (gen_rtx_SET (VOIDmode, oldx,
-+				      gen_rtx_MINUS (SImode, op0, oldx)));
-+	      return oldx;
-+
-+	    }
- 	  else if (GET_CODE (addr) != PLUS)
- 	    {
- 	      /* fwprop is putting in the REG_EQUIV notes which are
--- 
-2.5.0
-
diff --git a/package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch b/package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
deleted file mode 100644
index 28cb7c1..0000000
--- a/package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From f00b0f17d6889d811468c2c77508fbea8bfc377d Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Tue, 19 Jan 2016 14:40:16 +0100
-Subject: [PATCH] UPDATE1: Fix handling complex PIC moves.
-
-The arc_legitimate_pc_offset_p condition is too lax. Updated it.
-
-The fix is done in development tree: [arc-4.8-dev f00b0f1] 
-and will be a part of the next release of ARC GNU tools.
-Once that new release happens this patch must be removed.
-
-gcc/
-2016-01-18  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.c (arc_needs_pcl_p ): New function
-	(arc_legitimate_pc_offset_p): Use arc_needs_pcl_p.
----
- gcc/config/arc/arc.c | 42 ++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 40 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index f7cae9f..18d88a3 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -5234,6 +5234,45 @@ arc_rtx_costs (rtx x, int code, int outer_code, int opno ATTRIBUTE_UNUSED,
-     }
- }
- 
-+/* Helper used by arc_legitimate_pc_offset_p.  */
-+
-+static bool
-+arc_needs_pcl_p (rtx x)
-+{
-+  register const char *fmt;
-+  register int i, j;
-+
-+  if ((GET_CODE (x) == UNSPEC)
-+      && (XVECLEN (x, 0) == 1)
-+      && (GET_CODE (XVECEXP (x, 0, 0)) == SYMBOL_REF))
-+    switch (XINT (x, 1))
-+      {
-+      case ARC_UNSPEC_GOT:
-+      case ARC_UNSPEC_GOTOFFPC:
-+      case UNSPEC_TLS_GD:
-+      case UNSPEC_TLS_IE:
-+	return true;
-+      default:
-+	break;
-+      }
-+
-+  fmt = GET_RTX_FORMAT (GET_CODE (x));
-+  for (i = GET_RTX_LENGTH (GET_CODE (x)) - 1; i >= 0; i--)
-+    {
-+      if (fmt[i] == 'e')
-+	{
-+	  if (arc_needs_pcl_p (XEXP (x, i)))
-+	    return true;
-+	}
-+      else if (fmt[i] == 'E')
-+	for (j = XVECLEN (x, i) - 1; j >= 0; j--)
-+	  if (arc_needs_pcl_p (XVECEXP (x, i, j)))
-+	    return true;
-+    }
-+
-+  return false;
-+}
-+
- /* Return true if ADDR is an address that needs to be expressed as an
-    explicit sum of pcl + offset.  */
- 
-@@ -5242,8 +5281,7 @@ arc_legitimate_pc_offset_p (rtx addr)
- {
-   if (GET_CODE (addr) != CONST)
-     return false;
--  addr = XEXP (addr, 0);
--  return flag_pic && !arc_raw_symbolic_reference_mentioned_p (addr, false);
-+  return arc_needs_pcl_p (addr);
- }
- 
- /* Return true if ADDR is a valid pic address.
--- 
-2.5.0
-
diff --git a/package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch b/package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
deleted file mode 100644
index dc03a02..0000000
--- a/package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 09463827001a7b8094f4b9460514370a1876d908 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Wed, 20 Jan 2016 16:32:40 +0100
-Subject: [PATCH] Don't allow mcompact-casesi for ARCv2
-
-The compact casesi is not working for arcv2 processors family as it
-makes use of the add_s rx,rx,pcl instruction which is only valid for
-arc6xx and arc700 processors. Also not having this instruction makes
-no much sens to change the compact-casesi pattern to use normal add
-instructions as it nullifies the advantage of short instruction use.
-The default casesi pattern betters suits the arcv2 architecture.
-
-The fix is done in development tree: [arc-4.8-dev 0946382] 
-and will be a part of the next release of ARC GNU tools.
-Once that new release happens this patch must be removed.
-
-gcc/
-2016-01-20  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* common/config/arc/arc-common.c (arc_option_optimization_table):
-	Remove mcompact-casesi option.
-	* config/arc/arc.c (arc_override_options): Use compact-casesi only
-	for arcv1.
-	* config/arc/arc.md (casesi_load): Use short instructions.
----
- gcc/common/config/arc/arc-common.c |  1 -
- gcc/config/arc/arc.c               |  9 +++++----
- gcc/config/arc/arc.md              | 10 ++++++++--
- 3 files changed, 13 insertions(+), 7 deletions(-)
- 
- 	* config/arc/arc.c (arc_legitimize_pic_address): Handle MINUS
-diff --git a/gcc/common/config/arc/arc-common.c b/gcc/common/config/arc/arc-common.c
-index e2e36fa..310bc80 100644
---- a/gcc/common/config/arc/arc-common.c
-+++ b/gcc/common/config/arc/arc-common.c
-@@ -58,7 +58,6 @@ static const struct default_options arc_option_optimization_table[] =
-     { OPT_LEVELS_ALL, OPT_mbbit_peephole, NULL, 1 },
-     { OPT_LEVELS_SIZE, OPT_mq_class, NULL, 1 },
-     { OPT_LEVELS_SIZE, OPT_mcase_vector_pcrel, NULL, 1 },
--    { OPT_LEVELS_SIZE, OPT_mcompact_casesi, NULL, 1 },
-     { OPT_LEVELS_NONE, 0, NULL, 0 }
-   };
- 
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 18d88a3..f828398 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -1151,6 +1151,11 @@ arc_override_options (void)
-   if (arc_size_opt_level == 3)
-     optimize_size = 1;
- 
-+  if (TARGET_V2)
-+    TARGET_COMPACT_CASESI = 0;
-+  else if (optimize_size == 1)
-+    TARGET_COMPACT_CASESI = 1;
-+
-   if (flag_pic)
-     target_flags |= MASK_NO_SDATA_SET;
- 
-@@ -1163,10 +1168,6 @@ arc_override_options (void)
-   if (!TARGET_Q_CLASS)
-     TARGET_COMPACT_CASESI = 0;
- 
--  /* For the time being don't support COMPACT_CASESI for ARCv2. */
--  if (TARGET_V2)
--    TARGET_COMPACT_CASESI = 0;
--
-   if (TARGET_COMPACT_CASESI)
-     TARGET_CASE_VECTOR_PC_RELATIVE = 1;
- 
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index bc4ac38..ba7c8bc 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -3837,14 +3837,20 @@
-   switch (GET_MODE (diff_vec))
-     {
-     case SImode:
--      return \"ld.as %0,[%1,%2]%&\";
-+      if ((which_alternative == 0) && TARGET_CODE_DENSITY)
-+       return \"ld_s.as %0,[%1,%2]%&\";
-+      else
-+       return \"ld.as %0,[%1,%2]%&\";
-     case HImode:
-       if (ADDR_DIFF_VEC_FLAGS (diff_vec).offset_unsigned)
- 	return \"ldw.as %0,[%1,%2]\";
-       return \"ldw.x.as %0,[%1,%2]\";
-     case QImode:
-       if (ADDR_DIFF_VEC_FLAGS (diff_vec).offset_unsigned)
--	return \"ldb%? %0,[%1,%2]%&\";
-+        if (which_alternative == 0)
-+	 return \"ldb_s %0,[%1,%2]%&\";
-+        else
-+	 return \"ldb %0,[%1,%2]%&\";
-       return \"ldb.x %0,[%1,%2]\";
-     default:
-       gcc_unreachable ();
--- 
-2.5.0
-
diff --git a/package/gcc/arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/arc-2015.12-rc1/851-PR-other-56780.patch b/package/gcc/arc-2015.12/851-PR-other-56780.patch
similarity index 100%
rename from package/gcc/arc-2015.12-rc1/851-PR-other-56780.patch
rename to package/gcc/arc-2015.12/851-PR-other-56780.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 064a727..0ef4e65 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -9,4 +9,4 @@ sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a31
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/sha512.sum
 sha512  d619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab500a8744bffd19ea51892ce09fc37f862f2cfcb42de0f0f8cd8f8da37a  gcc-5.3.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none  xxx  gcc-arc-2015.12-rc1.tar.gz
+none  xxx  gcc-arc-2015.12.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index d5f08b2..6807694 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -52,7 +52,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2015.12-rc1-gdb" if BR2_arc
+	default "arc-2015.12-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 64bc501..3abdcd0 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -4,5 +4,5 @@ sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 # No hash for the ARC & microblaze variants, comes from the github-helper:
-none	xxx	gdb-arc-2015.12-rc1-gdb.tar.gz
+none	xxx	gdb-arc-2015.12-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-- 
2.5.0
