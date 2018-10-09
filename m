From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  9 Oct 2018 22:07:01 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain-external: add Arm AArch64
 toolchain 8.2-2018.08
In-Reply-To: <20181009200702.16263-1-romain.naour@gmail.com>
References: <20181009200702.16263-1-romain.naour@gmail.com>
Message-ID: <20181009200702.16263-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the same toolchain that was previously distributed by Linaro. [1]

Switch default toolchain as this toolchain supersed the Linaro AArch64 toolchain.
Only x86_64 host are supported, so keep Linaro toolchain for x86 host.

Tested with qemu_aarch64_virt_defconfig.

[1] https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/toolchain-external/Config.in                |  4 +++-
 .../toolchain-external-arm-aarch64/Config.in          | 19 +++++++++++++++++++
 .../toolchain-external-arm-aarch64/Config.in.options  |  9 +++++++++
 .../toolchain-external-arm-aarch64.hash               |  4 ++++
 .../toolchain-external-arm-aarch64.mk                 | 12 ++++++++++++
 5 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d2b430c9f8..47e54fc354 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -11,7 +11,8 @@ comment "glibc toolchains only available with shared lib support"
 # Kept toolchains sorted by architecture in order to use some toolchain
 # as default choice
 
-# Aarch64 (use Linaro toolchain by default)
+# Aarch64 (use ARM toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
 
@@ -111,6 +112,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 # BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL and BR2_TOOLCHAIN_EXTERNAL_PREFIX
 
 # Aarch64
+source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
new file mode 100644
index 0000000000..ba627129cb
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -0,0 +1,19 @@
+config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
+	bool "Arm AArch64 2018.08"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Arm toolchain for the AArch64 architecture.
+
+	  This is the same toolchain that was previously distributed by
+	  Linaro.
+
+	  https://developer.arm.com/open-source/gnu-toolchain
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options
new file mode 100644
index 0000000000..19b75805c9
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "aarch64-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-arm-aarch64"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
new file mode 100644
index 0000000000..d651bb0182
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -0,0 +1,4 @@
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.08/gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu.tar.xz.asc
+md5 1c47f4edc431cf19604a9f1b09975269 gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu.tar.xz
+# locally calculated
+sha256 3e60644846ac60693e58ad71a319d64c5f7bcf95ff34411272c8d9674f85648f gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
new file mode 100644
index 0000000000..515b66cd79
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# toolchain-external-arm-aarch64
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2018.08
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)
+
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-linux-gnu.tar.xz
+
+$(eval $(toolchain-external-package))
-- 
2.14.4
