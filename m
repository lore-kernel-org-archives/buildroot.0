From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Sep 2016 15:38:57 -0300
Subject: [Buildroot] [PATCH 1/6] arch: remove support for sh64
Message-ID: <1473359942-15810-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's been deprecated for quite some time now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .defconfig                              |  1 -
 arch/Config.in                          | 12 +-----------
 arch/Config.in.sh                       |  3 +--
 linux/Config.in                         |  6 +++---
 package/fdk-aac/Config.in               |  4 ++--
 package/gauche/Config.in                |  2 +-
 package/gdb/Config.in                   |  4 ++--
 package/libunwind/Config.in             |  2 +-
 package/ruby/ruby.mk                    |  2 +-
 toolchain/toolchain-buildroot/Config.in |  4 ++--
 10 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/.defconfig b/.defconfig
index 037647e..7ab0c3f 100644
--- a/.defconfig
+++ b/.defconfig
@@ -15,7 +15,6 @@ BR2_i386=y
 # BR2_nios2 is not set
 # BR2_powerpc is not set
 # BR2_sh is not set
-# BR2_sh64 is not set
 # BR2_sparc is not set
 # BR2_sparc64 is not set
 # BR2_x86_64 is not set
diff --git a/arch/Config.in b/arch/Config.in
index 3caca15..df4db0b 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -197,16 +197,6 @@ config BR2_sh
 	  http://www.hitachi.com/
 	  http://en.wikipedia.org/wiki/SuperH
 
-config BR2_sh64
-	bool "SuperH64"
-	depends on BR2_DEPRECATED_SINCE_2015_05
-	select BR2_ARCH_HAS_MMU_MANDATORY
-	help
-	  SuperH64 (or SH) is a 64-bit reduced instruction set computer (RISC)
-	  instruction set architecture (ISA) developed by Hitachi.
-	  http://www.hitachi.com/
-	  http://en.wikipedia.org/wiki/SuperH
-
 config BR2_sparc
 	bool "SPARC"
 	select BR2_ARCH_HAS_MMU_MANDATORY
@@ -396,7 +386,7 @@ if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 source "arch/Config.in.powerpc"
 endif
 
-if BR2_sh || BR2_sh64
+if BR2_sh
 source "arch/Config.in.sh"
 endif
 
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index 1bdea37..4705212 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -23,8 +23,7 @@ config BR2_ARCH
 	default "sh4eb"		if BR2_sh4eb
 	default "sh4a"		if BR2_sh4a
 	default "sh4aeb"	if BR2_sh4aeb
-	default "sh64"		if BR2_sh64
 
 config BR2_ENDIAN
-	default "LITTLE"	if BR2_sh4 || BR2_sh4a || BR2_sh64
+	default "LITTLE"	if BR2_sh4 || BR2_sh4a
 	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
diff --git a/linux/Config.in b/linux/Config.in
index 4b701a4..fd6b4b3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -179,7 +179,7 @@ config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
 		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
-		   BR2_sh || BR2_sh64 || BR2_mips || BR2_mipsel || \
+		   BR2_sh || BR2_mips || BR2_mipsel || \
 		   BR2_mips64 || BR2_mips64el
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
@@ -198,7 +198,7 @@ config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
 	depends on BR2_arm || BR2_armeb || BR2_powerpc || \
 		   BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || \
-		   BR2_sh || BR2_sh64 || BR2_xtensa
+		   BR2_sh || BR2_xtensa
 
 config BR2_LINUX_KERNEL_ZIMAGE_EPAPR
 	bool "zImage.epapr"
@@ -235,7 +235,7 @@ config BR2_LINUX_KERNEL_LINUX_BIN
 
 config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
-	depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
+	depends on BR2_mips || BR2_mipsel || BR2_sh
 
 config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
index 1ec59e1..9e18d22 100644
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FDK_AAC
 	# These are the architectures supported by FDK AAC
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_powerpc || BR2_sh || BR2_sh64
+		   BR2_powerpc || BR2_sh
 
 	help
 	  The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec")
@@ -17,4 +17,4 @@ comment "fdk-aac needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_powerpc || BR2_sh || BR2_sh64
+		   BR2_powerpc || BR2_sh
diff --git a/package/gauche/Config.in b/package/gauche/Config.in
index 3ca012d..c5f2a51 100644
--- a/package/gauche/Config.in
+++ b/package/gauche/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
 	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k || \
 		BR2_mips || BR2_mipsel || BR2_mips64 || \
 		BR2_mips64el || BR2_powerpc || BR2_powerpc64 || \
-		BR2_powerpc64le || BR2_sh || BR2_sh64 || BR2_x86_64
+		BR2_powerpc64le || BR2_sh || BR2_x86_64
 
 config BR2_PACKAGE_GAUCHE
 	bool "gauche"
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index feab01d..809e02d 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -40,10 +40,10 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
-	depends on !BR2_sh && !BR2_sh64 && !BR2_microblaze
+	depends on !BR2_sh && !BR2_microblaze
 
 comment "full gdb on target needs a toolchain w/ wchar"
-	depends on !BR2_sh && !BR2_sh64 && !BR2_microblaze
+	depends on !BR2_sh && !BR2_microblaze
 	depends on !BR2_USE_WCHAR
 
 if BR2_PACKAGE_GDB_DEBUGGER
diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 04ab5a5..5527a2b 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_USES_GLIBC && \
 		(((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
 		 BR2_mips || BR2_mipsel || BR2_mips64 || \
-		 BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64)
+		 BR2_mips64el || BR2_powerpc || BR2_sh || BR2_i386 || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
 		(((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
 		 BR2_i386 || BR2_mips || BR2_mipsel || \
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 3b8310c..f3f8047 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -24,7 +24,7 @@ RUBY_CFLAGS = $(TARGET_CFLAGS)
 # With some SuperH toolchains (like Sourcery CodeBench 2012.09), ruby fails to
 # build with 'pcrel too far'. This seems to be caused by the -Os option we pass
 # by default. To fix the problem, use standard -O2 optimization instead.
-ifeq ($(BR2_sh)$(BR2_sh64),y)
+ifeq ($(BR2_sh),y)
 RUBY_CFLAGS += -O2
 endif
 RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 9fdfb42..8e275c2 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,8 +48,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
 		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
-		   BR2_sh          || BR2_sh64       || BR2_sparc64 || \
-		   BR2_x86_64      || BR2_microblaze || BR2_nios2
+		   BR2_sh          || BR2_sparc64    || BR2_x86_64 || \
+		   BR2_microblaze || BR2_nios2
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_powerpc_SPE
-- 
2.7.3
