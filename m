From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 12:49:25 +0100
Subject: [Buildroot] [git commit] toolchain: disable SSP support if CFI
 support in binutils is missing
Message-ID: <20181104115156.EF09781432@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=435613ef298d49788d82f7bb2e06f944d69d890b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by [1], SSP support is missing in the Buildroot toolchain
for microblaze even if it's requested by selecting
BR2_TOOLCHAIN_HAS_SSP config option.

In Buildroot, we are using libssp provided by the C library (glibc,
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

The NiosII toolchains built with binutils < 2.30 are also affected by
this issue.

This patch improve the toolchain infrastructure by adding a new
BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI blind option

Disable SSP support for microblaze entirely.
Disable SSP support for nios2 only with Binutils < 2.30.

Fixes:
https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006389

[1] https://gitlab.com/free-electrons/toolchains-builder/issues/1
[2] https://git.buildroot.net/buildroot/tree/package/gcc/gcc.mk?h=2018.05#n275
[3] https://grsecurity.net/rap_faq.php

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: adjust how the BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI option
is expressed.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 6 ++++++
 package/glibc/Config.in         | 2 +-
 package/musl/Config.in          | 3 ++-
 package/uclibc/Config.in        | 1 +
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index c8c02bca77..59120f3138 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -1,5 +1,11 @@
 comment "Binutils Options"
 
+config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
+	bool
+	default y
+	depends on !BR2_microblaze
+	depends on !(BR2_nios2 && (BR2_BINUTILS_VERSION_2_28_X || BR2_BINUTILS_VERSION_2_29_X))
+
 choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 63dd0f4dd7..7821251087 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GLIBC
 	bool
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
-	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_SSP if BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 	help
 	  https://www.gnu.org/software/libc/
 endif
diff --git a/package/musl/Config.in b/package/musl/Config.in
index bedc50cd45..67e9e78a14 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MUSL
 	depends on BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LINUX_HEADERS
 	# SSP broken on i386/ppc: http://www.openwall.com/lists/musl/2016/12/04/2
-	select BR2_TOOLCHAIN_HAS_SSP if !(BR2_i386 || BR2_powerpc)
+	select BR2_TOOLCHAIN_HAS_SSP if BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI \
+		&& !(BR2_i386 || BR2_powerpc)
 	# Compatibility headers: cdefs.h, queue.h
 	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index a566881852..de2885bc92 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -70,6 +70,7 @@ config BR2_PTHREAD_DEBUG
 
 config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	bool "Enable stack protection support"
+	depends on BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 	select BR2_TOOLCHAIN_HAS_SSP
 	help
 	  Enable stack smashing protection support using GCCs
