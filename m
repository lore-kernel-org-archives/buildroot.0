From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:08:55 +0200
Subject: [Buildroot] [PATCH v2 10/23] toolchain-external-linaro-arm: new
	package
In-Reply-To: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477742948-11490-11-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Linaro external toolchain for
the ARM architecture. As of this commit, the code is currently not
used, but it will be used as soon as the external toolchain
infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-linaro-arm/Config.in        | 27 ++++++++++++++++++++++
 .../Config.in.options                              |  6 +++++
 .../toolchain-external-linaro-arm.hash             |  3 +++
 .../toolchain-external-linaro-arm.mk               | 17 ++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
new file mode 100644
index 0000000..bf8649a
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -0,0 +1,27 @@
+comment "Linaro toolchains available for Cortex-A + EABIhf"
+	depends on BR2_arm
+	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
+	bool "Linaro ARM 2016.05"
+	depends on BR2_arm
+	depends on BR2_ARM_CPU_ARMV7A
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Linaro toolchain for the ARM architecture. It uses Linaro
+	  GCC 2016.05 (based on gcc 5.3.1), Linaro GDB 2016.05 (based on
+	  GDB 7.11.1), glibc 2.21, Binutils 2016.05 (based on 2.25). It
+	  generates code that runs on all Cortex-A profile devices,
+	  but tuned for the Cortex-A9. The code generated is Thumb 2,
+	  with the hard floating point calling convention, and uses
+	  the VFPv3-D16 FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
new file mode 100644
index 0000000..9d9ecef
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-linaro-arm"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
new file mode 100644
index 0000000..8106426
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 f1421c580ce977226f4fefc9c409b3b423260cc65a6e9dc6da88bb3478a521a0  gcc-linaro-5.3.1-2016.05-i686_arm-linux-gnueabihf.tar.xz
+sha256 987941c9fffdf56ffcbe90e8984673c16648c477b537fcf43add22fa62f161cd  gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
new file mode 100644
index 0000000..bb7718a
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# toolchain-external-linaro-arm
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2016.05
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_LINARO_ARM_PREFIX = arm-linux-gnueabihf
+
+ifeq ($(HOSTARCH),x86)
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
+else
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
+endif
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
