From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 08:55:41 +0100
Subject: [Buildroot] [git commit branch/next] package/musl: bump to version
 1.2.0
Message-ID: <20200227074413.804B88EC2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3012c3cc28a6686bb47f2489a218b90e557f0b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also:
 * Drop patch 0003 which is included in the new version.
 * Update hash value of the COPYRIGHT file as the copyright year was
   updated.

From the release history [1]:

This release moves all 32-bit archs to 64-bit time_t, enabling them
to represent times beyond January of 2038.

There are no new requirements on kernel version, and this is not a
hard ABI break, but the type changes do impact compatibility between
code built against previous versions of musl and code built against
musl 1.2. Users upgrading 32-bit systems should read the detailed
time64 release notes [2]. 64-bit systems are not affected.

In addition, character data has been updated to align with Unicode
12.1.0, along with fixes for some errors in the data and a replacement
for inefficient and unmaintainable case-mapping code. Correctness of
results has been improved in the math library, particularly some complex
functions and 32-bit x86 asm. Various arch-specific bugs have also been
fixed.

[1] https://musl.libc.org/releases.html
[2] https://musl.libc.org/time64.html

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...cv64-register-index-constants-to-signal.h.patch | 54 ----------------------
 package/musl/musl.hash                             |  6 +--
 package/musl/musl.mk                               |  2 +-
 3 files changed, 4 insertions(+), 58 deletions(-)

diff --git a/package/musl/0003-move-riscv64-register-index-constants-to-signal.h.patch b/package/musl/0003-move-riscv64-register-index-constants-to-signal.h.patch
deleted file mode 100644
index 8221c0ea30..0000000000
--- a/package/musl/0003-move-riscv64-register-index-constants-to-signal.h.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 329e79299daaa994b8e75941331a1093051ea5d9 Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Tue, 4 Feb 2020 09:29:13 -0500
-Subject: move riscv64 register index constants to signal.h
-
-under _GNU_SOURCE for namespace cleanliness, analogous to other archs.
-the original placement in sys/reg.h seems not to have been motivated;
-such a header isn't even present on other implementations.
-
-Downloaded from upstream commit
-https://git.musl-libc.org/cgit/musl/commit/?id=329e79299daaa994b8e75941331a1093051ea5d9
-
-Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
----
- arch/riscv64/bits/reg.h    | 6 ------
- arch/riscv64/bits/signal.h | 9 +++++++++
- 2 files changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/arch/riscv64/bits/reg.h b/arch/riscv64/bits/reg.h
-index c800788c..2633f39d 100644
---- a/arch/riscv64/bits/reg.h
-+++ b/arch/riscv64/bits/reg.h
-@@ -1,8 +1,2 @@
- #undef __WORDSIZE
- #define __WORDSIZE 64
--#define REG_PC 0
--#define REG_RA 1
--#define REG_SP 2
--#define REG_TP 4
--#define REG_S0 8
--#define REG_A0 10
-diff --git a/arch/riscv64/bits/signal.h b/arch/riscv64/bits/signal.h
-index 2ff4be30..b006334f 100644
---- a/arch/riscv64/bits/signal.h
-+++ b/arch/riscv64/bits/signal.h
-@@ -35,6 +35,15 @@ typedef struct mcontext_t {
- 	union __riscv_mc_fp_state __fpregs;
- } mcontext_t;
- 
-+#if defined(_GNU_SOURCE)
-+#define REG_PC 0
-+#define REG_RA 1
-+#define REG_SP 2
-+#define REG_TP 4
-+#define REG_S0 8
-+#define REG_A0 10
-+#endif
-+
- #if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
- typedef unsigned long greg_t;
- typedef unsigned long gregset_t[32];
--- 
-cgit v1.2.1
-
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index f0450897c0..9d8b61e165 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://www.musl-libc.org/releases/musl-1.1.24.tar.gz.asc
-sha256  1370c9a812b2cf2a7d92802510cca0058cc37e66a7bedd70051f0a34015022a3  musl-1.1.24.tar.gz
-sha256  3520d478bccbdf68d9dc0c03984efb0fa4b99868ab2599f5b5f72f3fb3b07a49  COPYRIGHT
+# https://musl.libc.org/releases/musl-1.2.0.tar.gz.asc
+sha256  c6de7b191139142d3f9a7b5b702c9cae1b5ee6e7f57e582da9328629408fd4e8  musl-1.2.0.tar.gz
+sha256  afe1df384787fce3577f3356b8b0d417381483f7c704eacb63f8050349fac77a  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index df68c5f51b..9482c0b246 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.24
+MUSL_VERSION = 1.2.0
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
