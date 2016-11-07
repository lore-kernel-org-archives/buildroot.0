From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:05 +0100
Subject: [Buildroot] [PATCH v4 10/22] toolchain-external-linaro-armeb: new
	package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-11-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Linaro external toolchain for the
ARM Big-endian architecture.

The legacy implementation is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 32 ++++------------------
 .../toolchain-external-linaro-armeb/Config.in      | 26 ++++++++++++++++++
 .../Config.in.options                              |  9 ++++++
 .../toolchain-external-linaro-armeb.hash           |  3 ++
 .../toolchain-external-linaro-armeb.mk             | 16 +++++++++++
 .../toolchain-external/toolchain-external.hash     |  4 ---
 toolchain/toolchain-external/toolchain-external.mk |  7 -----
 7 files changed, 59 insertions(+), 38 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index dfc8e70..a19e41a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -19,32 +19,8 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Con
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in"
 
-comment "Linaro toolchains available for Cortex-A + EABIhf"
-	depends on BR2_armeb
-	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
-
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2016.05"
-	depends on BR2_armeb
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
-	help
-	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2016.05 (based on gcc 5.3.1), Linaro GDB
-	  2016.05 (based on GDB 7.11.1), glibc 2.21, Binutils 2016.05
-	  (based on 2.25). It generates code that runs on all Cortex-A
-	  profile devices, but tuned for the Cortex-A9. The code
-	  generated is Thumb 2, with the hard floating point calling
-	  convention, and uses the VFPv3-D16 FPU instructions.
+# ARM big-endian
+source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
 
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
@@ -543,7 +519,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
 	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arcle
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
-	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
@@ -603,6 +578,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Con
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options"
 
+# ARM big-endian
+source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
new file mode 100644
index 0000000..ed84c47
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -0,0 +1,26 @@
+comment "Linaro toolchains available for Cortex-A + EABIhf"
+	depends on BR2_armeb
+	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
+	bool "Linaro armeb 2016.05"
+	depends on BR2_armeb
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
+	help
+	  Linaro toolchain for the ARM big endian architecture. It
+	  uses Linaro GCC 2016.05 (based on gcc 5.3.1), Linaro GDB
+	  2016.05 (based on GDB 7.11.1), glibc 2.21, Binutils 2016.05
+	  (based on 2.25). It generates code that runs on all Cortex-A
+	  profile devices, but tuned for the Cortex-A9. The code
+	  generated is Thumb 2, with the hard floating point calling
+	  convention, and uses the VFPv3-D16 FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
new file mode 100644
index 0000000..225e90f
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "armeb-linux-gnueabihf"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-linaro-armeb"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
new file mode 100644
index 0000000..7952b50
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 f6e9c0d3320760fe8f89e9ec3acdd7b4da7eff889c094b4a2acc286fd46f334f  gcc-linaro-5.3.1-2016.05-i686_armeb-linux-gnueabihf.tar.xz
+sha256 6cf41c8944be56279cc14992aa075174b7a4c5938502536266eaaeef048f9440  gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
new file mode 100644
index 0000000..cf2f3ad
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# toolchain-external-linaro-armeb
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2016.05
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
+
+ifeq ($(HOSTARCH),x86)
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
+else
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
+endif
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index d2cf44b..3740ca4 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -28,10 +28,6 @@ sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2
 sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
 
-# ARM toolchains from Linaro
-sha256 f6e9c0d3320760fe8f89e9ec3acdd7b4da7eff889c094b4a2acc286fd46f334f  gcc-linaro-5.3.1-2016.05-i686_armeb-linux-gnueabihf.tar.xz
-sha256 6cf41c8944be56279cc14992aa075174b7a4c5938502536266eaaeef048f9440  gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
-
 # Codescape toolchains from Imagination Technologies
 # From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
 sha256 e3c1f292ac6a9f12480af431c85a7ed9dfa011a52fd62a50be3363ec6b9bc872  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index f8d22b4..7dfcac3 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -98,13 +98,6 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(@D)/arago-2011.09/
 endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/armeb-linux-gnueabihf
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-i686_armeb-linux-gnueabihf.tar.xz
-else
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
-endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.10.2
