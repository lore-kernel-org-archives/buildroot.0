From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:08:52 +0200
Subject: [Buildroot] [PATCH v2 07/23] toolchain-external-arago-armv5te: new
	package
In-Reply-To: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477742948-11490-8-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new package for the Arago external toolchain for
the ARM architecture. As of this commit, the code is currently not
used, but it will be used as soon as the external toolchain
infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arago-armv5te/Config.in     | 19 ++++++++++++++++++
 .../Config.in.options                              |  6 ++++++
 .../toolchain-external-arago-armv5te.hash          |  3 +++
 .../toolchain-external-arago-armv5te.mk            | 23 ++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv5te/toolchain-external-arago-armv5te.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv5te/toolchain-external-arago-armv5te.mk

diff --git a/toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in b/toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in
new file mode 100644
index 0000000..2c821a4
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in
@@ -0,0 +1,19 @@
+config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
+	bool "Arago ARMv5 2011.09"
+	depends on BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_ARM_CPU_ARMV4
+	depends on BR2_ARM_EABI
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	# kernel headers: 2.6.31
+	help
+	  Texas Instruments Arago ARMv5 2011.09 toolchain, with gcc
+	  4.5.3, binutils 2.20.1, glibc 2.12, gdb 7.2.
+
+	  This toolchain uses software-floating point.
diff --git a/toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in.options b/toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in.options
new file mode 100644
index 0000000..dd08ee0
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-arago-armv5te"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-arago-armv5te/toolchain-external-arago-armv5te.hash b/toolchain/toolchain-external/toolchain-external-arago-armv5te/toolchain-external-arago-armv5te.hash
new file mode 100644
index 0000000..dd70004
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arago-armv5te/toolchain-external-arago-armv5te.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
+sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-arago-armv5te/toolchain-external-arago-armv5te.mk b/toolchain/toolchain-external/toolchain-external-arago-armv5te/toolchain-external-arago-armv5te.mk
new file mode 100644
index 0000000..f06728e
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-arago-armv5te/toolchain-external-arago-armv5te.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# toolchain-external-arago-armv5te
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_VERSION = 2011.09
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_PREFIX = arm-arago-linux-gnueabi
+
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_SOURCE = \
+	arago-$(TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_VERSION)-armv5te-linux-gnueabi-sdk.tar.bz2
+
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_ACTUAL_SOURCE_TARBALL = arago-toolchain-$(TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_VERSION)-sources.tar.bz2
+
+define TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_FIXUP_EXTRACT
+	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
+	rm -rf $(@D)/arago-2011.09/
+endef
+
+TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_FIXUP_EXTRACT
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
