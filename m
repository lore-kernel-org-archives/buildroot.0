From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 12:15:33 +0200
Subject: [Buildroot] [git commit] package/uclibc: fix mips uclibc toolchain
 with gcc 10
Message-ID: <20200509112348.1DE1C90EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba870e315762df1c5ccea0926cbea8d10fdd95e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]
"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
available to be present in the clobber list anymore, resulting in build failure
for mips*r6 targets in form of:
...
.../sysdep.h:146:2: error: the register ???lo??? cannot be clobbered in ???asm??? for the current target
  146 |  __asm__ volatile (      \
      |  ^~~~~~~

This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
This patch provides the alternative definitions of __SYSCALL_CLOBBERS for r6
targets that won't include those registers."

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/543923030

Note:
The kernel 5.4.35 fail to build later due to a similar issue while
building lib/vdso/gettimeofday.c [2]. The issue is still present in kernel
5.7-rc4.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/mips/include/asm/vdso/gettimeofday.h?h=v5.7-rc4#n38

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-include-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/uclibc/0001-mips-Do-not-include-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch b/package/uclibc/0001-mips-Do-not-include-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch
new file mode 100644
index 0000000000..cc8b9d9c0b
--- /dev/null
+++ b/package/uclibc/0001-mips-Do-not-include-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch
@@ -0,0 +1,68 @@
+From aad6cdbcff0f5411a09ac524637fea62652786a3 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 8 May 2020 18:39:45 +0200
+Subject: [PATCH] mips: Do not include hi and lo in __SYSCALL_CLOBBERS for R6
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+From [1]
+"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
+available to be present in the clobber list anymore, resulting in build failure
+for mips*r6 targets in form of:
+...
+.../sysdep.h:146:2: error: the register ???lo??? cannot be clobbered in ???asm??? for the current target
+  146 |  __asm__ volatile (      \
+      |  ^~~~~~~
+
+This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
+This patch provides the alternative definitions of __SYSCALL_CLOBBERS for r6
+targets that won't include those registers."
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libc/sysdeps/linux/mips/bits/syscalls.h | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/libc/sysdeps/linux/mips/bits/syscalls.h b/libc/sysdeps/linux/mips/bits/syscalls.h
+index b8f80597e..13728ac55 100644
+--- a/libc/sysdeps/linux/mips/bits/syscalls.h
++++ b/libc/sysdeps/linux/mips/bits/syscalls.h
+@@ -270,8 +270,13 @@
+ 	_sys_result;							\
+ })
+ 
+-#define __SYSCALL_CLOBBERS "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13", \
+-	"$14", "$15", "$24", "$25", "hi", "lo", "memory"
++#if __mips_isa_rev >= 6
++# define __SYSCALL_CLOBBERS "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13", \
++	 "$14", "$15", "$24", "$25", "memory"
++#else
++# define __SYSCALL_CLOBBERS "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13", \
++	 "$14", "$15", "$24", "$25", "hi", "lo", "memory"
++#endif
+ 
+ #else /* N32 || N64 */
+ 
+@@ -327,8 +332,13 @@
+ 	_sys_result;							\
+ })
+ 
+-#define __SYSCALL_CLOBBERS "$1", "$3", "$10", "$11", "$12", "$13", \
+-	"$14", "$15", "$24", "$25", "hi", "lo", "memory"
++#if __mips_isa_rev >= 6
++# define __SYSCALL_CLOBBERS "$1", "$3", "$10", "$11", "$12", "$13", \
++	 "$14", "$15", "$24", "$25", "memory"
++#else
++# define __SYSCALL_CLOBBERS "$1", "$3", "$10", "$11", "$12", "$13", \
++	 "$14", "$15", "$24", "$25", "hi", "lo", "memory"
++#endif
+ 
+ #endif
+ 
+-- 
+2.25.4
+
