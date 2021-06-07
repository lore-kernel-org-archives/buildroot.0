From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Jun 2021 20:54:39 +0200
Subject: [Buildroot] [PATCH] package/gcc: bump to version 9.4.0
Message-ID: <20210607185439.5161-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patches
Reorder remaining patches

See:
https://gcc.gnu.org/pipermail/gcc-announce/2021/000168.html

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/315291768

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../0001-xtensa-fix-PR-target-91880.patch     | 50 ------------
 ...move-SELFTEST_DEPS-before-including-.patch | 81 -------------------
 ...issue-with-set_got-clobbering-LR-r9.patch} |  4 +-
 ...RANT-for-OpenRISC-when-pthread-is-p.patch} |  6 +-
 ...et-92095-internal-error-with-O1-mcp.patch} | 28 +++----
 ...mcmodel-option-to-handle-large-GOTs.patch} | 12 +--
 ...cmodel-large-when-building-crtstuff.patch} |  8 +-
 package/gcc/Config.in.host                    |  2 +-
 package/gcc/gcc.hash                          |  4 +-
 9 files changed, 32 insertions(+), 163 deletions(-)
 delete mode 100644 package/gcc/9.3.0/0001-xtensa-fix-PR-target-91880.patch
 delete mode 100644 package/gcc/9.3.0/0004-gcc-Makefile.in-move-SELFTEST_DEPS-before-including-.patch
 rename package/gcc/{9.3.0/0002-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch => 9.4.0/0001-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch} (98%)
 rename package/gcc/{9.3.0/0003-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch => 9.4.0/0002-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch} (88%)
 rename package/gcc/{9.3.0/0005-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch => 9.4.0/0003-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch} (93%)
 rename package/gcc/{9.3.0/0006-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch => 9.4.0/0004-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch} (96%)
 rename package/gcc/{9.3.0/0007-or1k-Use-cmodel-large-when-building-crtstuff.patch => 9.4.0/0005-or1k-Use-cmodel-large-when-building-crtstuff.patch} (93%)

