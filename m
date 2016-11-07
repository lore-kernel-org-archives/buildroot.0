From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:02 +0100
Subject: [Buildroot] [PATCH v4 07/22] toolchain-external-linaro-arm: new
	package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-8-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Linaro external toolchain for the
ARM architecture.

The legacy implementation is removed.

The comment about availability is duplicated for arm and armeb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 32 +++++-----------------
 .../toolchain-external-linaro-arm/Config.in        | 27 ++++++++++++++++++
 .../Config.in.options                              |  9 ++++++
 .../toolchain-external-linaro-arm.hash             |  3 ++
 .../toolchain-external-linaro-arm.mk               | 16 +++++++++++
 .../toolchain-external/toolchain-external.hash     |  2 --
 toolchain/toolchain-external/toolchain-external.mk |  7 -----
 7 files changed, 62 insertions(+), 34 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ecf9618..bffb9fd 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -15,34 +15,14 @@ comment "glibc toolchains only available with shared lib support"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
 
+# ARM (use Linaro toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
+
 comment "Linaro toolchains available for Cortex-A + EABIhf"
-	depends on BR2_arm || BR2_armeb
+	depends on BR2_armeb
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2016.05"
-	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2016.05 (based on gcc 5.3.1), Linaro GDB 2016.05 (based on
-	  GDB 7.11.1), glibc 2.21, Binutils 2016.05 (based on 2.25). It
-	  generates code that runs on all Cortex-A profile devices,
-	  but tuned for the Cortex-A9. The code generated is Thumb 2,
-	  with the hard floating point calling convention, and uses
-	  the VFPv3-D16 FPU instructions.
-
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2016.05"
 	depends on BR2_armeb
@@ -596,7 +576,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
 	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arcle
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
@@ -654,6 +633,9 @@ config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options"
 
+# ARM
+source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
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
index 0000000..dcbc659
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "arm-linux-gnueabihf"
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
index 0000000..64918ca
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# toolchain-external-linaro-arm
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2016.05
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
+
+ifeq ($(HOSTARCH),x86)
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
+else
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
+endif
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 666cd02..945bf21 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -32,8 +32,6 @@ sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2
 sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
 
 # ARM toolchains from Linaro
-sha256 f1421c580ce977226f4fefc9c409b3b423260cc65a6e9dc6da88bb3478a521a0  gcc-linaro-5.3.1-2016.05-i686_arm-linux-gnueabihf.tar.xz
-sha256 987941c9fffdf56ffcbe90e8984673c16648c477b537fcf43add22fa62f161cd  gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz
 sha256 f6e9c0d3320760fe8f89e9ec3acdd7b4da7eff889c094b4a2acc286fd46f334f  gcc-linaro-5.3.1-2016.05-i686_armeb-linux-gnueabihf.tar.xz
 sha256 6cf41c8944be56279cc14992aa075174b7a4c5938502536266eaaeef048f9440  gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2571539..410ff18 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -101,13 +101,6 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(@D)/arago-2011.09/
 endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/arm-linux-gnueabihf
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-i686_arm-linux-gnueabihf.tar.xz
-else
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz
-endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/armeb-linux-gnueabihf
 ifeq ($(HOSTARCH),x86)
-- 
2.10.2
