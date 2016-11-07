From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:11 +0100
Subject: [Buildroot] [PATCH v4 16/22] toolchain-external-codesourcery-sh:
	new package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-17-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the SuperH 4a architecture.

The legacy implementation is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 33 ++++------------------
 .../toolchain-external-codesourcery-sh/Config.in   | 25 ++++++++++++++++
 .../Config.in.options                              |  9 ++++++
 .../toolchain-external-codesourcery-sh.hash        |  3 ++
 .../toolchain-external-codesourcery-sh.mk          | 13 +++++++++
 .../toolchain-external/toolchain-external.hash     |  3 --
 toolchain/toolchain-external/toolchain-external.mk |  3 --
 7 files changed, 56 insertions(+), 33 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e628279..8e06b05 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -33,6 +33,9 @@ source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Confi
 # NIOSII
 source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
 
+# SH4a
+source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in"
+
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
@@ -78,32 +81,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
-	bool "Sourcery CodeBench SH 2012.09"
-	depends on BR2_sh4a || BR2_sh4aeb
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-	help
-	  Sourcery CodeBench toolchain for the SuperH architecture,
-	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
-	  glibc 2.16, uClibc 0.9.30, gdb 7.4.50 and kernel headers
-	  3.5.4. It has support for the following variants:
-	    - SH4A, glibc, little endian
-	      Default.
-	    - SH4A, glibc, big endian
-	      Add -mb to BR2_TARGET_OPTIMIZATION
-	    - SH4A, uClibc, little endian
-	      Not usable in Buildroot yet.
-	    - SH4A, uClibc, big endian
-	      Not usable in Buildroot yet.
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	bool "Sourcery CodeBench AMD64 2015.11"
 	depends on BR2_x86_64
@@ -265,7 +242,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABI
@@ -330,6 +306,9 @@ source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Confi
 # NIOSII
 source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options"
 
+# SH4a
+source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options"
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
new file mode 100644
index 0000000..a47dab7
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
@@ -0,0 +1,25 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
+	bool "Sourcery CodeBench SH 2012.09"
+	depends on BR2_sh4a || BR2_sh4aeb
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	help
+	  Sourcery CodeBench toolchain for the SuperH architecture,
+	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
+	  glibc 2.16, uClibc 0.9.30, gdb 7.4.50 and kernel headers
+	  3.5.4. It has support for the following variants:
+	    - SH4A, glibc, little endian
+	      Default.
+	    - SH4A, glibc, big endian
+	      Add -mb to BR2_TARGET_OPTIMIZATION
+	    - SH4A, uClibc, little endian
+	      Not usable in Buildroot yet.
+	    - SH4A, uClibc, big endian
+	      Not usable in Buildroot yet.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
new file mode 100644
index 0000000..90061ce
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "sh-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-sh"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
new file mode 100644
index 0000000..ff2ba5f
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 e2e58c10e52395d5d35157e35f85233f713c6f9223a652dfc56194cfd2eed004  renesas-2012.09-61-sh-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
new file mode 100644
index 0000000..5370bb2
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# toolchain-external-sourcery-sh
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_VERSION = 2012.09-61
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_SOURCE = renesas-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_ACTUAL_SOURCE_TARBALL = renesas-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 5c98fe3..18b3e1a 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -2,9 +2,6 @@
 # Next hashes are all locally computed
 
 # Mentor's Sourcery CodeBench Lite toolchains
-# SuperH
-sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 e2e58c10e52395d5d35157e35f85233f713c6f9223a652dfc56194cfd2eed004  renesas-2012.09-61-sh-linux-gnu.src.tar.bz2
 # x86
 sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-2012.09-62-i686-pc-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index fde0564..9aabab6 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -56,9 +56,6 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(@D)/arago-2011.09/
 endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
-- 
2.10.2
