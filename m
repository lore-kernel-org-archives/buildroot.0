From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 23:24:09 +0200
Subject: [Buildroot] [git commit] Add support for powerpc64le
Message-ID: <20140601083245.B13999CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a426a91973c03ea99bb49bace8141de2d1ab25d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for powerpc64le-linux-gnu.  This includes
needed patches to fakeroot and gmp.

gmp patch is from upstream HG tree.
fakeroot patch is from Ubuntu written by Adam Conrad.

Signed-off-by: Jeff Bailey <jeffbailey@google.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                                           |    2 +-
 arch/Config.in                                     |   10 ++++++-
 arch/Config.in.powerpc                             |    8 +++--
 package/binutils/Config.in.host                    |    2 +-
 package/fakeroot/01-powerpc64le-support.patch      |   29 ++++++++++++++++++++
 package/gcc/Config.in.host                         |    2 +-
 package/glibc/Config.in                            |   11 ++++---
 ...c-provide-default-bmod-to-mod-threshold-1.patch |   22 +++++++++++++++
 toolchain/toolchain-buildroot/Config.in            |   10 +++---
 9 files changed, 79 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 6d97262..7363ee5 100644
--- a/Makefile
+++ b/Makefile
@@ -310,7 +310,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/aarch64/arm64/ \
 	-e s/bfin/blackfin/ \
 	-e s/parisc64/parisc/ \
-	-e s/powerpc64/powerpc/ \
+	-e s/powerpc64.*/powerpc/ \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 	-e s/sh.*/sh/ \
 	-e s/microblazeel/microblaze/)
diff --git a/arch/Config.in b/arch/Config.in
index bc81dac..2114dd8 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -143,6 +143,14 @@ config BR2_powerpc
 	  http://www.power.org/
 	  http://en.wikipedia.org/wiki/Powerpc
 
+config BR2_powerpc64le
+	bool "PowerPC64 (little endian)"
+	select BR2_ARCH_IS_64
+	help
+	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
+	  http://www.power.org/
+	  http://en.wikipedia.org/wiki/Powerpc
+
 config BR2_sh
 	bool "SuperH"
 	help
@@ -321,7 +329,7 @@ if BR2_nios2
 source "arch/Config.in.nios2"
 endif
 
-if BR2_powerpc
+if BR2_powerpc || BR2_powerpc64le
 source "arch/Config.in.powerpc"
 endif
 
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index ae70a8a..5f9f473 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -1,6 +1,6 @@
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_powerpc
+	depends on BR2_powerpc || BR2_powerpc64le
 	default BR2_generic_powerpc
 	help
 	  Specific CPU variant to use
@@ -74,7 +74,7 @@ endchoice
 
 choice
 	prompt "Target ABI"
-	depends on BR2_powerpc
+	depends on BR2_powerpc || BR2_powerpc64le
 	default BR2_powerpc_SPE if BR2_powerpc_8540 || BR2_powerpc_8548
 	default BR2_powerpc_CLASSIC
 	help
@@ -99,9 +99,11 @@ config BR2_POWERPC_SOFT_FLOAT
 
 config BR2_ARCH
 	default "powerpc"	if BR2_powerpc
+	default "powerpc64le"	if BR2_powerpc64le
 
 config BR2_ENDIAN
