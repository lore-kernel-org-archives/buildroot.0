From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 19:20:38 +0100
Subject: [Buildroot] [git commit] packages/glibc: Fix mcontext_t error that
 breaks RISC-V package builds
Message-ID: <20190204181940.0CBDF83B8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72723ea80f71300c4bb5078a2c4240e6ed43b160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The riscv-glibc repository version of glibc 2.26 will build for
RISC-V 32bit, but when many packages are built against the resulting
library an 'unknown type name mcontext_t' error is reported. The
definition of mcontext_h in the ucontext.h header file needs to be
moved outside of the '#ifdef __USE_MISC' structure to fix this
issue.

Fixes:
  http://autobuild.buildroot.net/results/5aa9cb29c459f511dc9c4fcf218dc9a842505aa3

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t_t-error-that-breaks-RISC-V-architecture.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch
new file mode 100644
index 0000000000..961d5a1cb6
--- /dev/null
+++ b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch
@@ -0,0 +1,39 @@
+From 6b4520e13c2ed7fca725d5f5c879854cd7c96c19 Mon Sep 17 00:00:00 2001
+From: Mark Corbin <mark.corbin@embecosm.com>
+Date: Mon, 4 Feb 2019 10:35:27 +0000
+Subject: [PATCH] Fix mcontext_t error that breaks RISC-V architecture
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
