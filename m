From: Romain Perier <romain.perier@free-electrons.com>
Date: Tue, 26 Jul 2016 10:21:30 +0200
Subject: [Buildroot] [PATCH v3 6/6] package/amd-catalyst-driver: Add AMD
	proprietary graphic stack support
In-Reply-To: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
References: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
Message-ID: <1469521290-20446-7-git-send-email-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commits adds support for the AMD Catalyst Linux driver 15.9
(15.201.1151). It includes the fglrx kernel module with various fixes
to make it work with at least Linux kernel 4.4 LTS, the userspace OpenGL
and OpenCL binary blobs and the most commonly used cmdline tools.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
---

Changes in v3:
 - Add a missing comma before the first argument of
   AMD_CATALYST_DRIVER_INSTALL_GL_LIBS, otherwise this function
   is skipped and does nothing.

 package/Config.in                                  |   1 +
 .../0001-Add-support-for-Linux-4.0.patch           |  45 ++++++
 .../0002-Add-support-for-Linux-4.1.patch           |  31 ++++
 .../0003-Add-support-for-Linux-4.2.patch           | 121 ++++++++++++++
 ...0004-Use-fpregs_active-instead-of-has_fpu.patch |  33 ++++
 ...-Use-a-local-copy-of-copy_xregs_to_kernel.patch |  79 ++++++++++
 .../0006-Add-support-for-Linux-4.4.patch           |  78 +++++++++
 package/amd-catalyst-driver/20-fglrx.conf          |   4 +
 package/amd-catalyst-driver/Config.in              |  90 +++++++++++
 .../amd-catalyst-driver/amd-catalyst-driver.hash   |   2 +
 package/amd-catalyst-driver/amd-catalyst-driver.mk | 175 +++++++++++++++++++++
 package/amd-catalyst-driver/gl.pc                  |  12 ++
 12 files changed, 671 insertions(+)
 create mode 100644 package/amd-catalyst-driver/0001-Add-support-for-Linux-4.0.patch
 create mode 100644 package/amd-catalyst-driver/0002-Add-support-for-Linux-4.1.patch
 create mode 100644 package/amd-catalyst-driver/0003-Add-support-for-Linux-4.2.patch
 create mode 100644 package/amd-catalyst-driver/0004-Use-fpregs_active-instead-of-has_fpu.patch
 create mode 100644 package/amd-catalyst-driver/0005-Use-a-local-copy-of-copy_xregs_to_kernel.patch
 create mode 100644 package/amd-catalyst-driver/0006-Add-support-for-Linux-4.4.patch
 create mode 100644 package/amd-catalyst-driver/20-fglrx.conf
 create mode 100644 package/amd-catalyst-driver/Config.in
 create mode 100644 package/amd-catalyst-driver/amd-catalyst-driver.hash
 create mode 100644 package/amd-catalyst-driver/amd-catalyst-driver.mk
 create mode 100644 package/amd-catalyst-driver/gl.pc

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..7aa1e3c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -344,6 +344,7 @@ endmenu
 	source "package/acpid/Config.in"
 	source "package/aer-inject/Config.in"
 	source "package/am335x-pru-package/Config.in"
