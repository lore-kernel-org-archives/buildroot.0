From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Oct 2014 20:55:28 +0200
Subject: [Buildroot] [git commit] ARC: gcc - fixes for improperly calculated
	jump/branch offsets
Message-ID: <20141008191510.E99E9B1AAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b94949efb34c706cea8271a05785727904f3d72d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Symptoms usually seen are like that:
--->---
Error: operand out of range (128 is not between -128 and 127)
--->---
where range may differ.

Since compiler tries to use jump/branch instructions with the shortest encoding
of offset it's important to calculate required offset properly.

In case of miscalculation by compiler later assembler throws an error because of
inability to encode requested value.

Fixes are taken from current development branch of GCC for ARC and will be a
part of the next release of ARC tools, so at that point patch should be dropped.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-call-arc_hazard-before-branch-shortening.patch |   96 ++++++++++++++++++++
 ...-length-attribute-for-casesi_load-pattern.patch |   44 +++++++++
 ...-in-delay-slot-and-needs-to-be-predicated.patch |   69 ++++++++++++++
 ...te-casesi_compact_jump-instruction-length.patch |   31 +++++++
 4 files changed, 240 insertions(+), 0 deletions(-)

diff --git a/package/gcc/arc-2014.08/400-call-arc_hazard-before-branch-shortening.patch b/package/gcc/arc-2014.08/400-call-arc_hazard-before-branch-shortening.patch
new file mode 100644
index 0000000..7361e6b
--- /dev/null
+++ b/package/gcc/arc-2014.08/400-call-arc_hazard-before-branch-shortening.patch
@@ -0,0 +1,96 @@
+Call arc_hazard before branch shortening
+
+On attempt to compile busybox (1.22.1) from buildroot master following build
+error happened:
+--->---
+$ arc-linux-gcc -Iinclude -Ilibbb  -include include/autoconf.h -D_FILE_OFFSET_BITS=64 -fstack-protector-all -fno-guess-branch-probability -Os -c -o libbb/xfuncs.o libbb/xfuncs.c
+xfuncs.s: Assembler messages:
+xfuncs.s:444: Error: operand out of range (128 is not between -128 and 127)
+--->---
+
+Fix is taken from current development branch of GCC for ARC and will be a
+part of the next release of ARC tools, so at that point patch should be dropped.
+
+https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/37ba2006be0b8c629d2f8ba6c5ec2819bd0269e5
+
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+---
+
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index 7d64f69..30baae1 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -6520,6 +6520,16 @@ workaround_arc_anomaly (void)
+ {
+   rtx insn, succ0, succ1;
+ 
++  /* For any architecture: call arc_hazard here. */
++  for (insn = get_insns (); insn; insn = NEXT_INSN (insn))
++    {
++      succ0 = next_real_insn(insn);
++      if (arc_hazard (insn, succ0))
++	{
++	  emit_insn_before (gen_nopv (), succ0);
++	}
++    }
++
+   if (!TARGET_ARC700)
+     return;
+ 
+@@ -8710,7 +8720,7 @@ arc_loop_hazard (rtx pred, rtx succ)
+ 	succ_bb = BLOCK_FOR_INSN (NEXT_INSN (label));
+     }
+ 
+-  if (succ_bb && REGNO_REG_SET_P (df_get_live_in (succ_bb), LP_COUNT))
++  if (succ_bb && REGNO_REG_SET_P (df_get_live_out (succ_bb), LP_COUNT))
+     return true;
+ 
+   return false;
+diff --git a/gcc/testsuite/gcc.target/arc/pr9000798619.c b/gcc/testsuite/gcc.target/arc/pr9000798619.c
+new file mode 100644
+index 0000000..b08b32d
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arc/pr9000798619.c
+@@ -0,0 +1,42 @@
++/* { dg-do assemble } */
++/* { dg-options "-Os -fstack-protector-all -fno-guess-branch-probability" } */
++/* The arc_hazard introduces a NOP which is not taken into account by
++   branch shortening step, resulting in an out of range branch
++   offset (ARC700 architecture). */
++
++typedef unsigned char uint8_t;
++extern int *const bb_errno;
++
++char* hex2bin(char *dst, const char *str, int count)
++{
++ (*bb_errno) = 22;
++ while (*str && count) {
++  uint8_t val;
++  uint8_t c = *str++;
++  if (((unsigned char)((c) - '0') <= 9))
++   val = c - '0';
++  else if ((c|0x20) >= 'a' && (c|0x20) <= 'f')
++   val = (c|0x20) - ('a' - 10);
++  else
++   return ((void *)0);
++  val <<= 4;
++  c = *str;
++  if (((unsigned char)((c) - '0') <= 9))
++   val |= c - '0';
++  else if ((c|0x20) >= 'a' && (c|0x20) <= 'f')
++   val |= (c|0x20) - ('a' - 10);
++  else if (c == ':' || c == '\0')
++   val >>= 4;
++  else
++   return ((void *)0);
++
++  *dst++ = val;
++  if (c != '\0')
++   str++;
++  if (*str == ':')
++   str++;
++  count--;
++ }
++ (*bb_errno) = (*str ? 34 : 0);
++ return dst;
++}
diff --git a/package/gcc/arc-2014.08/401-fix-length-attribute-for-casesi_load-pattern.patch b/package/gcc/arc-2014.08/401-fix-length-attribute-for-casesi_load-pattern.patch
new file mode 100644
index 0000000..959c1cc
--- /dev/null
+++ b/package/gcc/arc-2014.08/401-fix-length-attribute-for-casesi_load-pattern.patch
@@ -0,0 +1,44 @@
+Fix length attribute for casesi_load pattern.
+
+Perl compilation was broken:
+--->---
+$ arc-linux-gcc -DPERL_CORE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -matomic -pipe -mdiv-rem -Os   -c -o perl.o perl.c
+perl.s: Assembler messages:
+perl.s:1271: Error: operand out of range (512 is not between -512 and 511)
+--->---
+
+Fix is taken from current development branch of GCC for ARC and will be a
+part of the next release of ARC tools, so at that point patch should be dropped.
+
+https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/664ccd8d5ac8e047faac599309c9c2867af3a736
+
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+---
+
+--- a/gcc/config/arc/arc.md
++++ b/gcc/config/arc/arc.md
+@@ -3834,22 +3834,8 @@
+     }
+ }"
+   [(set_attr "type" "load")
+-   (set_attr_alternative "iscompact"
+-     [(cond
+-	[(ne (symbol_ref "GET_MODE (PATTERN (next_real_insn (operands[3])))")
+-	     (symbol_ref "QImode"))
+-	 (const_string "false")
+-	 (match_test "!ADDR_DIFF_VEC_FLAGS (PATTERN (next_real_insn (operands[3]))).offset_unsigned")
+-	 (const_string "false")]
+-	(const_string "true"))
+-      (const_string "false")
+-      (const_string "false")])
+-   (set_attr_alternative "length"
+-     [(cond
+-	[(eq_attr "iscompact" "false") (const_int 4)]
+-	(const_int 2))
+-      (const_int 4)
+-      (const_int 8)])])
++   (set_attr "iscompact" "false")
++   (set_attr "length" "4,4,8")])
+ 
+ ; Unlike the canonical tablejump, this pattern always uses a jump address,
+ ; even for CASE_VECTOR_PC_RELATIVE.
diff --git a/package/gcc/arc-2014.08/402-fix-length-of-instructions-that-are-in-delay-slot-and-needs-to-be-predicated.patch b/package/gcc/arc-2014.08/402-fix-length-of-instructions-that-are-in-delay-slot-and-needs-to-be-predicated.patch
new file mode 100644
index 0000000..7ceeada
--- /dev/null
+++ b/package/gcc/arc-2014.08/402-fix-length-of-instructions-that-are-in-delay-slot-and-needs-to-be-predicated.patch
@@ -0,0 +1,69 @@
+Fix length of instructions that are in delay slot and needs to be predicated
+
+Following problem was reported:
+--->---
+arceb-linux-gcc -mq-class -g -O2 -c -o main.o main.i
+/tmp/ccudUc8y.s: Assembler messages:
+/tmp/ccudUc8y.s:18820: Error: operand out of range (256 is not between -256 and 255)
+--->---
+
+Fix is taken from current development branch of GCC for ARC and will be a
+part of the next release of ARC tools, so at that point patch should be dropped.
+
+https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/5dfca5504d38293d5264f632c3090ac39c12f72b
+
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+---
+
+diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
+index 908d002..212423b 100644
+--- a/gcc/config/arc/arc-protos.h
++++ b/gcc/config/arc/arc-protos.h
+@@ -126,4 +126,5 @@ extern void arc_expand_compare_and_swap (rtx *);
+ 
+ #ifdef  RTX_CODE
+ extern void arc_expand_atomic_op (enum rtx_code, rtx, rtx, rtx, rtx, rtx);
++extern bool arc_bdr_iscond (rtx);
+ #endif
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index 68e5552..7d3ded3 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -9336,6 +9336,23 @@ arc_write_ext_corereg (rtx insn)
+   return for_each_rtx (&PATTERN (insn), write_ext_corereg_1, 0);
+ }
+ 
++/* Return true if the insn is in a delay slot and needs to be executed
++   conditionally. */
++
++bool
++arc_bdr_iscond (rtx insn)
++{
++  rtx jump = prev_active_insn (insn);
++
++  if (!jump || !JUMP_P(jump))
++    return false;
++
++  if (INSN_ANNULLED_BRANCH_P (jump) && INSN_FROM_TARGET_P (insn))
++    return true;
++
++  return false;
++}
++
+ /* This is like the hook, but returns NULL when it can't / won't generate
+    a legitimate address.  */
+ 
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
+index e001659..88b2e37 100644
+--- a/gcc/config/arc/arc.md
++++ b/gcc/config/arc/arc.md
+@@ -377,7 +377,8 @@
+ 	(cond [(match_test "GET_CODE (PATTERN (insn)) == COND_EXEC")
+ 	       (const_int 12)]
+ 	      (const_int 10))
+-	(match_test "GET_CODE (PATTERN (insn)) == COND_EXEC") (const_int 4)]
++	(match_test "GET_CODE (PATTERN (insn)) == COND_EXEC || arc_bdr_iscond (insn)")
++	(const_int 4)]
+       (const_int 2))
+ 
+     (eq_attr "iscompact" "true_limm")
diff --git a/package/gcc/arc-2014.08/403-update-casesi_compact_jump-instruction-length.patch b/package/gcc/arc-2014.08/403-update-casesi_compact_jump-instruction-length.patch
new file mode 100644
index 0000000..dd188a4
--- /dev/null
+++ b/package/gcc/arc-2014.08/403-update-casesi_compact_jump-instruction-length.patch
@@ -0,0 +1,31 @@
+Update casesi_compact_jump instruction length
+
+Fixes autobuilder issue http://autobuild.buildroot.net/results/bc5/bc5100d6462af4e2805f2bc8d39c87a55d843e2b/
+
+--->---
+$ arc-linux-gcc -c -o wps_attr_parse.o -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -I.../host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/libnl3/ -I.../build/hostapd-2.2/src -I.../build/hostapd-2.2/src/utils wps_attr_parse.c
+wps_attr_parse.s: Assembler messages:
+wps_attr_parse.s:860: Error: operand out of range (512 is not between -512 and 511)
+--->---
+
+Fix is taken from current development branch of GCC for ARC and will be a
+part of the next release of ARC tools, so at that point patch should be dropped.
+
+https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/8e704c43cb50407ec79795f6f7459f09800b9f01
+
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+---
+ 
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
+index 88b2e37..8e18703 100644
+--- a/gcc/config/arc/arc.md
++++ b/gcc/config/arc/arc.md
+@@ -3948,7 +3948,7 @@
+   output_asm_insn (s, xop);
+   return \"add_s %2,%2,pcl\n\tj_s%* [%2]\";
+ }"
+-  [(set_attr "length" "10")
++  [(set_attr "length" "12")
+    (set_attr "type" "jump")
+    (set_attr "iscompact" "true")
+    (set_attr "cond" "nocond")])
