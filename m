From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 20:07:06 +0200
Subject: [Buildroot] [git commit] gcc: arc-2017.03-rc2: Fix "unrecognized
	supposed constant" error
Message-ID: <20170515181056.EE26882306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b360bd547f1c80b75c356a1aedca03a57debd94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following problem:
------------------------------------>8--------------------------------
arc-linux-gcc -c -Os -fPIC iso9660.i
iso9660.c: In function 'strip_trail':
iso9660.c:155:1: error: unrecognized supposed constant
 }
 ^
(unspec:SI [
        (symbol_ref:SI ("*.LANCHOR1") [flags 0x182])
    ] ARC_UNSPEC_GOTOFFPC)
iso9660.c:155:1: internal compiler error: in arc_legitimate_constant_p, at config/arc/arc.c:6028
------------------------------------>8--------------------------------

Found by Buildroot autobuilder [1].

The fix [2] is in arc-2017.03 development branch of ARC GCC and once it
becomes a part the next release of ARC tools this should be removed
from Buildroot.

[1] http://autobuild.buildroot.net/results/c90/c909e8c397ab972b6aa4d370572cad4fae284d00/build-end.log
[2] https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/139fed9d29ab935b3bc5159c0bdf7b8b8a39442d

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-return-false-for-any-PIC-related-unspecs.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/gcc/arc-2017.03-rc2/0001-FIX-PIC-return-false-for-any-PIC-related-unspecs.patch b/package/gcc/arc-2017.03-rc2/0001-FIX-PIC-return-false-for-any-PIC-related-unspecs.patch
new file mode 100644
index 0000000..ea97082
--- /dev/null
+++ b/package/gcc/arc-2017.03-rc2/0001-FIX-PIC-return-false-for-any-PIC-related-unspecs.patch
@@ -0,0 +1,58 @@
+From 139fed9d29ab935b3bc5159c0bdf7b8b8a39442d Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@gmail.com>
+Date: Mon, 15 May 2017 05:05:27 -0400
+Subject: [PATCH] [FIX] PIC: return false for any PIC related  unspecs
+
+---
+ gcc/config/arc/arc.c                        |  9 ++++-----
+ gcc/testsuite/gcc.target/arc/pr9001191897.c | 10 ++++++++++
+ 2 files changed, 14 insertions(+), 5 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/arc/pr9001191897.c
+
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index 3d53a667d37f..b00126f4d2c4 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -6056,11 +6056,8 @@ arc_legitimate_constant_p (machine_mode mode, rtx x)
+       return true;
+ 
+     case NEG:
+-      /* Assembler does not understand -(@label at gotoff).  Also, we do
+-	 not print such pic address constant.  */
+-      if (GET_CODE (XEXP (x, 0)) == UNSPEC)
+-	return false;
+       return arc_legitimate_constant_p (mode, XEXP (x, 0));
++
+     case PLUS:
+     case MINUS:
+       {
+@@ -6090,7 +6087,9 @@ arc_legitimate_constant_p (machine_mode mode, rtx x)
+ 	case UNSPEC_TLS_IE:
+ 	  return true;
+ 	default:
+-	  break;
++	  /* Any other unspec ending here are pic related, hence the above
++	     constant pic address checking returned false.  */
++	  return false;
+ 	}
+       /* Fall through.  */
+ 
+diff --git a/gcc/testsuite/gcc.target/arc/pr9001191897.c b/gcc/testsuite/gcc.target/arc/pr9001191897.c
+new file mode 100644
+index 000000000000..2b9e1689803f
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arc/pr9001191897.c
+@@ -0,0 +1,10 @@
++/* { dg-do compile } */
++/* { dg-skip-if "" { ! { clmcpu } } } */
++/* { dg-options "-mcpu=arch2 -Os -fpic -mno-sdata -mno-indexed-loads -w" } */
++a;
++c() {
++  static char b[25];
++  for (; a >= 0; a--)
++    if (b[a])
++      b[a] = '\0';
++}
+-- 
+2.7.4
+
