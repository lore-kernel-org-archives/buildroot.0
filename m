From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:05:33 +0200
Subject: [Buildroot] [git commit] gdb: remove Blackfin patch
Message-ID: <20180415200629.AB444886C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3142e7a8ea67774a9103240bb93461645832f51f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And renumber remaining patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Sync-proc_service-definition-with-GLIBC.patch} |   0
 ...lit-out-common-mach-model-defines-into-ar.patch | 155 ---------------------
 ...efine-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} |   0
 ...fine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch} |   0
 ...0004-Fix-gdbserver-build-on-uClibc-noMMU.patch} |   0
 ...gidefs.h.patch => 0005-use-asm-sgidefs.h.patch} |   0
 6 files changed, 155 deletions(-)

diff --git a/package/gdb/7.11.1/0002-Sync-proc_service-definition-with-GLIBC.patch b/package/gdb/7.11.1/0001-Sync-proc_service-definition-with-GLIBC.patch
similarity index 100%
rename from package/gdb/7.11.1/0002-Sync-proc_service-definition-with-GLIBC.patch
rename to package/gdb/7.11.1/0001-Sync-proc_service-definition-with-GLIBC.patch
diff --git a/package/gdb/7.11.1/0001-sim-bfin-split-out-common-mach-model-defines-into-ar.patch b/package/gdb/7.11.1/0001-sim-bfin-split-out-common-mach-model-defines-into-ar.patch
deleted file mode 100644
index 5841cfd4d1..0000000000
--- a/package/gdb/7.11.1/0001-sim-bfin-split-out-common-mach-model-defines-into-ar.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 7a09ed68e203a813d88fb7fc6eeb1e92209561a5 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Mon, 8 Aug 2016 13:06:49 +0800
-Subject: [PATCH] sim: bfin: split out common mach/model defines into arch.h
- [PR sim/20438]
-
-The current machs.h mixes common enums with Blackfin-specific defines.
-This causes us troubles with header inclusion order such that we can't
-drop the old SIM_CPU typedef (which is duplicated in common code).  By
-splitting the two up, we can unwind this dependency chain, and drop the
-old typedef.  It also fixes building with older gcc versions.
-
-[Romain: backport from gdb 7.12]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-
----
- sim/bfin/ChangeLog  |  9 +++++++++
- sim/bfin/arch.h     | 44 ++++++++++++++++++++++++++++++++++++++++++++
- sim/bfin/machs.h    | 20 --------------------
- sim/bfin/sim-main.h |  8 ++------
- 4 files changed, 55 insertions(+), 26 deletions(-)
- create mode 100644 sim/bfin/arch.h
-
-diff --git a/sim/bfin/ChangeLog b/sim/bfin/ChangeLog
-index 3dea7c9..a995436 100644
---- a/sim/bfin/ChangeLog
-+++ b/sim/bfin/ChangeLog
-@@ -1,3 +1,12 @@
-+2016-08-13  Mike Frysinger  <vapier@gentoo.org>
-+
-+	PR sim/20438
-+	* machs.h (MODEL_TYPE, MACH_ATTR, BFIN_INSN_*): Move ...
-+	* arch.h: ... to this new header file.
-+	* sim-main.h (SIM_CPU): Delete.
-+	Include arch.h before sim-base.h, and move sim-base.h before
-+	bfin-sim.h.
-+
- 2016-01-10  Mike Frysinger  <vapier@gentoo.org>
- 
- 	* config.in, configure: Regenerate.
-diff --git a/sim/bfin/arch.h b/sim/bfin/arch.h
-new file mode 100644
-index 0000000..b86d3e9
---- /dev/null
-+++ b/sim/bfin/arch.h
-@@ -0,0 +1,44 @@
-+/* Simulator for Analog Devices Blackfin processors.
-+
-+   Copyright (C) 2005-2016 Free Software Foundation, Inc.
-+   Contributed by Analog Devices, Inc.
-+
-+   This file is part of simulators.
-+
-+   This program is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by
-+   the Free Software Foundation; either version 3 of the License, or
-+   (at your option) any later version.
-+
-+   This program is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+   GNU General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
-+
-+#ifndef BFIN_ARCH_H
-+#define BFIN_ARCH_H
-+
-+typedef enum model_type {
-+#define P(n) MODEL_BF##n,
-+#include "proc_list.def"
-+#undef P
-+  MODEL_MAX
-+} MODEL_TYPE;
-+
-+typedef enum mach_attr {
-+  MACH_BASE,
-+  MACH_BFIN,
-+  MACH_MAX
-+} MACH_ATTR;
-+
-+enum {
-+#define I(insn) BFIN_INSN_##insn,
-+#include "insn_list.def"
-+#undef I
-+  BFIN_INSN_MAX
-+};
-+
-+#endif
-diff --git a/sim/bfin/machs.h b/sim/bfin/machs.h
-index 0372982..36819ae 100644
---- a/sim/bfin/machs.h
-+++ b/sim/bfin/machs.h
-@@ -21,19 +21,6 @@
- #ifndef _BFIN_MACHS_H_
- #define _BFIN_MACHS_H_
- 
--typedef enum model_type {
--#define P(n) MODEL_BF##n,
--#include "proc_list.def"
--#undef P
--  MODEL_MAX
--} MODEL_TYPE;
--
--typedef enum mach_attr {
--  MACH_BASE,
--  MACH_BFIN,
--  MACH_MAX
--} MACH_ATTR;
--
- #define CPU_MODEL_NUM(cpu) MODEL_NUM (CPU_MODEL (cpu))
- 
- /* XXX: Some of this probably belongs in CPU_MODEL.  */
-@@ -46,13 +33,6 @@ void bfin_model_cpu_init (SIM_DESC, SIM_CPU *);
- bu32 bfin_model_get_chipid (SIM_DESC);
- bu32 bfin_model_get_dspid (SIM_DESC);
- 
--enum {
--#define I(insn) BFIN_INSN_##insn,
--#include "insn_list.def"
--#undef I
--  BFIN_INSN_MAX
--};
--
- #define BFIN_COREMMR_CEC_BASE		0xFFE02100
- #define BFIN_COREMMR_CEC_SIZE		(4 * 5)
- #define BFIN_COREMMR_CTIMER_BASE	0xFFE03000
-diff --git a/sim/bfin/sim-main.h b/sim/bfin/sim-main.h
-index 51fb87e..34fd153 100644
---- a/sim/bfin/sim-main.h
-+++ b/sim/bfin/sim-main.h
-@@ -23,17 +23,13 @@
- 
- #include "sim-basics.h"
- #include "sim-signal.h"
--
--/* TODO: Delete this.  Need to convert bu32/etc... to common sim types
--         and unwind the bfin-sim.h/machs.h include below first though.  */
--typedef struct _sim_cpu SIM_CPU;
-+#include "arch.h"
-+#include "sim-base.h"
- 
- #include "bfin-sim.h"
- 
- #include "machs.h"
- 
--#include "sim-base.h"
--
- struct _sim_cpu {
-   /* ... simulator specific members ... */
-   struct bfin_cpu_state state;
--- 
-2.9.3
-
diff --git a/package/gdb/7.11.1/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/7.11.1/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 100%
rename from package/gdb/7.11.1/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to package/gdb/7.11.1/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
diff --git a/package/gdb/7.11.1/0004-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/7.11.1/0003-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
similarity index 100%
rename from package/gdb/7.11.1/0004-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
rename to package/gdb/7.11.1/0003-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
diff --git a/package/gdb/7.11.1/0005-Fix-gdbserver-build-on-uClibc-noMMU.patch b/package/gdb/7.11.1/0004-Fix-gdbserver-build-on-uClibc-noMMU.patch
similarity index 100%
rename from package/gdb/7.11.1/0005-Fix-gdbserver-build-on-uClibc-noMMU.patch
rename to package/gdb/7.11.1/0004-Fix-gdbserver-build-on-uClibc-noMMU.patch
diff --git a/package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch b/package/gdb/7.11.1/0005-use-asm-sgidefs.h.patch
similarity index 100%
rename from package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch
rename to package/gdb/7.11.1/0005-use-asm-sgidefs.h.patch
