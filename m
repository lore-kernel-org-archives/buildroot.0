From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:08:51 +0200
Subject: [Buildroot] [PATCH v2 06/23] toolchain-external-arago-armv7a: new
	package
In-Reply-To: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477742948-11490-7-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Arago external toolchain for
the ARM architecture. As of this commit, the code is currently not
used, but it will be used as soon as the external toolchain
infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arago-armv7a/Config.in      | 24 ++++++++++++++++++++++
 .../Config.in.options                              |  6 ++++++
 .../toolchain-external-arago-armv7a.hash           |  3 +++
 .../toolchain-external-arago-armv7a.mk             | 23 +++++++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv7a/toolchain-external-arago-armv7a.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv7a/toolchain-external-arago-armv7a.mk

diff --git a/toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in b/toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in
new file mode 100644
index 0000000..a3ea6b2
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in
@@ -0,0 +1,24 @@
+config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
+	bool "Arago ARMv7 2011.09"
+	depends on BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_CPU_ARMV7A
+	depends on BR2_ARM_EABI
+	depends on BR2_ARM_CPU_HAS_VFPV3
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	# kernel headers: 2.6.31
+	help
+	  Texas Instruments Arago 2011.09 toolchain, with gcc 4.5.3,
+	  binutils 2.20.1, glibc 2.12, gdb 7.2.
+
+	  This toolchain uses -mfloat-abi=softfp (i.e can use FPU
+	  instructions, but passes floating point function arguments
+	  in integer registers), and requires a VFPv3 floating point
+	  unit to work properly. This unit is available on most
+	  Cortex-A ARM processors, but not all.
diff --git a/toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in.options b/toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in.options
new file mode 100644
index 0000000..96018f5
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-arago-armv7a"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-arago-armv7a/toolchain-external-arago-armv7a.hash b/toolchain/toolchain-external/toolchain-external-arago-armv7a/toolchain-external-arago-armv7a.hash
new file mode 100644
index 0000000..a66900a
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arago-armv7a/toolchain-external-arago-armv7a.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
+sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-arago-armv7a/toolchain-external-arago-armv7a.mk b/toolchain/toolchain-external/toolchain-external-arago-armv7a/toolchain-external-arago-armv7a.mk
new file mode 100644
index 0000000..93e3e79
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arago-armv7a/toolchain-external-arago-armv7a.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# toolchain-external-arago-armv7a
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_VERSION = 2011.09
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_PREFIX = arm-arago-linux-gnueabi
+
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_SOURCE = \
+	arago-$(TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_VERSION)-armv7a-linux-gnueabi-sdk.tar.bz2
+
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_ACTUAL_SOURCE_TARBALL = arago-toolchain-$(TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_VERSION)-sources.tar.bz2
+
+define TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_FIXUP_EXTRACT
+	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
+	rm -rf $(@D)/arago-2011.09/
+endef
+
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_FIXUP_EXTRACT
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
