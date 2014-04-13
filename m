From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Apr 2014 21:58:56 +0200
Subject: [Buildroot] [PATCH 2/4] gcc: add fix for PR 58595 to gcc 4.7.3
In-Reply-To: <1397419138-8776-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1397419138-8776-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1397419138-8776-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../4.7.3/843-gcc-4.7.3-Fix-PR-target-58595.patch  | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 package/gcc/4.7.3/843-gcc-4.7.3-Fix-PR-target-58595.patch

diff --git a/package/gcc/4.7.3/843-gcc-4.7.3-Fix-PR-target-58595.patch b/package/gcc/4.7.3/843-gcc-4.7.3-Fix-PR-target-58595.patch
new file mode 100644
index 0000000..656952c
--- /dev/null
+++ b/package/gcc/4.7.3/843-gcc-4.7.3-Fix-PR-target-58595.patch
@@ -0,0 +1,102 @@
+commit 4fa1f8926227d4e79975b674dc4292b9bec4b137
+Author: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date:   Thu Mar 6 12:07:07 2014 +0000
+
+    	PR target/58595
+    	* config/arm/arm.c (arm_tls_symbol_p): Remove.
+    	(arm_legitimize_address): Call legitimize_tls_address for any
+    	arm_tls_referenced_p expression, handle constant addend.  Call it
+    	before testing for !TARGET_ARM.
+    	(thumb_legitimize_address): Don't handle arm_tls_symbol_p here.
+    
+    	* gcc.dg/tls/pr58595.c: New test.
+    
+    
+    git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 208380 138bc75d-0d04-0410-961f-82ee72b054a4
+
+diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
+index ce24bfe..af5666b 100644
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -235,7 +235,6 @@ static tree arm_gimplify_va_arg_expr (tree, tree, gimple_seq *, gimple_seq *);
+ static void arm_option_override (void);
+ static unsigned HOST_WIDE_INT arm_shift_truncation_mask (enum machine_mode);
+ static bool arm_cannot_copy_insn_p (rtx);
+-static bool arm_tls_symbol_p (rtx x);
+ static int arm_issue_rate (void);
+ static void arm_output_dwarf_dtprel (FILE *, int, rtx) ATTRIBUTE_UNUSED;
+ static bool arm_output_addr_const_extra (FILE *, rtx);
+@@ -7336,6 +7335,32 @@ legitimize_tls_address (rtx x, rtx reg)
+ rtx
+ arm_legitimize_address (rtx x, rtx orig_x, enum machine_mode mode)
+ {
++  if (arm_tls_referenced_p (x))
++    {
++      rtx addend = NULL;
++
++      if (GET_CODE (x) == CONST && GET_CODE (XEXP (x, 0)) == PLUS)
++	{
++	  addend = XEXP (XEXP (x, 0), 1);
++	  x = XEXP (XEXP (x, 0), 0);
++	}
++
++      if (GET_CODE (x) != SYMBOL_REF)
++	return x;
++
++      gcc_assert (SYMBOL_REF_TLS_MODEL (x) != 0);
++
++      x = legitimize_tls_address (x, NULL_RTX);
++
++      if (addend)
++	{
++	  x = gen_rtx_PLUS (SImode, x, addend);
++	  orig_x = x;
++	}
++      else
++	return x;
++    }
++
+   if (!TARGET_ARM)
+     {
+       /* TODO: legitimize_address for Thumb2.  */
+@@ -7344,9 +7369,6 @@ arm_legitimize_address (rtx x, rtx orig_x, enum machine_mode mode)
+       return thumb_legitimize_address (x, orig_x, mode);
+     }
+ 
+-  if (arm_tls_symbol_p (x))
+-    return legitimize_tls_address (x, NULL_RTX);
+-
+   if (GET_CODE (x) == PLUS)
+     {
+       rtx xop0 = XEXP (x, 0);
+@@ -7459,9 +7481,6 @@ arm_legitimize_address (rtx x, rtx orig_x, enum machine_mode mode)
+ rtx
+ thumb_legitimize_address (rtx x, rtx orig_x, enum machine_mode mode)
+ {
+-  if (arm_tls_symbol_p (x))
+-    return legitimize_tls_address (x, NULL_RTX);
+-
+   if (GET_CODE (x) == PLUS
+       && CONST_INT_P (XEXP (x, 1))
+       && (INTVAL (XEXP (x, 1)) >= 32 * GET_MODE_SIZE (mode)
+@@ -7756,20 +7775,6 @@ thumb_legitimize_reload_address (rtx *x_p,
+ 
+ /* Test for various thread-local symbols.  */
+ 
+-/* Return TRUE if X is a thread-local symbol.  */
+-
+-static bool
+-arm_tls_symbol_p (rtx x)
+-{
+-  if (! TARGET_HAVE_TLS)
+-    return false;
+-
+-  if (GET_CODE (x) != SYMBOL_REF)
+-    return false;
+-
+-  return SYMBOL_REF_TLS_MODEL (x) != 0;
+-}
+-
+ /* Helper for arm_tls_referenced_p.  */
+ 
+ static int
-- 
1.8.3.2
