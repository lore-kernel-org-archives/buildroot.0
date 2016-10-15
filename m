From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 15:53:18 +0200
Subject: [Buildroot] [PATCH] gcc: add patches to fix PR70473
Message-ID: <1476539598-31097-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gc 5.x introduced a regression in the ARM build, which causes the
s-automata program to consume a very significant amount of RAM during
the gcc build. This causes numerous failures with our Travis-CI based
testing of defconfigs.

In order to address this, this commit backports a commit from the gcc
master branch, to both our gcc 5.x and gcc 6.x support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...et-70473-Reduce-size-of-Cortex-A8-automat.patch | 68 +++++++++++++++++++++
 ...et-70473-Reduce-size-of-Cortex-A8-automat.patch | 69 ++++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 package/gcc/5.4.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
 create mode 100644 package/gcc/6.2.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch

diff --git a/package/gcc/5.4.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch b/package/gcc/5.4.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
new file mode 100644
index 0000000..d8c74f9
--- /dev/null
+++ b/package/gcc/5.4.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
@@ -0,0 +1,68 @@
+From 89bd94250827f887b38211ac048b4006229dc9c0 Mon Sep 17 00:00:00 2001
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 26 Aug 2016 10:23:20 +0000
+Subject: [PATCH] [ARM] PR target/70473: Reduce size of Cortex-A8 automaton
+
+	PR target/70473
+	* config/arm/cortex-a8-neon.md (cortex_a8_vfp_muld): Reduce
+	reservation duration to 15 cycles.
+	(cortex_a8_vfp_macs): Likewise.
+	(cortex_a8_vfp_macd): Likewise.
+	(cortex_a8_vfp_divs): Likewise.
+	(cortex_a8_vfp_divd): Likewise.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 239772 138bc75d-0d04-0410-961f-82ee72b054a4
+
+[Backport from gcc upstream commit 79f5d5e3cd5a668d5ecb2b6b0cce80ef5706ac53.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gcc/config/arm/cortex-a8-neon.md | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/gcc/config/arm/cortex-a8-neon.md b/gcc/config/arm/cortex-a8-neon.md
+index 04fa01e..4e6d05d 100644
+--- a/gcc/config/arm/cortex-a8-neon.md
++++ b/gcc/config/arm/cortex-a8-neon.md
+@@ -357,30 +357,34 @@
+        (eq_attr "type" "fmuls"))
+   "cortex_a8_vfp,cortex_a8_vfplite*11")
+ 
++;; Don't model a reservation for more than 15 cycles as this explodes the
++;; state space of the automaton for little gain.  It is unlikely that the
++;; scheduler will find enough instructions to hide the full latency of the
++;; instructions.
+ (define_insn_reservation "cortex_a8_vfp_muld" 17
+   (and (eq_attr "tune" "cortexa8")
+        (eq_attr "type" "fmuld"))
+-  "cortex_a8_vfp,cortex_a8_vfplite*16")
++  "cortex_a8_vfp,cortex_a8_vfplite*15")
+ 
+ (define_insn_reservation "cortex_a8_vfp_macs" 21
+   (and (eq_attr "tune" "cortexa8")
+        (eq_attr "type" "fmacs,ffmas"))
+-  "cortex_a8_vfp,cortex_a8_vfplite*20")
++  "cortex_a8_vfp,cortex_a8_vfplite*15")
+ 
+ (define_insn_reservation "cortex_a8_vfp_macd" 26
+   (and (eq_attr "tune" "cortexa8")
+        (eq_attr "type" "fmacd,ffmad"))
+-  "cortex_a8_vfp,cortex_a8_vfplite*25")
++  "cortex_a8_vfp,cortex_a8_vfplite*15")
+ 
+ (define_insn_reservation "cortex_a8_vfp_divs" 37
+   (and (eq_attr "tune" "cortexa8")
+        (eq_attr "type" "fdivs, fsqrts"))
+-  "cortex_a8_vfp,cortex_a8_vfplite*36")
++  "cortex_a8_vfp,cortex_a8_vfplite*15")
+ 
+ (define_insn_reservation "cortex_a8_vfp_divd" 65
+   (and (eq_attr "tune" "cortexa8")
+        (eq_attr "type" "fdivd, fsqrtd"))
+-  "cortex_a8_vfp,cortex_a8_vfplite*64")
++  "cortex_a8_vfp,cortex_a8_vfplite*15")
+ 
+ ;; Comparisons can actually take 7 cycles sometimes instead of four,
+ ;; but given all the other instructions lumped into type=ffarith that
+-- 
+2.7.4
+
diff --git a/package/gcc/6.2.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch b/package/gcc/6.2.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
new file mode 100644
index 0000000..af9fb1d
--- /dev/null
+++ b/package/gcc/6.2.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
@@ -0,0 +1,69 @@
+From 07453188b18a2cbe815917dbb893b4ebfdd793b6 Mon Sep 17 00:00:00 2001
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 26 Aug 2016 10:23:20 +0000
+Subject: [PATCH] [ARM] PR target/70473: Reduce size of Cortex-A8 automaton
+
+	PR target/70473
+	* config/arm/cortex-a8-neon.md (cortex_a8_vfp_muld): Reduce
+	reservation duration to 15 cycles.
+	(cortex_a8_vfp_macs): Likewise.
+	(cortex_a8_vfp_macd): Likewise.
+	(cortex_a8_vfp_divs): Likewise.
+	(cortex_a8_vfp_divd): Likewise.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 239772
+138bc75d-0d04-0410-961f-82ee72b054a4
+
+[Backport from gcc upstream commit 79f5d5e3cd5a668d5ecb2b6b0cce80ef5706ac53.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gcc/config/arm/cortex-a8-neon.md | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/gcc/config/arm/cortex-a8-neon.md b/gcc/config/arm/cortex-a8-neon.md
+index 45f861f..b16c299 100644
+--- a/gcc/config/arm/cortex-a8-neon.md
++++ b/gcc/config/arm/cortex-a8-neon.md
+@@ -357,30 +357,34 @@
+        (eq_attr "type" "fmuls"))
+   "cortex_a8_vfp,cortex_a8_vfplite*11")
+ 
++;; Don't model a reservation for more than 15 cycles as this explodes the
++;; state space of the automaton for little gain.  It is unlikely that the
++;; scheduler will find enough instructions to hide the full latency of the
++;; instructions.
+ (define_insn_reservation "cortex_a8_vfp_muld" 17
+   (and (eq_attr "tune" "cortexa8")
+        (eq_attr "type" "fmuld"))
+-  "cortex_a8_vfp,cortex_a8_vfplite*16")
++  "cortex_a8_vfp,cortex_a8_vfplite*15")
+ 
+ (define_insn_reservation "cortex_a8_vfp_macs" 21
+   (and (eq_attr "tune" "cortexa8")
+        (eq_attr "type" "fmacs,ffmas"))
+-  "cortex_a8_vfp,cortex_a8_vfplite*20")
++  "cortex_a8_vfp,cortex_a8_vfplite*15")
+ 
+ (define_insn_reservation "cortex_a8_vfp_macd" 26
+   (and (eq_attr "tune" "cortexa8")
+        (eq_attr "type" "fmacd,ffmad"))
+-  "cortex_a8_vfp,cortex_a8_vfplite*25")
++  "cortex_a8_vfp,cortex_a8_vfplite*15")
+ 
+ (define_insn_reservation "cortex_a8_vfp_divs" 37
+   (and (eq_attr "tune" "cortexa8")
+        (eq_attr "type" "fdivs, fsqrts"))
+-  "cortex_a8_vfp,cortex_a8_vfplite*36")
++  "cortex_a8_vfp,cortex_a8_vfplite*15")
+ 
+ (define_insn_reservation "cortex_a8_vfp_divd" 65
+   (and (eq_attr "tune" "cortexa8")
+        (eq_attr "type" "fdivd, fsqrtd"))
+-  "cortex_a8_vfp,cortex_a8_vfplite*64")
++  "cortex_a8_vfp,cortex_a8_vfplite*15")
+ 
+ ;; Comparisons can actually take 7 cycles sometimes instead of four,
+ ;; but given all the other instructions lumped into type=ffarith that
+-- 
+2.7.4
+
-- 
2.7.4
