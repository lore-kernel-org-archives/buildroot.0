From: Romain Naour <romain.naour@smile.fr>
Date: Mon,  3 Jul 2017 14:50:38 +0200
Subject: [Buildroot] [PATCH] package/libunwind: fix build failure due to
	asm()
Message-ID: <20170703125038.4097-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gcc documentation [1] suggest to use __asm__ instead of asm.

Fixes:
http://autobuild.buildroot.net/results/3ef/3efe156b6494e4392b6c31de447ee2c72acc1a53

[1] https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html#Alternate-Keywords

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ibunwind-arm-fix-build-failure-due-to-asm.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/libunwind/0004-libunwind-arm-fix-build-failure-due-to-asm.patch

diff --git a/package/libunwind/0004-libunwind-arm-fix-build-failure-due-to-asm.patch b/package/libunwind/0004-libunwind-arm-fix-build-failure-due-to-asm.patch
new file mode 100644
index 0000000..cfd0c55
--- /dev/null
+++ b/package/libunwind/0004-libunwind-arm-fix-build-failure-due-to-asm.patch
@@ -0,0 +1,43 @@
+From c7ab998ec52b09d61ec3c0ea62aa07cd26077ea3 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Mon, 3 Jul 2017 14:43:02 +0200
+Subject: [PATCH] libunwind-arm: fix build failure due to asm()
+
+The gcc documentation [1] suggest to use __asm__ instead of asm.
+
+Fixes:
+http://autobuild.buildroot.net/results/3ef/3efe156b6494e4392b6c31de447ee2c72acc1a53
+
+[1] https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html#Alternate-Keywords
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/libunwind-arm.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/libunwind-arm.h b/include/libunwind-arm.h
+index f208487..1c856fa 100644
+--- a/include/libunwind-arm.h
++++ b/include/libunwind-arm.h
+@@ -265,7 +265,7 @@ unw_tdep_context_t;
+ #ifndef __thumb__
+ #define unw_tdep_getcontext(uc) (({                                     \
+   unw_tdep_context_t *unw_ctx = (uc);                                   \
+-  register unsigned long *unw_base asm ("r0") = unw_ctx->regs;          \
++  register unsigned long *unw_base __asm__ ("r0") = unw_ctx->regs;      \
+   __asm__ __volatile__ (                                                \
+     "stmia %[base], {r0-r15}"                                           \
+     : : [base] "r" (unw_base) : "memory");                              \
+@@ -273,7 +273,7 @@ unw_tdep_context_t;
+ #else /* __thumb__ */
+ #define unw_tdep_getcontext(uc) (({                                     \
+   unw_tdep_context_t *unw_ctx = (uc);                                   \
+-  register unsigned long *unw_base asm ("r0") = unw_ctx->regs;          \
++  register unsigned long *unw_base __asm__ ("r0") = unw_ctx->regs;      \
+   __asm__ __volatile__ (                                                \
+     ".align 2\nbx pc\nnop\n.code 32\n"                                  \
+     "stmia %[base], {r0-r15}\n"                                         \
+-- 
+2.9.4
+
-- 
2.9.4
