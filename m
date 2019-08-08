From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  8 Aug 2019 21:38:47 +0300
Subject: [Buildroot] [PATCH v2] package/musl: fix conflict with riscv kernel
 headers
Message-ID: <a34235eac6761a3c5c38451cde296dd7d88db86b.1565289527.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two upstream patches fixing musl vs kernel headers conflict. This
fixes build of strace for risc64 at it happens to use headers from both
sources.

Modify patch #3 to leave a single newline in user.h. Otherwise 'patch
-E' in apply-patches.sh deletes user.h instead of leaving it empty.

Fixes (strace):
http://autobuild.buildroot.net/results/ac32e83dc5eb5ce2809fc4b9d11f540dbdae9ed6/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Use upstream patch (slightly modified) for user.h
---
 ...-risc64-conflict-with-kernel-headers.patch | 61 ++++++++++++++++
 ...-remove-riscv64-bits-user.h-contents.patch | 69 +++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
 create mode 100644 package/musl/0003-remove-riscv64-bits-user.h-contents.patch

diff --git a/package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch b/package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
new file mode 100644
index 000000000000..8ae7b0200ae5
--- /dev/null
+++ b/package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
@@ -0,0 +1,61 @@
+From 8acc688548b27151c45ee8a80f3a0b75f4a761c0 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 6 Aug 2019 08:51:13 +0300
+Subject: [PATCH] fix risc64 conflict with kernel headers
+
+Rename user registers struct definitions to avoid conflict with the
+asm/ptrace.h kernel header that defines the same structs. Use the
+__riscv_mc prefix as glibc does.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 8acc688548b
+
+ arch/riscv64/bits/signal.h | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/arch/riscv64/bits/signal.h b/arch/riscv64/bits/signal.h
+index 4c94a8f02edc..76d7ad80c8cd 100644
+--- a/arch/riscv64/bits/signal.h
++++ b/arch/riscv64/bits/signal.h
+@@ -12,29 +12,29 @@
+ typedef unsigned long greg_t;
+ typedef unsigned long gregset_t[32];
+ 
+-struct __riscv_f_ext_state {
++struct __riscv_mc_f_ext_state {
+ 	unsigned int f[32];
+ 	unsigned int fcsr;
+ };
+ 
+-struct __riscv_d_ext_state {
++struct __riscv_mc_d_ext_state {
+ 	unsigned long long f[32];
+ 	unsigned int fcsr;
+ };
+ 
+-struct __riscv_q_ext_state {
++struct __riscv_mc_q_ext_state {
+ 	unsigned long long f[64] __attribute__((aligned(16)));
+ 	unsigned int fcsr;
+ 	unsigned int reserved[3];
+ };
+ 
+-union __riscv_fp_state {
+-	struct __riscv_f_ext_state f;
+-	struct __riscv_d_ext_state d;
+-	struct __riscv_q_ext_state q;
++union __riscv_mc_fp_state {
++	struct __riscv_mc_f_ext_state f;
++	struct __riscv_mc_d_ext_state d;
++	struct __riscv_mc_q_ext_state q;
+ };
+ 
+-typedef union __riscv_fp_state fpregset_t;
++typedef union __riscv_mc_fp_state fpregset_t;
+ 
+ typedef struct sigcontext {
+ 	gregset_t gregs;
+-- 
+2.20.1
+
diff --git a/package/musl/0003-remove-riscv64-bits-user.h-contents.patch b/package/musl/0003-remove-riscv64-bits-user.h-contents.patch
new file mode 100644
index 000000000000..4af3ba665b86
--- /dev/null
+++ b/package/musl/0003-remove-riscv64-bits-user.h-contents.patch
@@ -0,0 +1,69 @@
+From 414b512c60706e34473edd58fe876037ea77138c Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Tue, 6 Aug 2019 12:50:38 -0400
+Subject: [PATCH] remove riscv64 bits/user.h contents
+
+the contents conflicted with asm/ptrace.h. glibc does not provide
+anything in user.h for riscv, so software cannot be depending on it.
+
+simplified from patch submitted by Baruch Siach.
+
+[ baruch: add empty line so that 'patch -E' doesn't delete user.h ]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit d493206de7df
+
+ arch/riscv64/bits/user.h | 42 ----------------------------------------
+ 1 file changed, 42 deletions(-)
+
+diff --git a/arch/riscv64/bits/user.h b/arch/riscv64/bits/user.h
+index bd0f0fc7027f..8b137891791f 100644
+--- a/arch/riscv64/bits/user.h
++++ b/arch/riscv64/bits/user.h
+@@ -1,43 +1 @@
+-struct user_regs_struct {
+-	unsigned long pc;
+-	unsigned long ra;
+-	unsigned long sp;
+-	unsigned long gp;
+-	unsigned long tp;
+-	unsigned long t0;
+-	unsigned long t1;
+-	unsigned long t2;
+-	unsigned long s0;
+-	unsigned long s1;
+-	unsigned long a0;
+-	unsigned long a1;
+-	unsigned long a2;
+-	unsigned long a3;
+-	unsigned long a4;
+-	unsigned long a5;
+-	unsigned long a6;
+-	unsigned long a7;
+-	unsigned long s2;
+-	unsigned long s3;
+-	unsigned long s4;
+-	unsigned long s5;
+-	unsigned long s6;
+-	unsigned long s7;
+-	unsigned long s8;
+-	unsigned long s9;
+-	unsigned long s10;
+-	unsigned long s11;
+-	unsigned long t3;
+-	unsigned long t4;
+-	unsigned long t5;
+-	unsigned long t6;
+-};
+ 
+-struct user_fpregs_struct {
+-	double f[32];
+-	unsigned int fcsr;
+-};
+-
+-#define ELF_NGREG 32
+-typedef unsigned long elf_greg_t, elf_gregset_t[ELF_NGREG];
+-typedef struct user_fpregs_struct elf_fpregset_t;
+-- 
+2.20.1
+
-- 
2.20.1