diff --git a/package/gcc/9.3.0/0001-xtensa-fix-PR-target-91880.patch b/package/gcc/9.3.0/0001-xtensa-fix-PR-target-91880.patch
deleted file mode 100644
index 4e5aea2c7b..0000000000
--- a/package/gcc/9.3.0/0001-xtensa-fix-PR-target-91880.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0a59aa440a4c125b81504c777b066ae4eb1f09f0 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 24 Sep 2019 04:15:17 -0700
-Subject: [PATCH] xtensa: fix PR target/91880
-
-Xtensa hwloop_optimize segfaults when zero overhead loop is about to be
-inserted as the first instruction of the function.
-Insert zero overhead loop instruction into new basic block before the
-loop when basic block that precedes the loop is empty.
-
-2019-09-26  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	* config/xtensa/xtensa.c (hwloop_optimize): Insert zero overhead
-	loop instruction into new basic block before the loop when basic
-	block that precedes the loop is empty.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
-Backported from: r276166
-
- gcc/config/xtensa/xtensa.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index ee5612441e2..2527468d57d 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -4235,7 +4235,9 @@ hwloop_optimize (hwloop_info loop)
- 
-   seq = get_insns ();
- 
--  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1)
-+  entry_after = BB_END (entry_bb);
-+  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1
-+      || !entry_after)
-     {
-       basic_block new_bb;
-       edge e;
-@@ -4256,7 +4258,6 @@ hwloop_optimize (hwloop_info loop)
-     }
-   else
-     {
--      entry_after = BB_END (entry_bb);
-       while (DEBUG_INSN_P (entry_after)
-              || (NOTE_P (entry_after)
- 		 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK))
--- 
-2.24.1
-
diff --git a/package/gcc/9.3.0/0004-gcc-Makefile.in-move-SELFTEST_DEPS-before-including-.patch b/package/gcc/9.3.0/0004-gcc-Makefile.in-move-SELFTEST_DEPS-before-including-.patch
deleted file mode 100644
index 227d35a7f0..0000000000
--- a/package/gcc/9.3.0/0004-gcc-Makefile.in-move-SELFTEST_DEPS-before-including-.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 811c8d628045c3d248144fc560a4bf80209ca16e Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Thu, 21 May 2020 15:58:02 +0200
-Subject: [PATCH] gcc/Makefile.in: move SELFTEST_DEPS before including language
- makefile fragments
-
-As reported by several Buildroot users [1][2][3], the gcc build
-may fail while running selftests makefile target.
-
-The problem only occurs when ccache is used with gcc 9 and 10,
-probably due to a race condition.
-
-While debuging with "make -p" we can notice that s-selftest-c target
-contain only "cc1" as dependency instead of cc1 and SELFTEST_DEPS [4].
-
-  s-selftest-c: cc1
-
-While the build is failing, the s-selftest-c dependencies recipe is
-still running and reported as a bug by make.
-
-  "Dependencies recipe running (THIS IS A BUG)."
-
-A change [5] in gcc 9 seems to introduce the problem since we can't
-reproduce this problem with gcc 8.
-
-As suggested by Yann E. MORIN [6], move SELFTEST_DEPS before
-including language makefile fragments.
-
-With the fix applied, the s-seltest-c dependency contains
-SELFTEST_DEPS value.
-
-  s-selftest-c: cc1 xgcc specs stmp-int-hdrs ../../gcc/testsuite/selftests
-
-[1] http://lists.busybox.net/pipermail/buildroot/2020-May/282171.html
-[2] http://lists.busybox.net/pipermail/buildroot/2020-May/282766.html
-[3] https://github.com/cirosantilli/linux-kernel-module-cheat/issues/108
-[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/c/Make-lang.in;h=bfae6fd2549c4f728816cd355fa9739dcc08fcde;hb=033eb5671769a4c681a44aad08a454e667e08502#l120
-[5] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=033eb5671769a4c681a44aad08a454e667e08502
-[6] http://lists.busybox.net/pipermail/buildroot/2020-May/283213.html
-
-Upstream status: https://gcc.gnu.org/pipermail/gcc-patches/2020-May/546248.html
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-Cc: Ben Dakin-Norris <ben.dakin-norris@navtechradar.com>
-Cc: Maxim Kochetkov <fido_max@inbox.ru>
-Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Cc: Yann E. MORIN <yann.morin.1998@free.fr>
-Cc: Cc: David Malcolm <dmalcolm@gcc.gnu.org>
----
-This patch should be backported to gcc 10 and gcc 9.
----
- gcc/Makefile.in | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index abae872cd63..e2ef3c46afc 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -1686,6 +1686,10 @@ $(FULL_DRIVER_NAME): ./xgcc
- 	rm -f $@
- 	$(LN_S) $< $@
- 
-+# SELFTEST_DEPS need to be set before including language makefile fragments.
-+# Otherwise $(SELFTEST_DEPS) is empty when used from various <LANG>/Make-lang.in.
-+SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
-+
- #
- # Language makefile fragments.
- 
-@@ -1950,8 +1954,6 @@ DEVNULL=$(if $(findstring mingw,$(build)),nul,/dev/null)
- SELFTEST_FLAGS = -nostdinc $(DEVNULL) -S -o $(DEVNULL) \
- 	-fself-test=$(srcdir)/testsuite/selftests
- 
--SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
--
- # Run the selftests during the build once we have a driver and the frontend,
- # so that self-test failures are caught as early as possible.
- # Use "s-selftest-FE" to ensure that we only run the selftests if the
--- 
-2.25.4
-
diff --git a/package/gcc/9.3.0/0002-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch b/package/gcc/9.4.0/0001-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
similarity index 98%
rename from package/gcc/9.3.0/0002-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
rename to package/gcc/9.4.0/0001-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
index e40b96fe0f..185e16c179 100644
--- a/package/gcc/9.3.0/0002-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
+++ b/package/gcc/9.4.0/0001-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
@@ -1,4 +1,4 @@
-From 1383012ae409ed91903b2b76ee15137bc1f89900 Mon Sep 17 00:00:00 2001
+From 014db5e5febec94e35c13ce89ee6b389328873a1 Mon Sep 17 00:00:00 2001
 From: shorne <shorne@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 31 Aug 2019 06:00:56 +0000
 Subject: [PATCH] or1k: Fix issue with set_got clobbering LR (r9)
@@ -101,5 +101,5 @@ index 2dad51cd46b..88f3f02630f 100644
     (clobber (reg:SI LR_REGNUM))]
    ""
 -- 
-2.24.1
+2.31.1
 
diff --git a/package/gcc/9.3.0/0003-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch b/package/gcc/9.4.0/0002-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
similarity index 88%
rename from package/gcc/9.3.0/0003-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
rename to package/gcc/9.4.0/0002-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
index 3ff64b71f8..5ac03d7c0c 100644
--- a/package/gcc/9.3.0/0003-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
+++ b/package/gcc/9.4.0/0002-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
@@ -1,4 +1,4 @@
-From 2aefc4ee703ce3ff70ad25915005cacfbaae0c49 Mon Sep 17 00:00:00 2001
+From f80e9941739fb3973b61fc6a5abddef5ad2faf73 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Fri, 27 Mar 2020 21:23:53 +0100
 Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
@@ -14,7 +14,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 2 insertions(+)
 
 diff --git a/gcc/config/or1k/linux.h b/gcc/config/or1k/linux.h
-index 4b2f7b6e1fd..b00d23ddfa0 100644
+index cbdc781418f..36303af892c 100644
 --- a/gcc/config/or1k/linux.h
 +++ b/gcc/config/or1k/linux.h
 @@ -32,6 +32,8 @@
@@ -27,5 +27,5 @@ index 4b2f7b6e1fd..b00d23ddfa0 100644
  #define LINK_SPEC "%{h*}			\
     %{static:-Bstatic}				\
 -- 
-2.21.0
+2.31.1
 
diff --git a/package/gcc/9.3.0/0005-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch b/package/gcc/9.4.0/0003-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
similarity index 93%
rename from package/gcc/9.3.0/0005-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
rename to package/gcc/9.4.0/0003-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
index 8ed281e981..0c69de93be 100644
--- a/package/gcc/9.3.0/0005-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
+++ b/package/gcc/9.4.0/0003-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
@@ -1,4 +1,4 @@
-From 0d7fe4806d9dce76367c193d5199df6a2b98009f Mon Sep 17 00:00:00 2001
+From 1107ecc3e8af31adc7bbd4e08c0614836bd1cebd Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Wed, 20 Jan 2021 23:22:16 +0100
 Subject: [PATCH] Revert "re PR target/92095 (internal error with -O1
@@ -30,7 +30,7 @@ Cc: Eric Botcazou <ebotcazou@gcc.gnu.org>
  delete mode 100644 gcc/testsuite/gcc.c-torture/compile/20191108-1.c
 
 diff --git a/gcc/config/sparc/sparc-protos.h b/gcc/config/sparc/sparc-protos.h
-index ef1adb69ede..9bdae7b9faa 100644
+index f1c120c4860..f4b6f00a7b1 100644
 --- a/gcc/config/sparc/sparc-protos.h
 +++ b/gcc/config/sparc/sparc-protos.h
 @@ -69,7 +69,6 @@ extern void sparc_split_reg_mem (rtx, rtx, machine_mode);
@@ -42,10 +42,10 @@ index ef1adb69ede..9bdae7b9faa 100644
  extern const char *output_cbranch (rtx, rtx, int, int, int, rtx_insn *);
  extern const char *output_return (rtx_insn *);
 diff --git a/gcc/config/sparc/sparc.c b/gcc/config/sparc/sparc.c
-index a993aab7639..2974d174e93 100644
+index 0553dc501e6..516dcf96d7b 100644
 --- a/gcc/config/sparc/sparc.c
 +++ b/gcc/config/sparc/sparc.c
-@@ -4205,6 +4205,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
+@@ -4170,6 +4170,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
  static bool
  sparc_cannot_force_const_mem (machine_mode mode, rtx x)
  {
@@ -59,7 +59,7 @@ index a993aab7639..2974d174e93 100644
    switch (GET_CODE (x))
      {
      case CONST_INT:
-@@ -4240,11 +4247,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
+@@ -4205,11 +4212,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
  }
  
  /* Global Offset Table support.  */
@@ -73,7 +73,7 @@ index a993aab7639..2974d174e93 100644
  
  /* Return the SYMBOL_REF for the Global Offset Table.  */
  
-@@ -4257,6 +4262,27 @@ sparc_got (void)
+@@ -4222,6 +4227,27 @@ sparc_got (void)
    return got_symbol_rtx;
  }
  
@@ -101,7 +101,7 @@ index a993aab7639..2974d174e93 100644
  /* Wrapper around the load_pcrel_sym{si,di} patterns.  */
  
  static rtx
-@@ -4276,78 +4302,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
+@@ -4241,78 +4267,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
    return insn;
  }
  
