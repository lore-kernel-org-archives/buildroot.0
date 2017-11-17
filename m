From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 21:49:16 +0100
Subject: [Buildroot] [git commit] fwup: fix for ARC toolchain
Message-ID: <20171117204304.E51CF80F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d544feb8a277a43abec889450f917017d666e49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building fwup package with ARC toolchain causes internal compiler error.
Adding patch for ARC gcc solves this issue. In the next version of toolchain,
this problem has already been taken into account.

Fixes:
	http://autobuild.buildroot.net/results/a1b/a1bd5084309ced6c2d1b311617e5d9f0c362557a//
	http://autobuild.buildroot.net/results/dd3/dd3000bd99d71383ce82cd6b01b543cd9660130e//

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-checking-for-jumps.patch              | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/gcc/arc-2017.09-release/0001-fix-checking-for-jumps.patch b/package/gcc/arc-2017.09-release/0001-fix-checking-for-jumps.patch
new file mode 100644
index 0000000..ce78fac
--- /dev/null
+++ b/package/gcc/arc-2017.09-release/0001-fix-checking-for-jumps.patch
@@ -0,0 +1,49 @@
+From c2694d3739d90ea3350b42252638b604a2c122b7 Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@gmail.com>
+Date: Tue, 7 Nov 2017 20:16:41 +0200
+Subject: [PATCH] [FIX][ZOL] fix checking for jumps
+
+Signed-off-by: Evgeniy Didin <didin@synopsys.com>
+---
+ gcc/config/arc/arc.c                  |  3 ++-
+ gcc/testsuite/gcc.target/arc/loop-4.c | 14 ++++++++++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/arc/loop-4.c
+
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index 22eeb34a371..5d367499d03 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -7505,7 +7505,8 @@ hwloop_optimize (hwloop_info loop)
+       && INSN_P (last_insn)
+       && (JUMP_P (last_insn) || CALL_P (last_insn)
+ 	  || GET_CODE (PATTERN (last_insn)) == SEQUENCE
+-	  || JUMP_P (prev_active_insn (last_insn))
++	  || (prev_active_insn (last_insn)
++	      && JUMP_P (prev_active_insn (last_insn)))
+ 	  /* At this stage we can have (insn (clobber (mem:BLK
+ 	     (reg)))) instructions, ignpre them.  */
+ 	  || (GET_CODE (PATTERN (last_insn)) != CLOBBER
+diff --git a/gcc/testsuite/gcc.target/arc/loop-4.c b/gcc/testsuite/gcc.target/arc/loop-4.c
+new file mode 100644
+index 00000000000..99a93a74d1e
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arc/loop-4.c
+@@ -0,0 +1,14 @@
++/* { dg-do assemble } */
++/* { dg-do compile } */
++/* { dg-options "-Os" } */
++
++
++void fn1(void *p1, int p2, int p3)
++{
++  char *d = p1;
++  do
++    *d++ = p2;
++  while (--p3);
++}
++
++/* { dg-final { scan-assembler "lp_count" } } */
+-- 
+2.11.0
+
