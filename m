From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:31:54 +0100
Subject: [Buildroot] [git commit] package/musl: move riscv64 register index
 constant definitions
Message-ID: <20200211223133.D62788DB62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3672b699f007e0191aaf77a6271fe1a96526651
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The riscv64 build of libsigsegv using musl fails due to a missing
definition for REG_SP. This constant is used to index the __gregs
array in the ucontext_t structure.

This fix moves the musl defintion of REG_SP (and others) from
arch/riscv64/bits/reg.h to arch/riscv64/bits/signal.h
so that it is picked up correctly.

The patch was downloaded from upstream:
https://git.musl-libc.org/cgit/musl/commit/?id=329e79299daaa994b8e75941331a1093051ea5d9

Fixes:
http://autobuild.buildroot.org/results/8fcd5cb912e513ac08a81e3ee726e29ac22212bb/

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cv64-register-index-constants-to-signal.h.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/musl/0003-move-riscv64-register-index-constants-to-signal.h.patch b/package/musl/0003-move-riscv64-register-index-constants-to-signal.h.patch
new file mode 100644
index 0000000000..8221c0ea30
--- /dev/null
+++ b/package/musl/0003-move-riscv64-register-index-constants-to-signal.h.patch
@@ -0,0 +1,54 @@
+From 329e79299daaa994b8e75941331a1093051ea5d9 Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Tue, 4 Feb 2020 09:29:13 -0500
+Subject: move riscv64 register index constants to signal.h
+
+under _GNU_SOURCE for namespace cleanliness, analogous to other archs.
+the original placement in sys/reg.h seems not to have been motivated;
+such a header isn't even present on other implementations.
+
+Downloaded from upstream commit
+https://git.musl-libc.org/cgit/musl/commit/?id=329e79299daaa994b8e75941331a1093051ea5d9
+
+Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
+---
+ arch/riscv64/bits/reg.h    | 6 ------
+ arch/riscv64/bits/signal.h | 9 +++++++++
+ 2 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/arch/riscv64/bits/reg.h b/arch/riscv64/bits/reg.h
+index c800788c..2633f39d 100644
+--- a/arch/riscv64/bits/reg.h
++++ b/arch/riscv64/bits/reg.h
+@@ -1,8 +1,2 @@
+ #undef __WORDSIZE
+ #define __WORDSIZE 64
+-#define REG_PC 0
+-#define REG_RA 1
+-#define REG_SP 2
+-#define REG_TP 4
+-#define REG_S0 8
+-#define REG_A0 10
+diff --git a/arch/riscv64/bits/signal.h b/arch/riscv64/bits/signal.h
+index 2ff4be30..b006334f 100644
+--- a/arch/riscv64/bits/signal.h
++++ b/arch/riscv64/bits/signal.h
+@@ -35,6 +35,15 @@ typedef struct mcontext_t {
+ 	union __riscv_mc_fp_state __fpregs;
+ } mcontext_t;
+ 
++#if defined(_GNU_SOURCE)
++#define REG_PC 0
++#define REG_RA 1
++#define REG_SP 2
++#define REG_TP 4
++#define REG_S0 8
++#define REG_A0 10
++#endif
++
+ #if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
+ typedef unsigned long greg_t;
+ typedef unsigned long gregset_t[32];
+-- 
+cgit v1.2.1
+
