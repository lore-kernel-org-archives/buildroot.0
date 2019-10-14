From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 14 Oct 2019 21:13:05 +0200
Subject: [Buildroot] [PATCH] package/musl: bump to version 1.1.24
Message-ID: <20191014191305.360663-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

News from upstream [1]:
"""
This version adds the GLOB_TILDE extension for glob, a non-stub
implementation of the catgets localization API, and posix_spawn
extensions for chdir in the child. Many arch-specific bugs are fixed,
some serious, including CVE-2019-14697 affecting several math
functions only on i386, broken riscv64 atomics, broken lseek with
large offsets on x32 and mipsn32, and broken setjmp/longjmp on mipsr6.
Various low-severity, non-arch-specific bugs are also fixed.

In addition, this release cycle sets the internal groundwork for
moving 32-bit archs to 64-bit time_t, needed for their future
viability as Y2038 approaches. Most of the changes are not externally
visible, but some affect which syscalls are used. Notably, mips64
stat-family functions can now report 64-bit file timestamps correctly,
and some time-related breakage on x32 is fixed. In addition, select no
longer stores remaining time back to the timeout argument. Previously,
whether it did so was arch-dependent and merely a consequence of the
Linux syscall behavior, which was found to be mildly non-conforming.
"""

Remove patches 0002 to 0005, which are included in the new version.
Note, that the CVE fix mentioned above is the same as patch 0004.

The license file has changed because Arm was added to the copyright
file.

[1] https://www.musl-libc.org/download.html

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...-risc64-conflict-with-kernel-headers.patch |  61 ------
 ...-remove-riscv64-bits-user.h-contents.patch |  69 ------
 ...balance-in-corner-cases-of-i386-math.patch | 200 ------------------
 ...ression-in-i386-asm-for-atan2-atan2f.patch |  37 ----
 package/musl/musl.hash                        |   6 +-
 package/musl/musl.mk                          |   2 +-
 6 files changed, 4 insertions(+), 371 deletions(-)
 delete mode 100644 package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
 delete mode 100644 package/musl/0003-remove-riscv64-bits-user.h-contents.patch
 delete mode 100644 package/musl/0004-fix-x87-stack-imbalance-in-corner-cases-of-i386-math.patch
 delete mode 100644 package/musl/0005-fix-build-regression-in-i386-asm-for-atan2-atan2f.patch

