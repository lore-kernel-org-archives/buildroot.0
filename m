From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  6 Aug 2019 09:02:35 +0300
Subject: [Buildroot] [PATCH] package/musl: fix conflict with riscv kernel
 headers
Message-ID: <546b2d18faabdbb04764d763c093e7e590cab627.1565071355.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two patches to rename structs that both musl and kernel headers
define. This fixes build of strace for risc64 at it happens to use
headers from both sources.

Fixes (strace):
http://autobuild.buildroot.net/results/ac32e83dc5eb5ce2809fc4b9d11f540dbdae9ed6/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...-risc64-conflict-with-kernel-headers.patch | 61 +++++++++++++++++++
 ...regs_struct-conflict-with-kernel-hea.patch | 28 +++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
 create mode 100644 package/musl/0003-fix-risc64-user_regs_struct-conflict-with-kernel-hea.patch

diff --git a/package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch b/package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
new file mode 100644
index 000000000000..750f16b9293f
--- /dev/null
+++ b/package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
@@ -0,0 +1,61 @@
+From 63f4c551e85a848e336f41539b6dd283396eeda7 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 6 Aug 2019 07:35:51 +0300
+Subject: [PATCH] fix risc64 conflict with kernel headers
+
+Rename user registers struct definitions to avoid conflict with the
+asm/ptrace.h kernel header that defines the same structs. Use the
+__riscv_mc prefix as glibc does.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://www.openwall.com/lists/musl/2019/08/06/4
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
diff --git a/package/musl/0003-fix-risc64-user_regs_struct-conflict-with-kernel-hea.patch b/package/musl/0003-fix-risc64-user_regs_struct-conflict-with-kernel-hea.patch
new file mode 100644
index 000000000000..aaf9d7da6883
--- /dev/null
+++ b/package/musl/0003-fix-risc64-user_regs_struct-conflict-with-kernel-hea.patch
@@ -0,0 +1,28 @@
+From def2fa340038c0de0fd604db530d4b94b8121038 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 6 Aug 2019 08:33:23 +0300
+Subject: [PATCH] fix risc64 user_regs_struct conflict with kernel header
+
+Rename user_regs_struct following the example of s390 to avoid conflict
+with the kernel asm/ptrace.h header.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://www.openwall.com/lists/musl/2019/08/06/5
+
+ arch/riscv64/bits/user.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/riscv64/bits/user.h b/arch/riscv64/bits/user.h
+index bd0f0fc7027f..097c7ad6ce18 100644
+--- a/arch/riscv64/bits/user.h
++++ b/arch/riscv64/bits/user.h
+@@ -1,4 +1,4 @@
+-struct user_regs_struct {
++struct _user_regs_struct {
+ 	unsigned long pc;
+ 	unsigned long ra;
+ 	unsigned long sp;
+-- 
+2.20.1
+
-- 
2.20.1
