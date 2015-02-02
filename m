From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:27:55 +0100
Subject: [Buildroot] [git commit] ARC: bump tools to 2014.12 release
Message-ID: <20150202202802.9EC2D7FD4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41e1cb18d105589f38f943b56d6681dec469237a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now when new shiny tools are released by Synopsys we're ready for
version update in Buildroot again.

More details about arc-2014.12 release are available here:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2014.12

Following patches were removed from GCC since they are a part of release
now:
 * 200-size_type_unsigned_int.patch
 * 300-ptrdiff_type_int.patch
 * 400-call-arc_hazard-before-branch-shortening.patch
 * 401-fix-length-attribute-for-casesi_load-pattern.patch
 * 402-fix-length-of-instructions-that-are-in-delay-slot-and-needs-to-be-predicated.patch
 * 403-update-casesi_compact_jump-instruction-length.patch

But since arc-2014.12 tools are still based on GCC 4.8 following patches
ar still relevant so moving to the new folder to match ARC gcc bump.
 * 100-libstdcxx-uclibc-c99.patch
 * 910-gcc-poison-system-directories.patch

Binutils are still based on 2.23 so following patch still makes sense:
 * 600-poison-system-directories.patch

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                    |    2 +-
 .../600-poison-system-directories.patch            |    0
 package/gcc/Config.in.host                         |    2 +-
 .../arc-2014.08/200-size_type_unsigned_int.patch   |   24 -----
 package/gcc/arc-2014.08/300-ptrdiff_type_int.patch |   26 ------
 ...-call-arc_hazard-before-branch-shortening.patch |   96 --------------------
 ...-length-attribute-for-casesi_load-pattern.patch |   44 ---------
 ...-in-delay-slot-and-needs-to-be-predicated.patch |   69 --------------
 ...te-casesi_compact_jump-instruction-length.patch |   31 -------
 .../100-libstdcxx-uclibc-c99.patch                 |    0
 .../910-gcc-poison-system-directories.patch        |    0
 package/gdb/Config.in.host                         |    2 +-
 package/uclibc/Config.in                           |    2 +-
 13 files changed, 4 insertions(+), 294 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 6dac3c0..0739467 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -34,7 +34,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "arc-2014.08"	if BR2_arc
