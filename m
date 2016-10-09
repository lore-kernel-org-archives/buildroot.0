From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 13:59:29 +0200
Subject: [Buildroot] [git commit] package/gcc: nios2 Backport nios2 r31 fix
Message-ID: <20161009120520.40A8981844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=840b7bca0051a5f1dd07f3d6bdf66be06247611c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported on the mailing list, gcc5 with binutils 2.26.1 produce some
assembler error "r31 cannot be used with jmp; use ret instead" [1]

The bug is reported upstream [2], but gcc 5.4 needs an upstream patch to
fix this issue.

Note: openembedded backported the same patch for gcc 5.3 [3]

Fixes:

alsa-lib:
http://autobuild.buildroot.net/results/1fc9806a62b813b085c39d36000f4d9d18f779df
http://autobuild.buildroot.net/results/03eb11b6a783da1985c19858f6c5f69027e0ed9c
http://autobuild.buildroot.net/results/d620812ae79c4e8252d2b0c410f94e9cdcbcfbc3
http://autobuild.buildroot.net/results/04b7609f5decc71bf25e981f14756029715fc621
http://autobuild.buildroot.net/results/e85be7ffd62e7ab95c4dd0049b0c67ae98f75543

freeswitch:
http://autobuild.buildroot.net/results/96f69b7be1978f85271e2827c2e18d4ed8de8dfc

flac:
http://autobuild.buildroot.net/results/fb3/fb36a9939cac82dc187b64fae93720ea1930f343

libmodplug:
http://autobuild.buildroot.net/results/f12/f12a5d5b4f5338438fbb053ec013e69559eaaa0c

[1] http://lists.busybox.net/pipermail/buildroot/2016-September/172932.html
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=20674
[3] http://lists.openembedded.org/pipermail/openembedded-core/2016-February/117633.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../5.4.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch   | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/package/gcc/5.4.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch b/package/gcc/5.4.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch
new file mode 100644
index 0000000..7a8c843
--- /dev/null
+++ b/package/gcc/5.4.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch
@@ -0,0 +1,103 @@
+From 920a898d2a04933c13eb808a513bc5822e91f70a Mon Sep 17 00:00:00 2001
+From: sandra <sandra@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 12 May 2015 15:57:22 +0000
+Subject: [PATCH] gcc/nios2: Add IJMP_REGS enum
+
+2015-05-12  Chung-Lin Tang  <cltang@codesourcery.com>
+	    Sandra Loosemore <sandra@codesourcery.com>
+
+	gcc/
+	* config/nios2/nios2.h (enum reg_class): Add IJMP_REGS enum
+	value.
+	(REG_CLASS_NAMES): Add "IJMP_REGS".
+	(REG_CLASS_CONTENTS): Add new entry for IJMP_REGS.
+	* config/nios2/nios2.md (indirect_jump,*tablejump): Adjust to
+	use new "c" register constraint.
+	* config/nios2/constraint.md (c): New register constraint
+	corresponding to IJMP_REGS.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223082 138bc75d-0d04-0410-961f-82ee72b054a4
+
+[Romain: rebase on gcc 5.4]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/nios2/constraints.md |  3 +++
+ gcc/config/nios2/nios2.h        | 11 +++++++----
+ gcc/config/nios2/nios2.md       |  4 ++--
+ 3 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/gcc/config/nios2/constraints.md b/gcc/config/nios2/constraints.md
+index f4bd9f7..735f892 100644
+--- a/gcc/config/nios2/constraints.md
++++ b/gcc/config/nios2/constraints.md
+@@ -39,6 +39,9 @@
+ 
+ ;; Register constraints
+ 
++(define_register_constraint "c" "IJMP_REGS"
++  "A register suitable for an indirect jump.")
++
+ (define_register_constraint "j" "SIB_REGS"
+   "A register suitable for an indirect sibcall.")
+ 
+diff --git a/gcc/config/nios2/nios2.h b/gcc/config/nios2/nios2.h
+index 117983d..7c329ae 100644
+--- a/gcc/config/nios2/nios2.h
++++ b/gcc/config/nios2/nios2.h
+@@ -173,6 +173,7 @@ enum reg_class
+ {
+   NO_REGS,
+   SIB_REGS,
++  IJMP_REGS,
+   GP_REGS,
+   ALL_REGS,
+   LIM_REG_CLASSES
+@@ -183,6 +184,7 @@ enum reg_class
+ #define REG_CLASS_NAMES   \
+   {  "NO_REGS",		  \
+      "SIB_REGS",	  \
++     "IJMP_REGS",	  \
+      "GP_REGS",           \
+      "ALL_REGS" }
+ 
+@@ -190,10 +192,11 @@ enum reg_class
+ 
+ #define REG_CLASS_CONTENTS			\
+   {						\
+-    /* NO_REGS  */ { 0, 0},			\
+-    /* SIB_REGS */ { 0xfe0c, 0},		\
+-    /* GP_REGS  */ {~0, 0},			\
+-    /* ALL_REGS */ {~0,~0}			\
++    /* NO_REGS    */ { 0, 0},			\
++    /* SIB_REGS   */ { 0xfe0c, 0},		\
++    /* IJMP_REGS  */ { 0x7fffffff, 0},		\
++    /* GP_REGS    */ {~0, 0},			\
++    /* ALL_REGS   */ {~0,~0}			\
+   }
+ 
+ 
+diff --git a/gcc/config/nios2/nios2.md b/gcc/config/nios2/nios2.md
+index 7b35d269..36ef101 100644
+--- a/gcc/config/nios2/nios2.md
++++ b/gcc/config/nios2/nios2.md
+@@ -697,7 +697,7 @@
+ ; check or adjust for overflow.
+ 
+ (define_insn "indirect_jump"
+-  [(set (pc) (match_operand:SI 0 "register_operand" "r"))]
++  [(set (pc) (match_operand:SI 0 "register_operand" "c"))]
+   ""
+   "jmp\\t%0"
+   [(set_attr "type" "control")])
+@@ -811,7 +811,7 @@
+ 
+ (define_insn "*tablejump"
+   [(set (pc)
+-        (match_operand:SI 0 "register_operand" "r"))
++        (match_operand:SI 0 "register_operand" "c"))
+    (use (label_ref (match_operand 1 "" "")))]
+   ""
+   "jmp\\t%0"
+-- 
+2.5.5
+