@@ -186,7 +186,7 @@ index a993aab7639..2974d174e93 100644
  }
  
  /* Ensure that we are not using patterns that are not OK with PIC.  */
-@@ -5512,7 +5490,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
+@@ -5477,7 +5455,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
      return true;
  
    /* GOT register (%l7) if needed.  */
@@ -195,7 +195,7 @@ index a993aab7639..2974d174e93 100644
      return true;
  
    /* If the function accesses prior frames, the frame pointer and the return
-@@ -12555,9 +12533,10 @@ static void
+@@ -12520,9 +12498,10 @@ static void
  sparc_file_end (void)
  {
    /* If we need to emit the special GOT helper function, do so now.  */
@@ -207,7 +207,7 @@ index a993aab7639..2974d174e93 100644
  #ifdef DWARF2_UNWIND_INFO
        bool do_cfi;
  #endif
-@@ -12594,22 +12573,17 @@ sparc_file_end (void)
+@@ -12559,22 +12538,17 @@ sparc_file_end (void)
  #ifdef DWARF2_UNWIND_INFO
        do_cfi = dwarf2out_do_cfi_asm ();
        if (do_cfi)
@@ -236,7 +236,7 @@ index a993aab7639..2974d174e93 100644
  #endif
      }
  
-@@ -13115,10 +13089,7 @@ sparc_init_pic_reg (void)
+@@ -13080,10 +13054,7 @@ sparc_init_pic_reg (void)
    edge entry_edge;
    rtx_insn *seq;
  
