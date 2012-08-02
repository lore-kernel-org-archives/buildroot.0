From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:14 -0000
Subject: [Buildroot] [git commit branch/next] toolchain/gcc: bump 4.7.x
Message-ID: <20120802195239.D3AD7800EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e85e2590e51e7492820776b7d14c2bbb26bbc335
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/4.7.0/200-gcc-pr52734.patch          |  115 --------------------
 .../gcc/{4.7.0 => 4.7.1}/100-uclibc-conf.patch     |    0
 .../{4.7.0 => 4.7.1}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.7.0 => 4.7.1}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.7.0 => 4.7.1}/830-arm_unbreak_armv4t.patch  |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 toolchain/gcc/Config.in                            |    2 +-
 9 files changed, 1 insertions(+), 116 deletions(-)

diff --git a/toolchain/gcc/4.7.0/200-gcc-pr52734.patch b/toolchain/gcc/4.7.0/200-gcc-pr52734.patch
deleted file mode 100644
index a1ac601..0000000
--- a/toolchain/gcc/4.7.0/200-gcc-pr52734.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-Index: gcc/tree-ssa-tail-merge.c
-===================================================================
---- a/gcc/tree-ssa-tail-merge.c (revision 185028)
-+++ b/gcc/tree-ssa-tail-merge.c (working copy)
-@@ -1123,18 +1123,31 @@ gimple_equal_p (same_succ same_succ, gim
-     }
- }
- 
--/* Let GSI skip backwards over local defs.  */
-+/* Let GSI skip backwards over local defs.  Return the earliest vuse in VUSE.
-+   Return true in VUSE_ESCAPED if the vuse influenced a SSA_OP_DEF of one of the
-+   processed statements.  */
- 
- static void
--gsi_advance_bw_nondebug_nonlocal (gimple_stmt_iterator *gsi)
-+gsi_advance_bw_nondebug_nonlocal (gimple_stmt_iterator *gsi, tree *vuse,
-+				  bool *vuse_escaped)
- {
-   gimple stmt;
-+  tree lvuse;
- 
-   while (true)
-     {
-       if (gsi_end_p (*gsi))
- 	return;
-       stmt = gsi_stmt (*gsi);
-+
-+      lvuse = gimple_vuse (stmt);
-+      if (lvuse != NULL_TREE)
-+	{
-+	  *vuse = lvuse;
-+	  if (!ZERO_SSA_OPERANDS (stmt, SSA_OP_DEF))
-+	    *vuse_escaped = true;
-+	}
-+
-       if (!(is_gimple_assign (stmt) && local_def (gimple_get_lhs (stmt))
- 	    && !gimple_has_side_effects (stmt)))
- 	return;
-@@ -1150,9 +1163,11 @@ find_duplicate (same_succ same_succ, bas
- {
-   gimple_stmt_iterator gsi1 = gsi_last_nondebug_bb (bb1);
-   gimple_stmt_iterator gsi2 = gsi_last_nondebug_bb (bb2);
-+  tree vuse1 = NULL_TREE, vuse2 = NULL_TREE;
-+  bool vuse_escaped = false;
- 
--  gsi_advance_bw_nondebug_nonlocal (&gsi1);
--  gsi_advance_bw_nondebug_nonlocal (&gsi2);
-+  gsi_advance_bw_nondebug_nonlocal (&gsi1, &vuse1, &vuse_escaped);
-+  gsi_advance_bw_nondebug_nonlocal (&gsi2, &vuse2, &vuse_escaped);
- 
-   while (!gsi_end_p (gsi1) && !gsi_end_p (gsi2))
-     {
-@@ -1161,13 +1176,20 @@ find_duplicate (same_succ same_succ, bas
- 
-       gsi_prev_nondebug (&gsi1);
-       gsi_prev_nondebug (&gsi2);
--      gsi_advance_bw_nondebug_nonlocal (&gsi1);
--      gsi_advance_bw_nondebug_nonlocal (&gsi2);
-+      gsi_advance_bw_nondebug_nonlocal (&gsi1, &vuse1, &vuse_escaped);
-+      gsi_advance_bw_nondebug_nonlocal (&gsi2, &vuse2, &vuse_escaped);
-     }
- 
-   if (!(gsi_end_p (gsi1) && gsi_end_p (gsi2)))
-     return;
- 
-+  /* If the incoming vuses are not the same, and the vuse escaped into an
-+     SSA_OP_DEF, then merging the 2 blocks will change the value of the def,
-+     which potentially means the semantics of one of the blocks will be changed.
-+     TODO: make this check more precise.  */
-+  if (vuse_escaped && vuse1 != vuse2)
-+    return;
-+
-   if (dump_file)
-     fprintf (dump_file, "find_duplicates: <bb %d> duplicate of <bb %d>\n",
- 	     bb1->index, bb2->index);
-Index: gcc/testsuite/gcc.dg/pr52734.c
-===================================================================
---- a/dev/null (new file)
-+++ b/gcc/testsuite/gcc.dg/pr52734.c (revision 0)
-@@ -0,0 +1,35 @@
-+/* { dg-do run } */
-+/* { dg-options "-O2" } */
-+
-+int bbb = 0;
-+
-+int __attribute__((noinline,noclone)) aaa(void)
-+{
-+    ++bbb;
-+    return 0;
-+}
-+
-+int __attribute__((noinline,noclone)) ccc(void)
-+{
-+  int ddd;
-+  /* bbb == 0 */
-+  if (aaa())
-+    return bbb;
-+
-+  /* bbb == 1 */
-+  ddd = bbb;
-+  /* bbb == ddd == 1 */
-+  if (aaa ())
-+    return 0;
-+  /* bbb == 2, ddd == 1 */
-+
-+  return ddd;
-+}
-+
-+int main(void)
-+{
-+    if (ccc() != 1)
-+	__builtin_abort();
-+    return 0;
-+}
-+
diff --git a/toolchain/gcc/4.7.0/100-uclibc-conf.patch b/toolchain/gcc/4.7.1/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.7.0/100-uclibc-conf.patch
rename to toolchain/gcc/4.7.1/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.7.0/301-missing-execinfo_h.patch b/toolchain/gcc/4.7.1/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.7.0/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.7.1/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.7.0/302-c99-snprintf.patch b/toolchain/gcc/4.7.1/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.7.0/302-c99-snprintf.patch
rename to toolchain/gcc/4.7.1/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.7.0/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.7.1/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.7.0/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.7.1/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.7.0/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.7.1/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.7.0/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.7.1/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.7.0/830-arm_unbreak_armv4t.patch b/toolchain/gcc/4.7.1/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.7.0/830-arm_unbreak_armv4t.patch
rename to toolchain/gcc/4.7.1/830-arm_unbreak_armv4t.patch
diff --git a/toolchain/gcc/4.7.0/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.7.1/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.7.0/powerpc-link-with-math-lib.patch.conditional
rename to toolchain/gcc/4.7.1/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index eb4d5ea..4ce8816 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -64,7 +64,7 @@ config BR2_GCC_VERSION
 	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.3"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.3"     if BR2_GCC_VERSION_4_6_X
-	default "4.7.0"     if BR2_GCC_VERSION_4_7_X
+	default "4.7.1"     if BR2_GCC_VERSION_4_7_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
