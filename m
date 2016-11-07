From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:07 +0100
Subject: [Buildroot] [PATCH v4 12/22] toolchain-external-codesourcery-mips:
	new package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-13-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the MIPS architecture.

The legacy implementation is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 101 ++-------------------
 .../toolchain-external-codesourcery-mips/Config.in |  93 +++++++++++++++++++
 .../Config.in.options                              |   9 ++
 .../toolchain-external-codesourcery-mips.hash      |   3 +
 .../toolchain-external-codesourcery-mips.mk        |  13 +++
 .../toolchain-external/toolchain-external.hash     |   3 -
 toolchain/toolchain-external/toolchain-external.mk |   3 -
 7 files changed, 124 insertions(+), 101 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f8e04f5..1f49975 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -25,6 +25,9 @@ source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
 # Blackfin
 source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in"
 
+# MIPS (use codesourcery toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
+
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
@@ -70,100 +73,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
-	bool "Sourcery CodeBench MIPS 2016.05"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64R2
-	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_MIPS_NABI32
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	help
-	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 5.3, binutils 2.25.51, glibc
-	  2.23, uClibc 0.9.30 and gdb 7.10.50, kernel headers 4.4.1. It
-	  has support for the following variants:
-	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Big-Endian, O32
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32r2 - Big-Endian, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Little-Endian, O32
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32r2 - Little-Endian, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32, microMIPS
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
-	    - MIPS32r2 - uClibc, Big-Endian, 2008 NaN, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Big-Endian, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Big-Endian, Soft-Float, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, 2008 NaN, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, Soft-Float, O32
-	      Not usable in Buildroot yet.
-	    - MIPS64r2 - Big-Endian, N64
-	      Select MIPS64 (big endian) core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64r2 - Big-Endian, Soft-Float, N64
-	      Select MIPS64 (big endian) core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-	    - MIPS64r2 - Little-Endian, N64
-	      Select MIPS64 (little endian) core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64r2 - Little-Endian, Soft-Float, N64
-	      Select MIPS64 (little endian) core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-
-comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
-	depends on BR2_MIPS_NABI32
-	depends on !BR2_STATIC_LIBS
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	bool "Codescape IMG GNU Linux Toolchain 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -506,7 +415,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
@@ -567,6 +475,9 @@ source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.o
 # Blackfin
 source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options"
 
+# MIPS
+source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
new file mode 100644
index 0000000..6a13ae6
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
@@ -0,0 +1,93 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
+	bool "Sourcery CodeBench MIPS 2016.05"
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64R2
+	# Unsupported MIPS cores
+	depends on !BR2_mips_interaptiv
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_MIPS_NABI32
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	help
+	  Sourcery CodeBench toolchain for the MIPS architecture, from
+	  Mentor Graphics. It uses gcc 5.3, binutils 2.25.51, glibc
+	  2.23, uClibc 0.9.30 and gdb 7.10.50, kernel headers 4.4.1. It
+	  has support for the following variants:
+	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
+	      Select MIPS (big endian) core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
+	    - MIPS32r2 - Big-Endian, O32
+	      Select MIPS (big endian) core
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS32r2 - Big-Endian, O32, MIPS16
+	      Select MIPS (big endian) core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32r2 - Big-Endian, Soft-Float, O32
+	      Select MIPS (big endian) core
+	      Select BR2_SOFT_FLOAT
+	    - MIPS32r2 - Big-Endian, Soft-Float, O32, MIPS16
+	      Select MIPS (big endian) core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
+	      Select MIPS (little endian) core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
+	    - MIPS32r2 - Little-Endian, O32
+	      Select MIPS (little endian) core
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS32r2 - Little-Endian, O32, MIPS16
+	      Select MIPS (little endian) core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32
+	      Select MIPS (little endian) core
+	      Select BR2_SOFT_FLOAT
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32, MIPS16
+	      Select MIPS (little endian) core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32, microMIPS
+	      Select MIPS (little endian) core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
+	    - MIPS32r2 - uClibc, Big-Endian, 2008 NaN, O32
+	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Big-Endian, O32
+	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Big-Endian, Soft-Float, O32
+	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Little-Endian, 2008 NaN, O32
+	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Little-Endian, O32
+	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Little-Endian, Soft-Float, O32
+	      Not usable in Buildroot yet.
+	    - MIPS64r2 - Big-Endian, N64
+	      Select MIPS64 (big endian) core
+	      Select the n64 ABI
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS64r2 - Big-Endian, Soft-Float, N64
+	      Select MIPS64 (big endian) core
+	      Select the n64 ABI
+	      Select BR2_SOFT_FLOAT
+	    - MIPS64r2 - Little-Endian, N64
+	      Select MIPS64 (little endian) core
+	      Select the n64 ABI
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS64r2 - Little-Endian, Soft-Float, N64
+	      Select MIPS64 (little endian) core
+	      Select the n64 ABI
+	      Select BR2_SOFT_FLOAT
+
+comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
+	depends on BR2_MIPS_NABI32
+	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
new file mode 100644
index 0000000..677cc67
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "mips-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-mips"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
new file mode 100644
index 0000000..2d80338
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 d354447c4c5160439dafd5464fa3a0266dd41e79f973477238e4f0215a6b5397  mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 2658e55d5b71bba25d6f77e868e18b200ea5f75c8add7ed3a9266e716d9adfff  mips-2016.05-8-mips-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
new file mode 100644
index 0000000..5117d47
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# toolchain-external-codesourcery-mips
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION = 2016.05-8
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_SOURCE = mips-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_ACTUAL_SOURCE_TARBALL = mips-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 16c2e19..1a0ff72 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -14,9 +14,6 @@ sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-20
 # AMD64
 sha256 3c31206c8b9277f409ee00e4777ba82dfa6da2a4ca0926501cd5fb6bbd1b407e  amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 0b673f5035f97d5d03c31272cddab0f117d39ad76a5ad2a3bc98c156571527de  amd-2015.11-139-x86_64-amd-linux-gnu.src.tar.bz2
-# MIPS
-sha256 d354447c4c5160439dafd5464fa3a0266dd41e79f973477238e4f0215a6b5397  mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 2658e55d5b71bba25d6f77e868e18b200ea5f75c8add7ed3a9266e716d9adfff  mips-2016.05-8-mips-linux-gnu.src.tar.bz2
 
 # ARM toolchains from Texas Instrument's Arago project
 # There is one source file that covers both binary distributions.
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 4b21b4f..e7bc754 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -88,9 +88,6 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(@D)/arago-2011.09/
 endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.10.2
