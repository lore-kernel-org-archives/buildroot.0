From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Oct 2016 15:57:04 +0100
Subject: [Buildroot] [PATCH v3 15/24] toolchain-external-codesourcery-arm:
	new package
In-Reply-To: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477925833-27204-16-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the ARM architecture. As of this commit, the code is
currently not used, but it will be used as soon as the external
toolchain infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-arm/Config.in  | 33 ++++++++++++++++++++++
 .../Config.in.options                              |  6 ++++
 .../toolchain-external-codesourcery-arm.hash       |  3 ++
 .../toolchain-external-codesourcery-arm.mk         | 14 +++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
new file mode 100644
index 0000000..037985b
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
@@ -0,0 +1,33 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
+	bool "Sourcery CodeBench ARM 2014.05"
+	depends on BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_EABI
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	help
+	  Sourcery CodeBench toolchain for the ARM architecture, from
+	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
+	  2.18 and gdb 7.7.50, kernel headers 3.13. It has support
+	  for the following variants:
+	    - ARMv5TE, little endian, soft-float, glibc
+	      Select ARM926T, ARM10T, XScale or another ARMv5 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv4T, little endian, soft-float, glibc
+	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mthumb
+
+comment "Sourcery CodeBench toolchains available for the EABI ABI"
+	depends on BR2_arm
+	depends on !BR2_ARM_EABI
+	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
new file mode 100644
index 0000000..59634d5
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-arm"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
new file mode 100644
index 0000000..535f4aa
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
new file mode 100644
index 0000000..9df156c
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# toolchain-external-codesourcery-arm
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION = 2014.05-29
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_SOURCE = arm-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_PREFIX)-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_ACTUAL_SOURCE_TARBALL = arm-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_PREFIX).src.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_PREFIX = arm-none-linux-gnueabi
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
