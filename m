From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:09:06 +0200
Subject: [Buildroot] [PATCH v2 21/23] toolchain-external-codescape-img-mips:
	new package
In-Reply-To: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477742948-11490-22-git-send-email-romain.naour@gmail.com>
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
 .../Config.in                                      | 62 ++++++++++++++++++++++
 .../Config.in.options                              |  6 +++
 .../toolchain-external-codescape-img-mips.hash     |  3 ++
 .../toolchain-external-codescape-img-mips.mk       | 48 +++++++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk

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
index 0000000..8c534a5
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
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
index 0000000..e8d815b
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
@@ -0,0 +1,48 @@
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
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_PREFIX = mips-img-linux-gnu
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
+	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_CC) $(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_CFLAGS))"; \
+	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
+	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
+endef
+
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_POST_INSTALL_STAGING_HOOKS += \
+	TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STAGING_FIXUPS \
+	TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SYMLINK
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
