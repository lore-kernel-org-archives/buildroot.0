From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 15:37:17 +0200
Subject: [Buildroot] [git commit] gcc: fix conditional move constraint on ARC
Message-ID: <20160826133723.9ECCD82304@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62d9a0fc06cf78b0853473ad3d66bc7a2d3a361d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch solves one of the ARC internal compiler issues.

Fixes:
  http://autobuild.buildroot.net/results/1c4493c6a18b7a93a0368420c8f79032f9330891/
  http://autobuild.buildroot.net/results/51071b790866b0c7083de3a94ad2a427009096af/
  http://autobuild.buildroot.net/results/09e037c628ca2a27d8eb832dd070f50ec7ebb72a/

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../950-ARC-Fix-conditional-move-contstraint.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/gcc/arc-2016.09-eng008/950-ARC-Fix-conditional-move-contstraint.patch b/package/gcc/arc-2016.09-eng008/950-ARC-Fix-conditional-move-contstraint.patch
new file mode 100644
index 0000000..153af6d
--- /dev/null
+++ b/package/gcc/arc-2016.09-eng008/950-ARC-Fix-conditional-move-contstraint.patch
@@ -0,0 +1,34 @@
+From e569e9c2ce2273f5175e0928efd6e45c3e71c45f Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Mon, 22 Aug 2016 19:58:25 +0200
+Subject: [PATCH] [ARC] Fix conditional move contstraint
+
+Move pattern (movsi_insn) allows predicated instructions to be
+instructions which can hold all registers.  However, the conditional
+variant doesn't.  This patch fixes this problem.
+
+2016-08-22  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* config/arc/arc.md (movsi_cond_exec): Update constraint.
+
+Signed-off-by: Claudiu Zissulescu  <claziss@synopsys.com>
+---
+ gcc/config/arc/arc.md | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
+index d87174a..607c6e6 100644
+--- a/gcc/config/arc/arc.md
++++ b/gcc/config/arc/arc.md
+@@ -3603,7 +3603,7 @@
+      (match_operator 3 "proper_comparison_operator"
+        [(match_operand 2 "cc_register" "Rcc,Rcc") (const_int 0)])
+      (set (match_operand:SI 0 "dest_reg_operand" "=w,w")
+-	  (match_operand:SI 1 "nonmemory_operand" "Lc,?Cal")))]
++	  (match_operand:SI 1 "nonmemory_operand" "LRac,?Cal")))]
+   ""
+   "mov.%d3 %0,%S1"
+   [(set_attr "type" "cmove")
+-- 
+2.6.3
+
