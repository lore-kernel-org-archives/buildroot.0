From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:10 +0100
Subject: [Buildroot] [PATCH v4 15/22]
	toolchain-external-codesourcery-niosII: new package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-16-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the nios-II architecture.

The legacy implementation is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 25 ++++++----------------
 .../Config.in                                      | 17 +++++++++++++++
 .../Config.in.options                              |  9 ++++++++
 .../toolchain-external-codesourcery-niosII.hash    |  3 +++
 .../toolchain-external-codesourcery-niosII.mk      | 13 +++++++++++
 .../toolchain-external/toolchain-external.hash     |  3 ---
 toolchain/toolchain-external/toolchain-external.mk |  3 ---
 7 files changed, 48 insertions(+), 25 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d2e1d3b..e628279 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -30,6 +30,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config
 source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in"
 
+# NIOSII
+source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
+
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
@@ -75,24 +78,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	bool "Sourcery CodeBench Nios-II 2016.05"
-	depends on BR2_nios2
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.25.1
-	help
-	  Sourcery CodeBench toolchain for the Nios-II architecture,
-	  from Mentor Graphics. It uses gcc 5.3, binutils 2.25.51,
-	  glibc 2.23, gdb 7.10.50 and kernel headers 4.4.
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	bool "Sourcery CodeBench SH 2012.09"
 	depends on BR2_sh4a || BR2_sh4aeb
@@ -280,7 +265,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
@@ -343,6 +327,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config
 source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options"
 
+# NIOSII
+source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options"
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
new file mode 100644
index 0000000..54eed8c
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
@@ -0,0 +1,17 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
+	bool "Sourcery CodeBench Nios-II 2016.05"
+	depends on BR2_nios2
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.25.1
+	help
+	  Sourcery CodeBench toolchain for the Nios-II architecture,
+	  from Mentor Graphics. It uses gcc 5.3, binutils 2.25.51,
+	  glibc 2.23, gdb 7.10.50 and kernel headers 4.4.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
new file mode 100644
index 0000000..07cc5ed
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "nios2-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-niosII"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
new file mode 100644
index 0000000..a60c49f
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 750639290744adda931c81fa2cd2ffc2bde972488047824dcfaa53c42562191d  sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 3dc1c2685c0472059547dd7becb5dc991541b8176af39fa7aa5f601d38b9879a  sourceryg++-2016.05-10-nios2-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
new file mode 100644
index 0000000..3eb6679
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# toolchain-external-codesourcery-niosII
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2016.05-10
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SOURCE = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_ACTUAL_SOURCE_TARBALL = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 83859e7..5c98fe3 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -2,9 +2,6 @@
 # Next hashes are all locally computed
 
 # Mentor's Sourcery CodeBench Lite toolchains
-# NiosII
-sha256 750639290744adda931c81fa2cd2ffc2bde972488047824dcfaa53c42562191d  sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 3dc1c2685c0472059547dd7becb5dc991541b8176af39fa7aa5f601d38b9879a  sourceryg++-2016.05-10-nios2-linux-gnu.src.tar.bz2
 # SuperH
 sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 e2e58c10e52395d5d35157e35f85233f713c6f9223a652dfc56194cfd2eed004  renesas-2012.09-61-sh-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 31a53d2..fde0564 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -56,9 +56,6 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(@D)/arago-2011.09/
 endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.10.2
