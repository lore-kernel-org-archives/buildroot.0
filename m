From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 May 2021 10:37:20 +0200
Subject: [Buildroot] [git commit] package/gcc: add upstream patches that
 introduce -mcmodel=large option for or1k
Message-ID: <20210521081133.BC23481369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8367664f8aea1e962c111df0432014d744fd00f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's add upstream patches introducing -mcmodel=large or1k gcc option that
works in conjunction with previous binutils patch. That option fix binutils
bug 21464[1] allowing to build libgeos with no problem. This way we can
consider buildroot toolchain binutils bug 21464 free.

[1]: https://sourceware.org/bugzilla/show_bug.cgi?id=21464

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: remove the PATCH M/N parts - cfr. check-package]
---
 ...k-Add-mcmodel-option-to-handle-large-GOTs.patch | 200 ++++++++++++++++++++
 ...k-Use-cmodel-large-when-building-crtstuff.patch |  60 ++++++
 ...k-Add-mcmodel-option-to-handle-large-GOTs.patch | 201 +++++++++++++++++++++
 ...k-Use-cmodel-large-when-building-crtstuff.patch |  60 ++++++
 4 files changed, 521 insertions(+)

diff --git a/package/gcc/10.3.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/10.3.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
new file mode 100644
index 0000000000..73010c21ee
--- /dev/null
+++ b/package/gcc/10.3.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
@@ -0,0 +1,200 @@
+From 1dad3f95ffcd1871ca670a13a06fbedb1c3ce509 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:11:44 +0900
+Subject: [PATCH] or1k: Add mcmodel option to handle large GOTs
+
+When building libgeos we get an error with:
+
+    linux-uclibc/9.3.0/crtbeginS.o: in function `__do_global_dtors_aux':
+    crtstuff.c:(.text+0x118): relocation truncated to fit: R_OR1K_GOT16 against symbol `__cxa_finalize' defined in .text section in
+    /home/shorne/work/openrisc/3eb9f9d0f6d8274b2d19753c006bd83f7d536e3c/output/host/or1k-buildroot-linux-uclibc/sysroot/lib/libc.so.
+
+This is caused by GOT code having a limit of 64k.  In OpenRISC this
+looks to be the only relocation code pattern to be limited to 64k.
+
+This patch allows specifying a new option -mcmodel=large which can be
+used to generate 2 more instructions to construct 32-bit addresses for
+up to 4G GOTs.
+
+gcc/ChangeLog:
+
+	PR 99783
+	* config/or1k/or1k-opts.h: New file.
+	* config/or1k/or1k.c (or1k_legitimize_address_1, print_reloc):
+	Support generating gotha relocations if -mcmodel=large is
+	specified.
+	* config/or1k/or1k.h (TARGET_CMODEL_SMALL, TARGET_CMODEL_LARGE):
+	New macros.
+	* config/or1k/or1k.opt (mcmodel=): New option.
+	* doc/invoke.text (OpenRISC Options): Document mcmodel.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ gcc/config/or1k/or1k-opts.h | 30 ++++++++++++++++++++++++++++++
+ gcc/config/or1k/or1k.c      | 11 +++++++++--
+ gcc/config/or1k/or1k.h      |  7 +++++++
+ gcc/config/or1k/or1k.opt    | 19 +++++++++++++++++++
+ gcc/doc/invoke.texi         | 12 +++++++++++-
+ 5 files changed, 76 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/config/or1k/or1k-opts.h
+
+diff --git a/gcc/config/or1k/or1k-opts.h b/gcc/config/or1k/or1k-opts.h
+new file mode 100644
+index 00000000000..f791b894fdd
+--- /dev/null
++++ b/gcc/config/or1k/or1k-opts.h
+@@ -0,0 +1,30 @@
++/* Definitions for option handling for OpenRISC.
++   Copyright (C) 2021 Free Software Foundation, Inc.
++   Contributed by Stafford Horne.
++
++   This file is part of GCC.
++
++   GCC is free software; you can redistribute it and/or modify it
++   under the terms of the GNU General Public License as published
++   by the Free Software Foundation; either version 3, or (at your
++   option) any later version.
++
++   GCC is distributed in the hope that it will be useful, but WITHOUT
++   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
++   License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with GCC; see the file COPYING3.  If not see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef GCC_OR1K_OPTS_H
++#define GCC_OR1K_OPTS_H
++
++/* The OpenRISC code generation models available.  */
++enum or1k_cmodel_type {
++  CMODEL_SMALL,
++  CMODEL_LARGE
++};
++
++#endif /* GCC_OR1K_OPTS_H */
+diff --git a/gcc/config/or1k/or1k.c b/gcc/config/or1k/or1k.c
+index 5fa5425aa2b..88613f9596b 100644
+--- a/gcc/config/or1k/or1k.c
++++ b/gcc/config/or1k/or1k.c
+@@ -750,7 +750,14 @@ or1k_legitimize_address_1 (rtx x, rtx scratch)
+ 	    {
+ 	      base = gen_sym_unspec (base, UNSPEC_GOT);
+ 	      crtl->uses_pic_offset_table = 1;
+-	      t2 = gen_rtx_LO_SUM (Pmode, pic_offset_table_rtx, base);
++	      if (TARGET_CMODEL_LARGE)
++		{
++	          emit_insn (gen_rtx_SET (t1, gen_rtx_HIGH (Pmode, base)));
++	          emit_insn (gen_add3_insn (t1, t1, pic_offset_table_rtx));
++	          t2 = gen_rtx_LO_SUM (Pmode, t1, base);
++		}
++	      else
++	        t2 = gen_rtx_LO_SUM (Pmode, pic_offset_table_rtx, base);
+ 	      t2 = gen_const_mem (Pmode, t2);
+ 	      emit_insn (gen_rtx_SET (t1, t2));
+ 	      base = t1;
+@@ -1089,7 +1096,7 @@ print_reloc (FILE *stream, rtx x, HOST_WIDE_INT add, reloc_kind kind)
+      no special markup.  */
+   static const char * const relocs[RKIND_MAX][RTYPE_MAX] = {
+     { "lo", "got", "gotofflo", "tpofflo", "gottpofflo", "tlsgdlo" },
+-    { "ha", NULL,  "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
++    { "ha", "gotha", "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
+   };
+   reloc_type type = RTYPE_DIRECT;
+ 
+diff --git a/gcc/config/or1k/or1k.h b/gcc/config/or1k/or1k.h
+index 23db771d8fb..f1646d16dfd 100644
+--- a/gcc/config/or1k/or1k.h
++++ b/gcc/config/or1k/or1k.h
+@@ -21,6 +21,8 @@
+ #ifndef GCC_OR1K_H
+ #define GCC_OR1K_H
+ 
++#include "config/or1k/or1k-opts.h"
++
+ /* Names to predefine in the preprocessor for this target machine.  */
+ #define TARGET_CPU_CPP_BUILTINS()		\
+   do						\
+@@ -35,6 +37,11 @@
+     }						\
+   while (0)
+ 
++#define TARGET_CMODEL_SMALL \
++  (or1k_code_model == CMODEL_SMALL)
++#define TARGET_CMODEL_LARGE \
++  (or1k_code_model == CMODEL_LARGE)
++
+ /* Storage layout.  */
+ 
+ #define DEFAULT_SIGNED_CHAR 1
+diff --git a/gcc/config/or1k/or1k.opt b/gcc/config/or1k/or1k.opt
+index 03c9b8d0bba..8e035075f8a 100644
+--- a/gcc/config/or1k/or1k.opt
++++ b/gcc/config/or1k/or1k.opt
+@@ -21,6 +21,9 @@
+ ; See the GCC internals manual (options.texi) for a description of
+ ; this file's format.
+ 
++HeaderInclude
++config/or1k/or1k-opts.h
++
+ mhard-div
+ Target RejectNegative InverseMask(SOFT_DIV)
+ Enable generation of hardware divide (l.div, l.divu) instructions.  This is the
+@@ -63,6 +66,22 @@ When -mhard-float is selected, enables generation of unordered floating point
+ compare and set flag (lf.sfun*) instructions.  By default functions from libgcc
+ are used to perform unordered floating point compare and set flag operations.
+ 
++mcmodel=
++Target RejectNegative Joined Enum(or1k_cmodel_type) Var(or1k_code_model) Init(CMODEL_SMALL)
++Specify the code model used for accessing memory addresses.  Specifying large
++enables generating binaries with large global offset tables.  By default the
++value is small.
++
++Enum
++Name(or1k_cmodel_type) Type(enum or1k_cmodel_type)
++Known code model types (for use with the -mcmodel= option):
++
++EnumValue
++Enum(or1k_cmodel_type) String(small) Value(CMODEL_SMALL)
++
++EnumValue
++Enum(or1k_cmodel_type) String(large) Value(CMODEL_LARGE)
++
+ mcmov
+ Target RejectNegative Mask(CMOV)
+ Enable generation of conditional move (l.cmov) instructions.  By default the
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index eabeec944e7..eda350c99ec 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -1102,7 +1102,8 @@ Objective-C and Objective-C++ Dialects}.
+ @gccoptlist{-mboard=@var{name}  -mnewlib  -mhard-mul  -mhard-div @gol
+ -msoft-mul  -msoft-div @gol
+ -msoft-float  -mhard-float  -mdouble-float -munordered-float @gol
+--mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm}
++-mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm @gol
++-mcmodel=@var{code-model}}
+ 
+ @emph{PDP-11 Options}
+ @gccoptlist{-mfpu  -msoft-float  -mac0  -mno-ac0  -m40  -m45  -m10 @gol
+@@ -25111,6 +25112,15 @@ Enable generation of shift with immediate (@code{l.srai}, @code{l.srli},
+ @code{l.slli}) instructions.  By default extra instructions will be generated
+ to store the immediate to a register first.
+ 
++ at item -mcmodel=small
++ at opindex mcmodel=small
++Generate OpenRISC code for the small model: The GOT is limited to 64k. This is
++the default model.
++
++ at item -mcmodel=large
++ at opindex mcmodel=large
++Generate OpenRISC code for the large model: The GOT may grow up to 4G in size.
++
+ 
+ @end table
+ 
+-- 
+2.25.1
+
diff --git a/package/gcc/10.3.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/10.3.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
new file mode 100644
index 0000000000..7da0e8f757
--- /dev/null
+++ b/package/gcc/10.3.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
@@ -0,0 +1,60 @@
+From 0354e007a6235df81e208fa89cbf1571a8b56975 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:11:45 +0900
+Subject: [PATCH] or1k: Use cmodel=large when building crtstuff
+
+When linking gcc runtime objects into large binaries the link may fail
+with the below errors.  This will happen even if we are building with
+-mcmodel=large.
+
+    /home/shorne/work/openrisc/output/host/lib/gcc/or1k-buildroot-linux-uclibc/10.3.0/crtbeginS.o: in function `deregister_tm_clones':
+    crtstuff.c:(.text+0x3c): relocation truncated to fit: R_OR1K_GOT16 against undefined symbol `_ITM_deregisterTMCloneTable'
+    /home/shorne/work/openrisc/output/host/lib/gcc/or1k-buildroot-linux-uclibc/10.3.0/crtbeginS.o: in function `register_tm_clones':
+    crtstuff.c:(.text+0xc0): relocation truncated to fit: R_OR1K_GOT16 against undefined symbol `_ITM_registerTMCloneTable'
+
+This patch builds the gcc crtstuff binaries always with the
+-mcmodel=large option to ensure they can be linked into large binaries.
+
+libgcc/ChangeLog:
+
+	PR 99783
+	* config.host (or1k-*, tmake_file): Add or1k/t-crtstuff.
+	* config/or1k/t-crtstuff: New file.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ libgcc/config.host            | 4 ++--
+ libgcc/config/or1k/t-crtstuff | 2 ++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+ create mode 100644 libgcc/config/or1k/t-crtstuff
+
+diff --git a/libgcc/config.host b/libgcc/config.host
+index c529cc40f0c..ddf0033e28c 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -1127,12 +1127,12 @@ nios2-*-*)
+ 	extra_parts="$extra_parts crti.o crtn.o"
+ 	;;
+ or1k-*-linux*)
+-	tmake_file="$tmake_file or1k/t-or1k"
++	tmake_file="$tmake_file or1k/t-or1k or1k/t-crtstuff"
+ 	tmake_file="$tmake_file t-softfp-sfdf t-softfp"
+ 	md_unwind_header=or1k/linux-unwind.h
+ 	;;
+ or1k-*-*)
+-	tmake_file="$tmake_file or1k/t-or1k"
++	tmake_file="$tmake_file or1k/t-or1k or1k/t-crtstuff"
+ 	tmake_file="$tmake_file t-softfp-sfdf t-softfp"
+ 	;;
+ pdp11-*-*)
+diff --git a/libgcc/config/or1k/t-crtstuff b/libgcc/config/or1k/t-crtstuff
+new file mode 100644
+index 00000000000..dcae7f3498e
+--- /dev/null
++++ b/libgcc/config/or1k/t-crtstuff
+@@ -0,0 +1,2 @@
++# Compile crtbeginS.o and crtendS.o with -mcmodel=large
++CRTSTUFF_T_CFLAGS_S += -mcmodel=large
+-- 
+2.25.1
+
diff --git a/package/gcc/9.3.0/0006-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/9.3.0/0006-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
new file mode 100644
index 0000000000..60dd7f78ea
--- /dev/null
+++ b/package/gcc/9.3.0/0006-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
@@ -0,0 +1,201 @@
+From 1af3ab7fc3e4f2ae835c976486e8af0762674af3 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:11:44 +0900
+Subject: [PATCH] or1k: Add mcmodel option to handle large GOTs
+
+When building libgeos we get an error with:
+
+    linux-uclibc/9.3.0/crtbeginS.o: in function `__do_global_dtors_aux':
+    crtstuff.c:(.text+0x118): relocation truncated to fit: R_OR1K_GOT16 against symbol `__cxa_finalize' defined in .text section in
+    /home/shorne/work/openrisc/3eb9f9d0f6d8274b2d19753c006bd83f7d536e3c/output/host/or1k-buildroot-linux-uclibc/sysroot/lib/libc.so.
+
+This is caused by GOT code having a limit of 64k.  In OpenRISC this
+looks to be the only relocation code pattern to be limited to 64k.
+
+This patch allows specifying a new option -mcmodel=large which can be
+used to generate 2 more instructions to construct 32-bit addresses for
+up to 4G GOTs.
+
+gcc/ChangeLog:
+
+	PR 99783
+	* config/or1k/or1k-opts.h: New file.
+	* config/or1k/or1k.c (or1k_legitimize_address_1, print_reloc):
+	Support generating gotha relocations if -mcmodel=large is
+	specified.
+	* config/or1k/or1k.h (TARGET_CMODEL_SMALL, TARGET_CMODEL_LARGE):
+	New macros.
+	* config/or1k/or1k.opt (mcmodel=): New option.
+	* doc/invoke.text (OpenRISC Options): Document mcmodel.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ gcc/config/or1k/or1k-opts.h | 30 ++++++++++++++++++++++++++++++
+ gcc/config/or1k/or1k.c      | 11 +++++++++--
+ gcc/config/or1k/or1k.h      |  7 +++++++
+ gcc/config/or1k/or1k.opt    | 19 +++++++++++++++++++
+ gcc/doc/invoke.texi         | 13 ++++++++++++-
+ 5 files changed, 77 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/config/or1k/or1k-opts.h
+
+diff --git a/gcc/config/or1k/or1k-opts.h b/gcc/config/or1k/or1k-opts.h
+new file mode 100644
+index 00000000000..f791b894fdd
+--- /dev/null
++++ b/gcc/config/or1k/or1k-opts.h
+@@ -0,0 +1,30 @@
++/* Definitions for option handling for OpenRISC.
++   Copyright (C) 2021 Free Software Foundation, Inc.
++   Contributed by Stafford Horne.
++
++   This file is part of GCC.
++
++   GCC is free software; you can redistribute it and/or modify it
++   under the terms of the GNU General Public License as published
++   by the Free Software Foundation; either version 3, or (at your
++   option) any later version.
++
++   GCC is distributed in the hope that it will be useful, but WITHOUT
++   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
++   License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with GCC; see the file COPYING3.  If not see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef GCC_OR1K_OPTS_H
++#define GCC_OR1K_OPTS_H
++
++/* The OpenRISC code generation models available.  */
++enum or1k_cmodel_type {
++  CMODEL_SMALL,
++  CMODEL_LARGE
++};
++
++#endif /* GCC_OR1K_OPTS_H */
+diff --git a/gcc/config/or1k/or1k.c b/gcc/config/or1k/or1k.c
+index fc10fcfabde..df67d72b139 100644
+--- a/gcc/config/or1k/or1k.c
++++ b/gcc/config/or1k/or1k.c
+@@ -750,7 +750,14 @@ or1k_legitimize_address_1 (rtx x, rtx scratch)
+ 	    {
+ 	      base = gen_sym_unspec (base, UNSPEC_GOT);
+ 	      crtl->uses_pic_offset_table = 1;
+-	      t2 = gen_rtx_LO_SUM (Pmode, pic_offset_table_rtx, base);
++	      if (TARGET_CMODEL_LARGE)
++		{
++	          emit_insn (gen_rtx_SET (t1, gen_rtx_HIGH (Pmode, base)));
++	          emit_insn (gen_add3_insn (t1, t1, pic_offset_table_rtx));
++	          t2 = gen_rtx_LO_SUM (Pmode, t1, base);
++		}
++	      else
++	        t2 = gen_rtx_LO_SUM (Pmode, pic_offset_table_rtx, base);
+ 	      t2 = gen_const_mem (Pmode, t2);
+ 	      emit_insn (gen_rtx_SET (t1, t2));
+ 	      base = t1;
+@@ -1097,7 +1104,7 @@ print_reloc (FILE *stream, rtx x, HOST_WIDE_INT add, reloc_kind kind)
+      no special markup.  */
+   static const char * const relocs[RKIND_MAX][RTYPE_MAX] = {
+     { "lo", "got", "gotofflo", "tpofflo", "gottpofflo", "tlsgdlo" },
+-    { "ha", NULL,  "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
++    { "ha", "gotha", "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
+   };
+   reloc_type type = RTYPE_DIRECT;
+ 
+diff --git a/gcc/config/or1k/or1k.h b/gcc/config/or1k/or1k.h
+index 6dda230f217..858f30743b7 100644
+--- a/gcc/config/or1k/or1k.h
++++ b/gcc/config/or1k/or1k.h
+@@ -21,6 +21,8 @@
+ #ifndef GCC_OR1K_H
+ #define GCC_OR1K_H
+ 
++#include "config/or1k/or1k-opts.h"
++
+ /* Names to predefine in the preprocessor for this target machine.  */
+ #define TARGET_CPU_CPP_BUILTINS()		\
+   do						\
+@@ -35,6 +37,11 @@
+     }						\
+   while (0)
+ 
++#define TARGET_CMODEL_SMALL \
++  (or1k_code_model == CMODEL_SMALL)
++#define TARGET_CMODEL_LARGE \
++  (or1k_code_model == CMODEL_LARGE)
++
+ /* Storage layout.  */
+ 
+ #define DEFAULT_SIGNED_CHAR 1
+diff --git a/gcc/config/or1k/or1k.opt b/gcc/config/or1k/or1k.opt
+index 7bdbd842dd4..116524c3441 100644
+--- a/gcc/config/or1k/or1k.opt
++++ b/gcc/config/or1k/or1k.opt
+@@ -23,6 +23,9 @@
+ 
+ ; Please try to keep this file in ASCII collating order.
+ 
++HeaderInclude
++config/or1k/or1k-opts.h
++
+ mhard-div
+ Target RejectNegative InverseMask(SOFT_DIV)
+ Use hardware divide instructions, use -msoft-div for emulation.
+@@ -31,6 +34,22 @@ mhard-mul
+ Target RejectNegative InverseMask(SOFT_MUL).
+ Use hardware multiply instructions, use -msoft-mul for emulation.
+ 
++mcmodel=
++Target RejectNegative Joined Enum(or1k_cmodel_type) Var(or1k_code_model) Init(CMODEL_SMALL)
++Specify the code model used for accessing memory addresses.  Specifying large
++enables generating binaries with large global offset tables.  By default the
++value is small.
++
++Enum
++Name(or1k_cmodel_type) Type(enum or1k_cmodel_type)
++Known code model types (for use with the -mcmodel= option):
++
++EnumValue
++Enum(or1k_cmodel_type) String(small) Value(CMODEL_SMALL)
++
++EnumValue
++Enum(or1k_cmodel_type) String(large) Value(CMODEL_LARGE)
++
+ mcmov
+ Target RejectNegative Mask(CMOV)
+ Allows generation of binaries which use the l.cmov instruction.  If your target
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index 0ab6c9c6449..0904b2b5a41 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -1030,7 +1030,9 @@ Objective-C and Objective-C++ Dialects}.
+ @emph{OpenRISC Options}
+ @gccoptlist{-mboard=@var{name}  -mnewlib  -mhard-mul  -mhard-div @gol
+ -msoft-mul  -msoft-div @gol
+--mcmov  -mror  -msext  -msfimm  -mshftimm}
++-mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm @gol
++-mcmodel=@var{code-model}}
++
+ 
+ @emph{PDP-11 Options}
+ @gccoptlist{-mfpu  -msoft-float  -mac0  -mno-ac0  -m40  -m45  -m10 @gol
+@@ -27408,6 +27410,15 @@ MWAITX, SHA, CLZERO, AES, PCL_MUL, CX16, MOVBE, MMX, SSE, SSE2, SSE3, SSE4A,
+ SSSE3, SSE4.1, SSE4.2, ABM, XSAVEC, XSAVES, CLFLUSHOPT, POPCNT, and 64-bit
+ instruction set extensions.)
+ 
++ at item -mcmodel=small
++ at opindex mcmodel=small
++Generate OpenRISC code for the small model: The GOT is limited to 64k. This is
++the default model.
++
++ at item -mcmodel=large
++ at opindex mcmodel=large
++Generate OpenRISC code for the large model: The GOT may grow up to 4G in size.
++
+ 
+ @item btver1
+ CPUs based on AMD Family 14h cores with x86-64 instruction set support.  (This
+-- 
+2.25.1
+
diff --git a/package/gcc/9.3.0/0007-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/9.3.0/0007-or1k-Use-cmodel-large-when-building-crtstuff.patch
new file mode 100644
index 0000000000..673847fd88
--- /dev/null
+++ b/package/gcc/9.3.0/0007-or1k-Use-cmodel-large-when-building-crtstuff.patch
@@ -0,0 +1,60 @@
+From b540f7b916ba7cf2059b84c5cc8d08c67ebe9a0b Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:11:45 +0900
+Subject: [PATCH] or1k: Use cmodel=large when building crtstuff
+
+When linking gcc runtime objects into large binaries the link may fail
+with the below errors.  This will happen even if we are building with
+-mcmodel=large.
+
+    /home/shorne/work/openrisc/output/host/lib/gcc/or1k-buildroot-linux-uclibc/10.3.0/crtbeginS.o: in function `deregister_tm_clones':
+    crtstuff.c:(.text+0x3c): relocation truncated to fit: R_OR1K_GOT16 against undefined symbol `_ITM_deregisterTMCloneTable'
+    /home/shorne/work/openrisc/output/host/lib/gcc/or1k-buildroot-linux-uclibc/10.3.0/crtbeginS.o: in function `register_tm_clones':
+    crtstuff.c:(.text+0xc0): relocation truncated to fit: R_OR1K_GOT16 against undefined symbol `_ITM_registerTMCloneTable'
+
+This patch builds the gcc crtstuff binaries always with the
+-mcmodel=large option to ensure they can be linked into large binaries.
+
+libgcc/ChangeLog:
+
+	PR 99783
+	* config.host (or1k-*, tmake_file): Add or1k/t-crtstuff.
+	* config/or1k/t-crtstuff: New file.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ libgcc/config.host            | 4 ++--
+ libgcc/config/or1k/t-crtstuff | 2 ++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+ create mode 100644 libgcc/config/or1k/t-crtstuff
+
+diff --git a/libgcc/config.host b/libgcc/config.host
+index 0f15fda3612..0c21d384e6f 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -1051,12 +1051,12 @@ nios2-*-*)
+ 	extra_parts="$extra_parts crti.o crtn.o"
+ 	;;
+ or1k-*-linux*)
+-	tmake_file="$tmake_file or1k/t-or1k"
++	tmake_file="$tmake_file or1k/t-or1k or1k/t-crtstuff"
+ 	tmake_file="$tmake_file t-softfp-sfdf t-softfp"
+ 	md_unwind_header=or1k/linux-unwind.h
+ 	;;
+ or1k-*-*)
+-	tmake_file="$tmake_file or1k/t-or1k"
++	tmake_file="$tmake_file or1k/t-or1k or1k/t-crtstuff"
+ 	tmake_file="$tmake_file t-softfp-sfdf t-softfp"
+ 	;;
+ pdp11-*-*)
+diff --git a/libgcc/config/or1k/t-crtstuff b/libgcc/config/or1k/t-crtstuff
+new file mode 100644
+index 00000000000..dcae7f3498e
+--- /dev/null
++++ b/libgcc/config/or1k/t-crtstuff
+@@ -0,0 +1,2 @@
++# Compile crtbeginS.o and crtendS.o with -mcmodel=large
++CRTSTUFF_T_CFLAGS_S += -mcmodel=large
+-- 
+2.25.1
+
