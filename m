From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 15:25:38 +0200
Subject: [Buildroot] [git commit] gcc: arc: add patch to fix tst_movb pattern
Message-ID: <20170525132607.4AA4182967@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a71fb422bae5141d8605650e5ce12b2b244ed8fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes building of quagga [1]:

------------------------------>8---------------------------
839:1: error: unrecognizable insn:
 }
 ^
(insn 183 24 26 4 (set (reg:CC_ZN 61 cc)
        (and:SI (reg:SI 0 r0 [orig:192 _12->id.s_addr ] [192])
            (const_int -256 [0xffffffffffffff00]))) ospf_ri.c:790 -1
     (nil))
ospf_ri.c:839:1: internal compiler error: in extract_insn, at recog.c:2287
------------------------------>8---------------------------

[1] http://autobuild.buildroot.net/results/3c1/3c12c4609d4a77ab8ccd3ea94840884d70520efai

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-ARC-Fix-tst_movb-pattern.patch            | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/gcc/arc-2017.03/0001-ARC-Fix-tst_movb-pattern.patch b/package/gcc/arc-2017.03/0001-ARC-Fix-tst_movb-pattern.patch
new file mode 100644
index 0000000..3b09a13
--- /dev/null
+++ b/package/gcc/arc-2017.03/0001-ARC-Fix-tst_movb-pattern.patch
@@ -0,0 +1,55 @@
+From 08235ef444fd32d311fc9edb65895133820462e3 Mon Sep 17 00:00:00 2001
+From: claziss <claziss@synopsys.com>
+Date: Wed, 24 May 2017 12:53:43 +0200
+Subject: [PATCH] [ARC] Fix tst_movb pattern.
+
+The tst_movb pattern is missing guarding when spitting.
+
+gcc/
+2017-05-24  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* config/arc/arc.md (tst_movb): Add guard when splitting.
+
+testsuite/
+2017-05-24  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* gcc.target/arc/pr9001195952.c: New test.
+---
+ gcc/config/arc/arc.md                       |  2 +-
+ gcc/testsuite/gcc.target/arc/pr9001195952.c | 11 +++++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+ create mode 100755 gcc/testsuite/gcc.target/arc/pr9001195952.c
+
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
+index e78abaaafc42..d5510aeb0600 100644
+--- a/gcc/config/arc/arc.md
++++ b/gcc/config/arc/arc.md
+@@ -863,7 +863,7 @@ archs4xd, archs4xd_slow"
+    (clobber (match_scratch:SI 3 "=X,X,X,X,X,X,Rrq,Rrq,c"))]
+   "TARGET_NPS_BITOPS"
+   "movb.f.cl %3,%1,%p2,%p2,%s2"
+-  "reload_completed
++  "TARGET_NPS_BITOPS && reload_completed
+    && (extract_constrain_insn_cached (insn), (which_alternative & ~1) != 6)"
+   [(set (match_dup 0) (match_dup 4))])
+ 
+diff --git a/gcc/testsuite/gcc.target/arc/pr9001195952.c b/gcc/testsuite/gcc.target/arc/pr9001195952.c
+new file mode 100755
+index 000000000000..252438d8d78b
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arc/pr9001195952.c
+@@ -0,0 +1,11 @@
++/* { dg-do compile } */
++/* { dg-skip-if "" { ! { clmcpu } } } */
++/* { dg-options "-mcpu=archs -Os -w -fpic" } */
++
++/* tst_movb split pattern is wrong for anything else than NPS
++   chip.  */
++__bswap_32___bsx() {
++  int a = __builtin_bswap32(__bswap_32___bsx);
++  if (a & 1048575)
++    zlog_warn();
++}
+-- 
+2.7.4
+
