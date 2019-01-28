From: Joakim Bech <joakim.bech@linaro.org>
Date: Mon, 28 Jan 2019 15:02:06 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: update AArch32/AArch64 toolchain
 to 8-2-2019.01
In-Reply-To: <20190128133500.7515-1-joakim.bech@linaro.org>
References: <20190128133500.7515-1-joakim.bech@linaro.org>
Message-ID: <20190128140206.25948-1-joakim.bech@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested with OP-TEE [1] using GCC 8.2 2019.01 for both AArch32 (QEMU
Armv7-A, gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf [2]) and with
AArch64 (QEMU Armv8-A, gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu [2])
which has gotten TUI mode re-enabled [3].

[1] https://github.com/OP-TEE
[2] https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads
[3] https://bugs.linaro.org/show_bug.cgi?id=4130

Signed-off-by: Joakim Bech <joakim.bech@linaro.org>
---
Re-sending the patch, since I wasn't subscribing to the Buildroot
mailinglist.

 package/linux-headers/Config.in.host                         | 4 ++++
 toolchain/Config.in                                          | 5 +++++
 .../toolchain-external-arm-aarch64/Config.in                 | 4 ++--
 .../toolchain-external/toolchain-external-arm-arm/Config.in  | 4 ++--
 .../toolchain-external-custom/Config.in.options              | 4 ++++
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a6055e75b9..fd0cef8b21 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_4_20
 	bool "Linux 4.20.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 
+config BR2_KERNEL_HEADERS_5_00
+	bool "Linux 5.00.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
diff --git a/toolchain/Config.in b/toolchain/Config.in
index baf192c936..fd197f2407 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -374,10 +374,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.00" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
 	default "4.20" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index fbb5e025e8..279cb88f31 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 2018.11"
+	bool "Arm AArch64 2019.01"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 0449737889..69c2f7425e 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -4,7 +4,7 @@ comment "Arm toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 2018.11"
+	bool "Arm ARM 2019.01"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64"
@@ -14,7 +14,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 08a79ee4d9..48eb1ea080 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_00
+	bool "5.00.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_20
 	bool "4.20.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-- 
2.17.1
