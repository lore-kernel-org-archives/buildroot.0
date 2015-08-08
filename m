From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:00 -0000
Subject: [Buildroot] [git commit branch/next] aarch64: add big
	endian(aarch64_be) support
Message-ID: <20150808105628.EF72C7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=827ba46556b7c2dddb0e881879bacf3283fc2c3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add aarch64_be support. Note that CONFIG_CPU_BIG_ENDIAN should be
defined in kernel config when building a big endian kernel.

Signed-off-by: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                |    2 +-
 arch/Config.in                          |   12 ++++++++++--
 arch/Config.in.aarch64                  |    4 +++-
 toolchain/toolchain-buildroot/Config.in |   27 ++++++++++++++-------------
 4 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index b1bcf78..35818f0 100644
--- a/Makefile
+++ b/Makefile
@@ -329,7 +329,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/arcle/arc/ \
 	-e s/arceb/arc/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
-	-e s/aarch64/arm64/ \
+	-e s/aarch64.*/arm64/ \
 	-e s/bfin/blackfin/ \
 	-e s/parisc64/parisc/ \
 	-e s/powerpc64.*/powerpc/ \
diff --git a/arch/Config.in b/arch/Config.in
index 94397b3..39ce046 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -59,7 +59,15 @@ config BR2_armeb
 	  http://en.wikipedia.org/wiki/ARM
 
 config BR2_aarch64
-	bool "AArch64"
+	bool "AArch64 (little endian)"
+	select BR2_ARCH_IS_64
+	help
+	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
+	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
+	  http://en.wikipedia.org/wiki/ARM
+
+config BR2_aarch64_be
+	bool "AArch64 (big endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
@@ -347,7 +355,7 @@ if BR2_arm || BR2_armeb
 source "arch/Config.in.arm"
 endif
 
-if BR2_aarch64
+if BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.aarch64"
 endif
 
diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
index 2e79870..325bccc 100644
--- a/arch/Config.in.aarch64
+++ b/arch/Config.in.aarch64
@@ -1,8 +1,10 @@
 config BR2_ARCH
 	default "aarch64"	if BR2_aarch64
+	default "aarch64_be"	if BR2_aarch64_be
 
 config BR2_ENDIAN
-	default "LITTLE"
+	default "LITTLE" if BR2_aarch64
+	default "BIG"	 if BR2_aarch64_be
 
 config BR2_ARCH_HAS_ATOMICS
 	default y
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 77a197e..13e2b15 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -23,8 +23,8 @@ source "package/linux-headers/Config.in.host"
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_UCLIBC
-	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_aarch64 || BR2_microblaze \
-		|| BR2_mips64 || BR2_mips64el || BR2_powerpc64
+	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_aarch64 || BR2_aarch64_be \
+		|| BR2_microblaze || BR2_mips64 || BR2_mips64el || BR2_powerpc64
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
@@ -42,11 +42,12 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	bool "eglibc"
-	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
-		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
-		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
-		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64
+	depends on BR2_arm        || BR2_armeb    || BR2_aarch64    || \
+		   BR2_aarch64_be || BR2_i386     || BR2_mips       || \
+		   BR2_mipsel     || BR2_mips64   || BR2_mips64el   || \
+		   BR2_powerpc    || BR2_sh       || BR2_sh64       || \
+		   BR2_sparc      || BR2_x86_64   || BR2_microblaze || \
+		   BR2_powerpc64
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_DEPRECATED_SINCE_2015_08
@@ -61,12 +62,12 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	bool "glibc"
-	depends on BR2_arm         || BR2_armeb    || BR2_aarch64 || \
-		   BR2_i386        || BR2_mips     || BR2_mipsel  || \
-		   BR2_mips64      || BR2_mips64el || BR2_powerpc || \
-		   BR2_powerpc64   || BR2_powerpc64le || BR2_sh   || \
-		   BR2_sh64        || BR2_sparc    || BR2_x86_64  || \
-		   BR2_microblaze  || BR2_nios2
+	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
+		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
+		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
+		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
+		   BR2_sh          || BR2_sh64       || BR2_sparc   || \
+		   BR2_x86_64      || BR2_microblaze || BR2_nios2
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_powerpc_SPE
