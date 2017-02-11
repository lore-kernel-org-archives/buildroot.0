From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 11 Feb 2017 23:47:14 +0100
Subject: [Buildroot] [PATCH for-master] package/gdb: backport uptream fix
	for simulator build issue with bfin
Message-ID: <20170211224714.1277-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This revert the commit [1] which break the simulator for aarch64.
Backport the upstream fix instead (from 7.12).

[1] f71ad71f24fbeca1a81cc9efe79016a7db6f1320

Tested with gcc 4.4.5 (debian squeeze chroot).

Fixes:
http://autobuild.buildroot.net/results/cfd/cfdc9117fef7ecdf5cc5fc907a6fe8701a2c174a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Revert-sim-unify-SIM_CPU-definition.patch | 355 ---------------------
 ...lit-out-common-mach-model-defines-into-ar.patch | 151 +++++++++
 2 files changed, 151 insertions(+), 355 deletions(-)
 delete mode 100644 package/gdb/7.11.1/0001-Revert-sim-unify-SIM_CPU-definition.patch
 create mode 100644 package/gdb/7.11.1/0001-sim-bfin-split-out-common-mach-model-defines-into-ar.patch

diff --git a/package/gdb/7.11.1/0001-Revert-sim-unify-SIM_CPU-definition.patch b/package/gdb/7.11.1/0001-Revert-sim-unify-SIM_CPU-definition.patch
deleted file mode 100644
index 8a8eece..0000000
--- a/package/gdb/7.11.1/0001-Revert-sim-unify-SIM_CPU-definition.patch
+++ /dev/null
@@ -1,355 +0,0 @@
-From 77080d5f7fd47dd567f22807d336bc9111f93d7b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 4 Aug 2016 23:44:24 +0200
-Subject: [PATCH] Revert "sim: unify SIM_CPU definition"
-
-This reverts commit 20bca71d82598a015de0991196e45f0b5f7ead81.
-
-This change causes a redefinition of SIM_CPU on the Blackfin
-architecture, as it is defined in both the common sim/common/sim-base.h
-and the architecture specific sim/bfin/sim-main.h.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- sim/arm/sim-main.h        | 3 +++
- sim/avr/sim-main.h        | 2 ++
- sim/bfin/sim-main.h       | 2 --
- sim/common/sim-base.h     | 2 --
- sim/cr16/sim-main.h       | 2 ++
- sim/cris/sim-main.h       | 3 +++
- sim/d10v/sim-main.h       | 2 ++
- sim/frv/sim-main.h        | 3 +++
- sim/ft32/sim-main.h       | 2 ++
- sim/h8300/sim-main.h      | 3 +++
- sim/iq2000/sim-main.h     | 3 +++
- sim/lm32/sim-main.h       | 3 +++
- sim/m32r/sim-main.h       | 3 +++
- sim/m68hc11/sim-main.h    | 3 +++
- sim/mcore/sim-main.h      | 2 ++
- sim/microblaze/sim-main.h | 3 +++
- sim/mips/sim-main.h       | 3 +++
- sim/mn10300/sim-main.h    | 2 ++
- sim/moxie/sim-main.h      | 3 +++
- sim/msp430/sim-main.h     | 3 +++
- sim/sh/sim-main.h         | 3 +++
- sim/sh64/sim-main.h       | 3 +++
- sim/v850/sim-main.h       | 3 +++
- 23 files changed, 57 insertions(+), 4 deletions(-)
-
-diff --git a/sim/arm/sim-main.h b/sim/arm/sim-main.h
-index 3620810..f644122 100644
---- a/sim/arm/sim-main.h
-+++ b/sim/arm/sim-main.h
-@@ -20,6 +20,9 @@
- #define SIM_MAIN_H
- 
- #include "sim-basics.h"
-+
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- #include "bfd.h"
- 
-diff --git a/sim/avr/sim-main.h b/sim/avr/sim-main.h
-index 47155e3..cd41045 100644
---- a/sim/avr/sim-main.h
-+++ b/sim/avr/sim-main.h
-@@ -21,6 +21,8 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
- #include "sim-basics.h"
- 
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- 
- struct _sim_cpu {
-diff --git a/sim/bfin/sim-main.h b/sim/bfin/sim-main.h
-index 51fb87e..cf1ed57 100644
---- a/sim/bfin/sim-main.h
-+++ b/sim/bfin/sim-main.h
-@@ -24,8 +24,6 @@
- #include "sim-basics.h"
- #include "sim-signal.h"
- 
--/* TODO: Delete this.  Need to convert bu32/etc... to common sim types
--         and unwind the bfin-sim.h/machs.h include below first though.  */
- typedef struct _sim_cpu SIM_CPU;
- 
- #include "bfin-sim.h"
-diff --git a/sim/common/sim-base.h b/sim/common/sim-base.h
-index 350b352..1b849f4 100644
---- a/sim/common/sim-base.h
-+++ b/sim/common/sim-base.h
-@@ -72,8 +72,6 @@ typedef address_word sim_cia;
- #define INVALID_INSTRUCTION_ADDRESS ((address_word)0 - 1)
- #endif
- 
--/* TODO: Probably should just delete SIM_CPU.  */
--typedef struct _sim_cpu SIM_CPU;
- typedef struct _sim_cpu sim_cpu;
- 
- #include "sim-module.h"
-diff --git a/sim/cr16/sim-main.h b/sim/cr16/sim-main.h
-index 208f917..78e3996 100644
---- a/sim/cr16/sim-main.h
-+++ b/sim/cr16/sim-main.h
-@@ -24,6 +24,8 @@
- typedef long int           word;
- typedef unsigned long int  uword;
- 
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- #include "bfd.h"
- 
-diff --git a/sim/cris/sim-main.h b/sim/cris/sim-main.h
-index 8aab970..0ff907f 100644
---- a/sim/cris/sim-main.h
-+++ b/sim/cris/sim-main.h
-@@ -29,6 +29,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
-    one of -scache/-pbb.  */
- #define WITH_SCACHE_PBB 1
- 
-+struct _sim_cpu;
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "symcat.h"
- #include "sim-basics.h"
- #include "cgen-types.h"
-diff --git a/sim/d10v/sim-main.h b/sim/d10v/sim-main.h
-index 76f06d8..fd5bd51 100644
---- a/sim/d10v/sim-main.h
-+++ b/sim/d10v/sim-main.h
-@@ -24,6 +24,8 @@
- typedef long int           word;
- typedef unsigned long int  uword;
- 
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- #include "bfd.h"
- 
-diff --git a/sim/frv/sim-main.h b/sim/frv/sim-main.h
-index f95c1cc..701e208 100644
---- a/sim/frv/sim-main.h
-+++ b/sim/frv/sim-main.h
-@@ -19,6 +19,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
- /* Main header for the frv.  */
- 
-+struct _sim_cpu; /* FIXME: should be in sim-basics.h */
-+typedef struct _sim_cpu SIM_CPU;
-+
- /* sim-basics.h includes config.h but cgen-types.h must be included before
-    sim-basics.h and cgen-types.h needs config.h.  */
- #include "config.h"
-diff --git a/sim/ft32/sim-main.h b/sim/ft32/sim-main.h
-index a15b247..eef0201 100644
---- a/sim/ft32/sim-main.h
-+++ b/sim/ft32/sim-main.h
-@@ -25,6 +25,8 @@
- #include "sim-base.h"
- #include "bfd.h"
- 
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "ft32-sim.h"
- 
- struct _sim_cpu {
-diff --git a/sim/h8300/sim-main.h b/sim/h8300/sim-main.h
-index 6dbc1ac..e95c4d9 100644
---- a/sim/h8300/sim-main.h
-+++ b/sim/h8300/sim-main.h
-@@ -87,6 +87,9 @@ enum h8_typecodes {
- };
- 
- #include "sim-basics.h"
-+
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- 
- /* Structure used to describe addressing */
-diff --git a/sim/iq2000/sim-main.h b/sim/iq2000/sim-main.h
-index 829f9bb..a770dc5 100644
---- a/sim/iq2000/sim-main.h
-+++ b/sim/iq2000/sim-main.h
-@@ -4,6 +4,9 @@
- #ifndef SIM_MAIN_H
- #define SIM_MAIN_H
- 
-+struct _sim_cpu; /* FIXME: should be in sim-basics.h */
-+typedef struct _sim_cpu SIM_CPU;
-+
- /* sim-basics.h includes config.h but cgen-types.h must be included before
-    sim-basics.h and cgen-types.h needs config.h.  */
- #include "config.h"
-diff --git a/sim/lm32/sim-main.h b/sim/lm32/sim-main.h
-index 20e2b71..eeffde3 100644
---- a/sim/lm32/sim-main.h
-+++ b/sim/lm32/sim-main.h
-@@ -25,6 +25,9 @@
- 
- #define WITH_SCACHE_PBB 1
- 
-+struct _sim_cpu;		/* FIXME: should be in sim-basics.h */
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "symcat.h"
- #include "sim-basics.h"
- #include "cgen-types.h"
-diff --git a/sim/m32r/sim-main.h b/sim/m32r/sim-main.h
-index 5b24ce8..39f7ecc 100644
---- a/sim/m32r/sim-main.h
-+++ b/sim/m32r/sim-main.h
-@@ -8,6 +8,9 @@
-    one of -scache/-pbb.  */
- #define WITH_SCACHE_PBB 1
- 
-+struct _sim_cpu; /* FIXME: should be in sim-basics.h */
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "symcat.h"
- #include "sim-basics.h"
- #include "cgen-types.h"
-diff --git a/sim/m68hc11/sim-main.h b/sim/m68hc11/sim-main.h
-index b940df7..0aa096f 100644
---- a/sim/m68hc11/sim-main.h
-+++ b/sim/m68hc11/sim-main.h
-@@ -21,6 +21,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- #define _SIM_MAIN_H
- 
- #include "sim-basics.h"
-+
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-signal.h"
- #include "sim-base.h"
- 
-diff --git a/sim/mcore/sim-main.h b/sim/mcore/sim-main.h
-index fce26e8..fa7ee9f 100644
---- a/sim/mcore/sim-main.h
-+++ b/sim/mcore/sim-main.h
-@@ -24,6 +24,8 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- typedef long int           word;
- typedef unsigned long int  uword;
- 
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- #include "bfd.h"
- 
-diff --git a/sim/microblaze/sim-main.h b/sim/microblaze/sim-main.h
-index 3a7b088..9e6bf01 100644
---- a/sim/microblaze/sim-main.h
-+++ b/sim/microblaze/sim-main.h
-@@ -20,6 +20,9 @@
- 
- #include "microblaze.h"
- #include "sim-basics.h"
-+
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- 
- /* The machine state.
-diff --git a/sim/mips/sim-main.h b/sim/mips/sim-main.h
-index 0ea1234..eedbfc9 100644
---- a/sim/mips/sim-main.h
-+++ b/sim/mips/sim-main.h
-@@ -27,6 +27,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- mips_core_signal ((SD), (CPU), (CIA), (MAP), (NR_BYTES), (ADDR), (TRANSFER), (ERROR))
- 
- #include "sim-basics.h"
-+
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- #include "bfd.h"
- 
-diff --git a/sim/mn10300/sim-main.h b/sim/mn10300/sim-main.h
-index 7171c03..3a917e7 100644
---- a/sim/mn10300/sim-main.h
-+++ b/sim/mn10300/sim-main.h
-@@ -38,6 +38,8 @@
- #include "itable.h"
- #include "idecode.h"
- 
-+typedef struct _sim_cpu SIM_CPU;
-+
- #define SIM_CORE_SIGNAL(SD,CPU,CIA,MAP,NR_BYTES,ADDR,TRANSFER,ERROR)  \
- mn10300_core_signal ((SD), (CPU), (CIA), (MAP), (NR_BYTES), (ADDR), (TRANSFER), (ERROR))
- 
-diff --git a/sim/moxie/sim-main.h b/sim/moxie/sim-main.h
-index 7091f21..b6b5ca3 100644
---- a/sim/moxie/sim-main.h
-+++ b/sim/moxie/sim-main.h
-@@ -21,6 +21,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- #define SIM_MAIN_H
- 
- #include "sim-basics.h"
-+
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- #include "bfd.h"
- 
-diff --git a/sim/msp430/sim-main.h b/sim/msp430/sim-main.h
-index 4a2ab22..c7cdc5e 100644
---- a/sim/msp430/sim-main.h
-+++ b/sim/msp430/sim-main.h
-@@ -23,6 +23,9 @@
- 
- #include "sim-basics.h"
- #include "sim-signal.h"
-+
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "msp430-sim.h"
- #include "sim-base.h"
- 
-diff --git a/sim/sh/sim-main.h b/sim/sh/sim-main.h
-index 4af7b03..6ab42a6 100644
---- a/sim/sh/sim-main.h
-+++ b/sim/sh/sim-main.h
-@@ -20,6 +20,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- #define SIM_MAIN_H
- 
- #include "sim-basics.h"
-+
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- 
- typedef struct
-diff --git a/sim/sh64/sim-main.h b/sim/sh64/sim-main.h
-index da8f516..5fd7095 100644
---- a/sim/sh64/sim-main.h
-+++ b/sim/sh64/sim-main.h
-@@ -3,6 +3,9 @@
- #ifndef SIM_MAIN_H
- #define SIM_MAIN_H
- 
-+struct _sim_cpu; /* FIXME: should be in sim-basics.h */
-+typedef struct _sim_cpu SIM_CPU;
-+
- /* sim-basics.h includes config.h but cgen-types.h must be included before
-    sim-basics.h and cgen-types.h needs config.h.  */
- #include "config.h"
-diff --git a/sim/v850/sim-main.h b/sim/v850/sim-main.h
-index e7276a6..1a45f97 100644
---- a/sim/v850/sim-main.h
-+++ b/sim/v850/sim-main.h
-@@ -9,6 +9,9 @@
- #include "sim-basics.h"
- #include "sim-signal.h"
- #include "sim-fpu.h"
-+
-+typedef struct _sim_cpu SIM_CPU;
-+
- #include "sim-base.h"
- 
- #include "simops.h"
--- 
-2.7.4
-
diff --git a/package/gdb/7.11.1/0001-sim-bfin-split-out-common-mach-model-defines-into-ar.patch b/package/gdb/7.11.1/0001-sim-bfin-split-out-common-mach-model-defines-into-ar.patch
new file mode 100644
index 0000000..c62a6b8
--- /dev/null
+++ b/package/gdb/7.11.1/0001-sim-bfin-split-out-common-mach-model-defines-into-ar.patch
@@ -0,0 +1,151 @@
+From 7a09ed68e203a813d88fb7fc6eeb1e92209561a5 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Mon, 8 Aug 2016 13:06:49 +0800
+Subject: [PATCH] sim: bfin: split out common mach/model defines into arch.h
+ [PR sim/20438]
+
+The current machs.h mixes common enums with Blackfin-specific defines.
+This causes us troubles with header inclusion order such that we can't
+drop the old SIM_CPU typedef (which is duplicated in common code).  By
+splitting the two up, we can unwind this dependency chain, and drop the
+old typedef.  It also fixes building with older gcc versions.
+---
+ sim/bfin/ChangeLog  |  9 +++++++++
+ sim/bfin/arch.h     | 44 ++++++++++++++++++++++++++++++++++++++++++++
+ sim/bfin/machs.h    | 20 --------------------
+ sim/bfin/sim-main.h |  8 ++------
+ 4 files changed, 55 insertions(+), 26 deletions(-)
+ create mode 100644 sim/bfin/arch.h
+
+diff --git a/sim/bfin/ChangeLog b/sim/bfin/ChangeLog
+index 3dea7c9..a995436 100644
+--- a/sim/bfin/ChangeLog
++++ b/sim/bfin/ChangeLog
+@@ -1,3 +1,12 @@
++2016-08-13  Mike Frysinger  <vapier@gentoo.org>
++
++	PR sim/20438
++	* machs.h (MODEL_TYPE, MACH_ATTR, BFIN_INSN_*): Move ...
++	* arch.h: ... to this new header file.
++	* sim-main.h (SIM_CPU): Delete.
++	Include arch.h before sim-base.h, and move sim-base.h before
++	bfin-sim.h.
++
+ 2016-01-10  Mike Frysinger  <vapier@gentoo.org>
+ 
+ 	* config.in, configure: Regenerate.
+diff --git a/sim/bfin/arch.h b/sim/bfin/arch.h
+new file mode 100644
+index 0000000..b86d3e9
+--- /dev/null
++++ b/sim/bfin/arch.h
+@@ -0,0 +1,44 @@
++/* Simulator for Analog Devices Blackfin processors.
++
++   Copyright (C) 2005-2016 Free Software Foundation, Inc.
++   Contributed by Analog Devices, Inc.
++
++   This file is part of simulators.
++
++   This program is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 3 of the License, or
++   (at your option) any later version.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
++
++#ifndef BFIN_ARCH_H
++#define BFIN_ARCH_H
++
++typedef enum model_type {
++#define P(n) MODEL_BF##n,
++#include "proc_list.def"
++#undef P
++  MODEL_MAX
++} MODEL_TYPE;
++
++typedef enum mach_attr {
++  MACH_BASE,
++  MACH_BFIN,
++  MACH_MAX
++} MACH_ATTR;
++
++enum {
++#define I(insn) BFIN_INSN_##insn,
++#include "insn_list.def"
++#undef I
++  BFIN_INSN_MAX
++};
++
++#endif
+diff --git a/sim/bfin/machs.h b/sim/bfin/machs.h
+index 0372982..36819ae 100644
+--- a/sim/bfin/machs.h
++++ b/sim/bfin/machs.h
+@@ -21,19 +21,6 @@
+ #ifndef _BFIN_MACHS_H_
+ #define _BFIN_MACHS_H_
+ 
+-typedef enum model_type {
+-#define P(n) MODEL_BF##n,
+-#include "proc_list.def"
+-#undef P
+-  MODEL_MAX
+-} MODEL_TYPE;
+-
+-typedef enum mach_attr {
+-  MACH_BASE,
+-  MACH_BFIN,
+-  MACH_MAX
+-} MACH_ATTR;
+-
+ #define CPU_MODEL_NUM(cpu) MODEL_NUM (CPU_MODEL (cpu))
+ 
+ /* XXX: Some of this probably belongs in CPU_MODEL.  */
+@@ -46,13 +33,6 @@ void bfin_model_cpu_init (SIM_DESC, SIM_CPU *);
+ bu32 bfin_model_get_chipid (SIM_DESC);
+ bu32 bfin_model_get_dspid (SIM_DESC);
+ 
+-enum {
+-#define I(insn) BFIN_INSN_##insn,
+-#include "insn_list.def"
+-#undef I
+-  BFIN_INSN_MAX
+-};
+-
+ #define BFIN_COREMMR_CEC_BASE		0xFFE02100
+ #define BFIN_COREMMR_CEC_SIZE		(4 * 5)
+ #define BFIN_COREMMR_CTIMER_BASE	0xFFE03000
+diff --git a/sim/bfin/sim-main.h b/sim/bfin/sim-main.h
+index 51fb87e..34fd153 100644
+--- a/sim/bfin/sim-main.h
++++ b/sim/bfin/sim-main.h
+@@ -23,17 +23,13 @@
+ 
+ #include "sim-basics.h"
+ #include "sim-signal.h"
+-
+-/* TODO: Delete this.  Need to convert bu32/etc... to common sim types
+-         and unwind the bfin-sim.h/machs.h include below first though.  */
+-typedef struct _sim_cpu SIM_CPU;
++#include "arch.h"
++#include "sim-base.h"
+ 
+ #include "bfin-sim.h"
+ 
+ #include "machs.h"
+ 
+-#include "sim-base.h"
+-
+ struct _sim_cpu {
+   /* ... simulator specific members ... */
+   struct bfin_cpu_state state;
+-- 
+2.9.3
+
-- 
2.9.3
