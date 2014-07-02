From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 17:14:03 +0200
Subject: [Buildroot] [git commit] gcc 4.8.3: add patch for PR60155
Message-ID: <20140702151502.B9D179D144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0e258262da747f046c8c86649a830b1b575c992
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/6c8/6c8c3cb19a6f98f6f27986b671d48ee092fdf7cc/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/4.8.3/842-PR60155.patch |  111 +++++++++++++++++++++++++++++++++++
 1 files changed, 111 insertions(+), 0 deletions(-)

diff --git a/package/gcc/4.8.3/842-PR60155.patch b/package/gcc/4.8.3/842-PR60155.patch
new file mode 100644
index 0000000..7bc2122
--- /dev/null
+++ b/package/gcc/4.8.3/842-PR60155.patch
@@ -0,0 +1,111 @@
+From gcc bugzilla https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60155
+Upstream status: in trunk.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- trunk/gcc/gcse.c	2014/02/12 14:50:06	207726
++++ trunk/gcc/gcse.c	2014/04/04 22:25:51	209134
+@@ -2502,6 +2502,65 @@
+       }
+ }
+ 
++struct set_data
++{
++  rtx insn;
++  const_rtx set;
++  int nsets;
++};
++
++/* Increment number of sets and record set in DATA.  */
++
++static void
++record_set_data (rtx dest, const_rtx set, void *data)
++{
++  struct set_data *s = (struct set_data *)data;
++
++  if (GET_CODE (set) == SET)
++    {
++      /* We allow insns having multiple sets, where all but one are
++	 dead as single set insns.  In the common case only a single
++	 set is present, so we want to avoid checking for REG_UNUSED
++	 notes unless necessary.  */
++      if (s->nsets == 1
++	  && find_reg_note (s->insn, REG_UNUSED, SET_DEST (s->set))
++	  && !side_effects_p (s->set))
++	s->nsets = 0;
++
++      if (!s->nsets)
++	{
++	  /* Record this set.  */
++	  s->nsets += 1;
++	  s->set = set;
++	}
++      else if (!find_reg_note (s->insn, REG_UNUSED, dest)
++	       || side_effects_p (set))
++	s->nsets += 1;
++    }
++}
++
++static const_rtx
++single_set_gcse (rtx insn)
++{
++  struct set_data s;
++  rtx pattern;
++  
++  gcc_assert (INSN_P (insn));
++
++  /* Optimize common case.  */
++  pattern = PATTERN (insn);
++  if (GET_CODE (pattern) == SET)
++    return pattern;
++
++  s.insn = insn;
++  s.nsets = 0;
++  note_stores (pattern, record_set_data, &s);
++
++  /* Considered invariant insns have exactly one set.  */
++  gcc_assert (s.nsets == 1);
++  return s.set;
++}
++
+ /* Emit move from SRC to DEST noting the equivalence with expression computed
+    in INSN.  */
+ 
+@@ -2509,7 +2568,8 @@
+ gcse_emit_move_after (rtx dest, rtx src, rtx insn)
+ {
+   rtx new_rtx;
+-  rtx set = single_set (insn), set2;
++  const_rtx set = single_set_gcse (insn);
++  rtx set2;
+   rtx note;
+   rtx eqv = NULL_RTX;
+ 
+@@ -3369,13 +3429,12 @@
+ 	      FOR_EACH_VEC_ELT (occrs_to_hoist, j, occr)
+ 		{
+ 		  rtx insn;
+-		  rtx set;
++		  const_rtx set;
+ 
+ 		  gcc_assert (!occr->deleted_p);
+ 
+ 		  insn = occr->insn;
+-		  set = single_set (insn);
+-		  gcc_assert (set);
++		  set = single_set_gcse (insn);
+ 
+ 		  /* Create a pseudo-reg to store the result of reaching
+ 		     expressions into.  Get the mode for the new pseudo
+@@ -3456,10 +3515,8 @@
+ {
+   rtx reg;
+   enum reg_class pressure_class;
+-  rtx set = single_set (insn);
++  const_rtx set = single_set_gcse (insn);
+ 
+-  /* Considered invariant insns have only one set.  */
+-  gcc_assert (set != NULL_RTX);
+   reg = SET_DEST (set);
+   if (GET_CODE (reg) == SUBREG)
+     reg = SUBREG_REG (reg);
