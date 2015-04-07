From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 7 Apr 2015 22:31:01 +0200
Subject: [Buildroot] [PATCH] sh64: drop support for architecture
Message-ID: <20150407203101.GA14853@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There seems to be no hardware or emulator available for this
architecture. Someone from ST Microelectronics told me that
sh64/sh5 projects are dropped over ten years ago.
I found nothing about real hardware on the sites of Hitachi
or Renesas.
We should drop this.
Support in uClibc-ng will be dropped in 1.1.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

---
Or does anyone know of any sh64/sh5 hardware?

---
 arch/Config.in                          |   10 +---------
 arch/Config.in.sh                       |    3 +--
 linux/Config.in                         |    6 +++---
 package/gdb/Config.in                   |    4 ++--
 package/libunwind/Config.in             |    4 ++--
 toolchain/toolchain-buildroot/Config.in |    4 ++--
 6 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 59bf84a..02c7108 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -161,14 +161,6 @@ config BR2_sh
 	  http://www.hitachi.com/
 	  http://en.wikipedia.org/wiki/SuperH
 
-config BR2_sh64
-	bool "SuperH64"
-	help
-	  SuperH64 (or SH) is a 64-bit reduced instruction set computer (RISC)
-	  instruction set architecture (ISA) developed by Hitachi.
-	  http://www.hitachi.com/
-	  http://en.wikipedia.org/wiki/SuperH
-
 config BR2_sparc
 	bool "SPARC"
 	help
@@ -342,7 +334,7 @@ if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 source "arch/Config.in.powerpc"
 endif
 
-if BR2_sh || BR2_sh64
+if BR2_sh
 source "arch/Config.in.sh"
 endif
 
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index 9f8f79c..4f99a0c 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -23,10 +23,9 @@ config BR2_ARCH
 	default "sh4eb"		if BR2_sh4eb
 	default "sh4a"		if BR2_sh4a
 	default "sh4aeb"	if BR2_sh4aeb
-	default "sh64"		if BR2_sh64
 
 config BR2_ENDIAN
-	default "LITTLE"	if BR2_sh4 || BR2_sh4a || BR2_sh64
+	default "LITTLE"	if BR2_sh4 || BR2_sh4a
 	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
 
 config BR2_ARCH_HAS_ATOMICS
diff --git a/linux/Config.in b/linux/Config.in
index c83a3f5..e1f7b5f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -177,7 +177,7 @@ choice
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
-		   BR2_powerpc || BR2_sh || BR2_sh64 || \
+		   BR2_powerpc || BR2_sh || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
@@ -196,7 +196,7 @@ config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
 	depends on BR2_arm || BR2_armeb || BR2_powerpc || \
 		   BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || \
-		   BR2_sh || BR2_sh64 || BR2_xtensa
+		   BR2_sh || BR2_xtensa
 
 config BR2_LINUX_KERNEL_APPENDED_ZIMAGE
 	bool "zImage with appended DT"
@@ -225,7 +225,7 @@ config BR2_LINUX_KERNEL_LINUX_BIN
 
 config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
-	depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
+	depends on BR2_mips || BR2_mipsel || BR2_sh
 
 config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index db6adf5..9d33438 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -40,10 +40,10 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
-	depends on !BR2_sh && !BR2_sh64 && !BR2_microblaze && !BR2_bfin
+	depends on !BR2_sh && !BR2_microblaze && !BR2_bfin
 
 comment "full gdb on target needs a toolchain w/ wchar"
-	depends on !BR2_sh && !BR2_sh64 && !BR2_microblaze && !BR2_bfin
+	depends on !BR2_sh && !BR2_microblaze && !BR2_bfin
 	depends on !BR2_USE_WCHAR
 
 if BR2_PACKAGE_GDB_DEBUGGER
diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 85cb472..fd54e77 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBUNWIND
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) # {g,s}etcontext
 	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
-		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
+		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_i386 || BR2_x86_64
 	help
 	  C API to determine the call-chain of a program.
 
@@ -11,5 +11,5 @@ config BR2_PACKAGE_LIBUNWIND
 
 comment "libunwind needs a uclibc snapshot or (e)glibc toolchain w/ threads"
 	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
-		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
+		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_i386 || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 1b4bb9d..e909092 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -45,7 +45,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
-		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
+		   BR2_sh     || BR2_sparc    || \
 		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
@@ -64,7 +64,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_i386        || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64      || BR2_mips64el || BR2_powerpc || \
 		   BR2_powerpc64   || BR2_powerpc64le || BR2_sh   || \
-		   BR2_sh64        || BR2_sparc    || BR2_x86_64  || \
+		   BR2_sparc       || BR2_x86_64  || \
 		   BR2_microblaze  || BR2_nios2
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
-- 
1.7.10.4