-	default "BIG"
+	default "BIG"    if BR2_powerpc
+	default "LITTLE" if BR2_powerpc64le
 
 config BR2_GCC_TARGET_TUNE
 	default "401"		if BR2_powerpc_401
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 15def13..0f7321e 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
-	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze
+	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze || BR2_powerpc64le
 	default BR2_BINUTILS_VERSION_2_22
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/fakeroot/01-powerpc64le-support.patch b/package/fakeroot/01-powerpc64le-support.patch
new file mode 100644
index 0000000..c26d9a5
--- /dev/null
+++ b/package/fakeroot/01-powerpc64le-support.patch
@@ -0,0 +1,29 @@
+Description: powerpc64le-support.patch: Patch configure to support ppc64el.
+Author: Adam Conrad <adconrad@ubuntu.com>
+
+--- fakeroot-1.20.orig/configure
++++ fakeroot-1.20/configure
+@@ -6509,6 +6509,9 @@ s390*-*linux*|s390*-*tpf*|sparc*-*linux*
+ 	  ppc64-*linux*|powerpc64-*linux*)
+ 	    LD="${LD-ld} -m elf32ppclinux"
+ 	    ;;
++	  powerpc64le-*linux*)
++	    LD="${LD-ld} -m elf32lppclinux"
++	    ;;
+ 	  s390x-*linux*)
+ 	    LD="${LD-ld} -m elf_s390"
+ 	    ;;
+@@ -6525,9 +6528,12 @@ s390*-*linux*|s390*-*tpf*|sparc*-*linux*
+ 	  x86_64-*linux*)
+ 	    LD="${LD-ld} -m elf_x86_64"
+ 	    ;;
+-	  ppc*-*linux*|powerpc*-*linux*)
++	  ppc-*linux*|powerpc-*linux*)
+ 	    LD="${LD-ld} -m elf64ppc"
+ 	    ;;
++	  powerpcle-*linux*)
++	    LD="${LD-ld} -m elf64lppc"
++	    ;;
+ 	  s390*-*linux*|s390*-*tpf*)
+ 	    LD="${LD-ld} -m elf64_s390"
+ 	    ;;
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 9feb452..ff25248 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -9,7 +9,7 @@ choice
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	default BR2_GCC_VERSION_4_8_X if BR2_aarch64
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
-	default BR2_GCC_VERSION_4_9_X if BR2_microblaze
+	default BR2_GCC_VERSION_4_9_X if BR2_microblaze || BR2_powerpc64le
 	default BR2_GCC_VERSION_4_5_X if BR2_bfin
 	default BR2_GCC_VERSION_4_7_X
 	help
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 693a33e..b690565 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -2,13 +2,14 @@ if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 choice
 	prompt "glibc version"
+	default BR2_GLIBC_VERSION_2_19 if BR2_powerpc64le
 	default BR2_GLIBC_VERSION_2_18
 	# Architectures supported in mainline glibc
-	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
-		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
-		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
-		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64 || BR2_microblaze
+	depends on BR2_arm         || BR2_armeb    || BR2_aarch64 || \
+		   BR2_i386        || BR2_mips     || BR2_mipsel  || \
+		   BR2_mips64      || BR2_mips64el || BR2_powerpc || \
+		   BR2_powerpc64le || BR2_sh       || BR2_sh64    || \
+		   BR2_sparc       || BR2_x86_64   || BR2_microblaze
 
 config BR2_GLIBC_VERSION_2_18
        bool "2.18"
diff --git a/package/gmp/gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch b/package/gmp/gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch
new file mode 100644
index 0000000..76aa72f
--- /dev/null
+++ b/package/gmp/gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch
@@ -0,0 +1,22 @@
+
+# HG changeset patch
+# User Torbjorn Granlund <tege@gmplib.org>
+# Date 1395835068 -3600
+# Node ID 4a6d258b467f661da0894cc60ecd060f2e3c67c7
+# Parent  301ce2788826a2d4d2725bd5cf01e998638db37a
+Provide default for BMOD_1_TO_MOD_1_THRESHOLD.
+
+diff -r 301ce2788826 -r 4a6d258b467f mpn/powerpc64/mode64/gcd_1.asm
+--- a/mpn/powerpc64/mode64/gcd_1.asm	Tue Mar 25 15:34:52 2014 +0100
++++ b/mpn/powerpc64/mode64/gcd_1.asm	Wed Mar 26 12:57:48 2014 +0100
+@@ -43,6 +43,9 @@
+ define(`n',     `r4')
+ define(`v0',    `r5')
+ 
++ifdef(`BMOD_1_TO_MOD_1_THRESHOLD',,
++  `define(`BMOD_1_TO_MOD_1_THRESHOLD',30)')
++
+ EXTERN_FUNC(mpn_mod_1)
+ EXTERN_FUNC(mpn_modexact_1c_odd)
+ 
+
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 216f9db..e19de4c 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -59,11 +59,11 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	bool "glibc"
-	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
-		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
-		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
-		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64 || BR2_microblaze
+	depends on BR2_arm         || BR2_armeb    || BR2_aarch64 || \
+		   BR2_i386        || BR2_mips     || BR2_mipsel  || \
+		   BR2_mips64      || BR2_mips64el || BR2_powerpc || \
+		   BR2_powerpc64le || BR2_sh       || BR2_sh64    || \
+		   BR2_sparc       || BR2_x86_64   || BR2_microblaze
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_USES_GLIBC
