From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Oct 2016 22:48:23 +0200
Subject: [Buildroot] [PATCH 22/30] toolchain-external-codescape-mti-mips:
	new package
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477255711-28603-23-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new package for the Codescape external toolchain for
the MIPS architecture. As of this commit, the code is currently not
used, but it will be used as soon as the external toolchain
infrastructure gets introduced in a future commit.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../Config.in                                      | 73 ++++++++++++++++++++++
 .../Config.in.options                              |  6 ++
 .../toolchain-external-codescape-mti-mips.hash     |  3 +
 .../toolchain-external-codescape-mti-mips.mk       | 48 ++++++++++++++
 4 files changed, 130 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
new file mode 100644
index 0000000..f899467
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -0,0 +1,73 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
+	bool "Codescape MTI GNU Linux Toolchain 2016.05"
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT) || \
+		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Codescape MTI GNU Linux Toolchain 2015.10 for the MIPS
+	  architecture, from Imagination Technologies. It uses gcc
+	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
+	  headers 4.0. It has support for the following variants:
+	    - MIPS32r2 - Big-Endian, Hard-Float, Legacy NaN, o32 ABI
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Disable 'Use soft-float'
+	    - MIPS32r2 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Disable 'Use soft-float'
+	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
+	    - MIPS32r2 - Big-Endian, Soft-Float, Legacy NaN, o32 ABI
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Enable 'Use soft-float'
+	    - MIPS32r2 - Little-Endian, Hard-Float, Legacy NaN, o32 ABI
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Disable 'Use soft-float'
+	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Disable 'Use soft-float'
+	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
+	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Enable 'Use soft-float'
+	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI, microMIPS
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Enable 'Use soft-float'
+	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
+	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI, microMIPS
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Disable 'Use soft-float'
+	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
+	    - MIPS64r2 - Big-Endian, Hard-Float, Legacy NaN, n32 ABI
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n32' Target ABI
+	      Disable 'Use soft-float'
+	    - MIPS64r2 - Little-Endian, Hard-Float, Legacy NaN, n32 ABI
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n32' Target ABI
+	      Disable 'Use soft-float'
+	    - MIPS64r2 - Big-Endian, Hard-Float, Legacy NaN, n64 ABI
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n64' Target ABI
+	      Disable 'Use soft-float'
+	    - MIPS64r2 - Little-Endian, Hard-Float, Legacy NaN, n64 ABI
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n64' Target ABI
+	      Disable 'Use soft-float'
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
new file mode 100644
index 0000000..c6a3c4b
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codescape-mti-mips"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
new file mode 100644
index 0000000..0d785f2
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
@@ -0,0 +1,3 @@
+# Codescape toolchains from Imagination Technologies
+# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
+sha256 10b8ab6d7c492abc19ecabafedc6bc5f12ff88107a3cb76dc452b3a9522d9c56  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
new file mode 100644
index 0000000..b605881
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# toolchain-external-codescape-mti-mips
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION = 2016.05-03
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION)
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STRIP_COMPONENTS = 2
+
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_PREFIX = mips-mti-linux-gnu
+
+# Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
+# sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
+# -> sbin-<abi> so that the rest of Buildroot can find the toolchain
+# tools in the appropriate location.
+ifeq ($(BR2_MIPS_OABI32),y)
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX = o32
+else ifeq ($(BR2_MIPS_NABI32),y)
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX = n32
+else ifeq ($(BR2_MIPS_NABI64),y)
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX = n64
+endif
+
+define TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STAGING_FIXUPS
+	rmdir $(STAGING_DIR)/usr/bin $(STAGING_DIR)/usr/sbin
+	ln -sf bin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/bin
+	ln -sf sbin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/sbin
+endef
+
+# The Codescape toolchain uses a sysroot layout that places them
+# side-by-side instead of nested like multilibs. A symlink is needed
+# much like for the nested sysroots which are handled in
+# copy_toolchain_sysroot but there is not enough information in there
+# to determine whether the sysroot layout was nested or side-by-side.
+# Add the symlink here for now.
+define TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SYMLINK
+	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_CC) $(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_CFLAGS))"; \
+	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
+	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
+endef
+
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_POST_INSTALL_STAGING_HOOKS += \
+	TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STAGING_FIXUPS \
+	TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SYMLINK
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
