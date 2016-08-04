From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 00:16:22 +0200
Subject: [Buildroot] [git commit] gdb: fix simulator build failures
Message-ID: <20160804221654.05D3381839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f71ad71f24fbeca1a81cc9efe79016a7db6f1320
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following reports from me of build failures of the GDB simulator for the
Blackfin architecture, Waldemar cooked a
patch (0005-fix-sim-compile.patch) that removes the typedef of SIM_CPU,
because there was a redefinition of this typedef for Blackfin. This was
not causing an issue with recent compilers as redefining the same
typedef is valid with recent compilers, but was causing build failures
with gcc 4.4.x.

However, by removing the common definition of SIM_CPU, this patch broke
the build of the GDB simulator on other architectures, which did not had
an architecture-specific redefinition of SIM_CPU (unlike Blackfin).

The crux of the problem is in a commit from Mike Frysinger, that tries
to refactor the SIM_CPU definition into a common one. Except that it
leaves a redefinition of it for Blackfin. Removing this second
definition however doesn't easily work, due to include ordering
issues. The easiest solution is to simply revert the patch from Mike
Frysinger. This allows to fix the build for all architectures and all
compiler versions.

Fixes:

  http://autobuild.buildroot.net/results/3b82c44ee853fab0e0c63881f0705bb659412917/
  http://autobuild.buildroot.net/results/dafbb93ab38a4285ce42436219d552cceb14828b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/7.10.1/0005-fix-sim-compile.patch      |  16 -
 .../0006-Revert-sim-unify-SIM_CPU-definition.patch | 372 +++++++++++++++++++++
 .../0001-Revert-sim-unify-SIM_CPU-definition.patch | 355 ++++++++++++++++++++
 package/gdb/7.11.1/0001-fix-sim-compile.patch      |  16 -
 4 files changed, 727 insertions(+), 32 deletions(-)

