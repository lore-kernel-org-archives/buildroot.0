From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:09:00 +0200
Subject: [Buildroot] [PATCH v2 15/23] toolchain-external-codesourcery-mips:
	new package
In-Reply-To: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477742948-11490-16-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the MIPS architecture. As of this commit, the code is
currently not used, but it will be used as soon as the external
toolchain infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-mips/Config.in | 93 ++++++++++++++++++++++
 .../Config.in.options                              |  6 ++
 .../toolchain-external-codesourcery-mips.hash      |  3 +
 .../toolchain-external-codesourcery-mips.mk        | 14 ++++
 4 files changed, 116 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk

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
index 0000000..7381a07
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
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
index 0000000..868b0d4
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# toolchain-external-codesourcery-mips
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION = 2016.05-8
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_SOURCE = mips-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_PREFIX)-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_ACTUAL_SOURCE_TARBALL = mips-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_PREFIX).src.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_PREFIX = mips-linux-gnu
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
