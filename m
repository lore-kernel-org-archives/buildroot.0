From: Mark Corbin <mark.corbin@embecosm.com>
Date: Mon,  4 Feb 2019 15:49:59 +0000
Subject: [Buildroot] [PATCH 1/1] packages/glibc: Fix mcontext_t error that
 breaks RISC-V package builds
Message-ID: <20190204154959.26237-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The riscv-glibc repository version of glibc 2.26 will build for
RISC-V 32bit, but when many packages are built against the resulting
library an 'unknown type name mcontext_t' error is reported. The
definition of mcontext_h in the ucontext.h header file needs to be
moved outside of the '#ifdef __USE_MISC' structure to fix this
issue.

Fixes:
  http://autobuild.buildroot.net/results/5aa9cb29c459f511dc9c4fcf218dc9a842505aa3

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 ...rror-that-breaks-RISC-V-architecture.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch

diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch
new file mode 100644
index 0000000000..e0875a4590
--- /dev/null
+++ b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch
@@ -0,0 +1,39 @@
+From 6b4520e13c2ed7fca725d5f5c879854cd7c96c19 Mon Sep 17 00:00:00 2001
+From: Mark Corbin <mark.corbin@embecosm.com>
+Date: Mon, 4 Feb 2019 10:35:27 +0000
+Subject: [PATCH 1/1] Fix mcontext_t error that breaks RISC-V architecture
+ package builds
+
+The riscv-glibc repository version of glibc 2.26 will build for
+RISC-V 32bit, but when many packages are built against the resulting
+library an 'unknown type name mcontext_t' error is reported. The
+definition of mcontext_h in the ucontext.h header file needs to be
+moved outside of the '#ifdef __USE_MISC' structure to fix this
+issue.
+
+Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
+---
+ sysdeps/unix/sysv/linux/riscv/sys/ucontext.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h b/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h
+index 8f02f09106..b9dd04564a 100644
+--- a/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h
++++ b/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h
+@@ -48,12 +48,11 @@ typedef greg_t gregset_t[NGREG];
+ 
+ /* Container for floating-point state.  */
+ typedef union __riscv_fp_state fpregset_t;
++#endif
+ 
+ /* Context to describe whole processor state.  */
+ typedef struct sigcontext mcontext_t;
+ 
+-#endif
+-
+ /* Userlevel context.  */
+ typedef struct ucontext
+   {
+-- 
+2.19.1
+
-- 
2.19.1
