From: Nylon Chen <nylon7@andestech.com>
Date: Wed, 23 Jan 2019 20:39:45 +0800
Subject: [Buildroot] [PATCH v2 1/3] arch: add support for Andes 32-bit
 (nds32) architecture
In-Reply-To: <20190123123947.5084-1-nylon7@andestech.com>
References: <20190123123947.5084-1-nylon7@andestech.com>
Message-ID: <20190123123947.5084-2-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enables a nds32 system to be built with a Buildroot generated
toolchain (gcc >= 8.0.1, binutils >= 2.30, glibc only).

This configuration has been used to successfully build a linux kernel
(git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git).

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
---
 DEVELOPERS                           |  7 +++++++
 arch/Config.in                       | 13 ++++++++++++
 arch/Config.in.nds32                 | 31 ++++++++++++++++++++++++++++
 package/binutils/Config.in.host      |  2 ++
 package/gcc/Config.in.host           |  4 ++++
 package/linux-headers/Config.in.host |  3 +++
 6 files changed, 60 insertions(+)
 create mode 100644 arch/Config.in.nds32

diff --git a/DEVELOPERS b/DEVELOPERS
index c1950bb0f4..1846748e01 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2296,3 +2296,10 @@ F:	package/qjson/
 F:	package/quazip/
 F:	package/shapelib/
 F:	package/tinc/
+
+N:	Nylon Chen <nylon7@andestech.com>
+F:	arch/Config.in
+F:	arch/Config.in.nds32
+F:	package/binutils
+F:	package/gcc
+F:	package/linux-headers
diff --git a/arch/Config.in b/arch/Config.in
index f50760a0cf..62d4dda595 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -125,6 +125,15 @@ config BR2_mips
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
+config BR2_nds32
+	bool "nds32"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
+	select BR2_ARCH_HAS_MMU_MANDATORY
+	help
+	  nds32 is a 32-bit architecture developed by Andes Technology.
+	  https://en.wikipedia.org/wiki/Andes_Technology
+
+
 config BR2_mipsel
 	bool "MIPS (little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
@@ -423,6 +432,10 @@ if BR2_nios2
 source "arch/Config.in.nios2"
 endif
 
+if BR2_nds32
+source "arch/Config.in.nds32"
+endif
+
 if BR2_or1k
 source "arch/Config.in.or1k"
 endif
diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
new file mode 100644
index 0000000000..f2b6a22f8c
--- /dev/null
+++ b/arch/Config.in.nds32
@@ -0,0 +1,31 @@
+config BR2_ARCH
+	default "nds32"
+
+choice
+	prompt "Target Architecture Variant"
+	default BR2_nds32_v3
+	depends on !BR2_ARCH_IS_64
+	help
+	  Specific CPU variant to use
+
+comment "N series"
+config BR2_nds32_v3
+	bool "v3"
+config BR2_nds32_v3f
+	bool "v3f"
+
+endchoice
+
+config BR2_GCC_TARGET_ARCH
+	default "v3"    if BR2_nds32_v3
+	default "v3f"   if BR2_nds32_v3f
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	bool
+
+config BR2_READELF_ARCH_NAME
+	default "Andes Technology compact code size embedded RISC processor family"
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 924d1749cd..484fb050ba 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -19,10 +19,12 @@ config BR2_BINUTILS_VERSION_2_28_X
 	bool "binutils 2.28.1"
 	depends on !BR2_arc
 	depends on !BR2_riscv
+	depends on !BR2_nds32
 
 config BR2_BINUTILS_VERSION_2_29_X
 	bool "binutils 2.29.1"
 	depends on !BR2_riscv
+	depends on !BR2_nds32
 
 config BR2_BINUTILS_VERSION_2_30_X
 	bool "binutils 2.30"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 036a5b9790..c8a74e10c6 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -26,6 +26,7 @@ config BR2_GCC_VERSION_4_9_X
 	# Broken or unsupported architectures
 	depends on !BR2_arc
 	depends on !BR2_or1k
+	depends on !BR2_nds32
 	# musl on microblaze, ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
@@ -42,6 +43,7 @@ config BR2_GCC_VERSION_5_X
 	# Broken or unsupported architectures
 	depends on !BR2_arc
 	depends on !BR2_or1k
+	depends on !BR2_nds32
 	# musl on ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
@@ -55,6 +57,7 @@ config BR2_GCC_VERSION_6_X
 	# Broken or unsupported architectures
 	depends on !BR2_arc
 	depends on !BR2_or1k
+	depends on !BR2_nds32
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_GCC_VERSION_7_X
@@ -62,6 +65,7 @@ config BR2_GCC_VERSION_7_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	# Broken or unsupported architectures
 	depends on !BR2_or1k
+	depends on !BR2_nds32
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_GCC_VERSION_8_X
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 88373aee6f..43a6374992 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -31,16 +31,19 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 config BR2_KERNEL_HEADERS_4_4
 	bool "Linux 4.4.x kernel headers"
 	depends on !BR2_riscv
+	depends on !BR2_nds32
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 
 config BR2_KERNEL_HEADERS_4_9
 	bool "Linux 4.9.x kernel headers"
 	depends on !BR2_riscv
+	depends on !BR2_nds32
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 
 config BR2_KERNEL_HEADERS_4_14
 	bool "Linux 4.14.x kernel headers"
 	depends on !BR2_riscv
+	depends on !BR2_nds32
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 
 config BR2_KERNEL_HEADERS_4_19
-- 
2.18.0
