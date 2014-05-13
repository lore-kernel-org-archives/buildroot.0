From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 22:28:21 -0700
Subject: [Buildroot] [PATCH v5 9/9] powerpc: add powerpc64 and powerpc64le
	support
In-Reply-To: <1399958901-7867-1-git-send-email-cody@linux.vnet.ibm.com>
References: <1399958901-7867-1-git-send-email-cody@linux.vnet.ibm.com>
Message-ID: <1399958901-7867-10-git-send-email-cody@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enables powerpc64 and powerpc64le. Currently, le needs at least
glibc 2.19 and gcc 4.9.0. For gdb, 7.7.1 works (added in an earlier
patch).

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
---
 Makefile                                |  3 ++-
 arch/Config.in                          | 21 ++++++++++++++++++++-
 arch/Config.in.powerpc                  |  5 ++++-
 linux/Config.in                         |  3 +--
 package/Makefile.in                     |  2 +-
 package/gcc/Config.in.host              | 10 +++++-----
 package/glibc/Config.in                 |  8 +++++---
 package/libatomic_ops/Config.in         |  2 +-
 package/openssl/openssl.mk              |  6 ++++++
 package/systemd/Config.in               |  3 ++-
 toolchain/toolchain-buildroot/Config.in |  5 +++--
 11 files changed, 50 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 2f18aab..395a1b0 100644
--- a/Makefile
+++ b/Makefile
@@ -38,7 +38,7 @@ export HOSTARCH := $(shell uname -m | \
 	    -e s/sun4u/sparc64/ \
 	    -e s/arm.*/arm/ \
 	    -e s/sa110/arm/ \
-	    -e s/ppc64/powerpc/ \
+	    -e s/ppc64/powerpc64/ \
 	    -e s/ppc/powerpc/ \
 	    -e s/macppc/powerpc/\
 	    -e s/sh.*/sh/)
@@ -310,6 +310,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/aarch64/arm64/ \
 	-e s/bfin/blackfin/ \
 	-e s/parisc64/parisc/ \
+	-e s/powerpc64le/powerpc/ \
 	-e s/powerpc64/powerpc/ \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 	-e s/sh.*/sh/ \
diff --git a/arch/Config.in b/arch/Config.in
index bc81dac..808dbd8 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -140,6 +140,25 @@ config BR2_powerpc
 	bool "PowerPC"
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
+	  Big endian.
+	  http://www.power.org/
+	  http://en.wikipedia.org/wiki/Powerpc
+
+config BR2_powerpc64
+	bool "PowerPC 64 (big endian)"
+	select BR2_ARCH_IS_64
+	help
+	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
+	  Big endian.
+	  http://www.power.org/
+	  http://en.wikipedia.org/wiki/Powerpc
+
+config BR2_powerpc64le
+	bool "PowerPC 64 (little endian)"
+	select BR2_ARCH_IS_64
+	help
+	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
+	  Little endian.
 	  http://www.power.org/
 	  http://en.wikipedia.org/wiki/Powerpc
 
@@ -321,7 +340,7 @@ if BR2_nios2
 source "arch/Config.in.nios2"
 endif
 
-if BR2_powerpc
+if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 source "arch/Config.in.powerpc"
 endif
 
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index b2f0555..84b15d4 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -150,9 +150,12 @@ config BR2_POWERPC_SOFT_FLOAT
 
 config BR2_ARCH
 	default "powerpc"	if BR2_powerpc
+	default "powerpc64"	if BR2_powerpc64
+	default "powerpc64le"	if BR2_powerpc64le
 
 config BR2_ENDIAN
-	default "BIG"
+	default "BIG" if BR2_powerpc || BR2_powerpc64
+	default "LITTLE" if BR2_powerpc64le
 
 config BR2_GCC_TARGET_TUNE
 	default "401"		if BR2_powerpc_401
diff --git a/linux/Config.in b/linux/Config.in
index cc1127a..9830aa4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -184,8 +184,7 @@ config BR2_LINUX_KERNEL_BZIMAGE
 
 config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
-	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc || \
-		   BR2_sh || BR2_sh64 || BR2_xtensa
+	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || BR2_sh || BR2_sh64 || BR2_xtensa
 
 config BR2_LINUX_KERNEL_APPENDED_ZIMAGE
 	bool "zImage with appended DT"
diff --git a/package/Makefile.in b/package/Makefile.in
index 2fc3aa7..0233506 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -321,7 +321,7 @@ endif
 ifeq ($(BR2_m68k),y)
 BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
 endif
-ifeq ($(BR2_powerpc)$(BR2_ENDIAN),yBIG)
+ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
 endif
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d0aa699..ea6957e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -20,14 +20,14 @@ choice
 		bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
 		bool "gcc 4.4.x"
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
@@ -37,7 +37,7 @@ choice
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
 		select BR2_GCC_NEEDS_MPC
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
@@ -46,14 +46,14 @@ choice
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4 && !BR2_powerpc64le
 		select BR2_GCC_NEEDS_MPC
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4 && !BR2_powerpc64le
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 693a33e..a2d6a27 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -8,13 +8,15 @@ choice
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64 || BR2_microblaze
+		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64 || \
+		   BR2_powerpc64le
 
 config BR2_GLIBC_VERSION_2_18
-       bool "2.18"
+	bool "2.18"
+	depends on !BR2_powerpc64le
 
 config BR2_GLIBC_VERSION_2_19
-       bool "2.19"
+	bool "2.19"
 
 endchoice
 
diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index f0a55a4..fe1efd4 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
+	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
 
 config BR2_PACKAGE_LIBATOMIC_OPS
 	bool "libatomic_ops"
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 52abb46..87bc2ef 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -42,6 +42,12 @@ ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)
 	OPENSSL_TARGET_ARCH = ppc
 endif
 endif
+ifeq ($(ARCH),powerpc64)
+	OPENSSL_TARGET_ARCH = ppc64
+endif
+ifeq ($(ARCH),powerpc64le)
+	OPENSSL_TARGET_ARCH = ppc64le
+endif
 ifeq ($(ARCH),x86_64)
 	OPENSSL_TARGET_ARCH = x86_64
 endif
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f10637a..05f4680 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	bool
 	# see src/shared/architecture.h
 	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
-		BR2_mipsel || BR2_powerpc || BR2_sh4 || BR2_sh4eb || \
+		BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le  || BR2_sh4 || BR2_sh4eb || \
 		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || \
 		BR2_aarch64 || BR2_m68k
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 216f9db..91ff705 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -45,7 +45,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64 || BR2_microblaze
+		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_USES_GLIBC
@@ -63,7 +63,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64 || BR2_microblaze
+		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64 || \
+		   BR2_powerpc64le
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_USES_GLIBC
-- 
1.9.3
