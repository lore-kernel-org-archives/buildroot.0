From: Nylon Chen <nylon7@andestech.com>
Date: Tue, 7 May 2019 09:33:55 +0800
Subject: [Buildroot] [PATCH 1/1] package/strace: add patch for nds32 support
Message-ID: <20190507013355.14062-1-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/05ec776548c9bede4878d4c3c43040c5b0aac182
  http://autobuild.buildroot.net/results/24023f2fa3dbf7c281726abdbfd4322badaffbfb

Signed-off-by: Vincent Chen <vincentc@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
---
 package/strace/0001-Add-nds32-porting.patch | 491 ++++++++++++++++++++
 package/strace/Config.in                    |   1 -
 2 files changed, 491 insertions(+), 1 deletion(-)
 create mode 100644 package/strace/0001-Add-nds32-porting.patch

diff --git a/package/strace/0001-Add-nds32-porting.patch b/package/strace/0001-Add-nds32-porting.patch
new file mode 100644
index 0000000000..821e74bedb
--- /dev/null
+++ b/package/strace/0001-Add-nds32-porting.patch
@@ -0,0 +1,491 @@
+From df64eebd778a46065e28b13053b1b68f125888a1 Mon Sep 17 00:00:00 2001
+From: Nylon Chen <nylon7@andestech.com>
+Date: Mon, 6 May 2019 14:41:32 +0800
+Subject: [PATCH] Add nds32 porting
+
+Signed-off-by: Vincent Chen <vincentc@andestech.com>
+Signed-off-by: Nylon Chen <nylon7@andestech.com>
+---
+ Makefile.am                    |  12 ++++
+ cacheflush.c                   |  15 +++++
+ config.h.in                    |   3 +
+ configure                      |   6 ++
+ configure.ac                   |   4 ++
+ linux/nds32/arch_regs.c        |   5 ++
+ linux/nds32/arch_regs.h        |   1 +
+ linux/nds32/arch_rt_sigframe.c |  31 ++++++++++
+ linux/nds32/arch_sigreturn.c   |  12 ++++
+ linux/nds32/get_error.c        |  12 ++++
+ linux/nds32/get_scno.c         |  19 ++++++
+ linux/nds32/get_syscall_args.c |  12 ++++
+ linux/nds32/ioctls_arch0.h     | 110 +++++++++++++++++++++++++++++++++
+ linux/nds32/ioctls_inc0.h      |   1 +
+ linux/nds32/set_error.c        |  13 ++++
+ linux/nds32/set_scno.c         |   6 ++
+ linux/nds32/syscallent.h       |  63 +++++++++++++++++++
+ 17 files changed, 325 insertions(+)
+ create mode 100644 linux/nds32/arch_regs.c
+ create mode 100644 linux/nds32/arch_regs.h
+ create mode 100644 linux/nds32/arch_rt_sigframe.c
+ create mode 100644 linux/nds32/arch_sigreturn.c
+ create mode 100644 linux/nds32/get_error.c
+ create mode 100644 linux/nds32/get_scno.c
+ create mode 100644 linux/nds32/get_syscall_args.c
+ create mode 100644 linux/nds32/ioctls_arch0.h
+ create mode 100644 linux/nds32/ioctls_inc0.h
+ create mode 100644 linux/nds32/set_error.c
+ create mode 100644 linux/nds32/set_scno.c
+ create mode 100644 linux/nds32/syscallent.h
+
+diff --git a/Makefile.am b/Makefile.am
+index 71d2558..8c20168 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -638,6 +638,18 @@ EXTRA_DIST =				\
+ 	linux/nios2/set_scno.c		\
+ 	linux/nios2/syscallent.h	\
+ 	linux/nr_prefix.c		\
++	linux/nds32/arch_regs.c		\
++	linux/nds32/arch_regs.h		\
++	linux/nds32/arch_rt_sigframe.c	\
++	linux/nds32/arch_sigreturn.c	\
++	linux/nds32/get_error.c		\
++	linux/nds32/get_scno.c		\
++	linux/nds32/get_syscall_args.c	\
++	linux/nds32/ioctls_arch0.h	\
++	linux/nds32/ioctls_inc0.h	\
++	linux/nds32/set_error.c		\
++	linux/nds32/set_scno.c		\
++	linux/nds32/syscallent.h	\
+ 	linux/or1k/arch_regs.c		\
+ 	linux/or1k/get_error.c		\
+ 	linux/or1k/get_scno.c		\
+diff --git a/cacheflush.c b/cacheflush.c
+index 721af4c..b42c921 100644
+--- a/cacheflush.c
++++ b/cacheflush.c
+@@ -112,3 +112,18 @@ SYS_FUNC(cacheflush)
+ 	return RVAL_DECODED;
+ }
+ #endif /* NIOS2 */
++
++#ifdef NDS32
++SYS_FUNC(cacheflush)
++{
++	/* start addr */
++	printaddr(tcp->u_arg[0]);
++	tprintf(", ");
++	/* end addr */
++	printaddr(tcp->u_arg[1]);
++	/* cache */
++	tprintf(", %lu", tcp->u_arg[2]);
++
++	return RVAL_DECODED;
++}
++#endif /* NIOS2 */
+diff --git a/config.h.in b/config.h.in
+index c6eb993..4825263 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -1675,6 +1675,9 @@
+ /* Define for the Nios-II architecture. */
+ #undef NIOS2
+ 
++/* Define for the nds32 architecture. */
++#undef NDS32
++
+ /* Define for the OpenRISC 1000 architecture. */
+ #undef OR1K
+ 
+diff --git a/configure b/configure
+index 397ca78..041a588 100755
+--- a/configure
++++ b/configure
+@@ -9397,6 +9397,12 @@ mips*)
+ 
+ $as_echo "#define MIPS 1" >>confdefs.h
+ 
++	;;
++nds32*)
++	arch=nds32
++
++$as_echo "#define NDS32 1" >>confdefs.h
++
+ 	;;
+ nios2*)
+ 	arch=nios2
+diff --git a/configure.ac b/configure.ac
+index 8045ebd..b88618e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -174,6 +174,10 @@ x86?64*)
+ 		AC_DEFINE([X32], 1, [Define for the 32bit AMD x86-64 architecture.])
+ 	fi
+ 	;;
++nds32*)
++	arch=nds32
++	AC_DEFINE([NDS32], 1, [Define for the nds32 architecture.])
++	;;
+ xtensa*)
+ 	arch=xtensa
+ 	AC_DEFINE([XTENSA], 1, [Define for the Xtensa architecture])
+diff --git a/linux/nds32/arch_regs.c b/linux/nds32/arch_regs.c
+new file mode 100644
+index 0000000..50b8ac5
+--- /dev/null
++++ b/linux/nds32/arch_regs.c
+@@ -0,0 +1,5 @@
++static struct user_pt_regs nds32_regs;
++unsigned long *const nds32_sp_ptr = (unsigned long *) &nds32_regs.sp;
++
++#define ARCH_REGS_FOR_GETREGSET nds32_regs
++#define ARCH_PC_REG nds32_regs.ipc
+diff --git a/linux/nds32/arch_regs.h b/linux/nds32/arch_regs.h
+new file mode 100644
+index 0000000..d452956
+--- /dev/null
++++ b/linux/nds32/arch_regs.h
+@@ -0,0 +1 @@
++extern unsigned long *const nds32_sp_ptr;
+diff --git a/linux/nds32/arch_rt_sigframe.c b/linux/nds32/arch_rt_sigframe.c
+new file mode 100644
+index 0000000..83579a2
+--- /dev/null
++++ b/linux/nds32/arch_rt_sigframe.c
+@@ -0,0 +1,31 @@
++/*
++ * Copyright (c) 2017 Dmitry V. Levin <ldv@altlinux.org>
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *    derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++FUNC_GET_RT_SIGFRAME_ADDR
++{
++	return *nds32_sp_ptr;
++}
+diff --git a/linux/nds32/arch_sigreturn.c b/linux/nds32/arch_sigreturn.c
+new file mode 100644
+index 0000000..9d5214a
+--- /dev/null
++++ b/linux/nds32/arch_sigreturn.c
+@@ -0,0 +1,12 @@
++static void
++arch_sigreturn(struct tcb *tcp)
++{
++#define SIZEOF_STRUCT_SIGINFO 128
++
++	const unsigned long addr =
++			(nds32_sp_ptr + SIZEOF_STRUCT_SIGINFO +
++			 offsetof(ucontext_t, uc_sigmask));
++	tprints("{mask=");
++	print_sigset_addr(tcp, addr);
++	tprints("}");
++}
+diff --git a/linux/nds32/get_error.c b/linux/nds32/get_error.c
+new file mode 100644
+index 0000000..dcc2dd6
+--- /dev/null
++++ b/linux/nds32/get_error.c
+@@ -0,0 +1,12 @@
++#include "negated_errno.h"
++
++static void
++arch_get_error(struct tcb *tcp, const bool check_errno)
++{
++	if (check_errno && is_negated_errno(nds32_regs.uregs[0])) {
++		tcp->u_rval = -1;
++		tcp->u_error = -nds32_regs.uregs[0];
++	} else {
++		tcp->u_rval = nds32_regs.uregs[0];
++	}
++}
+diff --git a/linux/nds32/get_scno.c b/linux/nds32/get_scno.c
+new file mode 100644
+index 0000000..350970b
+--- /dev/null
++++ b/linux/nds32/get_scno.c
+@@ -0,0 +1,19 @@
++
++/* Return codes: 1 - ok, 0 - ignore, other - error. */
++static int
++arch_get_scno(struct tcb *tcp)
++{
++
++	kernel_ulong_t scno = nds32_regs.syscallno;
++
++	if (!scno_in_range(scno))
++	{
++		if (debug_flag)
++			error_msg("stray syscall exit: v0 = %ld",
++				  tcp->scno);
++		return 0;
++	}
++	tcp->scno = scno;
++	
++	return 1;
++}
+diff --git a/linux/nds32/get_syscall_args.c b/linux/nds32/get_syscall_args.c
+new file mode 100644
+index 0000000..65c5ac9
+--- /dev/null
++++ b/linux/nds32/get_syscall_args.c
+@@ -0,0 +1,12 @@
++/* Return -1 on error or 1 on success (never 0!). */
++static int
++arch_get_syscall_args(struct tcb *tcp)
++{
++	tcp->u_arg[0] = nds32_regs.uregs[0];
++	tcp->u_arg[1] = nds32_regs.uregs[1];
++	tcp->u_arg[2] = nds32_regs.uregs[2];
++	tcp->u_arg[3] = nds32_regs.uregs[3];
++	tcp->u_arg[4] = nds32_regs.uregs[4];
++	tcp->u_arg[5] = nds32_regs.uregs[5];
++	return 1;
++}
+diff --git a/linux/nds32/ioctls_arch0.h b/linux/nds32/ioctls_arch0.h
+new file mode 100644
+index 0000000..69de19f
+--- /dev/null
++++ b/linux/nds32/ioctls_arch0.h
+@@ -0,0 +1,110 @@
++/* Generated by ioctls_gen.sh from definitions found in /NOBACKUP/sqa2/vincentc/linux_4.10/arch/nds32/include/ tree. */
++{ "linux/kvm.h", "KVM_ARM_SET_DEVICE_ADDR", _IOC_WRITE, 0xaeab, 0x10 },
++{ "linux/kvm.h", "KVM_ASSIGN_DEV_IRQ", _IOC_WRITE, 0xae70, 0x40 },
++{ "linux/kvm.h", "KVM_ASSIGN_PCI_DEVICE", _IOC_READ, 0xae69, 0x40 },
++{ "linux/kvm.h", "KVM_ASSIGN_SET_INTX_MASK", _IOC_WRITE, 0xaea4, 0x40 },
++{ "linux/kvm.h", "KVM_ASSIGN_SET_MSIX_ENTRY", _IOC_WRITE, 0xae74, 0x10 },
++{ "linux/kvm.h", "KVM_ASSIGN_SET_MSIX_NR", _IOC_WRITE, 0xae73, 0x08 },
++{ "linux/kvm.h", "KVM_CHECK_EXTENSION", _IOC_NONE, 0xae03, 0x00 },
++{ "linux/kvm.h", "KVM_CREATE_DEVICE", _IOC_READ|_IOC_WRITE, 0xaee0, 0x0c },
++{ "linux/kvm.h", "KVM_CREATE_IRQCHIP", _IOC_NONE, 0xae60, 0x00 },
++{ "linux/kvm.h", "KVM_CREATE_PIT", _IOC_NONE, 0xae64, 0x00 },
++{ "linux/kvm.h", "KVM_CREATE_PIT2", _IOC_WRITE, 0xae77, 0x40 },
++{ "linux/kvm.h", "KVM_CREATE_VCPU", _IOC_NONE, 0xae41, 0x00 },
++{ "linux/kvm.h", "KVM_CREATE_VM", _IOC_NONE, 0xae01, 0x00 },
++{ "linux/kvm.h", "KVM_DEASSIGN_DEV_IRQ", _IOC_WRITE, 0xae75, 0x40 },
++{ "linux/kvm.h", "KVM_DEASSIGN_PCI_DEVICE", _IOC_WRITE, 0xae72, 0x40 },
++{ "linux/kvm.h", "KVM_DIRTY_TLB", _IOC_WRITE, 0xaeaa, 0x0c },
++{ "linux/kvm.h", "KVM_ENABLE_CAP", _IOC_WRITE, 0xaea3, 0x68 },
++{ "linux/kvm.h", "KVM_GET_API_VERSION", _IOC_NONE, 0xae00, 0x00 },
++{ "linux/kvm.h", "KVM_GET_CLOCK", _IOC_READ, 0xae7c, 0x30 },
++{ "linux/kvm.h", "KVM_GET_CPUID2", _IOC_READ|_IOC_WRITE, 0xae91, 0x08 },
++{ "linux/kvm.h", "KVM_GET_DEVICE_ATTR", _IOC_WRITE, 0xaee2, 0x18 },
++{ "linux/kvm.h", "KVM_GET_DIRTY_LOG", _IOC_WRITE, 0xae42, 0x10 },
++{ "linux/kvm.h", "KVM_GET_EMULATED_CPUID", _IOC_READ|_IOC_WRITE, 0xae09, 0x08 },
++{ "linux/kvm.h", "KVM_GET_FPU", _IOC_READ, 0xae8c, 0x1a0 },
++{ "linux/kvm.h", "KVM_GET_IRQCHIP", _IOC_READ|_IOC_WRITE, 0xae62, 0x208 },
++{ "linux/kvm.h", "KVM_GET_LAPIC", _IOC_READ, 0xae8e, 0x400 },
++{ "linux/kvm.h", "KVM_GET_MP_STATE", _IOC_READ, 0xae98, 0x04 },
++{ "linux/kvm.h", "KVM_GET_MSRS", _IOC_READ|_IOC_WRITE, 0xae88, 0x08 },
++{ "linux/kvm.h", "KVM_GET_MSR_INDEX_LIST", _IOC_READ|_IOC_WRITE, 0xae02, 0x04 },
++{ "linux/kvm.h", "KVM_GET_NR_MMU_PAGES", _IOC_NONE, 0xae45, 0x00 },
++{ "linux/kvm.h", "KVM_GET_ONE_REG", _IOC_WRITE, 0xaeab, 0x10 },
++{ "linux/kvm.h", "KVM_GET_PIT", _IOC_READ|_IOC_WRITE, 0xae65, 0x48 },
++{ "linux/kvm.h", "KVM_GET_PIT2", _IOC_READ, 0xae9f, 0x70 },
++{ "linux/kvm.h", "KVM_GET_REGS", _IOC_READ, 0xae81, 0x90 },
++{ "linux/kvm.h", "KVM_GET_REG_LIST", _IOC_READ|_IOC_WRITE, 0xaeb0, 0x08 },
++{ "linux/kvm.h", "KVM_GET_SREGS", _IOC_READ, 0xae83, 0x138 },
++{ "linux/kvm.h", "KVM_GET_SUPPORTED_CPUID", _IOC_READ|_IOC_WRITE, 0xae05, 0x08 },
++{ "linux/kvm.h", "KVM_GET_TSC_KHZ", _IOC_NONE, 0xaea3, 0x00 },
++{ "linux/kvm.h", "KVM_GET_VCPU_EVENTS", _IOC_READ, 0xae9f, 0x40 },
++{ "linux/kvm.h", "KVM_GET_VCPU_MMAP_SIZE", _IOC_NONE, 0xae04, 0x00 },
++{ "linux/kvm.h", "KVM_GET_XCRS", _IOC_READ, 0xaea6, 0x188 },
++{ "linux/kvm.h", "KVM_GET_XSAVE", _IOC_READ, 0xaea4, 0x1000 },
++{ "linux/kvm.h", "KVM_HAS_DEVICE_ATTR", _IOC_WRITE, 0xaee3, 0x18 },
++{ "linux/kvm.h", "KVM_INTERRUPT", _IOC_WRITE, 0xae86, 0x04 },
++{ "linux/kvm.h", "KVM_IOEVENTFD", _IOC_WRITE, 0xae79, 0x40 },
++{ "linux/kvm.h", "KVM_IRQFD", _IOC_WRITE, 0xae76, 0x20 },
++{ "linux/kvm.h", "KVM_IRQ_LINE", _IOC_WRITE, 0xae61, 0x08 },
++{ "linux/kvm.h", "KVM_IRQ_LINE_STATUS", _IOC_READ|_IOC_WRITE, 0xae67, 0x08 },
++{ "linux/kvm.h", "KVM_KVMCLOCK_CTRL", _IOC_NONE, 0xaead, 0x00 },
++{ "linux/kvm.h", "KVM_NMI", _IOC_NONE, 0xae9a, 0x00 },
++{ "linux/kvm.h", "KVM_PPC_ALLOCATE_HTAB", _IOC_READ|_IOC_WRITE, 0xaea7, 0x04 },
++{ "linux/kvm.h", "KVM_PPC_GET_PVINFO", _IOC_WRITE, 0xaea1, 0x80 },
++{ "linux/kvm.h", "KVM_PPC_GET_SMMU_INFO", _IOC_READ, 0xaea6, 0x250 },
++{ "linux/kvm.h", "KVM_PPC_RESIZE_HPT_COMMIT", _IOC_READ, 0xaeae, 0x10 },
++{ "linux/kvm.h", "KVM_PPC_RESIZE_HPT_PREPARE", _IOC_READ, 0xaead, 0x10 },
++{ "linux/kvm.h", "KVM_REGISTER_COALESCED_MMIO", _IOC_WRITE, 0xae67, 0x10 },
++{ "linux/kvm.h", "KVM_REINJECT_CONTROL", _IOC_NONE, 0xae71, 0x00 },
++{ "linux/kvm.h", "KVM_RUN", _IOC_NONE, 0xae80, 0x00 },
++{ "linux/kvm.h", "KVM_S390_ENABLE_SIE", _IOC_NONE, 0xae06, 0x00 },
++{ "linux/kvm.h", "KVM_S390_GET_IRQ_STATE", _IOC_WRITE, 0xaeb6, 0x20 },
++{ "linux/kvm.h", "KVM_S390_GET_SKEYS", _IOC_WRITE, 0xaeb2, 0x40 },
++{ "linux/kvm.h", "KVM_S390_INITIAL_RESET", _IOC_NONE, 0xae97, 0x00 },
++{ "linux/kvm.h", "KVM_S390_INTERRUPT", _IOC_WRITE, 0xae94, 0x10 },
++{ "linux/kvm.h", "KVM_S390_IRQ", _IOC_WRITE, 0xaeb4, 0x48 },
++{ "linux/kvm.h", "KVM_S390_MEM_OP", _IOC_WRITE, 0xaeb1, 0x40 },
++{ "linux/kvm.h", "KVM_S390_SET_INITIAL_PSW", _IOC_WRITE, 0xae96, 0x10 },
++{ "linux/kvm.h", "KVM_S390_SET_IRQ_STATE", _IOC_WRITE, 0xaeb5, 0x20 },
++{ "linux/kvm.h", "KVM_S390_SET_SKEYS", _IOC_WRITE, 0xaeb3, 0x40 },
++{ "linux/kvm.h", "KVM_S390_STORE_STATUS", _IOC_WRITE, 0xae95, 0x04 },
++{ "linux/kvm.h", "KVM_S390_UCAS_MAP", _IOC_WRITE, 0xae50, 0x18 },
++{ "linux/kvm.h", "KVM_S390_UCAS_UNMAP", _IOC_WRITE, 0xae51, 0x18 },
++{ "linux/kvm.h", "KVM_S390_VCPU_FAULT", _IOC_WRITE, 0xae52, 0x04 },
++{ "linux/kvm.h", "KVM_SET_BOOT_CPU_ID", _IOC_NONE, 0xae78, 0x00 },
++{ "linux/kvm.h", "KVM_SET_CLOCK", _IOC_WRITE, 0xae7b, 0x30 },
++{ "linux/kvm.h", "KVM_SET_CPUID", _IOC_WRITE, 0xae8a, 0x08 },
++{ "linux/kvm.h", "KVM_SET_CPUID2", _IOC_WRITE, 0xae90, 0x08 },
++{ "linux/kvm.h", "KVM_SET_DEVICE_ATTR", _IOC_WRITE, 0xaee1, 0x18 },
++{ "linux/kvm.h", "KVM_SET_FPU", _IOC_WRITE, 0xae8d, 0x1a0 },
++{ "linux/kvm.h", "KVM_SET_GSI_ROUTING", _IOC_WRITE, 0xae6a, 0x08 },
++{ "linux/kvm.h", "KVM_SET_GUEST_DEBUG", _IOC_WRITE, 0xae9b, 0x48 },
++{ "linux/kvm.h", "KVM_SET_IDENTITY_MAP_ADDR", _IOC_WRITE, 0xae48, 0x08 },
++{ "linux/kvm.h", "KVM_SET_IRQCHIP", _IOC_READ, 0xae63, 0x208 },
++{ "linux/kvm.h", "KVM_SET_LAPIC", _IOC_WRITE, 0xae8f, 0x400 },
++{ "linux/kvm.h", "KVM_SET_MEMORY_ALIAS", _IOC_WRITE, 0xae43, 0x20 },
++{ "linux/kvm.h", "KVM_SET_MEMORY_REGION", _IOC_WRITE, 0xae40, 0x18 },
++{ "linux/kvm.h", "KVM_SET_MP_STATE", _IOC_WRITE, 0xae99, 0x04 },
++{ "linux/kvm.h", "KVM_SET_MSRS", _IOC_WRITE, 0xae89, 0x08 },
++{ "linux/kvm.h", "KVM_SET_NR_MMU_PAGES", _IOC_NONE, 0xae44, 0x00 },
++{ "linux/kvm.h", "KVM_SET_ONE_REG", _IOC_WRITE, 0xaeac, 0x10 },
++{ "linux/kvm.h", "KVM_SET_PIT", _IOC_READ, 0xae66, 0x48 },
++{ "linux/kvm.h", "KVM_SET_PIT2", _IOC_WRITE, 0xaea0, 0x70 },
++{ "linux/kvm.h", "KVM_SET_REGS", _IOC_WRITE, 0xae82, 0x90 },
++{ "linux/kvm.h", "KVM_SET_SIGNAL_MASK", _IOC_WRITE, 0xae8b, 0x04 },
++{ "linux/kvm.h", "KVM_SET_SREGS", _IOC_WRITE, 0xae84, 0x138 },
++{ "linux/kvm.h", "KVM_SET_TSC_KHZ", _IOC_NONE, 0xaea2, 0x00 },
++{ "linux/kvm.h", "KVM_SET_TSS_ADDR", _IOC_NONE, 0xae47, 0x00 },
++{ "linux/kvm.h", "KVM_SET_USER_MEMORY_REGION", _IOC_WRITE, 0xae46, 0x20 },
++{ "linux/kvm.h", "KVM_SET_VAPIC_ADDR", _IOC_WRITE, 0xae93, 0x08 },
++{ "linux/kvm.h", "KVM_SET_VCPU_EVENTS", _IOC_WRITE, 0xaea0, 0x40 },
++{ "linux/kvm.h", "KVM_SET_XCRS", _IOC_WRITE, 0xaea7, 0x188 },
++{ "linux/kvm.h", "KVM_SET_XSAVE", _IOC_WRITE, 0xaea5, 0x1000 },
++{ "linux/kvm.h", "KVM_SIGNAL_MSI", _IOC_WRITE, 0xaea5, 0x20 },
++{ "linux/kvm.h", "KVM_SMI", _IOC_NONE, 0xaeb7, 0x00 },
++{ "linux/kvm.h", "KVM_TPR_ACCESS_REPORTING", _IOC_READ|_IOC_WRITE, 0xae92, 0x28 },
++{ "linux/kvm.h", "KVM_TRANSLATE", _IOC_READ|_IOC_WRITE, 0xae85, 0x18 },
++{ "linux/kvm.h", "KVM_UNREGISTER_COALESCED_MMIO", _IOC_WRITE, 0xae68, 0x10 },
++{ "linux/kvm.h", "KVM_X86_GET_MCE_CAP_SUPPORTED", _IOC_READ, 0xae9d, 0x08 },
++{ "linux/kvm.h", "KVM_X86_SETUP_MCE", _IOC_WRITE, 0xae9c, 0x08 },
++{ "linux/kvm.h", "KVM_X86_SET_MCE", _IOC_WRITE, 0xae9e, 0x40 },
+diff --git a/linux/nds32/ioctls_inc0.h b/linux/nds32/ioctls_inc0.h
+new file mode 100644
+index 0000000..4aecf98
+--- /dev/null
++++ b/linux/nds32/ioctls_inc0.h
+@@ -0,0 +1 @@
++#include "32/ioctls_inc.h"
+diff --git a/linux/nds32/set_error.c b/linux/nds32/set_error.c
+new file mode 100644
+index 0000000..dd804b8
+--- /dev/null
++++ b/linux/nds32/set_error.c
+@@ -0,0 +1,13 @@
++static int
++arch_set_error(struct tcb *tcp)
++{
++	nds32_regs.uregs[0] = -tcp->u_error;
++	return set_regs(tcp->pid);
++}
++
++static int
++arch_set_success(struct tcb *tcp)
++{
++	nds32_regs.uregs[0] = tcp->u_rval;
++	return set_regs(tcp->pid);
++}
+diff --git a/linux/nds32/set_scno.c b/linux/nds32/set_scno.c
+new file mode 100644
+index 0000000..9c55b19
+--- /dev/null
++++ b/linux/nds32/set_scno.c
+@@ -0,0 +1,6 @@
++static int
++arch_set_scno(struct tcb *tcp, kernel_ulong_t scno)
++{
++	nds32_regs.syscallno = scno;
++	return set_regs(tcp->pid);
++}
+diff --git a/linux/nds32/syscallent.h b/linux/nds32/syscallent.h
+new file mode 100644
+index 0000000..27f8eea
+--- /dev/null
++++ b/linux/nds32/syscallent.h
+@@ -0,0 +1,63 @@
++#include "32/syscallent.h"
++[244] = { 3,	0,		SEN(cacheflush),	"cacheflush"	},
++[245] = { 0,	0,		SEN(getpagesize),	"getpagesize"	},
++[246] = { 6,	0,		SEN(syscall),		"syscalls"	},
++[247] = { 6,	TI,		SEN(ipc),		"ipc"		},
++[248] = { 3,	0,		SEN(sysfs),		"sysfs"		},
++[249 ... 259] = { },
++[1024] = { 3,	TD|TF,		SEN(open),		"open"		},
++[1025] = { 2,	TF,		SEN(link),		"link"		},
++[1026] = { 1,	TF,		SEN(unlink),		"unlink"	},
++[1027] = { 3,	TF,		SEN(mknod),		"mknod"		},
++[1028] = { 2,	TF,		SEN(chmod),		"chmod"		},
++[1029] = { 3,	TF,		SEN(chown),		"chown"		},
++[1030] = { 2,	TF,		SEN(mkdir),		"mkdir"		},
++[1031] = { 1,	TF,		SEN(rmdir),		"rmdir"		},
++[1032] = { 3,	TF,		SEN(chown),		"lchown"	},
++[1033] = { 2,	TF,		SEN(access),		"access"	},
++[1034] = { 2,	TF,		SEN(rename),		"rename"	},
++[1035] = { 3,	TF,		SEN(readlink),		"readlink"	},
++[1036] = { 2,	TF,		SEN(symlink),		"symlink"	},
++[1037] = { 2,	TF,		SEN(utimes),		"utimes"	},
++[1038] = { 2,	TF|TST|TSTA,	SEN(stat),		"stat"		},
++[1039] = { 2,	TF|TLST|TSTA,	SEN(lstat),		"lstat"		},
++[1040] = { 1,	TD,		SEN(pipe),		"pipe"		},
++[1041] = { 2,	TD,		SEN(dup2),		"dup2"		},
++[1042] = { 1,	TD,		SEN(epoll_create),	"epoll_create"	},
++[1043] = { 0,	TD,		SEN(inotify_init),	"inotify_init"	},
++[1044] = { 1,	TD,		SEN(eventfd),		"eventfd"	},
++[1045] = { 3,	TD|TS,		SEN(signalfd),		"signalfd"	},
++[1046] = { 4,	TD|TN,		SEN(sendfile64),	"sendfile"	},
++[1047] = { 2,	TD,		SEN(ftruncate),		"ftruncate"	},
++[1048] = { 2,	TF,		SEN(truncate),		"truncate"	},
++[1049] = { 2,	TF|TST|TSTA,	SEN(stat),		"stat"		},
++[1050] = { 2,	TF|TLST|TSTA,	SEN(lstat),		"lstat"		},
++[1051] = { 2,	TD|TFST|TSTA,	SEN(fstat),		"fstat"		},
++[1052] = { 3,	TD,		SEN(fcntl),		"fcntl"		},
++[1053] = { 4,	TD,		SEN(fadvise64),		"fadvise64"	},
++[1054] = { 4,	TD|TF|TFST|TSTA,SEN(newfstatat),	"newfstatat"	},
++[1055] = { 2,	TD|TFSF|TSFA,	SEN(fstatfs),		"fstatfs"	},
++[1056] = { 2,	TF|TSF|TSFA,	SEN(statfs),		"statfs"	},
++[1057] = { 3,	TD,		SEN(lseek),		"lseek"		},
++[1058] = { 6,	TD|TM|SI,	SEN(mmap),		"mmap"		},
++[1059] = { 1,	0,		SEN(alarm),		"alarm"		},
++[1060] = { 0,	0,		SEN(getpgrp),		"getpgrp"	},
++[1061] = { 0,	TS,		SEN(pause),		"pause"		},
++[1062] = { 1,	0,		SEN(time),		"time"		},
++[1063] = { 2,	TF,		SEN(utime),		"utime"		},
++[1064] = { 2,	TD|TF,		SEN(creat),		"creat"		},
++[1065] = { 3,	TD,		SEN(getdents),		"getdents"	},
++[1066] = { 3,	TD|TF,		SEN(futimesat),		"futimesat"	},
++[1067] = { 5,	TD,		SEN(select),		"select"	},
++[1068] = { 3,	TD,		SEN(poll),		"poll"		},
++[1069] = { 4,	TD,		SEN(epoll_wait),	"epoll_wait"	},
++[1070] = { 2,	TSFA,		SEN(ustat),		"ustat"		},
++[1071] = { 0,	TP,		SEN(vfork),		"vfork"		},
++[1072] = { 4,	TP,		SEN(wait4),		"wait4"		},
++[1073] = { 4,	TN,		SEN(recv),		"recv"		},
++[1074] = { 4,	TN,		SEN(send),		"send"		},
++[1075] = { 2,	0,		SEN(bdflush),		"bdflush"	},
++[1076] = { 1,	TF,		SEN(umount),		"umount"	},
++[1077] = { 1,	TF,		SEN(uselib),		"uselib"	},
++[1078] = { 1,	0,		SEN(sysctl),		"sysctl"	},
++[1079] = { 0,	TP,		SEN(fork),		"fork"		},
+-- 
+2.18.0
+
diff --git a/package/strace/Config.in b/package/strace/Config.in
index 38b4ebe32a..c7649e5789 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_STRACE
 	bool "strace"
 	# needs at least kernel headers 4.0 on nios2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
-	depends on !BR2_nds32
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
-- 
2.18.0
