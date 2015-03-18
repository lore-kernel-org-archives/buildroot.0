From: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
Date: Wed, 18 Mar 2015 17:49:51 +0800
Subject: [Buildroot] [RFC PATCH v2 4/5] aarch64: ilp32: add ilp32 build
	config
In-Reply-To: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1426672192-21041-5-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ILP32 in menuconfig. And disable the libc and toolchain which
does not support ILP32.

Signed-off-by: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
---
 arch/Config.in.aarch64                 | 35 ++++++++++++++++++++++++++++++++++
 package/gcc/Config.in.host             |  3 ++-
 toolchain/Config.in                    |  2 ++
 toolchain/toolchain-external/Config.in | 20 +++++++++++++++++++
 4 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
index 9830302..c9434d7 100644
--- a/arch/Config.in.aarch64
+++ b/arch/Config.in.aarch64
@@ -9,3 +9,38 @@ config BR2_ENDIAN
 config BR2_ARCH_HAS_ATOMICS
 	default y
 
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
+ config BR2_AARCH64_ILP32
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
index 1a5281c..b072e4d 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -56,7 +56,8 @@ choice
 		bool "gcc 4.8.x"
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_arc \
-			&& !BR2_bfin && !BR2_powerpc64le && !BR2_nios2
+			&& !BR2_bfin && !BR2_powerpc64le && !BR2_nios2 \
+			&& !BR2_AARCH64_ILP32
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12
 		# Broken or unsupported PPC cores
diff --git a/toolchain/Config.in b/toolchain/Config.in
index efb77f8..c78708d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -31,6 +31,7 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_AARCH64_ILP32
 
 choice
 	prompt "Toolchain type"
@@ -44,6 +45,7 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on !BR2_bfin
+	depends on !BR2_AARCH64_ILP32
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8b0f09b..48082b0 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -835,6 +835,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_AARCH64_ILP32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -849,6 +850,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_AARCH64_ILP32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -1043,69 +1045,86 @@ config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
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
 
@@ -1116,6 +1135,7 @@ choice
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 	bool "uClibc"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	depends on !BR2_AARCH64_ILP32
 	# For the time being, we assume that all custom external
 	# toolchains have shadow password support.
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-- 
1.8.4.5
