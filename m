From: Mark Corbin <mark.corbin@embecosm.com>
Date: Fri, 25 Oct 2019 10:56:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigsegv: fix macro expansion
 error for RISC-V with musl
Message-ID: <20191025095605.17673-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The expansion of the SIGSEGV_FAULT_STACKPOINTER macro fails when
building for RISC-V with musl because REG_SP is not defined (it is
defined for glibc). This patch just replaces REG_SP with the
numerical register offset (which is 2 for the stack pointer).

Fixes:
  http://autobuild.buildroot.net/results/8d6cade2562404b9800736a3b9a2beada98bda88

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 ...ion-error-when-building-for-RISC-V-w.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/libsigsegv/0005-Fix-macro-expansion-error-when-building-for-RISC-V-w.patch

diff --git a/package/libsigsegv/0005-Fix-macro-expansion-error-when-building-for-RISC-V-w.patch b/package/libsigsegv/0005-Fix-macro-expansion-error-when-building-for-RISC-V-w.patch
new file mode 100644
index 0000000000..6906e04b1d
--- /dev/null
+++ b/package/libsigsegv/0005-Fix-macro-expansion-error-when-building-for-RISC-V-w.patch
@@ -0,0 +1,29 @@
+From 3da9e4a8aea252143ab567678722c739793cfeb7 Mon Sep 17 00:00:00 2001
+From: Mark Corbin <mark.corbin@embecosm.com>
+Date: Fri, 25 Oct 2019 10:16:54 +0100
+Subject: [PATCH] Fix macro expansion error when building for RISC-V with
+ musl
+
+The expansion of the SIGSEGV_FAULT_STACKPOINTER macro fails when
+building for RISC-V with musl because REG_SP is not defined (it is
+defined for glibc). This patch just replaces REG_SP with the
+numerical register offset (which is 2 for the stack pointer).
+
+Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
+---
+ src/fault-linux-riscv64.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/fault-linux-riscv64.h b/src/fault-linux-riscv64.h
+index 14831bf..7fee4d3 100644
+--- a/src/fault-linux-riscv64.h
++++ b/src/fault-linux-riscv64.h
+@@ -26,4 +26,4 @@
+    glibc/sysdeps/unix/sysv/linux/riscv/bits/sigcontext.h
+    start with the same block of 32 general-purpose registers.  */
+ 
+-#define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.__gregs[REG_SP]
++#define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.__gregs[2]
+-- 
+2.19.1
+
-- 
2.19.1