diff --git a/package/gdb/7.10.1/0005-fix-sim-compile.patch b/package/gdb/7.10.1/0005-fix-sim-compile.patch
deleted file mode 100644
index c886363..0000000
--- a/package/gdb/7.10.1/0005-fix-sim-compile.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix compile on older systems with gcc 4.4.x.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gdb-7.10.1.orig//sim/common/sim-base.h gdb-7.10.1/sim/common/sim-base.h
---- gdb-7.10.1.orig//sim/common/sim-base.h	2015-05-13 13:03:56.000000000 -0500
-+++ gdb-7.10.1/sim/common/sim-base.h	2016-07-08 07:44:17.000000000 -0500
-@@ -72,8 +72,6 @@
- #define INVALID_INSTRUCTION_ADDRESS ((address_word)0 - 1)
- #endif
- 
--/* TODO: Probably should just delete SIM_CPU.  */
--typedef struct _sim_cpu SIM_CPU;
- typedef struct _sim_cpu sim_cpu;
- 
- #include "sim-module.h"
diff --git a/package/gdb/7.10.1/0006-Revert-sim-unify-SIM_CPU-definition.patch b/package/gdb/7.10.1/0006-Revert-sim-unify-SIM_CPU-definition.patch
new file mode 100644
index 0000000..20b7fb2
--- /dev/null
+++ b/package/gdb/7.10.1/0006-Revert-sim-unify-SIM_CPU-definition.patch
@@ -0,0 +1,372 @@
+From 4d913bb73965fdb9c756e8d5916a829b60aa3a44 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 4 Aug 2016 23:44:24 +0200
+Subject: [PATCH] Revert "sim: unify SIM_CPU definition"
+
+This reverts commit 20bca71d82598a015de0991196e45f0b5f7ead81.
+
+This change causes a redefinition of SIM_CPU on the Blackfin
+architecture, as it is defined in both the common sim/common/sim-base.h
+and the architecture specific sim/bfin/sim-main.h.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ sim/arm/sim-main.h        |  3 +++
+ sim/avr/sim-main.h        |  2 ++
+ sim/bfin/sim-main.h       |  2 --
+ sim/common/sim-base.h     |  2 --
+ sim/cr16/sim-main.h       |  2 ++
+ sim/cris/sim-main.h       |  5 +++++
+ sim/d10v/sim-main.h       |  2 ++
+ sim/frv/sim-main.h        | 10 ++++++++++
+ sim/ft32/sim-main.h       |  2 ++
+ sim/h8300/sim-main.h      |  3 +++
+ sim/iq2000/sim-main.h     |  5 +++++
+ sim/lm32/sim-main.h       |  5 +++++
+ sim/m32r/sim-main.h       |  5 +++++
+ sim/m68hc11/sim-main.h    |  3 +++
+ sim/mcore/sim-main.h      |  2 ++
+ sim/microblaze/sim-main.h |  3 +++
+ sim/mips/sim-main.h       |  3 +++
+ sim/mn10300/sim-main.h    |  2 ++
+ sim/moxie/sim-main.h      |  3 +++
+ sim/msp430/sim-main.h     |  3 +++
+ sim/sh/sim-main.h         |  3 +++
+ sim/sh64/sim-main.h       |  5 +++++
+ sim/v850/sim-main.h       |  3 +++
+ 23 files changed, 74 insertions(+), 4 deletions(-)
+
+diff --git a/sim/arm/sim-main.h b/sim/arm/sim-main.h
+index 9a37b98..ae622bd 100644
+--- a/sim/arm/sim-main.h
++++ b/sim/arm/sim-main.h
+@@ -20,6 +20,9 @@
+ #define SIM_MAIN_H
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/avr/sim-main.h b/sim/avr/sim-main.h
+index e0cac22..52904e3 100644
+--- a/sim/avr/sim-main.h
++++ b/sim/avr/sim-main.h
+@@ -23,6 +23,8 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
+ extern unsigned int pc;
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ 
+ struct _sim_cpu {
+diff --git a/sim/bfin/sim-main.h b/sim/bfin/sim-main.h
+index 806fe15..53e1774 100644
+--- a/sim/bfin/sim-main.h
++++ b/sim/bfin/sim-main.h
+@@ -24,8 +24,6 @@
+ #include "sim-basics.h"
+ #include "sim-signal.h"
+ 
+-/* TODO: Delete this.  Need to convert bu32/etc... to common sim types
+-         and unwind the bfin-sim.h/machs.h include below first though.  */
+ typedef struct _sim_cpu SIM_CPU;
+ 
+ #include "bfin-sim.h"
+diff --git a/sim/common/sim-base.h b/sim/common/sim-base.h
+index 21f61f4..e90e07c 100644
+--- a/sim/common/sim-base.h
++++ b/sim/common/sim-base.h
+@@ -72,8 +72,6 @@ typedef address_word sim_cia;
+ #define INVALID_INSTRUCTION_ADDRESS ((address_word)0 - 1)
+ #endif
+ 
+-/* TODO: Probably should just delete SIM_CPU.  */
+-typedef struct _sim_cpu SIM_CPU;
+ typedef struct _sim_cpu sim_cpu;
+ 
+ #include "sim-module.h"
+diff --git a/sim/cr16/sim-main.h b/sim/cr16/sim-main.h
+index a63b93e..1a80229 100644
+--- a/sim/cr16/sim-main.h
++++ b/sim/cr16/sim-main.h
+@@ -24,6 +24,8 @@
+ typedef long int           word;
+ typedef unsigned long int  uword;
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/cris/sim-main.h b/sim/cris/sim-main.h
+index 4dc04a2..fec0039 100644
+--- a/sim/cris/sim-main.h
++++ b/sim/cris/sim-main.h
+@@ -24,6 +24,11 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ #ifndef SIM_MAIN_H
+ #define SIM_MAIN_H
+ 
++#define USING_SIM_BASE_H
++
++struct _sim_cpu;
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "symcat.h"
+ #include "sim-basics.h"
+ #include "cgen-types.h"
+diff --git a/sim/d10v/sim-main.h b/sim/d10v/sim-main.h
+index 0b87811..a7d59dd 100644
+--- a/sim/d10v/sim-main.h
++++ b/sim/d10v/sim-main.h
+@@ -24,6 +24,8 @@
+ typedef long int           word;
+ typedef unsigned long int  uword;
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/frv/sim-main.h b/sim/frv/sim-main.h
+index d5a67cb..fd12c4f 100644
+--- a/sim/frv/sim-main.h
++++ b/sim/frv/sim-main.h
+@@ -19,6 +19,16 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
+ /* Main header for the frv.  */
+ 
++#define USING_SIM_BASE_H /* FIXME: quick hack */
++
++struct _sim_cpu; /* FIXME: should be in sim-basics.h */
++typedef struct _sim_cpu SIM_CPU;
++
++/* Set the mask of unsupported traces.  */
++#define WITH_TRACE \
++  (~(TRACE_alu | TRACE_decode | TRACE_memory | TRACE_model | TRACE_fpu \
++     | TRACE_branch | TRACE_debug))
++
+ /* sim-basics.h includes config.h but cgen-types.h must be included before
+    sim-basics.h and cgen-types.h needs config.h.  */
+ #include "config.h"
+diff --git a/sim/ft32/sim-main.h b/sim/ft32/sim-main.h
+index b27a690..a270a5d 100644
+--- a/sim/ft32/sim-main.h
++++ b/sim/ft32/sim-main.h
+@@ -25,6 +25,8 @@
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "ft32-sim.h"
+ 
+ struct _sim_cpu {
+diff --git a/sim/h8300/sim-main.h b/sim/h8300/sim-main.h
+index 6dbc1ac..e95c4d9 100644
+--- a/sim/h8300/sim-main.h
++++ b/sim/h8300/sim-main.h
+@@ -87,6 +87,9 @@ enum h8_typecodes {
+ };
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ 
+ /* Structure used to describe addressing */
+diff --git a/sim/iq2000/sim-main.h b/sim/iq2000/sim-main.h
+index 992520a..ce3baba 100644
+--- a/sim/iq2000/sim-main.h
++++ b/sim/iq2000/sim-main.h
+@@ -4,6 +4,11 @@
+ #ifndef SIM_MAIN_H
+ #define SIM_MAIN_H
+ 
++#define USING_SIM_BASE_H /* FIXME: quick hack */
++
++struct _sim_cpu; /* FIXME: should be in sim-basics.h */
++typedef struct _sim_cpu SIM_CPU;
++
+ /* sim-basics.h includes config.h but cgen-types.h must be included before
+    sim-basics.h and cgen-types.h needs config.h.  */
+ #include "config.h"
+diff --git a/sim/lm32/sim-main.h b/sim/lm32/sim-main.h
+index 4894e8d..210bb8b 100644
+--- a/sim/lm32/sim-main.h
++++ b/sim/lm32/sim-main.h
+@@ -23,6 +23,11 @@
+ #ifndef SIM_MAIN_H
+ #define SIM_MAIN_H
+ 
++#define USING_SIM_BASE_H	/* FIXME: quick hack */
++
++struct _sim_cpu;		/* FIXME: should be in sim-basics.h */
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "symcat.h"
+ #include "sim-basics.h"
+ #include "cgen-types.h"
+diff --git a/sim/m32r/sim-main.h b/sim/m32r/sim-main.h
+index cd39e98..74bb513 100644
+--- a/sim/m32r/sim-main.h
++++ b/sim/m32r/sim-main.h
+@@ -3,6 +3,11 @@
+ #ifndef SIM_MAIN_H
+ #define SIM_MAIN_H
+ 
++#define USING_SIM_BASE_H /* FIXME: quick hack */
++
++struct _sim_cpu; /* FIXME: should be in sim-basics.h */
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "symcat.h"
+ #include "sim-basics.h"
+ #include "cgen-types.h"
+diff --git a/sim/m68hc11/sim-main.h b/sim/m68hc11/sim-main.h
+index d1fc582..4f41db9 100644
+--- a/sim/m68hc11/sim-main.h
++++ b/sim/m68hc11/sim-main.h
+@@ -25,6 +25,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ #define SIM_HANDLES_LMA 1
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-signal.h"
+ #include "sim-base.h"
+ 
+diff --git a/sim/mcore/sim-main.h b/sim/mcore/sim-main.h
+index be50ec1..25698c1 100644
+--- a/sim/mcore/sim-main.h
++++ b/sim/mcore/sim-main.h
+@@ -24,6 +24,8 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ typedef long int           word;
+ typedef unsigned long int  uword;
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/microblaze/sim-main.h b/sim/microblaze/sim-main.h
+index 6781374..6b7b776 100644
+--- a/sim/microblaze/sim-main.h
++++ b/sim/microblaze/sim-main.h
+@@ -20,6 +20,9 @@
+ 
+ #include "microblaze.h"
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ 
+ /* The machine state.
+diff --git a/sim/mips/sim-main.h b/sim/mips/sim-main.h
+index 8d698ad..9729804 100644
+--- a/sim/mips/sim-main.h
++++ b/sim/mips/sim-main.h
+@@ -29,6 +29,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ mips_core_signal ((SD), (CPU), (CIA), (MAP), (NR_BYTES), (ADDR), (TRANSFER), (ERROR))
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/mn10300/sim-main.h b/sim/mn10300/sim-main.h
+index 847506e..2ddbfb9 100644
+--- a/sim/mn10300/sim-main.h
++++ b/sim/mn10300/sim-main.h
+@@ -42,6 +42,8 @@
+ #include "itable.h"
+ #include "idecode.h"
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #define WITH_WATCHPOINTS 1
+ 
+ #define SIM_CORE_SIGNAL(SD,CPU,CIA,MAP,NR_BYTES,ADDR,TRANSFER,ERROR)  \
+diff --git a/sim/moxie/sim-main.h b/sim/moxie/sim-main.h
+index b1a64fc..c60437e 100644
+--- a/sim/moxie/sim-main.h
++++ b/sim/moxie/sim-main.h
+@@ -21,6 +21,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ #define SIM_MAIN_H
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/msp430/sim-main.h b/sim/msp430/sim-main.h
+index 19c8cca..37bb42d 100644
+--- a/sim/msp430/sim-main.h
++++ b/sim/msp430/sim-main.h
+@@ -23,6 +23,9 @@
+ 
+ #include "sim-basics.h"
+ #include "sim-signal.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "msp430-sim.h"
+ #include "sim-base.h"
+ 
+diff --git a/sim/sh/sim-main.h b/sim/sh/sim-main.h
+index e67df28..e2e17d7 100644
+--- a/sim/sh/sim-main.h
++++ b/sim/sh/sim-main.h
+@@ -20,6 +20,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ #define SIM_MAIN_H
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ 
+ typedef struct
+diff --git a/sim/sh64/sim-main.h b/sim/sh64/sim-main.h
+index 7b24ab0..8fb595e 100644
+--- a/sim/sh64/sim-main.h
++++ b/sim/sh64/sim-main.h
+@@ -3,6 +3,11 @@
+ #ifndef SIM_MAIN_H
+ #define SIM_MAIN_H
+ 
++#define USING_SIM_BASE_H /* FIXME: quick hack */
++
++struct _sim_cpu; /* FIXME: should be in sim-basics.h */
++typedef struct _sim_cpu SIM_CPU;
++
+ /* sim-basics.h includes config.h but cgen-types.h must be included before
+    sim-basics.h and cgen-types.h needs config.h.  */
+ #include "config.h"
+diff --git a/sim/v850/sim-main.h b/sim/v850/sim-main.h
+index 5127d28..16cbd97 100644
+--- a/sim/v850/sim-main.h
++++ b/sim/v850/sim-main.h
+@@ -16,6 +16,9 @@
+ #include "sim-basics.h"
+ #include "sim-signal.h"
+ #include "sim-fpu.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ 
+ #include "simops.h"
+-- 
+2.7.4
+
diff --git a/package/gdb/7.11.1/0001-Revert-sim-unify-SIM_CPU-definition.patch b/package/gdb/7.11.1/0001-Revert-sim-unify-SIM_CPU-definition.patch
new file mode 100644
index 0000000..8a8eece
--- /dev/null
+++ b/package/gdb/7.11.1/0001-Revert-sim-unify-SIM_CPU-definition.patch
@@ -0,0 +1,355 @@
+From 77080d5f7fd47dd567f22807d336bc9111f93d7b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 4 Aug 2016 23:44:24 +0200
+Subject: [PATCH] Revert "sim: unify SIM_CPU definition"
+
+This reverts commit 20bca71d82598a015de0991196e45f0b5f7ead81.
+
+This change causes a redefinition of SIM_CPU on the Blackfin
+architecture, as it is defined in both the common sim/common/sim-base.h
+and the architecture specific sim/bfin/sim-main.h.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ sim/arm/sim-main.h        | 3 +++
+ sim/avr/sim-main.h        | 2 ++
+ sim/bfin/sim-main.h       | 2 --
+ sim/common/sim-base.h     | 2 --
+ sim/cr16/sim-main.h       | 2 ++
+ sim/cris/sim-main.h       | 3 +++
+ sim/d10v/sim-main.h       | 2 ++
+ sim/frv/sim-main.h        | 3 +++
+ sim/ft32/sim-main.h       | 2 ++
+ sim/h8300/sim-main.h      | 3 +++
+ sim/iq2000/sim-main.h     | 3 +++
+ sim/lm32/sim-main.h       | 3 +++
+ sim/m32r/sim-main.h       | 3 +++
+ sim/m68hc11/sim-main.h    | 3 +++
+ sim/mcore/sim-main.h      | 2 ++
+ sim/microblaze/sim-main.h | 3 +++
+ sim/mips/sim-main.h       | 3 +++
+ sim/mn10300/sim-main.h    | 2 ++
+ sim/moxie/sim-main.h      | 3 +++
+ sim/msp430/sim-main.h     | 3 +++
+ sim/sh/sim-main.h         | 3 +++
+ sim/sh64/sim-main.h       | 3 +++
+ sim/v850/sim-main.h       | 3 +++
+ 23 files changed, 57 insertions(+), 4 deletions(-)
+
+diff --git a/sim/arm/sim-main.h b/sim/arm/sim-main.h
+index 3620810..f644122 100644
+--- a/sim/arm/sim-main.h
++++ b/sim/arm/sim-main.h
+@@ -20,6 +20,9 @@
+ #define SIM_MAIN_H
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/avr/sim-main.h b/sim/avr/sim-main.h
+index 47155e3..cd41045 100644
+--- a/sim/avr/sim-main.h
++++ b/sim/avr/sim-main.h
+@@ -21,6 +21,8 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
+ #include "sim-basics.h"
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ 
+ struct _sim_cpu {
+diff --git a/sim/bfin/sim-main.h b/sim/bfin/sim-main.h
+index 51fb87e..cf1ed57 100644
+--- a/sim/bfin/sim-main.h
++++ b/sim/bfin/sim-main.h
+@@ -24,8 +24,6 @@
+ #include "sim-basics.h"
+ #include "sim-signal.h"
+ 
+-/* TODO: Delete this.  Need to convert bu32/etc... to common sim types
+-         and unwind the bfin-sim.h/machs.h include below first though.  */
+ typedef struct _sim_cpu SIM_CPU;
+ 
+ #include "bfin-sim.h"
+diff --git a/sim/common/sim-base.h b/sim/common/sim-base.h
+index 350b352..1b849f4 100644
+--- a/sim/common/sim-base.h
++++ b/sim/common/sim-base.h
+@@ -72,8 +72,6 @@ typedef address_word sim_cia;
+ #define INVALID_INSTRUCTION_ADDRESS ((address_word)0 - 1)
+ #endif
+ 
+-/* TODO: Probably should just delete SIM_CPU.  */
+-typedef struct _sim_cpu SIM_CPU;
+ typedef struct _sim_cpu sim_cpu;
+ 
+ #include "sim-module.h"
+diff --git a/sim/cr16/sim-main.h b/sim/cr16/sim-main.h
+index 208f917..78e3996 100644
+--- a/sim/cr16/sim-main.h
++++ b/sim/cr16/sim-main.h
+@@ -24,6 +24,8 @@
+ typedef long int           word;
+ typedef unsigned long int  uword;
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/cris/sim-main.h b/sim/cris/sim-main.h
+index 8aab970..0ff907f 100644
+--- a/sim/cris/sim-main.h
++++ b/sim/cris/sim-main.h
+@@ -29,6 +29,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+    one of -scache/-pbb.  */
+ #define WITH_SCACHE_PBB 1
+ 
++struct _sim_cpu;
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "symcat.h"
+ #include "sim-basics.h"
+ #include "cgen-types.h"
+diff --git a/sim/d10v/sim-main.h b/sim/d10v/sim-main.h
+index 76f06d8..fd5bd51 100644
+--- a/sim/d10v/sim-main.h
++++ b/sim/d10v/sim-main.h
+@@ -24,6 +24,8 @@
+ typedef long int           word;
+ typedef unsigned long int  uword;
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/frv/sim-main.h b/sim/frv/sim-main.h
+index f95c1cc..701e208 100644
+--- a/sim/frv/sim-main.h
++++ b/sim/frv/sim-main.h
+@@ -19,6 +19,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
+ /* Main header for the frv.  */
+ 
++struct _sim_cpu; /* FIXME: should be in sim-basics.h */
++typedef struct _sim_cpu SIM_CPU;
++
+ /* sim-basics.h includes config.h but cgen-types.h must be included before
+    sim-basics.h and cgen-types.h needs config.h.  */
+ #include "config.h"
+diff --git a/sim/ft32/sim-main.h b/sim/ft32/sim-main.h
+index a15b247..eef0201 100644
+--- a/sim/ft32/sim-main.h
++++ b/sim/ft32/sim-main.h
+@@ -25,6 +25,8 @@
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "ft32-sim.h"
+ 
+ struct _sim_cpu {
+diff --git a/sim/h8300/sim-main.h b/sim/h8300/sim-main.h
+index 6dbc1ac..e95c4d9 100644
+--- a/sim/h8300/sim-main.h
++++ b/sim/h8300/sim-main.h
+@@ -87,6 +87,9 @@ enum h8_typecodes {
+ };
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ 
+ /* Structure used to describe addressing */
+diff --git a/sim/iq2000/sim-main.h b/sim/iq2000/sim-main.h
+index 829f9bb..a770dc5 100644
+--- a/sim/iq2000/sim-main.h
++++ b/sim/iq2000/sim-main.h
+@@ -4,6 +4,9 @@
+ #ifndef SIM_MAIN_H
+ #define SIM_MAIN_H
+ 
++struct _sim_cpu; /* FIXME: should be in sim-basics.h */
++typedef struct _sim_cpu SIM_CPU;
++
+ /* sim-basics.h includes config.h but cgen-types.h must be included before
+    sim-basics.h and cgen-types.h needs config.h.  */
+ #include "config.h"
+diff --git a/sim/lm32/sim-main.h b/sim/lm32/sim-main.h
+index 20e2b71..eeffde3 100644
+--- a/sim/lm32/sim-main.h
++++ b/sim/lm32/sim-main.h
+@@ -25,6 +25,9 @@
+ 
+ #define WITH_SCACHE_PBB 1
+ 
++struct _sim_cpu;		/* FIXME: should be in sim-basics.h */
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "symcat.h"
+ #include "sim-basics.h"
+ #include "cgen-types.h"
+diff --git a/sim/m32r/sim-main.h b/sim/m32r/sim-main.h
+index 5b24ce8..39f7ecc 100644
+--- a/sim/m32r/sim-main.h
++++ b/sim/m32r/sim-main.h
+@@ -8,6 +8,9 @@
+    one of -scache/-pbb.  */
+ #define WITH_SCACHE_PBB 1
+ 
++struct _sim_cpu; /* FIXME: should be in sim-basics.h */
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "symcat.h"
+ #include "sim-basics.h"
+ #include "cgen-types.h"
+diff --git a/sim/m68hc11/sim-main.h b/sim/m68hc11/sim-main.h
+index b940df7..0aa096f 100644
+--- a/sim/m68hc11/sim-main.h
++++ b/sim/m68hc11/sim-main.h
+@@ -21,6 +21,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ #define _SIM_MAIN_H
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-signal.h"
+ #include "sim-base.h"
+ 
+diff --git a/sim/mcore/sim-main.h b/sim/mcore/sim-main.h
+index fce26e8..fa7ee9f 100644
+--- a/sim/mcore/sim-main.h
++++ b/sim/mcore/sim-main.h
+@@ -24,6 +24,8 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ typedef long int           word;
+ typedef unsigned long int  uword;
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/microblaze/sim-main.h b/sim/microblaze/sim-main.h
+index 3a7b088..9e6bf01 100644
+--- a/sim/microblaze/sim-main.h
++++ b/sim/microblaze/sim-main.h
+@@ -20,6 +20,9 @@
+ 
+ #include "microblaze.h"
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ 
+ /* The machine state.
+diff --git a/sim/mips/sim-main.h b/sim/mips/sim-main.h
+index 0ea1234..eedbfc9 100644
+--- a/sim/mips/sim-main.h
++++ b/sim/mips/sim-main.h
+@@ -27,6 +27,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ mips_core_signal ((SD), (CPU), (CIA), (MAP), (NR_BYTES), (ADDR), (TRANSFER), (ERROR))
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/mn10300/sim-main.h b/sim/mn10300/sim-main.h
+index 7171c03..3a917e7 100644
+--- a/sim/mn10300/sim-main.h
++++ b/sim/mn10300/sim-main.h
+@@ -38,6 +38,8 @@
+ #include "itable.h"
+ #include "idecode.h"
+ 
++typedef struct _sim_cpu SIM_CPU;
++
+ #define SIM_CORE_SIGNAL(SD,CPU,CIA,MAP,NR_BYTES,ADDR,TRANSFER,ERROR)  \
+ mn10300_core_signal ((SD), (CPU), (CIA), (MAP), (NR_BYTES), (ADDR), (TRANSFER), (ERROR))
+ 
+diff --git a/sim/moxie/sim-main.h b/sim/moxie/sim-main.h
+index 7091f21..b6b5ca3 100644
+--- a/sim/moxie/sim-main.h
++++ b/sim/moxie/sim-main.h
+@@ -21,6 +21,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ #define SIM_MAIN_H
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ #include "bfd.h"
+ 
+diff --git a/sim/msp430/sim-main.h b/sim/msp430/sim-main.h
+index 4a2ab22..c7cdc5e 100644
+--- a/sim/msp430/sim-main.h
++++ b/sim/msp430/sim-main.h
+@@ -23,6 +23,9 @@
+ 
+ #include "sim-basics.h"
+ #include "sim-signal.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "msp430-sim.h"
+ #include "sim-base.h"
+ 
+diff --git a/sim/sh/sim-main.h b/sim/sh/sim-main.h
+index 4af7b03..6ab42a6 100644
+--- a/sim/sh/sim-main.h
++++ b/sim/sh/sim-main.h
+@@ -20,6 +20,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ #define SIM_MAIN_H
+ 
+ #include "sim-basics.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ 
+ typedef struct
+diff --git a/sim/sh64/sim-main.h b/sim/sh64/sim-main.h
+index da8f516..5fd7095 100644
+--- a/sim/sh64/sim-main.h
++++ b/sim/sh64/sim-main.h
+@@ -3,6 +3,9 @@
+ #ifndef SIM_MAIN_H
+ #define SIM_MAIN_H
+ 
++struct _sim_cpu; /* FIXME: should be in sim-basics.h */
++typedef struct _sim_cpu SIM_CPU;
++
+ /* sim-basics.h includes config.h but cgen-types.h must be included before
+    sim-basics.h and cgen-types.h needs config.h.  */
+ #include "config.h"
+diff --git a/sim/v850/sim-main.h b/sim/v850/sim-main.h
+index e7276a6..1a45f97 100644
+--- a/sim/v850/sim-main.h
++++ b/sim/v850/sim-main.h
+@@ -9,6 +9,9 @@
+ #include "sim-basics.h"
+ #include "sim-signal.h"
+ #include "sim-fpu.h"
++
++typedef struct _sim_cpu SIM_CPU;
++
+ #include "sim-base.h"
+ 
+ #include "simops.h"
+-- 
+2.7.4
+
diff --git a/package/gdb/7.11.1/0001-fix-sim-compile.patch b/package/gdb/7.11.1/0001-fix-sim-compile.patch
deleted file mode 100644
index ecb0514..0000000
--- a/package/gdb/7.11.1/0001-fix-sim-compile.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix compile on older systems with gcc 4.4.x
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gdb-7.11.1.orig//sim/common/sim-base.h gdb-7.11.1/sim/common/sim-base.h
---- gdb-7.11.1.orig//sim/common/sim-base.h	2016-02-09 21:19:39.000000000 -0600
-+++ gdb-7.11.1/sim/common/sim-base.h	2016-07-08 08:02:09.000000000 -0500
-@@ -72,8 +72,6 @@
- #define INVALID_INSTRUCTION_ADDRESS ((address_word)0 - 1)
- #endif
- 
--/* TODO: Probably should just delete SIM_CPU.  */
--typedef struct _sim_cpu SIM_CPU;
- typedef struct _sim_cpu sim_cpu;
- 
- #include "sim-module.h"
