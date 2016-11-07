From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:08 +0100
Subject: [Buildroot] [PATCH v4 13/22] toolchain-external-codescape-img-mips:
	new package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-14-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Codescape IMG external toolchain
for the MIPS architecture.

The legacy implementation is removed.

The Codescape hacks for IMG and MTI are duplicated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 66 +---------------------
 .../Config.in                                      | 62 ++++++++++++++++++++
 .../Config.in.options                              |  9 +++
 .../toolchain-external-codescape-img-mips.hash     |  3 +
 .../toolchain-external-codescape-img-mips.mk       | 47 +++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  1 -
 toolchain/toolchain-external/toolchain-external.mk |  8 +--
 7 files changed, 124 insertions(+), 72 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 1f49975..c76941a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -27,6 +27,7 @@ source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.
 
 # MIPS (use codesourcery toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
+source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in"
 
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
@@ -73,69 +74,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
-	bool "Codescape IMG GNU Linux Toolchain 2016.05"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Codescape IMG GNU Linux Toolchain 2015.10 for the MIPS
-	  architecture, from Imagination Technologies. It uses gcc
-	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
-	  headers 4.0. It has support for the following variants:
-	    - MIPS32r6 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Disable 'Use soft-float'
-	    - MIPS32r6 - Big-Endian, Soft-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Enable 'Use soft-float'
-	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Disable 'Use soft-float'
-	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Enable 'Use soft-float'
-	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI, microMIPS
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Disable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI, microMIPS
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Enable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n32 ABI
-	      Select 'MIPS64 (big endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n32' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n32 ABI
-	      Select 'MIPS64 (little endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n32' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n64 ABI
-	      Select 'MIPS64 (big endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n64' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n64 ABI
-	      Select 'MIPS64 (little endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n64' Target ABI
-	      Disable 'Use soft-float'
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	bool "Codescape MTI GNU Linux Toolchain 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -421,7 +359,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABI
 	default "arm-linux-musleabihf"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABIHF
-	default "mips-img-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	default "mips-mti-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
 	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_i386
@@ -477,6 +414,7 @@ source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.
 
 # MIPS
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
+source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options"
 
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
new file mode 100644
index 0000000..1f0d4d1
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -0,0 +1,62 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
+	bool "Codescape IMG GNU Linux Toolchain 2016.05"
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Codescape IMG GNU Linux Toolchain 2015.10 for the MIPS
+	  architecture, from Imagination Technologies. It uses gcc
+	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
+	  headers 4.0. It has support for the following variants:
+	    - MIPS32r6 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Disable 'Use soft-float'
+	    - MIPS32r6 - Big-Endian, Soft-Float, 2008 NaN, o32 ABI
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Enable 'Use soft-float'
+	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Disable 'Use soft-float'
+	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Enable 'Use soft-float'
+	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI, microMIPS
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Disable 'Use soft-float'
+	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
+	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI, microMIPS
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Enable 'Use soft-float'
+	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
+	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n32 ABI
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r6' Target Architecture Variant
+	      Select 'n32' Target ABI
+	      Disable 'Use soft-float'
+	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n32 ABI
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r6' Target Architecture Variant
+	      Select 'n32' Target ABI
+	      Disable 'Use soft-float'
+	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n64 ABI
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r6' Target Architecture Variant
+	      Select 'n64' Target ABI
+	      Disable 'Use soft-float'
+	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n64 ABI
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r6' Target Architecture Variant
+	      Select 'n64' Target ABI
+	      Disable 'Use soft-float'
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
new file mode 100644
index 0000000..3eaa2a9
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "mips-img-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codescape-img-mips"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
new file mode 100644
index 0000000..e4ae9e1
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
@@ -0,0 +1,3 @@
+# Codescape toolchains from Imagination Technologies
+# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
+sha256 e3c1f292ac6a9f12480af431c85a7ed9dfa011a52fd62a50be3363ec6b9bc872  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
new file mode 100644
index 0000000..b4decfb
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# toolchain-external-codescape-img-mips
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2016.05-03
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION)
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STRIP_COMPONENTS = 2
+
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+
+# Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
+# sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
+# -> sbin-<abi> so that the rest of Buildroot can find the toolchain
+# tools in the appropriate location.
+ifeq ($(BR2_MIPS_OABI32),y)
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX = o32
+else ifeq ($(BR2_MIPS_NABI32),y)
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX = n32
+else ifeq ($(BR2_MIPS_NABI64),y)
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX = n64
+endif
+
+define TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STAGING_FIXUPS
+	rmdir $(STAGING_DIR)/usr/bin $(STAGING_DIR)/usr/sbin
+	ln -sf bin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/bin
+	ln -sf sbin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/sbin
+endef
+
+# The Codescape toolchain uses a sysroot layout that places them
+# side-by-side instead of nested like multilibs. A symlink is needed
+# much like for the nested sysroots which are handled in
+# copy_toolchain_sysroot but there is not enough information in there
+# to determine whether the sysroot layout was nested or side-by-side.
+# Add the symlink here for now.
+define TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SYMLINK
+	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))"; \
+	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
+	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
+endef
+
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_POST_INSTALL_STAGING_HOOKS += \
+	TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STAGING_FIXUPS \
+	TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SYMLINK
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 1a0ff72..962263c 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -23,7 +23,6 @@ sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-t
 
 # Codescape toolchains from Imagination Technologies
 # From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
-sha256 e3c1f292ac6a9f12480af431c85a7ed9dfa011a52fd62a50be3363ec6b9bc872  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
 sha256 10b8ab6d7c492abc19ecabafedc6bc5f12ff88107a3cb76dc452b3a9522d9c56  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
 
 # Synopsys DesignWare ARC toolchains
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index e7bc754..2acf9dd 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -54,7 +54,7 @@ endef
 # sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
 # -> sbin-<abi> so that the rest of Buildroot can find the toolchain
 # tools in the appropriate location.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
 ifeq ($(BR2_MIPS_OABI32),y)
 TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX = o32
 else ifeq ($(BR2_MIPS_NABI32),y)
@@ -100,12 +100,6 @@ TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
-TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
 TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03
 TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
-- 
2.10.2
