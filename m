From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Date: Tue, 21 Jul 2015 16:46:03 +0800
Subject: [Buildroot] [PATCH V3 4/5] aarch64: ilp32: add ilp32 build config
In-Reply-To: <1437468364-19245-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1437468364-19245-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1437468364-19245-5-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ILP32 in menuconfig. And disable the libc and toolchain which
does not support ILP32.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
---
 arch/Config.in.aarch64                 | 36 ++++++++++++++++++++++++++++++++++
 package/gcc/Config.in.host             |  3 ++-
 toolchain/Config.in                    |  2 ++
 toolchain/toolchain-external/Config.in | 22 +++++++++++++++++++++
 4 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
index 325bccc..b4e3e43 100644
--- a/arch/Config.in.aarch64
+++ b/arch/Config.in.aarch64
@@ -8,3 +8,39 @@ config BR2_ENDIAN
 
 config BR2_ARCH_HAS_ATOMICS
 	default y
+
+config BR2_GCC_TARGET_ABI
+	default "" if BR2_AARCH64_LP64
+	default "ilp32" if BR2_AARCH64_ILP32
+
+choice
+	prompt "Target ABI"
+	depends on BR2_aarch64 || BR2_aarch64_be
+	default BR2_AARCH64_LP64
+	help
+	  Application Binary Interface to use. The Application Binary
+	  Interface describes the calling conventions (how arguments
+	  are passed to functions, how the return value is passed, how
+	  system calls are made, etc.).
+
+config BR2_AARCH64_LP64
+	bool "LP64"
+	help
+	  The LP64 is the default ABI in aarch64. It means that
+	  long and pointer is 64bit.
+
+config BR2_AARCH64_ILP32
+	bool "ILP32"
+	help
+	  ILP32 is a method for running 32bit application on 64bit platform, such
+	  binary is elf32 with aarch64 assembly and is compiled by 64bit compiler.
+	  Refer the following table:
+
+	    \-            |  arm 32bit  | arm64 ILP32 | arm64 LP64
+	  ----------------|-------------|-------------|-------------
+	  instruction set |   armv7-a   |   armv8-a   |   armv8-a
+	  int             |   32bit     |   32bit     |   32bit
+	  long            |   32bit     | **32bit**   |   64bit
+	  pointer         |   32bit     | **32bit**   |   64bit
+
+endchoice
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 7d2c999..015f80a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -55,7 +55,8 @@ choice
 		bool "gcc 4.8.x"
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_arc \
-			&& !BR2_powerpc64le && !BR2_nios2
+			&& !BR2_powerpc64le && !BR2_nios2 \
+			&& !BR2_AARCH64_ILP32
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12
 		# Broken or unsupported PPC cores
diff --git a/toolchain/Config.in b/toolchain/Config.in
index a851ce4..794bf8b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -27,6 +27,7 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_AARCH64_ILP32
 
 choice
 	prompt "Toolchain type"
@@ -40,6 +41,7 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on !BR2_bfin
+	depends on !BR2_AARCH64_ILP32
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e70989e..12ad00a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -588,6 +588,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	depends on BR2_sh4a || BR2_sh4aeb
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_AARCH64_ILP32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -611,6 +612,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	depends on BR2_sh4a || BR2_sh4aeb
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_AARCH64_ILP32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -789,6 +791,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_AARCH64_ILP32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -803,6 +806,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_AARCH64_ILP32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -1008,69 +1012,86 @@ config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_15
 	bool "3.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14
 	bool "3.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13
 	bool "3.13.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12
 	bool "3.12.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_11
 	bool "3.11.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10
 	bool "3.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9
 	bool "3.9.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_8
 	bool "3.8.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_7
 	bool "3.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_6
 	bool "3.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_5
 	bool "3.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_4
 	bool "3.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_3
 	bool "3.3.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2
 	bool "3.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_1
 	bool "3.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_0
 	bool "3.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_AARCH64_ILP32
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
 	bool "2.6.x"
+	depends on !BR2_AARCH64_ILP32
 
 endchoice
 
@@ -1081,6 +1102,7 @@ choice
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 	bool "uClibc"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	depends on !BR2_AARCH64_ILP32
 	# For the time being, we assume that all custom external
 	# toolchains have shadow password support.
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-- 
2.1.4
