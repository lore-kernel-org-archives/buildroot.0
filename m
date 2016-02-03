From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 23:17:01 +0100
Subject: [Buildroot] [git commit] binutils: fix .loc processing in xtensa gas
Message-ID: <20160203221710.0B04C80641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7eafaa6f72bba5543c11177c5fe4845196c222fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/bff7436a800eeea92c0c92bd2846b0f2b31947fd/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-xtensa-fix-signedness-of-gas-relocations.patch | 47 ++++++++++
 ...-xtensa-fix-signedness-of-gas-relocations.patch | 99 ++++++++++++++++++++++
 ...-xtensa-fix-signedness-of-gas-relocations.patch | 99 ++++++++++++++++++++++
 3 files changed, 245 insertions(+)

diff --git a/package/binutils/2.23.2/914-xtensa-fix-signedness-of-gas-relocations.patch b/package/binutils/2.23.2/914-xtensa-fix-signedness-of-gas-relocations.patch
new file mode 100644
index 0000000..2955e11
--- /dev/null
+++ b/package/binutils/2.23.2/914-xtensa-fix-signedness-of-gas-relocations.patch
@@ -0,0 +1,47 @@
+From 6c7c5c477ef9ccf2d2548cf2ac3cec9bd3c9c5b6 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 2 Feb 2016 17:11:38 +0300
+Subject: [PATCH] xtensa: fix signedness of gas relocations
+
+Change 1058c7532d0b "Use signed data type for R_XTENSA_DIFF* relocation
+offsets." changed signedness of BFD_RELOC_XTENSA_DIFF* relocations
+substituted for BFD_RELOC_*. This made it impossible to encode arbitrary
+8-, 16- and 32-bit values, which broke e.g. debug info encoding by .loc
+directive. Revert this part and add test.
+
+gas/
+2016-02-03  Max Filippov  <jcmvbkbc@gmail.com>
+	* config/tc-xtensa.c (md_apply_fix): Mark BFD_RELOC_XTENSA_DIFF*
+	substitutions for BFD_RELOC_* as unsigned.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gas/config/tc-xtensa.c           |  6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
+index a119871..36a06cc 100644
+--- a/gas/config/tc-xtensa.c
++++ b/gas/config/tc-xtensa.c
+@@ -5961,15 +5961,15 @@ md_apply_fix (fixS *fixP, valueT *valP, segT seg)
+ 	    {
+ 	    case BFD_RELOC_8:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF8;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    case BFD_RELOC_16:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF16;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    case BFD_RELOC_32:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF32;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    default:
+ 	      break;
+-- 
+2.1.4
+
diff --git a/package/binutils/2.24/914-xtensa-fix-signedness-of-gas-relocations.patch b/package/binutils/2.24/914-xtensa-fix-signedness-of-gas-relocations.patch
new file mode 100644
index 0000000..bd75166
--- /dev/null
+++ b/package/binutils/2.24/914-xtensa-fix-signedness-of-gas-relocations.patch
@@ -0,0 +1,99 @@
+From 6c7c5c477ef9ccf2d2548cf2ac3cec9bd3c9c5b6 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 2 Feb 2016 17:11:38 +0300
+Subject: [PATCH] xtensa: fix signedness of gas relocations
+
+Change 1058c7532d0b "Use signed data type for R_XTENSA_DIFF* relocation
+offsets." changed signedness of BFD_RELOC_XTENSA_DIFF* relocations
+substituted for BFD_RELOC_*. This made it impossible to encode arbitrary
+8-, 16- and 32-bit values, which broke e.g. debug info encoding by .loc
+directive. Revert this part and add test.
+
+gas/
+2016-02-03  Max Filippov  <jcmvbkbc@gmail.com>
+	* config/tc-xtensa.c (md_apply_fix): Mark BFD_RELOC_XTENSA_DIFF*
+	substitutions for BFD_RELOC_* as unsigned.
+
+gas/testsuite/
+2016-02-03  Max Filippov  <jcmvbkbc@gmail.com>
+	* gas/xtensa/all.exp: Add loc to list of xtensa tests.
+	* gas/xtensa/loc.d: New file: loc test result patterns.
+	* gas/xtensa/loc.s: New file: loc test.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gas/config/tc-xtensa.c           |  6 +++---
+ gas/testsuite/gas/xtensa/all.exp |  1 +
+ gas/testsuite/gas/xtensa/loc.d   | 10 ++++++++++
+ gas/testsuite/gas/xtensa/loc.s   |  7 +++++++
+ 4 files changed, 21 insertions(+), 3 deletions(-)
+ create mode 100644 gas/testsuite/gas/xtensa/loc.d
+ create mode 100644 gas/testsuite/gas/xtensa/loc.s
+
+diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
+index a119871..36a06cc 100644
+--- a/gas/config/tc-xtensa.c
++++ b/gas/config/tc-xtensa.c
+@@ -5961,15 +5961,15 @@ md_apply_fix (fixS *fixP, valueT *valP, segT seg)
+ 	    {
+ 	    case BFD_RELOC_8:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF8;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    case BFD_RELOC_16:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF16;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    case BFD_RELOC_32:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF32;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    default:
+ 	      break;
+diff --git a/gas/testsuite/gas/xtensa/all.exp b/gas/testsuite/gas/xtensa/all.exp
+index 31b725b..7ff7bd7 100644
+--- a/gas/testsuite/gas/xtensa/all.exp
++++ b/gas/testsuite/gas/xtensa/all.exp
+@@ -101,6 +101,7 @@ if [istarget xtensa*-*-*] then {
+     run_dump_test "trampoline"
+     run_dump_test "first_frag_align"
+     run_dump_test "auto-litpools"
++    run_dump_test "loc"
+ }
+ 
+ if [info exists errorInfo] then {
+diff --git a/gas/testsuite/gas/xtensa/loc.d b/gas/testsuite/gas/xtensa/loc.d
+new file mode 100644
+index 0000000..71983cc
+--- /dev/null
++++ b/gas/testsuite/gas/xtensa/loc.d
+@@ -0,0 +1,10 @@
++#as:
++#objdump: -r
++#name: .loc directive relocs
++
++.*: +file format .*xtensa.*
++
++RELOCATION RECORDS FOR \[\.debug_line\]:
++#...
++.*R_XTENSA_DIFF16.*\.text\+0x00009c42
++#...
+diff --git a/gas/testsuite/gas/xtensa/loc.s b/gas/testsuite/gas/xtensa/loc.s
+new file mode 100644
+index 0000000..029e14e
+--- /dev/null
++++ b/gas/testsuite/gas/xtensa/loc.s
+@@ -0,0 +1,7 @@
++	.text
++	.file 1 "loc.s"
++	.loc 1 3
++	nop
++	.space 40000
++	.loc 1 5
++	nop
+-- 
+2.1.4
+
diff --git a/package/binutils/2.25.1/914-xtensa-fix-signedness-of-gas-relocations.patch b/package/binutils/2.25.1/914-xtensa-fix-signedness-of-gas-relocations.patch
new file mode 100644
index 0000000..bd75166
--- /dev/null
+++ b/package/binutils/2.25.1/914-xtensa-fix-signedness-of-gas-relocations.patch
@@ -0,0 +1,99 @@
+From 6c7c5c477ef9ccf2d2548cf2ac3cec9bd3c9c5b6 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 2 Feb 2016 17:11:38 +0300
+Subject: [PATCH] xtensa: fix signedness of gas relocations
+
+Change 1058c7532d0b "Use signed data type for R_XTENSA_DIFF* relocation
+offsets." changed signedness of BFD_RELOC_XTENSA_DIFF* relocations
+substituted for BFD_RELOC_*. This made it impossible to encode arbitrary
+8-, 16- and 32-bit values, which broke e.g. debug info encoding by .loc
+directive. Revert this part and add test.
+
+gas/
+2016-02-03  Max Filippov  <jcmvbkbc@gmail.com>
+	* config/tc-xtensa.c (md_apply_fix): Mark BFD_RELOC_XTENSA_DIFF*
+	substitutions for BFD_RELOC_* as unsigned.
+
+gas/testsuite/
+2016-02-03  Max Filippov  <jcmvbkbc@gmail.com>
+	* gas/xtensa/all.exp: Add loc to list of xtensa tests.
+	* gas/xtensa/loc.d: New file: loc test result patterns.
+	* gas/xtensa/loc.s: New file: loc test.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gas/config/tc-xtensa.c           |  6 +++---
+ gas/testsuite/gas/xtensa/all.exp |  1 +
+ gas/testsuite/gas/xtensa/loc.d   | 10 ++++++++++
+ gas/testsuite/gas/xtensa/loc.s   |  7 +++++++
+ 4 files changed, 21 insertions(+), 3 deletions(-)
+ create mode 100644 gas/testsuite/gas/xtensa/loc.d
+ create mode 100644 gas/testsuite/gas/xtensa/loc.s
+
+diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
+index a119871..36a06cc 100644
+--- a/gas/config/tc-xtensa.c
++++ b/gas/config/tc-xtensa.c
+@@ -5961,15 +5961,15 @@ md_apply_fix (fixS *fixP, valueT *valP, segT seg)
+ 	    {
+ 	    case BFD_RELOC_8:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF8;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    case BFD_RELOC_16:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF16;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    case BFD_RELOC_32:
+ 	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF32;
+-	      fixP->fx_signed = 1;
++	      fixP->fx_signed = 0;
+ 	      break;
+ 	    default:
+ 	      break;
+diff --git a/gas/testsuite/gas/xtensa/all.exp b/gas/testsuite/gas/xtensa/all.exp
+index 31b725b..7ff7bd7 100644
+--- a/gas/testsuite/gas/xtensa/all.exp
++++ b/gas/testsuite/gas/xtensa/all.exp
+@@ -101,6 +101,7 @@ if [istarget xtensa*-*-*] then {
+     run_dump_test "trampoline"
+     run_dump_test "first_frag_align"
+     run_dump_test "auto-litpools"
++    run_dump_test "loc"
+ }
+ 
+ if [info exists errorInfo] then {
+diff --git a/gas/testsuite/gas/xtensa/loc.d b/gas/testsuite/gas/xtensa/loc.d
+new file mode 100644
+index 0000000..71983cc
+--- /dev/null
++++ b/gas/testsuite/gas/xtensa/loc.d
+@@ -0,0 +1,10 @@
++#as:
++#objdump: -r
++#name: .loc directive relocs
++
++.*: +file format .*xtensa.*
++
++RELOCATION RECORDS FOR \[\.debug_line\]:
++#...
++.*R_XTENSA_DIFF16.*\.text\+0x00009c42
++#...
+diff --git a/gas/testsuite/gas/xtensa/loc.s b/gas/testsuite/gas/xtensa/loc.s
+new file mode 100644
+index 0000000..029e14e
+--- /dev/null
++++ b/gas/testsuite/gas/xtensa/loc.s
+@@ -0,0 +1,7 @@
++	.text
++	.file 1 "loc.s"
++	.loc 1 3
++	nop
++	.space 40000
++	.loc 1 5
++	nop
+-- 
+2.1.4
+
