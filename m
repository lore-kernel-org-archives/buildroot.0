From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Jul 2020 15:06:10 +0200
Subject: [Buildroot] [PATCH 1/3] qemu_mips32r6: Do not include hi and lo in
 clobber list for R6
Message-ID: <20200725130612.1325544-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1]
"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
available to be present in the clobber list anymore, resulting in build failure
for mips*r6 targets in form of:
...
.../sysdep.h:146:2: error: the register ?lo? cannot be clobbered in ?asm? for the current target
  146 |  __asm__ volatile (	 \
      |  ^~~~~~~

This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
This patch provides the alternative clobber list for r6 targets that won't include
those registers."

Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
for mips r6 cpus with gcc 10 for the same reason as glibc.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/655618359
https://gitlab.com/kubu93/buildroot/-/jobs/655618360

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...ude-hi-and-lo-in-clobber-list-for-R6.patch | 149 ++++++++++++++++++
 ...ude-hi-and-lo-in-clobber-list-for-R6.patch | 149 ++++++++++++++++++
 configs/qemu_mips32r6_malta_defconfig         |   1 +
 configs/qemu_mips32r6el_malta_defconfig       |   1 +
 4 files changed, 300 insertions(+)
 create mode 100644 board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
 create mode 100644 board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch

diff --git a/board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch b/board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
new file mode 100644
index 0000000000..4ab0e95880
--- /dev/null
+++ b/board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
@@ -0,0 +1,149 @@
+From bb04c220d82598066eeadf49defaec1157d4d206 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 25 Jul 2020 11:46:01 +0200
+Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+From [1]
+"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
+available to be present in the clobber list anymore, resulting in build failure
+for mips*r6 targets in form of:
+...
+.../sysdep.h:146:2: error: the register ?lo? cannot be clobbered in ?asm? for the current target
+  146 |  __asm__ volatile (      \
+      |  ^~~~~~~
+
+This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
+This patch provides the alternative clobber list for r6 targets that won't include
+those registers."
+
+Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
+for mips r6 cpus with gcc 10 for the same reason as glibc.
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
+[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ arch/mips/include/asm/vdso/gettimeofday.h | 45 +++++++++++++++++++++++
+ 1 file changed, 45 insertions(+)
+
+diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
+index 0ae9b4cbc153..ea600e0ebfe7 100644
+--- a/arch/mips/include/asm/vdso/gettimeofday.h
++++ b/arch/mips/include/asm/vdso/gettimeofday.h
+@@ -36,12 +36,21 @@ static __always_inline long gettimeofday_fallback(
+ 	register long nr asm("v0") = __NR_gettimeofday;
+ 	register long error asm("a3");
+ 
++#if __mips_isa_rev >= 6
++	asm volatile(
++	"       syscall\n"
++	: "=r" (ret), "=r" (error)
++	: "r" (tv), "r" (tz), "r" (nr)
++	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
++	  "$14", "$15", "$24", "$25", "memory");
++#else
+ 	asm volatile(
+ 	"       syscall\n"
+ 	: "=r" (ret), "=r" (error)
+ 	: "r" (tv), "r" (tz), "r" (nr)
+ 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+ 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
++#endif
+ 
+ 	return error ? -ret : ret;
+ }
+@@ -60,12 +69,21 @@ static __always_inline long clock_gettime_fallback(
+ #endif
+ 	register long error asm("a3");
+ 
++#if __mips_isa_rev >= 6
++	asm volatile(
++	"       syscall\n"
++	: "=r" (ret), "=r" (error)
++	: "r" (clkid), "r" (ts), "r" (nr)
++	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
++	  "$14", "$15", "$24", "$25", "memory");
++#else
+ 	asm volatile(
+ 	"       syscall\n"
+ 	: "=r" (ret), "=r" (error)
+ 	: "r" (clkid), "r" (ts), "r" (nr)
+ 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+ 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
++#endif
+ 
+ 	return error ? -ret : ret;
+ }
+@@ -84,12 +102,21 @@ static __always_inline int clock_getres_fallback(
+ #endif
+ 	register long error asm("a3");
+ 
++#if __mips_isa_rev >= 6
++	asm volatile(
++	"       syscall\n"
++	: "=r" (ret), "=r" (error)
++	: "r" (clkid), "r" (ts), "r" (nr)
++	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
++	  "$14", "$15", "$24", "$25", "memory");
++#else
+ 	asm volatile(
+ 	"       syscall\n"
+ 	: "=r" (ret), "=r" (error)
+ 	: "r" (clkid), "r" (ts), "r" (nr)
+ 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+ 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
++#endif
+ 
+ 	return error ? -ret : ret;
+ }
+@@ -108,12 +135,21 @@ static __always_inline long clock_gettime32_fallback(
+ 	register long nr asm("v0") = __NR_clock_gettime;
+ 	register long error asm("a3");
+ 
++#if __mips_isa_rev >= 6
++	asm volatile(
++	"       syscall\n"
++	: "=r" (ret), "=r" (error)
++	: "r" (clkid), "r" (ts), "r" (nr)
++	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
++	  "$14", "$15", "$24", "$25", "memory");
++#else
+ 	asm volatile(
+ 	"       syscall\n"
+ 	: "=r" (ret), "=r" (error)
+ 	: "r" (clkid), "r" (ts), "r" (nr)
+ 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+ 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
++#endif
+ 
+ 	return error ? -ret : ret;
+ }
+@@ -128,12 +164,21 @@ static __always_inline int clock_getres32_fallback(
+ 	register long nr asm("v0") = __NR_clock_getres;
+ 	register long error asm("a3");
+ 
++#if __mips_isa_rev >= 6
++	asm volatile(
++	"       syscall\n"
++	: "=r" (ret), "=r" (error)
++	: "r" (clkid), "r" (ts), "r" (nr)
++	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
++	  "$14", "$15", "$24", "$25", "memory");
++#else
+ 	asm volatile(
+ 	"       syscall\n"
+ 	: "=r" (ret), "=r" (error)
+ 	: "r" (clkid), "r" (ts), "r" (nr)
+ 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+ 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
++#endif
+ 
+ 	return error ? -ret : ret;
+ }
+-- 
+2.25.4
+
diff --git a/board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch b/board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
new file mode 100644
index 0000000000..4ab0e95880
--- /dev/null
+++ b/board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
@@ -0,0 +1,149 @@
+From bb04c220d82598066eeadf49defaec1157d4d206 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 25 Jul 2020 11:46:01 +0200
+Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+From [1]
+"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
+available to be present in the clobber list anymore, resulting in build failure
+for mips*r6 targets in form of:
+...
+.../sysdep.h:146:2: error: the register ?lo? cannot be clobbered in ?asm? for the current target
+  146 |  __asm__ volatile (      \
+      |  ^~~~~~~
+
+This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
+This patch provides the alternative clobber list for r6 targets that won't include
+those registers."
+
+Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
+for mips r6 cpus with gcc 10 for the same reason as glibc.
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
+[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ arch/mips/include/asm/vdso/gettimeofday.h | 45 +++++++++++++++++++++++
+ 1 file changed, 45 insertions(+)
+
+diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
+index 0ae9b4cbc153..ea600e0ebfe7 100644
+--- a/arch/mips/include/asm/vdso/gettimeofday.h
++++ b/arch/mips/include/asm/vdso/gettimeofday.h
+@@ -36,12 +36,21 @@ static __always_inline long gettimeofday_fallback(
+ 	register long nr asm("v0") = __NR_gettimeofday;
+ 	register long error asm("a3");
+ 
++#if __mips_isa_rev >= 6
++	asm volatile(
++	"       syscall\n"
++	: "=r" (ret), "=r" (error)
++	: "r" (tv), "r" (tz), "r" (nr)
++	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
++	  "$14", "$15", "$24", "$25", "memory");
++#else
+ 	asm volatile(
+ 	"       syscall\n"
+ 	: "=r" (ret), "=r" (error)
+ 	: "r" (tv), "r" (tz), "r" (nr)
+ 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+ 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
++#endif
+ 
+ 	return error ? -ret : ret;
+ }
+@@ -60,12 +69,21 @@ static __always_inline long clock_gettime_fallback(
+ #endif
+ 	register long error asm("a3");
+ 
++#if __mips_isa_rev >= 6
++	asm volatile(
++	"       syscall\n"
++	: "=r" (ret), "=r" (error)
++	: "r" (clkid), "r" (ts), "r" (nr)
++	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
++	  "$14", "$15", "$24", "$25", "memory");
++#else
+ 	asm volatile(
+ 	"       syscall\n"
+ 	: "=r" (ret), "=r" (error)
+ 	: "r" (clkid), "r" (ts), "r" (nr)
+ 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+ 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
++#endif
+ 
+ 	return error ? -ret : ret;
+ }
+@@ -84,12 +102,21 @@ static __always_inline int clock_getres_fallback(
+ #endif
+ 	register long error asm("a3");
+ 
++#if __mips_isa_rev >= 6
++	asm volatile(
++	"       syscall\n"
++	: "=r" (ret), "=r" (error)
++	: "r" (clkid), "r" (ts), "r" (nr)
++	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
++	  "$14", "$15", "$24", "$25", "memory");
++#else
+ 	asm volatile(
+ 	"       syscall\n"
+ 	: "=r" (ret), "=r" (error)
+ 	: "r" (clkid), "r" (ts), "r" (nr)
+ 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+ 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
++#endif
+ 
+ 	return error ? -ret : ret;
+ }
+@@ -108,12 +135,21 @@ static __always_inline long clock_gettime32_fallback(
+ 	register long nr asm("v0") = __NR_clock_gettime;
+ 	register long error asm("a3");
+ 
++#if __mips_isa_rev >= 6
++	asm volatile(
++	"       syscall\n"
++	: "=r" (ret), "=r" (error)
++	: "r" (clkid), "r" (ts), "r" (nr)
++	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
++	  "$14", "$15", "$24", "$25", "memory");
++#else
+ 	asm volatile(
+ 	"       syscall\n"
+ 	: "=r" (ret), "=r" (error)
+ 	: "r" (clkid), "r" (ts), "r" (nr)
+ 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+ 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
++#endif
+ 
+ 	return error ? -ret : ret;
+ }
+@@ -128,12 +164,21 @@ static __always_inline int clock_getres32_fallback(
+ 	register long nr asm("v0") = __NR_clock_getres;
+ 	register long error asm("a3");
+ 
++#if __mips_isa_rev >= 6
++	asm volatile(
++	"       syscall\n"
++	: "=r" (ret), "=r" (error)
++	: "r" (clkid), "r" (ts), "r" (nr)
++	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
++	  "$14", "$15", "$24", "$25", "memory");
++#else
+ 	asm volatile(
+ 	"       syscall\n"
+ 	: "=r" (ret), "=r" (error)
+ 	: "r" (clkid), "r" (ts), "r" (nr)
+ 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+ 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
++#endif
+ 
+ 	return error ? -ret : ret;
+ }
+-- 
+2.25.4
+
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index 9fb0e0b04d..d0147b4ed9 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.42"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/mips32r6-malta/patches"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index efadd712b7..f240f869be 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.42"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/mips32r6el-malta/patches"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
-- 
2.25.4