@@ -249,10 +249,10 @@ index a993aab7639..2974d174e93 100644
  
    start_sequence ();
 diff --git a/gcc/config/sparc/sparc.md b/gcc/config/sparc/sparc.md
-index 0a6e27ffa83..7af62d599b9 100644
+index d9ef79c13cc..6dbd054f1c7 100644
 --- a/gcc/config/sparc/sparc.md
 +++ b/gcc/config/sparc/sparc.md
-@@ -1604,7 +1604,10 @@
+@@ -1601,7 +1601,10 @@
     (clobber (reg:P O7_REG))]
    "REGNO (operands[0]) == INTVAL (operands[3])"
  {
@@ -321,5 +321,5 @@ index f00283f6e7b..67d4ac38095 100644
  #include <stdbool.h>
  #include <stdint.h>
 -- 
-2.25.4
+2.31.1
 
diff --git a/package/gcc/9.3.0/0006-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/9.4.0/0004-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
similarity index 96%
rename from package/gcc/9.3.0/0006-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
rename to package/gcc/9.4.0/0004-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
index 60dd7f78ea..894411f394 100644
--- a/package/gcc/9.3.0/0006-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
+++ b/package/gcc/9.4.0/0004-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
@@ -1,4 +1,4 @@
-From 1af3ab7fc3e4f2ae835c976486e8af0762674af3 Mon Sep 17 00:00:00 2001
+From 90b202b59fa2bdb68314a23471b32d3e16602bc8 Mon Sep 17 00:00:00 2001
 From: Stafford Horne <shorne@gmail.com>
 Date: Sun, 2 May 2021 06:11:44 +0900
 Subject: [PATCH] or1k: Add mcmodel option to handle large GOTs
@@ -104,7 +104,7 @@ index fc10fcfabde..df67d72b139 100644
    reloc_type type = RTYPE_DIRECT;
  
 diff --git a/gcc/config/or1k/or1k.h b/gcc/config/or1k/or1k.h
-index 6dda230f217..858f30743b7 100644
+index feee702d89c..dbaf0d0fe4c 100644
 --- a/gcc/config/or1k/or1k.h
 +++ b/gcc/config/or1k/or1k.h
 @@ -21,6 +21,8 @@
@@ -166,10 +166,10 @@ index 7bdbd842dd4..116524c3441 100644
  Target RejectNegative Mask(CMOV)
  Allows generation of binaries which use the l.cmov instruction.  If your target
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 0ab6c9c6449..0904b2b5a41 100644
+index 7b5f6e03d9f..683c64417af 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -1030,7 +1030,9 @@ Objective-C and Objective-C++ Dialects}.
+@@ -1032,7 +1032,9 @@ Objective-C and Objective-C++ Dialects}.
  @emph{OpenRISC Options}
  @gccoptlist{-mboard=@var{name}  -mnewlib  -mhard-mul  -mhard-div @gol
  -msoft-mul  -msoft-div @gol
@@ -180,7 +180,7 @@ index 0ab6c9c6449..0904b2b5a41 100644
  
  @emph{PDP-11 Options}
  @gccoptlist{-mfpu  -msoft-float  -mac0  -mno-ac0  -m40  -m45  -m10 @gol
-@@ -27408,6 +27410,15 @@ MWAITX, SHA, CLZERO, AES, PCL_MUL, CX16, MOVBE, MMX, SSE, SSE2, SSE3, SSE4A,
+@@ -27462,6 +27464,15 @@ MWAITX, SHA, CLZERO, AES, PCL_MUL, CX16, MOVBE, MMX, SSE, SSE2, SSE3, SSE4A,
  SSSE3, SSE4.1, SSE4.2, ABM, XSAVEC, XSAVES, CLFLUSHOPT, POPCNT, and 64-bit
  instruction set extensions.)
  
@@ -197,5 +197,5 @@ index 0ab6c9c6449..0904b2b5a41 100644
  @item btver1
  CPUs based on AMD Family 14h cores with x86-64 instruction set support.  (This
 -- 
-2.25.1
+2.31.1
 
diff --git a/package/gcc/9.3.0/0007-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/9.4.0/0005-or1k-Use-cmodel-large-when-building-crtstuff.patch
similarity index 93%
rename from package/gcc/9.3.0/0007-or1k-Use-cmodel-large-when-building-crtstuff.patch
rename to package/gcc/9.4.0/0005-or1k-Use-cmodel-large-when-building-crtstuff.patch
index 673847fd88..69d143349a 100644
--- a/package/gcc/9.3.0/0007-or1k-Use-cmodel-large-when-building-crtstuff.patch
+++ b/package/gcc/9.4.0/0005-or1k-Use-cmodel-large-when-building-crtstuff.patch
@@ -1,4 +1,4 @@
-From b540f7b916ba7cf2059b84c5cc8d08c67ebe9a0b Mon Sep 17 00:00:00 2001
+From d64a757040fe36b0d9dc65d24107c656f66bc8e5 Mon Sep 17 00:00:00 2001
 From: Stafford Horne <shorne@gmail.com>
 Date: Sun, 2 May 2021 06:11:45 +0900
 Subject: [PATCH] or1k: Use cmodel=large when building crtstuff
@@ -29,10 +29,10 @@ Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
  create mode 100644 libgcc/config/or1k/t-crtstuff
 
 diff --git a/libgcc/config.host b/libgcc/config.host
-index 0f15fda3612..0c21d384e6f 100644
+index bdbf77a3e62..bfb45a90630 100644
 --- a/libgcc/config.host
 +++ b/libgcc/config.host
-@@ -1051,12 +1051,12 @@ nios2-*-*)
+@@ -1061,12 +1061,12 @@ nios2-*-*)
  	extra_parts="$extra_parts crti.o crtn.o"
  	;;
  or1k-*-linux*)
