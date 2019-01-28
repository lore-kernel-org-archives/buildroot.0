From: Joakim Bech <joakim.bech@linaro.org>
Date: Mon, 28 Jan 2019 18:05:33 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain: update AArch32/AArch64
 toolchains to 8-2-2019.01
In-Reply-To: <20190128133500.7515-1-joakim.bech@linaro.org>
References: <20190128133500.7515-1-joakim.bech@linaro.org>
Message-ID: <20190128170533.16555-1-joakim.bech@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the GCC 2019.01 version [1] Arm have re-enabled the TUI mode which
makes debugging with GDB (source code) a bit easier [2].

Tested with bare Buildroot / defconfig(s):
 * qemu_aarch64_virt_defconfig
 * qemu_arm_vexpress_defconfig

Tested with OP-TEE [3]:
 * Full QEMU v7 (AArch32) build
 * Full QEMU v8 (AArch64) build

[1] https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads
[2] https://bugs.linaro.org/show_bug.cgi?id=4130
[3] https://github.com/OP-TEE

Signed-off-by: Joakim Bech <joakim.bech@linaro.org>
---
Changes v1 -> v2:
  - Added hashes for the new GCC binaries.
  - Stepped up the version in use in the ...arm-aarch64.mk as well as in
    the ...arm-arm.mk file(s).
  - Cleaned up and clarified the commit message.

 package/linux-headers/Config.in.host                         | 4 ++++
 toolchain/Config.in                                          | 5 +++++
 .../toolchain-external-arm-aarch64/Config.in                 | 4 ++--
 .../toolchain-external-arm-aarch64.hash                      | 5 +++++
 .../toolchain-external-arm-aarch64.mk                        | 2 +-
 .../toolchain-external/toolchain-external-arm-arm/Config.in  | 4 ++--
 .../toolchain-external-arm-arm.hash                          | 5 +++++
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk | 2 +-
 .../toolchain-external-custom/Config.in.options              | 4 ++++
 9 files changed, 29 insertions(+), 6 deletions(-)

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
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index cda90f7517..90e44d5c3b 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -2,3 +2,8 @@
 md5 319ca548ff05b0ec1008988a7e5ab619 gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz
 # locally calculated
 sha256 0142366da2f30feb1c366997cbdaa02286c8f1aa527c0fc177ee5ce8e77970fc gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz
+
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2019.01/gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu.tar.xz.asc
+md5 ed467a18abc7cf81d53c0cf6014b1867 gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu.tar.xz
+# locally calculated
+sha256 6683d51b0dd61a91ab1e8e478a0a8a50ccb34d5590c84aa36697e956b16f14a1 gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 0398bd1297..bb9c658639 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2018.11
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2019.01
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-linux-gnu.tar.xz
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
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index cd7f526547..e0e841cb70 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -2,3 +2,8 @@
 md5 59ccf965837ed1c5ba59e5ad4b688b21 gcc-arm-8.2-2018.11-x86_64-arm-linux-gnueabihf.tar.xz
 # locally calculated
 sha256 3f9bc7a68f744a5edc7caebff5f3f2c3bc1ff9d8ac8b05f7680a0071461deede gcc-arm-8.2-2018.11-x86_64-arm-linux-gnueabihf.tar.xz
+
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2019.01/gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf.tar.xz.asc
+md5 123887bdaa27b362f0f428dc36af5693 gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf.tar.xz
+# locally calculated
+sha256 6b73016fa4773a7450bac9bd80b2ca056b5d582dd966b509a17b305fc89506a9 gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 0c21affd7b..67d21a13d9 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2018.11
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2019.01
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-linux-gnueabihf.tar.xz
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