+	source "package/amd-catalyst-driver/Config.in"
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
diff --git a/package/amd-catalyst-driver/0001-Add-support-for-Linux-4.0.patch b/package/amd-catalyst-driver/0001-Add-support-for-Linux-4.0.patch
new file mode 100644
index 0000000..a0db962
--- /dev/null
+++ b/package/amd-catalyst-driver/0001-Add-support-for-Linux-4.0.patch
@@ -0,0 +1,45 @@
+From c35482bc0cc56b40263b74c3e58e42be867fd9f2 Mon Sep 17 00:00:00 2001
+From: Alberto Milone <alberto.milone@canonical.com>
+Date: Thu, 17 Sep 2015 15:41:46 +0200
+Subject: [PATCH] Add support for Linux 4.0
+
+Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
+---
+ common/lib/modules/fglrx/build_mod/firegl_public.c | 5 +++++
+ common/lib/modules/fglrx/build_mod/kcl_str.c       | 4 ++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/common/lib/modules/fglrx/build_mod/firegl_public.c b/common/lib/modules/fglrx/build_mod/firegl_public.c
+index 677565d..6017e89 100755
+--- a/common/lib/modules/fglrx/build_mod/firegl_public.c
++++ b/common/lib/modules/fglrx/build_mod/firegl_public.c
+@@ -285,6 +285,11 @@ MODULE_DEVICE_TABLE(pci, fglrx_pci_table);
+ 
+ MODULE_INFO(supported, "external");
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 20, 0)
++#define read_cr4()       __read_cr4()
++#define write_cr4(cr4)   __write_cr4(cr4)
++#endif
++
+ /* globals constants */
+ const char*         KCL_SYSINFO_OsVersionString = UTS_RELEASE;
+ const unsigned int  KCL_SYSINFO_PageSize        = PAGE_SIZE;
+diff --git a/common/lib/modules/fglrx/build_mod/kcl_str.c b/common/lib/modules/fglrx/build_mod/kcl_str.c
+index 2d89eb0..bacdb69 100755
+--- a/common/lib/modules/fglrx/build_mod/kcl_str.c
++++ b/common/lib/modules/fglrx/build_mod/kcl_str.c
+@@ -42,6 +42,10 @@
+ #include "kcl_type.h"
+ #include "kcl_str.h"
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 20, 0)
++#define strnicmp strncasecmp
++#endif
++
+ /** \brief Fill memory with a constant byte
+  *  \param s Pointer to memory
+  *  \param c Initializing value
+-- 
+2.8.1
+
diff --git a/package/amd-catalyst-driver/0002-Add-support-for-Linux-4.1.patch b/package/amd-catalyst-driver/0002-Add-support-for-Linux-4.1.patch
new file mode 100644
index 0000000..cc95916
--- /dev/null
+++ b/package/amd-catalyst-driver/0002-Add-support-for-Linux-4.1.patch
@@ -0,0 +1,31 @@
+From e9c8ccb4c8c842042542b792c51f9a7ec6c85e06 Mon Sep 17 00:00:00 2001
+From: Alberto Milone <alberto.milone@canonical.com>
+Date: Thu, 17 Sep 2015 15:44:59 +0200
+Subject: [PATCH] Add support for Linux 4.1
+
+Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
+---
+ common/lib/modules/fglrx/build_mod/firegl_public.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/common/lib/modules/fglrx/build_mod/firegl_public.c b/common/lib/modules/fglrx/build_mod/firegl_public.c
+index 6017e89..94778f1 100755
+--- a/common/lib/modules/fglrx/build_mod/firegl_public.c
++++ b/common/lib/modules/fglrx/build_mod/firegl_public.c
+@@ -3508,10 +3508,12 @@ int ATI_API_CALL KCL_InstallInterruptHandler(
+         KCL_PUB_InterruptHandlerWrap,
+ #if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,22)
+         ((useMSI) ? (SA_INTERRUPT) : (SA_SHIRQ)),
+-#else
++#elif LINUX_VERSION_CODE < KERNEL_VERSION(4,1,0)
+         //when MSI enabled. keep irq disabled when calling the action handler,
+         //exclude this IRQ from irq balancing (only on one CPU) 
+         ((useMSI) ? (IRQF_DISABLED) : (IRQF_SHARED)),    
++#else
++        ((useMSI) ? (0x0) : (IRQF_SHARED)),
+ #endif
+         dev_name,
+         context);
+-- 
+2.8.1
+
diff --git a/package/amd-catalyst-driver/0003-Add-support-for-Linux-4.2.patch b/package/amd-catalyst-driver/0003-Add-support-for-Linux-4.2.patch
new file mode 100644
index 0000000..7458162
--- /dev/null
+++ b/package/amd-catalyst-driver/0003-Add-support-for-Linux-4.2.patch
@@ -0,0 +1,121 @@
+From e2e6c2dac2a0311a022208dd289374b832538329 Mon Sep 17 00:00:00 2001
+From: Alberto Milone <alberto.milone@canonical.com>
+Date: Tue, 14 Jul 2015 12:56:37 +0200
+Subject: [PATCH] Add support for Linux 4.2
+
+Deal with the FPU code renaming
+
+Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
+---
+ common/lib/modules/fglrx/build_mod/firegl_public.c | 38 ++++++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+
+diff --git a/common/lib/modules/fglrx/build_mod/firegl_public.c b/common/lib/modules/fglrx/build_mod/firegl_public.c
+index 94778f1..749ea51 100755
+--- a/common/lib/modules/fglrx/build_mod/firegl_public.c
++++ b/common/lib/modules/fglrx/build_mod/firegl_public.c
+@@ -191,9 +191,17 @@
+ #include <linux/string.h>
+ #include <linux/gfp.h>
+ #include <linux/swap.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,2,0)
+ #include "asm/i387.h"
++#else
++#include <asm/fpu/api.h>
++#endif
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0)
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,2,0)
+ #include <asm/fpu-internal.h>
++#else
++#include <asm/fpu/internal.h>
++#endif
+ #endif
+ 
+ #include "firegl_public.h"
+@@ -1711,6 +1719,9 @@ void ATI_API_CALL KCL_SetCurrentProcessState(KCL_ENUM_ProcessState state)
+ 
+ #if defined(__i386__) 
+ #ifndef __HAVE_ARCH_CMPXCHG
++#ifndef __xg
++#define __xg(x) ((volatile long *)(x))
++#endif
+ static inline 
+ unsigned long __fgl_cmpxchg(volatile void *ptr, unsigned long old,            
+                         unsigned long new, int size)                      
+@@ -1747,7 +1758,11 @@ unsigned long ATI_API_CALL kcl__cmpxchg(volatile void *ptr, unsigned long old,
+          unsigned long new, int size)
+ {
+ #ifndef __HAVE_ARCH_CMPXCHG
++#if defined(__i386__)
+     return __fgl_cmpxchg(ptr,old,new,size);
++#elif defined(__x86_64__)
++    return cmpxchg((unsigned long*)ptr,old,new);
++#endif
+ #else
+     /* On kernel version 2.6.34 passing a variable or unsupported size
+      * argument to the __cmpxchg macro causes the default-clause of a
+@@ -6443,21 +6458,36 @@ static int KCL_fpu_save_init(struct task_struct *tsk)
+    struct fpu *fpu = &tsk->thread.fpu;
+ 
+    if(static_cpu_has(X86_FEATURE_XSAVE)) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,2,0)
+       fpu_xsave(fpu);
+       if (!(fpu->state->xsave.xsave_hdr.xstate_bv & XSTATE_FP))
++#else
++      copy_xregs_to_kernel(&fpu->state.xsave);
++      if (!(fpu->state.xsave.header.xfeatures & XSTATE_FP))
++#endif
+ 	 return 1;
+    } else if (static_cpu_has(X86_FEATURE_FXSR)) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,2,0)
+ 	 fpu_fxsave(fpu);
++#else
++     copy_fxregs_to_kernel(fpu);
++#endif
+    } else {
+ 	 asm volatile("fnsave %[fx]; fwait"
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,2,0)
+                   : [fx] "=m" (fpu->state->fsave));
++#else
++                  : [fx] "=m" (fpu->state.fsave));
++#endif
+ 	 return 0;
+    }
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,2,0)
+    if (unlikely(fpu->state->fxsave.swd & X87_FSW_ES)) {
+ 	asm volatile("fnclex");
+ 	return 0;
+    }
++#endif
+    return 1;
+ }
+ #endif
+@@ -6469,8 +6499,12 @@ static int KCL_fpu_save_init(struct task_struct *tsk)
+ void ATI_API_CALL KCL_fpu_begin(void)
+ {
+ #ifdef CONFIG_X86_64
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,2,0)
+     kernel_fpu_begin();
+ #else
++    __kernel_fpu_begin();
++#endif
++#else
+ #ifdef TS_USEDFPU
+     struct thread_info *cur_thread = current_thread_info();
+     struct task_struct *cur_task = get_current();
+@@ -6515,7 +6549,11 @@ void ATI_API_CALL KCL_fpu_begin(void)
+  */
+ void ATI_API_CALL KCL_fpu_end(void)
+ {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,2,0)
+     kernel_fpu_end();
++#else
++    __kernel_fpu_end();
++#endif
+ }
+ 
+ /** Create new directory entry under "/proc/...."
+-- 
+2.8.1
+
diff --git a/package/amd-catalyst-driver/0004-Use-fpregs_active-instead-of-has_fpu.patch b/package/amd-catalyst-driver/0004-Use-fpregs_active-instead-of-has_fpu.patch
new file mode 100644
index 0000000..4d375b8
--- /dev/null
+++ b/package/amd-catalyst-driver/0004-Use-fpregs_active-instead-of-has_fpu.patch
@@ -0,0 +1,33 @@
+From 7120f00015570a2e4d9b6532731960d509c71cba Mon Sep 17 00:00:00 2001
+From: Alberto Milone <alberto.milone@canonical.com>
+Date: Thu, 17 Sep 2015 15:48:30 +0200
+Subject: [PATCH] Use fpregs_active instead of has_fpu
+
+This is for Linux 4.2
+
+Thanks to Tim Gardner for the patch.
+
+Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
+---
+ common/lib/modules/fglrx/build_mod/firegl_public.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/common/lib/modules/fglrx/build_mod/firegl_public.c b/common/lib/modules/fglrx/build_mod/firegl_public.c
+index 749ea51..4c1f9a5 100755
+--- a/common/lib/modules/fglrx/build_mod/firegl_public.c
++++ b/common/lib/modules/fglrx/build_mod/firegl_public.c
+@@ -6528,7 +6528,11 @@ void ATI_API_CALL KCL_fpu_begin(void)
+     /* The thread structure is changed with the commit below for kernel 3.3:
+      * https://github.com/torvalds/linux/commit/7e16838d94b566a17b65231073d179bc04d590c8
+      */
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0)
++    if (cur_task->thread.fpu.fpregs_active)
++#else
+     if (cur_task->thread.fpu.has_fpu)
++#endif
+ #else
+     if (cur_task->thread.has_fpu)
+ #endif
+-- 
+2.8.1
+
diff --git a/package/amd-catalyst-driver/0005-Use-a-local-copy-of-copy_xregs_to_kernel.patch b/package/amd-catalyst-driver/0005-Use-a-local-copy-of-copy_xregs_to_kernel.patch
new file mode 100644
index 0000000..c9513ef
--- /dev/null
+++ b/package/amd-catalyst-driver/0005-Use-a-local-copy-of-copy_xregs_to_kernel.patch
@@ -0,0 +1,79 @@
+From eb703737be5c91c1a0817351db8ec152c523c85d Mon Sep 17 00:00:00 2001
+From: Alberto Milone <alberto.milone@canonical.com>
+Date: Thu, 17 Sep 2015 15:49:46 +0200
+Subject: [PATCH] Use a local copy of copy_xregs_to_kernel
+
+This is needed for Linux 4.2.
+
+Thanks to Tim Gardner for the patch.
+
+Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
+---
+ common/lib/modules/fglrx/build_mod/firegl_public.c | 44 +++++++++++++++++++++-
+ 1 file changed, 43 insertions(+), 1 deletion(-)
+
+diff --git a/common/lib/modules/fglrx/build_mod/firegl_public.c b/common/lib/modules/fglrx/build_mod/firegl_public.c
+index 4c1f9a5..bb67bba 100755
+--- a/common/lib/modules/fglrx/build_mod/firegl_public.c
++++ b/common/lib/modules/fglrx/build_mod/firegl_public.c
+@@ -6443,6 +6443,48 @@ int ATI_API_CALL kcl_sscanf(const char * buf, const char * fmt, ...)
+     return i;
+ }
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0)
++/*
++ * Save processor xstate to xsave area.
++ */
++static void _copy_xregs_to_kernel(struct xregs_state *xstate)
++{
++        u64 mask = -1;
++        u32 lmask = mask;
++        u32 hmask = mask >> 32;
++        int err = 0;
++
++        /*WARN_ON(!alternatives_patched);*/
++
++        /*
++         * If xsaves is enabled, xsaves replaces xsaveopt because
++         * it supports compact format and supervisor states in addition to
++         * modified optimization in xsaveopt.
++         *
++         * Otherwise, if xsaveopt is enabled, xsaveopt replaces xsave
++         * because xsaveopt supports modified optimization which is not
++         * supported by xsave.
++         *
++         * If none of xsaves and xsaveopt is enabled, use xsave.
++         */
++        alternative_input_2(
++                "1:"XSAVE,
++                XSAVEOPT,
++                X86_FEATURE_XSAVEOPT,
++                XSAVES,
++                X86_FEATURE_XSAVES,
++                [xstate] "D" (xstate), "a" (lmask), "d" (hmask) :
++                "memory");
++        asm volatile("2:\n\t"
++                     xstate_fault(err)
++                     : "0" (err)
++                     : "memory");
++
++        /* We should never fault when copying to a kernel buffer: */
++        WARN_ON_FPU(err);
++}
++#endif
++
+ /** \brief Generate UUID
+  *  \param buf pointer to the generated UUID
+  *  \return None
+@@ -6462,7 +6504,7 @@ static int KCL_fpu_save_init(struct task_struct *tsk)
+       fpu_xsave(fpu);
+       if (!(fpu->state->xsave.xsave_hdr.xstate_bv & XSTATE_FP))
+ #else
+-      copy_xregs_to_kernel(&fpu->state.xsave);
++      _copy_xregs_to_kernel(&fpu->state.xsave);
+       if (!(fpu->state.xsave.header.xfeatures & XSTATE_FP))
+ #endif
+ 	 return 1;
+-- 
+2.8.1
+
diff --git a/package/amd-catalyst-driver/0006-Add-support-for-Linux-4.4.patch b/package/amd-catalyst-driver/0006-Add-support-for-Linux-4.4.patch
new file mode 100644
index 0000000..104e2c5
--- /dev/null
+++ b/package/amd-catalyst-driver/0006-Add-support-for-Linux-4.4.patch
@@ -0,0 +1,78 @@
+From 54b230e26a1889c08507e791ab043f8a4b4ff771 Mon Sep 17 00:00:00 2001
+From: Romain Perier <romain.perier@free-electrons.com>
+Date: Thu, 7 Jul 2016 14:40:53 +0200
+Subject: [PATCH] Add support for Linux 4.4
+
+It fixes various things like the use of seq_printf because its API
+changed. It also replaces the call to mtrr_add and mtrr_del by
+arch_phys_wc_add and arch_phys_wc_del because these symbols are
+no longer exported for Linux >= 4.3.x.
+
+Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
+---
+ common/lib/modules/fglrx/build_mod/firegl_public.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/common/lib/modules/fglrx/build_mod/firegl_public.c b/common/lib/modules/fglrx/build_mod/firegl_public.c
+index bb67bba..b4b2d30 100755
+--- a/common/lib/modules/fglrx/build_mod/firegl_public.c
++++ b/common/lib/modules/fglrx/build_mod/firegl_public.c
+@@ -636,9 +636,16 @@ static int firegl_major_proc_read(struct seq_file *m, void* data)
+ 
+     len = snprintf(buf, request, "%d\n", major);
+ #else
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,3,0)
++    seq_printf(m, "%d\n", major);
++    len = 0;
++#else
+     len = seq_printf(m, "%d\n", major);
+ #endif
+ 
++#endif
++
+     KCL_DEBUG1(FN_FIREGL_PROC, "return len=%i\n",len);
+ 
+     return len;
+@@ -3432,7 +3439,11 @@ int ATI_API_CALL KCL_MEM_MTRR_Support(void)
+ int ATI_API_CALL KCL_MEM_MTRR_AddRegionWc(unsigned long base, unsigned long size)
+ {
+ #ifdef CONFIG_MTRR
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,3,0)
++    return arch_phys_wc_add(base, size);
++#else
+     return mtrr_add(base, size, MTRR_TYPE_WRCOMB, 1);
++#endif
+ #else /* !CONFIG_MTRR */
+     return -EPERM;
+ #endif /* !CONFIG_MTRR */
+@@ -3441,7 +3452,12 @@ int ATI_API_CALL KCL_MEM_MTRR_AddRegionWc(unsigned long base, unsigned long size
+ int ATI_API_CALL KCL_MEM_MTRR_DeleteRegion(int reg, unsigned long base, unsigned long size)
+ {
+ #ifdef CONFIG_MTRR
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,3,0)
++    arch_phys_wc_del(reg);
++    return 0;
++#else
+     return mtrr_del(reg, base, size);
++#endif
+ #else /* !CONFIG_MTRR */
+     return -EPERM;
+ #endif /* !CONFIG_MTRR */
+@@ -6505,8 +6521,13 @@ static int KCL_fpu_save_init(struct task_struct *tsk)
+       if (!(fpu->state->xsave.xsave_hdr.xstate_bv & XSTATE_FP))
+ #else
+       _copy_xregs_to_kernel(&fpu->state.xsave);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,4,0)
++      if (!(fpu->state.xsave.header.xfeatures & XFEATURE_MASK_FP))
++#else
+       if (!(fpu->state.xsave.header.xfeatures & XSTATE_FP))
+ #endif
++
++#endif
+ 	 return 1;
+    } else if (static_cpu_has(X86_FEATURE_FXSR)) {
+ #if LINUX_VERSION_CODE < KERNEL_VERSION(4,2,0)
+-- 
+2.8.1
+
diff --git a/package/amd-catalyst-driver/20-fglrx.conf b/package/amd-catalyst-driver/20-fglrx.conf
new file mode 100644
index 0000000..1186ed1
--- /dev/null
+++ b/package/amd-catalyst-driver/20-fglrx.conf
@@ -0,0 +1,4 @@
+Section "Device"
+	Identifier "AMD Radeon GPU"
+        Driver "fglrx"
+EndSection
diff --git a/package/amd-catalyst-driver/Config.in b/package/amd-catalyst-driver/Config.in
new file mode 100644
index 0000000..2dbecaa
--- /dev/null
+++ b/package/amd-catalyst-driver/Config.in
@@ -0,0 +1,90 @@
+comment "amd-catalyst-driver needs a glibc toolchain"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_AMD_CATALYST_DRIVER
+	bool "amd-catalyst-driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  The binary-only driver blob for AMD cards.
+	  This driver supports AMD Radeon HD 5xxx and newer graphics
+	  cards.
+
+	  http://www.amd.com/
+
+if BR2_PACKAGE_AMD_CATALYST_DRIVER
+
+comment "amd-catalyst-driver needs a modular Xorg <= 1.17"
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR || !BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+
+config BR2_PACKAGE_AMD_CATALYST_DRIVER_XORG
+	bool "X.org drivers"
+	default y
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
+	select BR2_PACKAGE_ACPID # runtime
+	# This package does not have standard GL headers
+	select BR2_PACKAGE_MESA3D_HEADERS
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
+
+if BR2_PACKAGE_AMD_CATALYST_DRIVER_XORG
+
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "amd-catalyst-driver"
+
+config BR2_PACKAGE_AMD_CATALYST_DRIVER_CMDLINE_TOOLS
+	bool "command-line configuration tools and utilities"
+	help
+	  Build the amd command line tools
+
+comment "Catalyst Control Center needs Qt4 with X11 and PNG support"
+	depends on !BR2_PACKAGE_QT || !BR2_PACKAGE_QT_X11 || BR2_PACKAGE_QT_NOPNG
+
+config BR2_PACKAGE_AMD_CATALYST_DRIVER_CCCLE
+	bool "Catalyst Control Center"
+	depends on BR2_USE_MMU && BR2_PACKAGE_QT && BR2_PACKAGE_QT_X11
+	select BR2_PACKAGE_PROCPS_NG # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_QT_GUI_MODULE
+	select BR2_PACKAGE_QT_ACCESSIBILITY
+	help
+	  Installs the Catalyst Control Center, a Qt graphical tool to
+	  control AMD graphics accelerators.
+
+endif
+
+config BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
+	bool
+
+config BR2_PACKAGE_AMD_CATALYST_DRIVER_OPENCL
+	bool "OpenCL support"
+	select BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
+	help
+	  Installs the OpenCL binary blobs and the ICD profile
+	  for GPGPU computing.
+
+
+
+config BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE_LICENSE_GPL
+	bool "fglrx module export GPL license"
+	help
+	  If enabled, you accept that the driver will be patched locally
+	  in order to export itself as a GPL module to the Linux kernel.
+	  This is required as the module uses some GPL-compatible
+	  symbols. Without this fix, the module won't build properly
+	  because the Linux kernel build system does not allow to link a
+	  non GPL module, if this one tries to use GPL-only symbols. It
+	  is worth mentioning that from a legal point of view, you are
+	  most likely not allowed to redistribute such a kernel module,
+	  in a pre-built form. The author and the buildroot project
+	  disclaim any responsibility in case these terms are not
+	  respected.
+
+endif # BR2_PACKAGE_AMD_CATALYST_DRIVER
diff --git a/package/amd-catalyst-driver/amd-catalyst-driver.hash b/package/amd-catalyst-driver/amd-catalyst-driver.hash
new file mode 100644
index 0000000..9f9b0a3
--- /dev/null
+++ b/package/amd-catalyst-driver/amd-catalyst-driver.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	bf3e6e7d5c51db3d075410a3f116f865b82823debc1d66698d187249feec6a91	amd-catalyst-15.9-linux-installer-15.201.1151-x86.x86_64.zip
diff --git a/package/amd-catalyst-driver/amd-catalyst-driver.mk b/package/amd-catalyst-driver/amd-catalyst-driver.mk
new file mode 100644
index 0000000..cfad4ee
--- /dev/null
+++ b/package/amd-catalyst-driver/amd-catalyst-driver.mk
@@ -0,0 +1,175 @@
+################################################################################
+#
+# amd-catalyst-driver
+#
+################################################################################
+
+AMD_CATALYST_DRIVER_VERSION = 15.9
+AMD_CATALYST_DRIVER_VERBOSE_VER = 15.201.1151
+AMD_CATALYST_DRIVER_SITE = http://www2.ati.com/drivers/linux
+AMD_CATALYST_DRIVER_DL_OPTS = --referer='http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx'
+AMD_CATALYST_DRIVER_SOURCE = amd-catalyst-$(AMD_CATALYST_DRIVER_VERSION)-linux-installer-$(AMD_CATALYST_DRIVER_VERBOSE_VER)-x86.x86_64.zip
+AMD_CATALYST_DRIVER_LICENSE = AMD Software License 
+AMD_CATALYST_DRIVER_LICENSE_FILES = LICENSE.txt
+AMD_CATALYST_DRIVER_INSTALL_STAGING = YES
+AMD_CATALYST_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
+AMD_CATALYST_DRIVER_ARCH_DIR = $(@D)/arch/x86$(AMD_CATALYST_DRIVER_SUFFIX)
+AMD_CATALYST_DRIVER_LIB_SUFFIX = $(if $(BR2_x86_64),64)
+
+
+define AMD_CATALYST_DRIVER_EXTRACT_CMDS
+	unzip -q $(DL_DIR)/$(AMD_CATALYST_DRIVER_SOURCE) -d $(@D)
+	$(SHELL) $(@D)/AMD-Catalyst-$(AMD_CATALYST_DRIVER_VERSION)-Linux-installer-$(AMD_CATALYST_DRIVER_VERBOSE_VER)-x86.x86_64.run --extract $(@D)
+endef
+
+ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE),y)
+AMD_CATALYST_DRIVER_MODULE_SUBDIRS = common/lib/modules/fglrx/build_mod/2.6.x
+AMD_CATALYST_DRIVER_MODULE_MAKE_OPTS =  \
+	CFLAGS_MODULE="-DCOMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space"
+
+ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE_LICENSE_GPL),y)
+define AMD_CATALYST_DRIVER_POST_PATCH_LICENSE_FIXUP
+	sed 's/^MODULE_LICENSE("\(.*\)")/MODULE_LICENSE("GPL\\0\1")/' -i $(@D)/common/lib/modules/fglrx/build_mod/firegl_public.c
+endef
+AMD_CATALYST_DRIVER_POST_PATCH_HOOKS += AMD_CATALYST_DRIVER_POST_PATCH_LICENSE_FIXUP
+endif
+
+define AMD_CATALYST_DRIVER_CONFIGURE_CMDS
+	# The Makefile expects to have source in the folder 2.6.x
+	cp $(@D)/common/lib/modules/fglrx/build_mod/*.{c,h} \
+		$(@D)/common/lib/modules/fglrx/build_mod/2.6.x
+	# This static lib is required during the link
+	cp $(@D)/arch/x86$(AMD_CATALYST_DRIVER_SUFFIX)/lib/modules/fglrx/build_mod/libfglrx_ip.a \
+		$(@D)/common/lib/modules/fglrx/build_mod/2.6.x
+endef
+
+$(eval $(kernel-module))
+endif
+
+ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_OPENCL),y)
+
+AMD_CATALYST_DRIVER_OCL_SUFFIX = $(if $(BR2_x86_64),64,32)
+AMD_CATALYST_DRIVER_OPENCL_FILES = \
+	usr/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/libOpenCL.so.1 \
+	usr/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/libaticalcl.so \
+	usr/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/libamdocl$(AMD_CATALYST_DRIVER_OCL_SUFFIX).so \
+	usr/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/libamdocl12cl$(AMD_CATALYST_DRIVER_OCL_SUFFIX).so
+
+define AMD_CATALYST_DRIVER_INSTALL_OPENCL
+	$(foreach f,$(AMD_CATALYST_DRIVER_OPENCL_FILES), \
+		$(INSTALL) -D -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/$(f) $(TARGET_DIR)/$(f)
+	)
+	ln -sf libOpenCL.so.1 \
+		$(TARGET_DIR)/usr/lib/libOpenCL.so
+	$(INSTALL) -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/bin/clinfo \
+		$(TARGET_DIR)/usr/bin
+	$(INSTALL) -D -m 0644 $(AMD_CATALYST_DRIVER_ARCH_DIR)/etc/OpenCL/vendors/amdocl$(AMD_CATALYST_DRIVER_OCL_SUFFIX).icd \
+		$(TARGET_DIR)/etc/OpenCL/vendors/amdocl$(AMD_CATALYST_DRIVER_OCL_SUFFIX).icd
+endef
+
+endif
+
+ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_XORG), y)
+
+AMD_CATALYST_DRIVER_DEPENDENCIES += mesa3d-headers
+AMD_CATALYST_DRIVER_PROVIDES = libgl
+AMD_CATALYST_DRIVER_XPIC_DIR = $(@D)/xpic$(if $(BR2_x86_64),_64a)
+
+define AMD_CATALYST_DRIVER_INSTALL_GL_LIBS
+	$(INSTALL) -m 0644 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/fglrx/fglrx-libGL.so.1.2 \
+		$(1)/usr/lib
+	ln -sf fglrx-libGL.so.1.2 $(1)/usr/lib/libGL.so.1.2
+	ln -sf fglrx-libGL.so.1.2 $(1)/usr/lib/libGL.so.1
+	ln -sf fglrx-libGL.so.1.2 $(1)/usr/lib/libGL.so
+endef
+
+define AMD_CATALYST_DRIVER_INSTALL_STAGING_XORG
+	$(call AMD_CATALYST_DRIVER_INSTALL_GL_LIBS,$(STAGING_DIR))
+	$(INSTALL) -D -m 0644 package/amd-catalyst-driver/gl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
+endef
+
+AMD_CATALYST_DRIVER_XORG_DRIVERS_FILES = modules/amdxmm.so \
+	modules/drivers/fglrx_drv.so \
+	modules/linux/libfglrxdrm.so
+
+define AMD_CATALYST_DRIVER_INSTALL_XORG
+# Xorg drivers
+	$(foreach f,$(AMD_CATALYST_DRIVER_XORG_DRIVERS_FILES), \
+		$(INSTALL) -D -m 0755 $(AMD_CATALYST_DRIVER_XPIC_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/$(f) \
+		$(TARGET_DIR)/usr/lib/xorg/$(f)
+	)
+
+# Xorg is not able to detect the driver automatically
+	$(INSTALL) -D -m 0644 package/amd-catalyst-driver/20-fglrx.conf \
+		$(TARGET_DIR)/etc/X11/xorg.conf.d/20-fglrx.conf
+
+
+# Common files: containing binary profiles about GPUs,
+# required by the fglrx_drv xorg driver
+	$(INSTALL) -d $(TARGET_DIR)/etc/ati
+ 	$(INSTALL) -m 0644 $(@D)/common/etc/ati/* $(TARGET_DIR)/etc/ati/
+
+# DRI and GLX xorg modules: by default DRI is activated,
+# these modules are required by the fglrx_drv.so xorg driver
+	$(INSTALL) -D -m 0644 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/modules/dri/fglrx_dri.so \
+		$(TARGET_DIR)/usr/lib/dri/fglrx_dri.so
+	$(INSTALL) -D -m 0644 $(AMD_CATALYST_DRIVER_XPIC_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/modules/extensions/fglrx/fglrx-libglx.so \
+		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
+	$(INSTALL) -D -m 0644 $(AMD_CATALYST_DRIVER_XPIC_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/modules/glesx.so \
+		$(TARGET_DIR)/usr/lib/xorg/modules/glesx.so
+
+# Userspace GL libraries, also runtime dependency of most of the cmdline tools
+	$(INSTALL) -m 0644 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/*.so \
+		$(TARGET_DIR)/usr/lib/
+	$(call AMD_CATALYST_DRIVER_INSTALL_GL_LIBS,$(TARGET_DIR))
+
+# Runtime depedency required by libfglrxdrm.so
+	$(INSTALL) -m 0644 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/libatiuki.so.1.0 \
+		$(TARGET_DIR)/usr/lib/
+	ln -sf libatiuki.so.1.0 \
+		$(TARGET_DIR)/usr/lib/libatiuki.so.1
+endef
+
+endif
+
+ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_CMDLINE_TOOLS), y)
+AMD_CATALYST_DRIVER_CMDLINE_TOOLS_FILES = \
+	atiode \
+	atiodcli \
+	fgl_glxgears \
+	aticonfig \
+	amd-console-helper \
+	fglrxinfo
+
+define  AMD_CATALYST_DRIVER_INSTALL_CMDLINE_TOOLS
+	$(INSTALL) -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/sbin/atieventsd \
+		$(TARGET_DIR)/usr/sbin
+	$(foreach f,$(AMD_CATALYST_DRIVER_CMDLINE_TOOLS_FILES), \
+		$(INSTALL) -D -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/X11R6/bin/$(f) \
+			$(TARGET_DIR)/usr/bin/$(f)
+	)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_CCCLE), y)
+define AMD_CATALYST_DRIVER_INSTALL_CCCLE
+	$(INSTALL) -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/X11R6/bin/amdcccle \
+		$(TARGET_DIR)/usr/bin/amdcccle
+	$(INSTALL) -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/sbin/amdnotifyui \
+		$(TARGET_DIR)/usr/sbin/amdnotifyui
+endef
+endif
+
+define AMD_CATALYST_DRIVER_INSTALL_STAGING_CMDS
+	$(call AMD_CATALYST_DRIVER_INSTALL_STAGING_XORG)
+endef
+
+define AMD_CATALYST_DRIVER_INSTALL_TARGET_CMDS
+	$(call AMD_CATALYST_DRIVER_INSTALL_XORG)
+	$(call AMD_CATALYST_DRIVER_INSTALL_CMDLINE_TOOLS)
+	$(call AMD_CATALYST_DRIVER_INSTALL_CCCLE)
+	$(call AMD_CATALYST_DRIVER_INSTALL_OPENCL)
+endef
+
+$(eval $(generic-package))
diff --git a/package/amd-catalyst-driver/gl.pc b/package/amd-catalyst-driver/gl.pc
new file mode 100644
index 0000000..8729271
--- /dev/null
+++ b/package/amd-catalyst-driver/gl.pc
@@ -0,0 +1,12 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: gl
+Description: AMD Catalyst OpenGL library
+Version: 15.9
+Libs: -L${libdir} -lGL -lm -lXext -lX11 -ldl
+Cflags: -I${includedir}
+glx_tls: no
+
-- 
2.8.1