+	default "arc-2014.12"	if BR2_arc
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24
diff --git a/package/binutils/arc-2014.08/600-poison-system-directories.patch b/package/binutils/arc-2014.12/600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2014.08/600-poison-system-directories.patch
rename to package/binutils/arc-2014.12/600-poison-system-directories.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0750807..24004c4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -97,7 +97,7 @@ config BR2_GCC_VERSION
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.4"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.2"     if BR2_GCC_VERSION_4_9_X
-	default "arc-2014.08" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2014.12" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch b/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch
deleted file mode 100644
index a6a0419..0000000
--- a/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fixes SIZE_TYPE to be "unsigned int" instead of "long unsigned int".
-
-This makes size_t to be "unsigned" ssize_t which makes happy compiler on data
-type checks.
-
-Fix is taken from current development branch of GCC for ARC and will be a
-part of the next release of ARC tools, so at that point patch should be dropped.
-
-https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/249f040299402647525c3f15b79d319fa7acddd3
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
-
---- a/gcc/config/arc/arc.h
-+++ b/gcc/config/arc/arc.h
-@@ -487,7 +487,7 @@ if (GET_MODE_CLASS (MODE) == MODE_INT		\
- /* Define this as 1 if `char' should by default be signed; else as 0.  */
- #define DEFAULT_SIGNED_CHAR 0
- 
--#define SIZE_TYPE "long unsigned int"
-+#define SIZE_TYPE "unsigned int"
- #define PTRDIFF_TYPE "long int"
- #define WCHAR_TYPE "int"
- #define WCHAR_TYPE_SIZE 32
diff --git a/package/gcc/arc-2014.08/300-ptrdiff_type_int.patch b/package/gcc/arc-2014.08/300-ptrdiff_type_int.patch
deleted file mode 100644
index 6ee765b..0000000
--- a/package/gcc/arc-2014.08/300-ptrdiff_type_int.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Redefine PTRDIFF_TYPE
-
-Change of SIZE_TYPE from "long unsigned int" to "unsigned int" introduced
-regression due to existing PTRDIFF_TYPE.
-
-Now to fix regression convert PTRDIFF_TYPE to simple "int".
-
-Fix is taken from current development branch of GCC for ARC and will be a
-part of the next release of ARC tools, so at that point patch should be dropped.
-
-https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/846e92167aa4f486259c9ff44bb4e6cce6097fa4
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
----
-
---- a/gcc/config/arc/arc.h
-+++ b/gcc/config/arc/arc.h
-@@ -488,7 +488,7 @@ if (GET_MODE_CLASS (MODE) == MODE_INT		\
- #define DEFAULT_SIGNED_CHAR 0
- 
- #define SIZE_TYPE "unsigned int"
--#define PTRDIFF_TYPE "long int"
-+#define PTRDIFF_TYPE "int"
- #define WCHAR_TYPE "int"
- #define WCHAR_TYPE_SIZE 32
- 
diff --git a/package/gcc/arc-2014.08/400-call-arc_hazard-before-branch-shortening.patch b/package/gcc/arc-2014.08/400-call-arc_hazard-before-branch-shortening.patch
deleted file mode 100644
index 7361e6b..0000000
--- a/package/gcc/arc-2014.08/400-call-arc_hazard-before-branch-shortening.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-Call arc_hazard before branch shortening
-
-On attempt to compile busybox (1.22.1) from buildroot master following build
-error happened:
---->---
-$ arc-linux-gcc -Iinclude -Ilibbb  -include include/autoconf.h -D_FILE_OFFSET_BITS=64 -fstack-protector-all -fno-guess-branch-probability -Os -c -o libbb/xfuncs.o libbb/xfuncs.c
-xfuncs.s: Assembler messages:
-xfuncs.s:444: Error: operand out of range (128 is not between -128 and 127)
---->---
-
-Fix is taken from current development branch of GCC for ARC and will be a
-part of the next release of ARC tools, so at that point patch should be dropped.
-
-https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/37ba2006be0b8c629d2f8ba6c5ec2819bd0269e5
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
----
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 7d64f69..30baae1 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -6520,6 +6520,16 @@ workaround_arc_anomaly (void)
- {
-   rtx insn, succ0, succ1;
- 
-+  /* For any architecture: call arc_hazard here. */
-+  for (insn = get_insns (); insn; insn = NEXT_INSN (insn))
-+    {
-+      succ0 = next_real_insn(insn);
-+      if (arc_hazard (insn, succ0))
-+	{
-+	  emit_insn_before (gen_nopv (), succ0);
-+	}
-+    }
-+
-   if (!TARGET_ARC700)
-     return;
- 
-@@ -8710,7 +8720,7 @@ arc_loop_hazard (rtx pred, rtx succ)
- 	succ_bb = BLOCK_FOR_INSN (NEXT_INSN (label));
-     }
- 
--  if (succ_bb && REGNO_REG_SET_P (df_get_live_in (succ_bb), LP_COUNT))
-+  if (succ_bb && REGNO_REG_SET_P (df_get_live_out (succ_bb), LP_COUNT))
-     return true;
- 
-   return false;
-diff --git a/gcc/testsuite/gcc.target/arc/pr9000798619.c b/gcc/testsuite/gcc.target/arc/pr9000798619.c
-new file mode 100644
-index 0000000..b08b32d
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/arc/pr9000798619.c
-@@ -0,0 +1,42 @@
-+/* { dg-do assemble } */
-+/* { dg-options "-Os -fstack-protector-all -fno-guess-branch-probability" } */
-+/* The arc_hazard introduces a NOP which is not taken into account by
-+   branch shortening step, resulting in an out of range branch
-+   offset (ARC700 architecture). */
-+
-+typedef unsigned char uint8_t;
-+extern int *const bb_errno;
-+
-+char* hex2bin(char *dst, const char *str, int count)
-+{
-+ (*bb_errno) = 22;
-+ while (*str && count) {
-+  uint8_t val;
-+  uint8_t c = *str++;
-+  if (((unsigned char)((c) - '0') <= 9))
-+   val = c - '0';
-+  else if ((c|0x20) >= 'a' && (c|0x20) <= 'f')
-+   val = (c|0x20) - ('a' - 10);
-+  else
-+   return ((void *)0);
-+  val <<= 4;
-+  c = *str;
-+  if (((unsigned char)((c) - '0') <= 9))
-+   val |= c - '0';
-+  else if ((c|0x20) >= 'a' && (c|0x20) <= 'f')
-+   val |= (c|0x20) - ('a' - 10);
-+  else if (c == ':' || c == '\0')
-+   val >>= 4;
-+  else
-+   return ((void *)0);
-+
-+  *dst++ = val;
-+  if (c != '\0')
-+   str++;
-+  if (*str == ':')
-+   str++;
-+  count--;
-+ }
-+ (*bb_errno) = (*str ? 34 : 0);
-+ return dst;
-+}
diff --git a/package/gcc/arc-2014.08/401-fix-length-attribute-for-casesi_load-pattern.patch b/package/gcc/arc-2014.08/401-fix-length-attribute-for-casesi_load-pattern.patch
deleted file mode 100644
index 959c1cc..0000000
--- a/package/gcc/arc-2014.08/401-fix-length-attribute-for-casesi_load-pattern.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Fix length attribute for casesi_load pattern.
-
-Perl compilation was broken:
---->---
-$ arc-linux-gcc -DPERL_CORE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -matomic -pipe -mdiv-rem -Os   -c -o perl.o perl.c
-perl.s: Assembler messages:
-perl.s:1271: Error: operand out of range (512 is not between -512 and 511)
---->---
-
-Fix is taken from current development branch of GCC for ARC and will be a
-part of the next release of ARC tools, so at that point patch should be dropped.
-
-https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/664ccd8d5ac8e047faac599309c9c2867af3a736
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
----
-
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -3834,22 +3834,8 @@
-     }
- }"
-   [(set_attr "type" "load")
--   (set_attr_alternative "iscompact"
--     [(cond
--	[(ne (symbol_ref "GET_MODE (PATTERN (next_real_insn (operands[3])))")
--	     (symbol_ref "QImode"))
--	 (const_string "false")
--	 (match_test "!ADDR_DIFF_VEC_FLAGS (PATTERN (next_real_insn (operands[3]))).offset_unsigned")
--	 (const_string "false")]
--	(const_string "true"))
--      (const_string "false")
--      (const_string "false")])
--   (set_attr_alternative "length"
--     [(cond
--	[(eq_attr "iscompact" "false") (const_int 4)]
--	(const_int 2))
--      (const_int 4)
--      (const_int 8)])])
-+   (set_attr "iscompact" "false")
-+   (set_attr "length" "4,4,8")])
- 
- ; Unlike the canonical tablejump, this pattern always uses a jump address,
- ; even for CASE_VECTOR_PC_RELATIVE.
diff --git a/package/gcc/arc-2014.08/402-fix-length-of-instructions-that-are-in-delay-slot-and-needs-to-be-predicated.patch b/package/gcc/arc-2014.08/402-fix-length-of-instructions-that-are-in-delay-slot-and-needs-to-be-predicated.patch
deleted file mode 100644
index 7ceeada..0000000
--- a/package/gcc/arc-2014.08/402-fix-length-of-instructions-that-are-in-delay-slot-and-needs-to-be-predicated.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Fix length of instructions that are in delay slot and needs to be predicated
-
-Following problem was reported:
---->---
-arceb-linux-gcc -mq-class -g -O2 -c -o main.o main.i
-/tmp/ccudUc8y.s: Assembler messages:
-/tmp/ccudUc8y.s:18820: Error: operand out of range (256 is not between -256 and 255)
---->---
-
-Fix is taken from current development branch of GCC for ARC and will be a
-part of the next release of ARC tools, so at that point patch should be dropped.
-
-https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/5dfca5504d38293d5264f632c3090ac39c12f72b
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
----
-
-diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
-index 908d002..212423b 100644
---- a/gcc/config/arc/arc-protos.h
-+++ b/gcc/config/arc/arc-protos.h
-@@ -126,4 +126,5 @@ extern void arc_expand_compare_and_swap (rtx *);
- 
- #ifdef  RTX_CODE
- extern void arc_expand_atomic_op (enum rtx_code, rtx, rtx, rtx, rtx, rtx);
-+extern bool arc_bdr_iscond (rtx);
- #endif
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 68e5552..7d3ded3 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -9336,6 +9336,23 @@ arc_write_ext_corereg (rtx insn)
-   return for_each_rtx (&PATTERN (insn), write_ext_corereg_1, 0);
- }
- 
-+/* Return true if the insn is in a delay slot and needs to be executed
-+   conditionally. */
-+
-+bool
-+arc_bdr_iscond (rtx insn)
-+{
-+  rtx jump = prev_active_insn (insn);
-+
-+  if (!jump || !JUMP_P(jump))
-+    return false;
-+
-+  if (INSN_ANNULLED_BRANCH_P (jump) && INSN_FROM_TARGET_P (insn))
-+    return true;
-+
-+  return false;
-+}
-+
- /* This is like the hook, but returns NULL when it can't / won't generate
-    a legitimate address.  */
- 
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index e001659..88b2e37 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -377,7 +377,8 @@
- 	(cond [(match_test "GET_CODE (PATTERN (insn)) == COND_EXEC")
- 	       (const_int 12)]
- 	      (const_int 10))
--	(match_test "GET_CODE (PATTERN (insn)) == COND_EXEC") (const_int 4)]
-+	(match_test "GET_CODE (PATTERN (insn)) == COND_EXEC || arc_bdr_iscond (insn)")
-+	(const_int 4)]
-       (const_int 2))
- 
-     (eq_attr "iscompact" "true_limm")
diff --git a/package/gcc/arc-2014.08/403-update-casesi_compact_jump-instruction-length.patch b/package/gcc/arc-2014.08/403-update-casesi_compact_jump-instruction-length.patch
deleted file mode 100644
index dd188a4..0000000
--- a/package/gcc/arc-2014.08/403-update-casesi_compact_jump-instruction-length.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Update casesi_compact_jump instruction length
-
-Fixes autobuilder issue http://autobuild.buildroot.net/results/bc5/bc5100d6462af4e2805f2bc8d39c87a55d843e2b/
-
---->---
-$ arc-linux-gcc -c -o wps_attr_parse.o -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -I.../host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/libnl3/ -I.../build/hostapd-2.2/src -I.../build/hostapd-2.2/src/utils wps_attr_parse.c
-wps_attr_parse.s: Assembler messages:
-wps_attr_parse.s:860: Error: operand out of range (512 is not between -512 and 511)
---->---
-
-Fix is taken from current development branch of GCC for ARC and will be a
-part of the next release of ARC tools, so at that point patch should be dropped.
-
-https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/8e704c43cb50407ec79795f6f7459f09800b9f01
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
----
- 
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index 88b2e37..8e18703 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -3948,7 +3948,7 @@
-   output_asm_insn (s, xop);
-   return \"add_s %2,%2,pcl\n\tj_s%* [%2]\";
- }"
--  [(set_attr "length" "10")
-+  [(set_attr "length" "12")
-    (set_attr "type" "jump")
-    (set_attr "iscompact" "true")
-    (set_attr "cond" "nocond")])
diff --git a/package/gcc/arc-2014.08/100-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2014.12/100-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/arc-2014.08/100-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2014.12/100-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/arc-2014.08/910-gcc-poison-system-directories.patch b/package/gcc/arc-2014.12/910-gcc-poison-system-directories.patch
similarity index 100%
rename from package/gcc/arc-2014.08/910-gcc-poison-system-directories.patch
rename to package/gcc/arc-2014.12/910-gcc-poison-system-directories.patch
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 7f9df3a..c8d6a94 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -52,7 +52,7 @@ config BR2_GDB_VERSION
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 || \
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
-	default "arc-2014.08-gdb" if BR2_arc
+	default "arc-2014.12-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7 || !BR2_PACKAGE_HOST_GDB
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 290f19b..020c47c 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -42,7 +42,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
-	default "arc-2014.08" if BR2_arc
+	default "arc-2014.12" if BR2_arc
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
