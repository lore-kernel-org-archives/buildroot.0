From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 10 Jun 2018 18:33:00 +0200
Subject: [Buildroot] [PATCH] SSP: disable ssp support on microblaze
Message-ID: <20180610163300.6440-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by [1], SSP support is missing in the Buildroot toolchain
for microblaze even if it's requested by selecting
BR2_TOOLCHAIN_HAS_SSP config option.

In Buildroot, we are using libssp provided by the C library (Glibc,
musl, uClibc-ng) when available. We are not using libssp from gcc.

So for a microblaze glibc based toolchain, the SSP support is enabled
unconditionally by a select BR2_TOOLCHAIN_HAS_SSP.

BR2_microblazeel=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_4_14=y
BR2_BINUTILS_VERSION_2_30_X=y
BR2_GCC_VERSION_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

While building the toolchain, we are building host-binutils which
provide "as" (assembler) and host-gcc-initial wich provide a
minimal cross gcc (C only cross-compiler without any C library).
When SSP support is requested, gcc_cv_libc_provides_ssp=yes is
added to the make command line (see [2] for full details)

With this setting, the SSP support is requested but it's not available
in the end and the toochain build succeed.

When the microblaze toolchain is imported to Biuldroot (2018.05) as
external toolchain with BR2_TOOLCHAIN_EXTERNAL_HAS_SSP set, the build
stop with :
"SSP support not available in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP"

The test is doing the following command line:

echo 'void main(){}' | [...]/host/bin/microblazeel-linux-gcc.br_real -Werror -fstack-protector -x c - -o [...]/build/.br-toolchain-test.tmp
cc1: error: -fstack-protector not supported for this target [-Werror]

When we look at the gcc-final log file (config.log) we can see this
error several time when using the minimal gcc (from host-gcc-initial).
So Why the minimal gcc doesn't support SSP?

When we look at the gcc-initial log file (config.log) we can see an
error with 'as':

configure:23194: checking assembler for cfi directives
configure:23209: [...]microblazeel-buildroot-linux-gnu/bin/as    -o conftest.o conftest.s >&5
conftest.s: Assembler messages:
conftest.s:2: Error: CFI is not supported for this target
conftest.s:3: Error: CFI is not supported for this target
conftest.s:4: Error: CFI is not supported for this target
conftest.s:5: Error: CFI is not supported for this target
conftest.s:6: Error: CFI is not supported for this target
conftest.s:7: Error: CFI is not supported for this target
configure:23212: $? = 1
configure: failed program was
    .text
    .cfi_startproc
    .cfi_offset 0, 0
    .cfi_same_value 1
    .cfi_def_cfa 1, 2
    .cfi_escape 1, 2, 3, 4, 5
    .cfi_endproc

This is the only relevant difference compared to a nios2 toolchain where
libssp is enabled and available (nios2 is an example).

"CFI" stand for "Control Flow Integrity" and it seems that SSP support
requires CFI target support (see [3] for some explanation).

The SSP support seems to depends on CFI support, but the toolchain
infrastructure is not detailed enough to handle the CFI dependency.

In the other hand, microblaze is the only architecture where CFI support
is missing.

Disable SSP support for microblaze entirely.

Fixes:
https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006389

[1] https://gitlab.com/free-electrons/toolchains-builder/issues/1
[2] https://git.buildroot.net/buildroot/tree/package/gcc/gcc.mk?h=2018.05#n275
[3] https://grsecurity.net/rap_faq.php

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/Config.in  | 3 ++-
 package/musl/Config.in   | 3 ++-
 package/uclibc/Config.in | 1 +
 toolchain/Config.in      | 3 +++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 57a2e833d2..7adf76699d 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GLIBC
 	bool
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
-	select BR2_TOOLCHAIN_HAS_SSP
+	# SSP not supported on microblaze
+	select BR2_TOOLCHAIN_HAS_SSP if !BR2_microblaze
 
 endif
diff --git a/package/musl/Config.in b/package/musl/Config.in
index bedc50cd45..4e0d6f4ef1 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MUSL
 	depends on BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LINUX_HEADERS
 	# SSP broken on i386/ppc: http://www.openwall.com/lists/musl/2016/12/04/2
-	select BR2_TOOLCHAIN_HAS_SSP if !(BR2_i386 || BR2_powerpc)
+	# SSP not supported on microblaze
+	select BR2_TOOLCHAIN_HAS_SSP if !(BR2_i386 || BR2_microblaze || BR2_powerpc)
 	# Compatibility headers: cdefs.h, queue.h
 	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index a566881852..0161954076 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -70,6 +70,7 @@ config BR2_PTHREAD_DEBUG
 
 config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	bool "Enable stack protection support"
+	depends on !BR2_microblaze # SSP not supported on microblaze
 	select BR2_TOOLCHAIN_HAS_SSP
 	help
 	  Enable stack smashing protection support using GCCs
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3a53a32a6d..1bf71a6d52 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -122,6 +122,9 @@ config BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_TOOLCHAIN_HAS_SSP
 	bool
+	# SSP support require CFI architecture support.
+	# https://gitlab.com/free-electrons/toolchains-builder/issues/1
+	depends on !BR2_microblaze # missing CFI support in "gas"
 
 config BR2_TOOLCHAIN_SUPPORTS_PIE
 	bool
-- 
2.14.4