@@ -56,5 +56,5 @@ index 00000000000..dcae7f3498e
 +# Compile crtbeginS.o and crtendS.o with -mcmodel=large
 +CRTSTUFF_T_CFLAGS_S += -mcmodel=large
 -- 
-2.25.1
+2.31.1
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 80b0b381f0..8f156fc4e1 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -85,7 +85,7 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_8_X
-	default "9.3.0"     if BR2_GCC_VERSION_9_X
+	default "9.4.0"     if BR2_GCC_VERSION_9_X
 	default "10.3.0"    if BR2_GCC_VERSION_10_X
 	default "11.1.0"    if BR2_GCC_VERSION_11_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 8a8a7b4581..0f7ff9dbf7 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
-#  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.3.0/sha512.sum
-sha512  4b9e3639eef6e623747a22c37a904b4750c93b6da77cf3958d5047e9b5ebddb7eebe091cc16ca0a227c0ecbd2bf3b984b221130f269a97ee4cc18f9cf6c444de  gcc-9.3.0.tar.xz
+#  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.4.0/sha512.sum
+sha512  dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b797b6af8ca9b2eeb746b3b115d9c3698381b989546e9151b4496415624  gcc-9.4.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-10.3.0/sha512.sum
 sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-11.1.0/sha512.sum
-- 
2.31.1
