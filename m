From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:12 +0100
Subject: [Buildroot] [PATCH v4 17/22] toolchain-external-codesourcery-amd64:
	new package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-18-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the AMD-64 architecture.

The legacy implementation is removed.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 32 ++++------------------
 .../Config.in                                      | 24 ++++++++++++++++
 .../Config.in.options                              |  9 ++++++
 .../toolchain-external-codesourcery-amd64.hash     |  3 ++
 .../toolchain-external-codesourcery-amd64.mk       | 12 ++++++++
 .../toolchain-external/toolchain-external.hash     |  3 --
 toolchain/toolchain-external/toolchain-external.mk |  3 --
 7 files changed, 54 insertions(+), 32 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8e06b05..2689c91 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -36,6 +36,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Conf
 # SH4a
 source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in"
 
+# x86/x86_64 (use amd64 toolchain by default for AMD64)
+source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in"
+
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
@@ -81,31 +84,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
-	bool "Sourcery CodeBench AMD64 2015.11"
-	depends on BR2_x86_64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_x86_jaguar || BR2_x86_steamroller
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	help
-	  Sourcery CodeBench toolchain for the amd64 (x86_64)
-	  architectures, from Mentor Graphics. It uses gcc 5.2,
-	  binutils 2.25.51, glibc 2.22, gdb 7.10.50 and kernel headers
-	  4.2. It has support for the following variants:
-	    - AMD Puma/Jaguar (family 16h), glibc
-	    Default for x86_64, nothing special to do.
-	    - AMD Steamroller (family 15h), glibc
-	    Select a steamroller core.
-	  No other architecture variants are supported since glibc
-	  is optimized for one of these two baselines.
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	bool "Sourcery CodeBench x86/x86_64 2012.09"
 	depends on BR2_i386 || BR2_x86_64
@@ -243,7 +221,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
-	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABI
 	default "arm-linux-musleabihf"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABIHF
 	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
@@ -309,6 +286,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Conf
 # SH4a
 source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options"
 
+# x86/x86_64
+source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options"
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
new file mode 100644
index 0000000..86486c8
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
@@ -0,0 +1,24 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
+	bool "Sourcery CodeBench AMD64 2015.11"
+	depends on BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_x86_jaguar || BR2_x86_steamroller
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	help
+	  Sourcery CodeBench toolchain for the amd64 (x86_64)
+	  architectures, from Mentor Graphics. It uses gcc 5.2,
+	  binutils 2.25.51, glibc 2.22, gdb 7.10.50 and kernel headers
+	  4.2. It has support for the following variants:
+	    - AMD Puma/Jaguar (family 16h), glibc
+	    Default for x86_64, nothing special to do.
+	    - AMD Steamroller (family 15h), glibc
+	    Select a steamroller core.
+	  No other architecture variants are supported since glibc
+	  is optimized for one of these two baselines.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
new file mode 100644
index 0000000..2ab2302
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "x86_64-amd-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-amd64"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
new file mode 100644
index 0000000..ea5f300
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 3c31206c8b9277f409ee00e4777ba82dfa6da2a4ca0926501cd5fb6bbd1b407e  amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 0b673f5035f97d5d03c31272cddab0f117d39ad76a5ad2a3bc98c156571527de  amd-2015.11-139-x86_64-amd-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
new file mode 100644
index 0000000..4b8e31c
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# toolchain-external-codesourcery-amd64
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION = 2015.11-139
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_SOURCE = amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_ACTUAL_SOURCE_TARBALL = amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 18b3e1a..b873abe 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -5,9 +5,6 @@
 # x86
 sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-2012.09-62-i686-pc-linux-gnu.src.tar.bz2
-# AMD64
-sha256 3c31206c8b9277f409ee00e4777ba82dfa6da2a4ca0926501cd5fb6bbd1b407e  amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 0b673f5035f97d5d03c31272cddab0f117d39ad76a5ad2a3bc98c156571527de  amd-2015.11-139-x86_64-amd-linux-gnu.src.tar.bz2
 
 # ARM toolchains from Texas Instrument's Arago project
 # There is one source file that covers both binary distributions.
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 9aabab6..3cb9024 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -59,9 +59,6 @@ TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_VERSION = 1.1.12
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
-- 
2.10.2