diff --git a/package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch b/package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
deleted file mode 100644
index 8ae7b0200a..0000000000
--- a/package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 8acc688548b27151c45ee8a80f3a0b75f4a761c0 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 6 Aug 2019 08:51:13 +0300
-Subject: [PATCH] fix risc64 conflict with kernel headers
-
-Rename user registers struct definitions to avoid conflict with the
-asm/ptrace.h kernel header that defines the same structs. Use the
-__riscv_mc prefix as glibc does.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 8acc688548b
-
- arch/riscv64/bits/signal.h | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/arch/riscv64/bits/signal.h b/arch/riscv64/bits/signal.h
-index 4c94a8f02edc..76d7ad80c8cd 100644
---- a/arch/riscv64/bits/signal.h
-+++ b/arch/riscv64/bits/signal.h
-@@ -12,29 +12,29 @@
- typedef unsigned long greg_t;
- typedef unsigned long gregset_t[32];
- 
--struct __riscv_f_ext_state {
-+struct __riscv_mc_f_ext_state {
- 	unsigned int f[32];
- 	unsigned int fcsr;
- };
- 
--struct __riscv_d_ext_state {
-+struct __riscv_mc_d_ext_state {
- 	unsigned long long f[32];
- 	unsigned int fcsr;
- };
- 
--struct __riscv_q_ext_state {
-+struct __riscv_mc_q_ext_state {
- 	unsigned long long f[64] __attribute__((aligned(16)));
- 	unsigned int fcsr;
- 	unsigned int reserved[3];
- };
- 
--union __riscv_fp_state {
--	struct __riscv_f_ext_state f;
--	struct __riscv_d_ext_state d;
--	struct __riscv_q_ext_state q;
-+union __riscv_mc_fp_state {
-+	struct __riscv_mc_f_ext_state f;
-+	struct __riscv_mc_d_ext_state d;
-+	struct __riscv_mc_q_ext_state q;
- };
- 
--typedef union __riscv_fp_state fpregset_t;
-+typedef union __riscv_mc_fp_state fpregset_t;
- 
- typedef struct sigcontext {
- 	gregset_t gregs;
--- 
-2.20.1
-
diff --git a/package/musl/0003-remove-riscv64-bits-user.h-contents.patch b/package/musl/0003-remove-riscv64-bits-user.h-contents.patch
deleted file mode 100644
index 4af3ba665b..0000000000
--- a/package/musl/0003-remove-riscv64-bits-user.h-contents.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 414b512c60706e34473edd58fe876037ea77138c Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Tue, 6 Aug 2019 12:50:38 -0400
-Subject: [PATCH] remove riscv64 bits/user.h contents
-
-the contents conflicted with asm/ptrace.h. glibc does not provide
-anything in user.h for riscv, so software cannot be depending on it.
-
-simplified from patch submitted by Baruch Siach.
-
-[ baruch: add empty line so that 'patch -E' doesn't delete user.h ]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit d493206de7df
-
- arch/riscv64/bits/user.h | 42 ----------------------------------------
- 1 file changed, 42 deletions(-)
-
-diff --git a/arch/riscv64/bits/user.h b/arch/riscv64/bits/user.h
-index bd0f0fc7027f..8b137891791f 100644
---- a/arch/riscv64/bits/user.h
-+++ b/arch/riscv64/bits/user.h
-@@ -1,43 +1 @@
--struct user_regs_struct {
--	unsigned long pc;
--	unsigned long ra;
--	unsigned long sp;
--	unsigned long gp;
--	unsigned long tp;
--	unsigned long t0;
--	unsigned long t1;
--	unsigned long t2;
--	unsigned long s0;
--	unsigned long s1;
--	unsigned long a0;
--	unsigned long a1;
--	unsigned long a2;
--	unsigned long a3;
--	unsigned long a4;
--	unsigned long a5;
--	unsigned long a6;
--	unsigned long a7;
--	unsigned long s2;
--	unsigned long s3;
--	unsigned long s4;
--	unsigned long s5;
--	unsigned long s6;
--	unsigned long s7;
--	unsigned long s8;
--	unsigned long s9;
--	unsigned long s10;
--	unsigned long s11;
--	unsigned long t3;
--	unsigned long t4;
--	unsigned long t5;
--	unsigned long t6;
--};
- 
--struct user_fpregs_struct {
--	double f[32];
--	unsigned int fcsr;
--};
--
--#define ELF_NGREG 32
--typedef unsigned long elf_greg_t, elf_gregset_t[ELF_NGREG];
--typedef struct user_fpregs_struct elf_fpregset_t;
--- 
-2.20.1
-
diff --git a/package/musl/0004-fix-x87-stack-imbalance-in-corner-cases-of-i386-math.patch b/package/musl/0004-fix-x87-stack-imbalance-in-corner-cases-of-i386-math.patch
deleted file mode 100644
index 8940c28654..0000000000
--- a/package/musl/0004-fix-x87-stack-imbalance-in-corner-cases-of-i386-math.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From f3ed8bfe8a82af1870ddc8696ed4cc1d5aa6b441 Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Mon, 5 Aug 2019 18:41:47 -0400
-Subject: [PATCH] fix x87 stack imbalance in corner cases of i386 math asm
-
-commit 31c5fb80b9eae86f801be4f46025bc6532a554c5 introduced underflow
-code paths for the i386 math asm, along with checks on the fpu status
-word to skip the underflow-generation instructions if the underflow
-flag was already raised. unfortunately, at least one such path, in
-log1p, returned with 2 items on the x87 stack rather than just 1 item
-for the return value. this is a violation of the ABI's calling
-convention, and could cause subsequent floating point code to produce
-NANs due to x87 stack overflow. if floating point results are used in
-flow control, this can lead to runaway wrong code execution.
-
-rather than reviewing each "underflow already raised" code path for
-correctness, remove them all. they're likely slower than just
-performing the underflow code unconditionally, and significantly more
-complex.
-
-all of this code should be ripped out and replaced by C source files
-with inline asm. doing so would preclude this kind of error by having
-the compiler perform all x87 stack register allocation and stack
-manipulation, and would produce comparable or better code. however
-such a change is a much larger project.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/math/i386/asin.s   | 10 ++--------
- src/math/i386/atan.s   |  7 ++-----
- src/math/i386/atan2.s  |  5 +----
- src/math/i386/atan2f.s |  5 +----
- src/math/i386/atanf.s  |  7 ++-----
- src/math/i386/exp.s    | 10 ++--------
- src/math/i386/log1p.s  |  7 ++-----
- src/math/i386/log1pf.s |  7 ++-----
- 8 files changed, 14 insertions(+), 44 deletions(-)
-
-diff --git a/src/math/i386/asin.s b/src/math/i386/asin.s
-index a9f691bf..920d967a 100644
---- a/src/math/i386/asin.s
-+++ b/src/math/i386/asin.s
-@@ -7,13 +7,10 @@ asinf:
- 	cmp $0x01000000,%eax
- 	jae 1f
- 		# subnormal x, return x with underflow
--	fnstsw %ax
--	and $16,%ax
--	jnz 2f
- 	fld %st(0)
- 	fmul %st(1)
- 	fstps 4(%esp)
--2:	ret
-+	ret
- 
- .global asinl
- .type asinl, at function
-@@ -30,11 +27,8 @@ asin:
- 	cmp $0x00200000,%eax
- 	jae 1f
- 		# subnormal x, return x with underflow
--	fnstsw %ax
--	and $16,%ax
--	jnz 2f
- 	fsts 4(%esp)
--2:	ret
-+	ret
- 1:	fld %st(0)
- 	fld1
- 	fsub %st(0),%st(1)
-diff --git a/src/math/i386/atan.s b/src/math/i386/atan.s
-index d73137b2..a26feae1 100644
---- a/src/math/i386/atan.s
-+++ b/src/math/i386/atan.s
-@@ -10,8 +10,5 @@ atan:
- 	fpatan
- 	ret
- 		# subnormal x, return x with underflow
--1:	fnstsw %ax
--	and $16,%ax
--	jnz 2f
--	fsts 4(%esp)
--2:	ret
-+1:	fsts 4(%esp)
-+	ret
-diff --git a/src/math/i386/atan2.s b/src/math/i386/atan2.s
-index a7d2979b..1fa0524d 100644
---- a/src/math/i386/atan2.s
-+++ b/src/math/i386/atan2.s
-@@ -10,8 +10,5 @@ atan2:
- 	cmp $0x00200000,%eax
- 	jae 1f
- 		# subnormal x, return x with underflow
--	fnstsw %ax
--	and $16,%ax
--	jnz 1f
- 	fsts 4(%esp)
--1:	ret
-+	ret
-diff --git a/src/math/i386/atan2f.s b/src/math/i386/atan2f.s
-index 14b88ce5..0b264726 100644
---- a/src/math/i386/atan2f.s
-+++ b/src/math/i386/atan2f.s
-@@ -10,10 +10,7 @@ atan2f:
- 	cmp $0x01000000,%eax
- 	jae 1f
- 		# subnormal x, return x with underflow
--	fnstsw %ax
--	and $16,%ax
--	jnz 1f
- 	fld %st(0)
- 	fmul %st(1)
- 	fstps 4(%esp)
--1:	ret
-+	ret
-diff --git a/src/math/i386/atanf.s b/src/math/i386/atanf.s
-index 8caddefa..893beac5 100644
---- a/src/math/i386/atanf.s
-+++ b/src/math/i386/atanf.s
-@@ -10,10 +10,7 @@ atanf:
- 	fpatan
- 	ret
- 		# subnormal x, return x with underflow
--1:	fnstsw %ax
--	and $16,%ax
--	jnz 2f
--	fld %st(0)
-+1:	fld %st(0)
- 	fmul %st(1)
- 	fstps 4(%esp)
--2:	ret
-+	ret
-diff --git a/src/math/i386/exp.s b/src/math/i386/exp.s
-index c7aa5b6e..df87c497 100644
---- a/src/math/i386/exp.s
-+++ b/src/math/i386/exp.s
-@@ -7,13 +7,10 @@ expm1f:
- 	cmp $0x01000000,%eax
- 	jae 1f
- 		# subnormal x, return x with underflow
--	fnstsw %ax
--	and $16,%ax
--	jnz 2f
- 	fld %st(0)
- 	fmul %st(1)
- 	fstps 4(%esp)
--2:	ret
-+	ret
- 
- .global expm1l
- .type expm1l, at function
-@@ -30,11 +27,8 @@ expm1:
- 	cmp $0x00200000,%eax
- 	jae 1f
- 		# subnormal x, return x with underflow
--	fnstsw %ax
--	and $16,%ax
--	jnz 2f
- 	fsts 4(%esp)
--2:	ret
-+	ret
- 1:	fldl2e
- 	fmulp
- 	mov $0xc2820000,%eax
-diff --git a/src/math/i386/log1p.s b/src/math/i386/log1p.s
-index 6b6929c7..354f391a 100644
---- a/src/math/i386/log1p.s
-+++ b/src/math/i386/log1p.s
-@@ -16,9 +16,6 @@ log1p:
- 	fyl2x
- 	ret
- 		# subnormal x, return x with underflow
--2:	fnstsw %ax
--	and $16,%ax
--	jnz 1f
--	fsts 4(%esp)
-+2:	fsts 4(%esp)
- 	fstp %st(1)
--1:	ret
-+	ret
-diff --git a/src/math/i386/log1pf.s b/src/math/i386/log1pf.s
-index c0bcd30f..4d3484cd 100644
---- a/src/math/i386/log1pf.s
-+++ b/src/math/i386/log1pf.s
-@@ -16,10 +16,7 @@ log1pf:
- 	fyl2x
- 	ret
- 		# subnormal x, return x with underflow
--2:	fnstsw %ax
--	and $16,%ax
--	jnz 1f
--	fxch
-+2:	fxch
- 	fmul %st(1)
- 	fstps 4(%esp)
--1:	ret
-+	ret
--- 
-2.11.0
-
diff --git a/package/musl/0005-fix-build-regression-in-i386-asm-for-atan2-atan2f.patch b/package/musl/0005-fix-build-regression-in-i386-asm-for-atan2-atan2f.patch
deleted file mode 100644
index 824933c6d5..0000000000
--- a/package/musl/0005-fix-build-regression-in-i386-asm-for-atan2-atan2f.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6818c31c9bc4bbad5357f1de14bedf781e5b349e Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Mon, 5 Aug 2019 19:57:07 -0400
-Subject: [PATCH] fix build regression in i386 asm for atan2, atan2f
-
-commit f3ed8bfe8a82af1870ddc8696ed4cc1d5aa6b441 inadvertently removed
-labels that were still needed.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/math/i386/atan2.s  | 2 +-
- src/math/i386/atan2f.s | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/math/i386/atan2.s b/src/math/i386/atan2.s
-index 1fa0524d..76b95f31 100644
---- a/src/math/i386/atan2.s
-+++ b/src/math/i386/atan2.s
-@@ -11,4 +11,4 @@ atan2:
- 	jae 1f
- 		# subnormal x, return x with underflow
- 	fsts 4(%esp)
--	ret
-+1:	ret
-diff --git a/src/math/i386/atan2f.s b/src/math/i386/atan2f.s
-index 0b264726..c9408a90 100644
---- a/src/math/i386/atan2f.s
-+++ b/src/math/i386/atan2f.s
-@@ -13,4 +13,4 @@ atan2f:
- 	fld %st(0)
- 	fmul %st(1)
- 	fstps 4(%esp)
--	ret
-+1:	ret
--- 
-2.11.0
-
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 2e5c1c0a12..f0450897c0 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://www.musl-libc.org/releases/musl-1.1.23.tar.gz.asc
-sha256  8a0feb41cef26c97dde382c014e68b9bb335c094bbc1356f6edaaf6b79bd14aa  musl-1.1.23.tar.gz
-sha256  b349949ea277c203212aa85b42cdc5310527419e6fa0ce29fef7641abe194577  COPYRIGHT
+# http://www.musl-libc.org/releases/musl-1.1.24.tar.gz.asc
+sha256  1370c9a812b2cf2a7d92802510cca0058cc37e66a7bedd70051f0a34015022a3  musl-1.1.24.tar.gz
+sha256  3520d478bccbdf68d9dc0c03984efb0fa4b99868ab2599f5b5f72f3fb3b07a49  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index b401fb3d11..df68c5f51b 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.23
+MUSL_VERSION = 1.1.24
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.23.0
