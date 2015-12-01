From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 1 Dec 2015 14:58:34 +0000
Subject: [Buildroot] [PATCH] valgrind: update
	0003-mips-replace-addi-with-addiu.patch
Message-ID: <1448981914-46671-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch has been updated in the upstream bug report, so let's update
it in Buildroot as well. It will fix the build issue for mips64r6:

m_dispatch/dispatch-mips64-linux.S:199: Error: opcode not supported on
this processor: mips64r6 (mips64r6) `daddi $13,$13,8'

Fixes:

  http://autobuild.buildroot.net/results/6ca/6ca3a31d1542fbbb44238e296565b40d6afcd5fa/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../0003-mips-replace-addi-with-addiu.patch        | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/package/valgrind/0003-mips-replace-addi-with-addiu.patch b/package/valgrind/0003-mips-replace-addi-with-addiu.patch
index 9168dce..624f6fa 100644
--- a/package/valgrind/0003-mips-replace-addi-with-addiu.patch
+++ b/package/valgrind/0003-mips-replace-addi-with-addiu.patch
@@ -21,6 +21,19 @@ Index: valgrind/coregrind/m_dispatch/dispatch-mips32-linux.S
          lw $25, 0($13) /* little-endian, so comparing 1st 32bit word */
          nop
  
+Index: valgrind/coregrind/m_dispatch/dispatch-mips64-linux.S
+===================================================================
+--- valgrind/coregrind/m_dispatch/dispatch-mips64-linux.S	(revision 15740)
++++ valgrind/coregrind/m_dispatch/dispatch-mips64-linux.S	(working copy)
+@@ -196,7 +196,7 @@
+         daddu $13, $13, $14
+
+         ld $12, 0($13) /* t3 = VG_(tt_fast)[hash] :: ULong* */
+-        daddi $13, $13, 8
++        daddiu $13, $13, 8
+         ld $25, 0($13) /* little-endian, so comparing 1st 32bit word */
+         nop
+
 Index: valgrind/coregrind/m_libcsetjmp.c
 ===================================================================
 --- valgrind/coregrind/m_libcsetjmp.c	(revision 15740)
@@ -34,6 +47,19 @@ Index: valgrind/coregrind/m_libcsetjmp.c
  "1:                             \n\t"
  "   move $v0, $a1               \n\t"  /* Return value of second argument. */
  "   j    $ra                    \n\t"
+Index: valgrind/coregrind/m_syswrap/syswrap-mips64-linux.c
+===================================================================
+--- valgrind/coregrind/m_syswrap/syswrap-mips64-linux.c	(revision 15740)
++++ valgrind/coregrind/m_syswrap/syswrap-mips64-linux.c	(working copy)
+@@ -173,7 +173,7 @@
+ "   ld $30, 8($29)\n"
+ "   ld $28, 16($29)\n"
+ "   jr $31\n"
+-"   daddi $29,$29, 32\n"
++"   daddiu $29,$29, 32\n"
+ ".previous\n"
+ );
+
 Index: valgrind/coregrind/m_trampoline.S
 ===================================================================
 --- valgrind/coregrind/m_trampoline.S	(revision 15740)
@@ -49,3 +75,63 @@ Index: valgrind/coregrind/m_trampoline.S
     strlen_cond:
        lbu $t0, ($a0)
        bne $t0, $zero, strlen_loop
+Index: valgrind/helgrind/tests/tc08_hbl2.c
+===================================================================
+--- valgrind/helgrind/tests/tc08_hbl2.c	(revision 15740)
++++ valgrind/helgrind/tests/tc08_hbl2.c	(working copy)
+@@ -125,11 +125,11 @@
+ #  define INC(_lval,_lqual)                         \
+      __asm__ __volatile__ (                         \
+       "L1xyzzy1" _lqual":\n"                        \
+-      "        move $t0, %0\n"                      \
+-      "        ll   $t1, 0($t0)\n"                  \
+-      "        addi $t1, $t1, 1\n"                  \
+-      "        sc   $t1, 0($t0)\n"                  \
+-      "        beqz $t1, L1xyzzy1" _lqual           \
++      "        move  $t0, %0\n"                     \
++      "        ll    $t1, 0($t0)\n"                 \
++      "        addiu $t1, $t1, 1\n"                 \
++      "        sc    $t1, 0($t0)\n"                 \
++      "        beqz  $t1, L1xyzzy1" _lqual          \
+       : /*out*/ : /*in*/ "r"(&(_lval))              \
+       : /*trash*/ "t0", "t1", "memory"              \
+         )
+Index: valgrind/VEX/priv/guest_mips_toIR.c
+===================================================================
+--- valgrind/VEX/priv/guest_mips_toIR.c	(revision 3206)
++++ valgrind/VEX/priv/guest_mips_toIR.c	(working copy)
+@@ -16794,6 +16794,7 @@
+                                      mkU64(0x0) : mkU32(0x0)))), imm);
+       break;
+
++#if defined(__mips__) && ((defined(__mips_isa_rev) && __mips_isa_rev < 6))
+    case 0x08: {  /* ADDI */
+       DIP("addi r%u, r%u, %u", rt, rs, imm);
+       IRTemp tmpRs32 = newTemp(Ity_I32);
+@@ -16831,6 +16832,8 @@
+       putIReg(rt,  mkWidenFrom32(ty, mkexpr(t0), True));
+       break;
+    }
++#endif
++
+    case 0x09:  /* ADDIU */
+       DIP("addiu r%u, r%u, %u", rt, rs, imm);
+       if (mode64) {
+@@ -16888,7 +16891,8 @@
+                                             mkU32(extend_s_16to32(imm)))));
+       break;
+
+-   case 0x18: {  /* Doubleword Add Immidiate - DADD; MIPS64 */
++#if defined(__mips__) && ((defined(__mips_isa_rev) && __mips_isa_rev < 6))
++   case 0x18: {  /* Doubleword Add Immidiate - DADDI; MIPS64 */
+       DIP("daddi r%u, r%u, %u", rt, rs, imm);
+       IRTemp tmpRs64 = newTemp(Ity_I64);
+       assign(tmpRs64, getIReg(rs));
+@@ -16926,6 +16930,7 @@
+       putIReg(rt,  mkexpr(t0));
+       break;
+    }
++#endif
+
+    case 0x19:  /* Doubleword Add Immidiate Unsigned - DADDIU; MIPS64 */
+       DIP("daddiu r%u, r%u, %u", rt, rs, imm);
-- 
2.4.10
