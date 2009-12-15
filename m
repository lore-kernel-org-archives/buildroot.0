From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 15 Dec 2009 10:36:33 +0100
Subject: [Buildroot] [PATCH 1/1] uclibc: add prctl syscall fix for AVR32
	architecture
Message-ID: <1260869793-2747-1-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard <jacmet@sunsite.dk>

This patch fixes the prctl syscall for the AVR32 architecture, since this
architecture assumes you handle varargs in a proper way, always.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 ...0.9.30-fix-varargs-in-prctl-syscall.patch.avr32 |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-fix-varargs-in-prctl-syscall.patch.avr32

diff --git a/toolchain/uClibc/uClibc-0.9.30-fix-varargs-in-prctl-syscall.patch.avr32 b/toolchain/uClibc/uClibc-0.9.30-fix-varargs-in-prctl-syscall.patch.avr32
new file mode 100644
index 0000000..8b27a84
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-fix-varargs-in-prctl-syscall.patch.avr32
@@ -0,0 +1,29 @@
+--- a/libc/sysdeps/linux/common/prctl.c
++++ b/libc/sysdeps/linux/common/prctl.c
+@@ -12,6 +12,24 @@
+ /* psm: including sys/prctl.h would depend on kernel headers */
+ 
+ #ifdef __NR_prctl
+-extern int prctl (int, long, long, long, long);
+-_syscall5(int, prctl, int, option, long, arg2, long, arg3, long, arg4, long, arg5)
++#define __NR___syscall_prctl	__NR_prctl
++static inline _syscall5(int, __syscall_prctl, int, option, long, arg2, long, arg3, long,
++		arg4, long, arg5);
++
++int prctl(int option, ...) {
++	long arg2 = 0;
++	long arg3 = 0;
++	long arg4 = 0;
++	long arg5 = 0;
++	va_list ap;
++
++	va_start(ap, option);
++	arg2 = va_arg(ap, long);
++	arg3 = va_arg(ap, long);
++	arg4 = va_arg(ap, long);
++	arg5 = va_arg(ap, long);
++	va_end(ap);
++
++	return __syscall_prctl(option, arg2, arg3, arg4, arg5);
++}
+ #endif
-- 
1.6.0.4
