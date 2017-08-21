From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:25:00 +0200
Subject: [Buildroot] [git commit] kvmtool: fix build with kernel headers >=
	4.12
Message-ID: <20170821211826.3114B7FA47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f539d49eeb5a1645264cf62083e88380b58b4f01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Linux 4.12, the header <asm/msr-index.h> has been removed from the
set of headers exported to userspace. Therefore, it cannot be used by
kvmtool anymore. This commit takes the simple approach of duplicating
inside kvmtool the MSR_* definitions that were used from this
<asm/msr-index.h> header.

This fixes:

x86/kvm-cpu.c:7:27: fatal error: asm/msr-index.h: No such file or directory
 #include <asm/msr-index.h>

Which is the second part of:

  http://autobuild.buildroot.net/results/4459a909e735343d1cf768d30466bc3c57eca19e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...6-kvm-cpu.c-don-t-include-asm-msr-index.h.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/kvmtool/0002-x86-kvm-cpu.c-don-t-include-asm-msr-index.h.patch b/package/kvmtool/0002-x86-kvm-cpu.c-don-t-include-asm-msr-index.h.patch
new file mode 100644
index 0000000..842c131
--- /dev/null
+++ b/package/kvmtool/0002-x86-kvm-cpu.c-don-t-include-asm-msr-index.h.patch
@@ -0,0 +1,58 @@
+From ce9abb649165aca728e4645ce09e7bb77e684b06 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 19 Aug 2017 16:35:59 +0200
+Subject: [PATCH] x86/kvm-cpu.c: don't include <asm/msr-index.h>
+
+Since kernel commit 25dc1d6cc3082aab293e5dad47623b550f7ddd2a ("x86:
+stop exporting msr-index.h to userland"), <asm/msr-index.h> is no
+longer exported to userspace. Therefore, any toolchain built with
+kernel headers >= 4.12 will no longer have this header file, causing a
+build failure in kvmtool.
+
+As a replacement, this patch includes inside x86/kvm-cpu.c the
+necessary MSR_* definitions.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Submitted-upstream: https://patchwork.kernel.org/patch/9910687/
+---
+ x86/kvm-cpu.c | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/x86/kvm-cpu.c b/x86/kvm-cpu.c
+index 5cc4e1e..b02ff65 100644
+--- a/x86/kvm-cpu.c
++++ b/x86/kvm-cpu.c
+@@ -4,7 +4,6 @@
+ #include "kvm/util.h"
+ #include "kvm/kvm.h"
+ 
+-#include <asm/msr-index.h>
+ #include <asm/apicdef.h>
+ #include <linux/err.h>
+ #include <sys/ioctl.h>
+@@ -136,6 +135,22 @@ static struct kvm_msrs *kvm_msrs__new(size_t nmsrs)
+ 	return vcpu;
+ }
+ 
++#define MSR_IA32_SYSENTER_CS            0x00000174
++#define MSR_IA32_SYSENTER_ESP           0x00000175
++#define MSR_IA32_SYSENTER_EIP           0x00000176
++
++#define MSR_STAR                0xc0000081 /* legacy mode SYSCALL target */
++#define MSR_LSTAR               0xc0000082 /* long mode SYSCALL target */
++#define MSR_CSTAR               0xc0000083 /* compat mode SYSCALL target */
++#define MSR_SYSCALL_MASK        0xc0000084 /* EFLAGS mask for syscall */
++#define MSR_KERNEL_GS_BASE      0xc0000102 /* SwapGS GS shadow */
++
++#define MSR_IA32_TSC                    0x00000010
++#define MSR_IA32_MISC_ENABLE            0x000001a0
++
++#define MSR_IA32_MISC_ENABLE_FAST_STRING_BIT            0
++#define MSR_IA32_MISC_ENABLE_FAST_STRING                (1ULL << MSR_IA32_MISC_ENABLE_FAST_STRING_BIT)
++
+ #define KVM_MSR_ENTRY(_index, _data)	\
+ 	(struct kvm_msr_entry) { .index = _index, .data = _data }
+ 
+-- 
+2.9.4
+
