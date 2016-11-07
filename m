From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:13 +0100
Subject: [Buildroot] [PATCH v4 18/22] toolchain-external-codesourcery-x86:
	new package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-19-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the i386/x86_64 architecture.

The legacy implementation is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 33 ++--------------------
 .../toolchain-external-codesourcery-x86/Config.in  | 29 +++++++++++++++++++
 .../Config.in.options                              |  9 ++++++
 .../toolchain-external-codesourcery-x86.hash       |  3 ++
 .../toolchain-external-codesourcery-x86.mk         | 12 ++++++++
 .../toolchain-external/toolchain-external.hash     |  5 ----
 toolchain/toolchain-external/toolchain-external.mk |  3 --
 7 files changed, 55 insertions(+), 39 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2689c91..cddfca8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -38,6 +38,7 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.i
 
 # x86/x86_64 (use amd64 toolchain by default for AMD64)
 source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in"
+source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in"
 
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
@@ -84,36 +85,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
-	bool "Sourcery CodeBench x86/x86_64 2012.09"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_x86_jaguar
-	depends on !BR2_x86_steamroller
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-	help
-	  Sourcery CodeBench toolchain for the x86/x86_64
-	  architectures, from Mentor Graphics. It uses gcc 4.7.2,
-	  binutils 2.23.51, glibc 2.16, gdb 7.4.50 and kernel headers
-	  3.5.4. It has support for the following variants:
-	    - Intel Pentium 4, glibc, 32 bits
-	      Default for x86, nothing special to do.
-	    - Intel Atom, glibc, 32 bits
-	      Select an Atom core
-	    - Intel Xeon, glibc, 64 bits
-	      Default for x86_64, nothing special to do.
-	    - Intel Core 2, glibc, 64 bits
-	      Select a Core 2 core
-	  Other architecture variants (beyond Pentium-4/Xeon) are
-	  supported as well, but glibc is not optimised for it.
-
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "Musl 1.1.12 toolchain"
 	depends on (BR2_arm && BR2_ARM_EABI && BR2_USE_MMU) || \
@@ -220,7 +191,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABI
 	default "arm-linux-musleabihf"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABIHF
 	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
@@ -288,6 +258,7 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.i
 
 # x86/x86_64
 source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options"
+source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options"
 
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
new file mode 100644
index 0000000..bcbdd26
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
@@ -0,0 +1,29 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
+	bool "Sourcery CodeBench x86/x86_64 2012.09"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_x86_jaguar
+	depends on !BR2_x86_steamroller
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	help
+	  Sourcery CodeBench toolchain for the x86/x86_64
+	  architectures, from Mentor Graphics. It uses gcc 4.7.2,
+	  binutils 2.23.51, glibc 2.16, gdb 7.4.50 and kernel headers
+	  3.5.4. It has support for the following variants:
+	    - Intel Pentium 4, glibc, 32 bits
+	      Default for x86, nothing special to do.
+	    - Intel Atom, glibc, 32 bits
+	      Select an Atom core
+	    - Intel Xeon, glibc, 64 bits
+	      Default for x86_64, nothing special to do.
+	    - Intel Core 2, glibc, 64 bits
+	      Select a Core 2 core
+	  Other architecture variants (beyond Pentium-4/Xeon) are
+	  supported as well, but glibc is not optimised for it.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
new file mode 100644
index 0000000..65b62f3
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "i686-pc-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-x86"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
new file mode 100644
index 0000000..a003f7a
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
+sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-2012.09-62-i686-pc-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk
new file mode 100644
index 0000000..5ee6991
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# toolchain-external-codesourcery-x86
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_VERSION = 2012.09-62
+TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_SOURCE = ia32-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i386-linux.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_ACTUAL_SOURCE_TARBALL = ia32-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index b873abe..8926bf8 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -1,11 +1,6 @@
 ######################################
 # Next hashes are all locally computed
 
-# Mentor's Sourcery CodeBench Lite toolchains
-# x86
-sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
-sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-2012.09-62-i686-pc-linux-gnu.src.tar.bz2
-
 # ARM toolchains from Texas Instrument's Arago project
 # There is one source file that covers both binary distributions.
 sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3cb9024..7e4539e 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -56,9 +56,6 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(@D)/arago-2011.09/
 endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_VERSION = 1.1.12
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
-- 
2.10.2
