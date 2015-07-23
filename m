From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 23 Jul 2015 20:19:44 +0200
Subject: [Buildroot] [PATCH v2] Add support for MIPS Codescape MTI GNU Linux
	toolchain
Message-ID: <1437675584-3604-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add support for MIPS Codescape MTI GNU Linux toolchain
- Add a hash value
- Add logic to 'toolchain/helpers.mk' to allow the SYSROOT_DIR and
  ARCH_SYSROOT_DIR sit side by side instead of nested.
- Add logic for creating the side-by-side symlink as a post install
  hook.
- Add logic to allow Buildroot finding the toolchain binaries under
  $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-03/bin.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
v1 -> v2: changes made according Yann E. Morin's review. Please see:
  http://patchwork.ozlabs.org/patch/499460/

 toolchain/helpers.mk                               | 12 ++++-
 toolchain/toolchain-external/Config.in             | 51 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  6 +++
 toolchain/toolchain-external/toolchain-external.mk | 18 ++++++++
 4 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 895f3f1..71d2ec9 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -116,6 +116,13 @@ copy_toolchain_lib_root = \
 #    non-default architecture variant is used. Without this, the
 #    compiler fails to find libraries and headers.
 #
+#  * Note: this guesses that the ARCH_SYSROOT_DIR is nested into
+#    the SYSROOT_DIR, but that's not true for all toolchains (i.e.
+#    Codescape toolchains), so a post-install-staging hook will be
+#    needed to create the symlink when the sysroot dirs are not nested
+#    because there is not enough information here to determine whether
+#    the sysroot layout is nested or side-by-side.
+#
 # Some toolchains (i.e Linaro binary toolchains) store support
 # libraries (libstdc++, libgcc_s) outside of the sysroot, so we simply
 # copy all the libraries from the "support lib directory" into our
@@ -144,7 +151,10 @@ copy_toolchain_sysroot = \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
-	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
+	SYSROOT_DIR_CANON=`readlink -f $${SYSROOT_DIR}` ; \
+	ARCH_SYSROOT_DIR_CANON=`readlink -f $${ARCH_SYSROOT_DIR}` ; \
+	if [ $${SYSROOT_DIR_CANON} != $${ARCH_SYSROOT_DIR_CANON} \
+		-a $${ARCH_SYSROOT_DIR_CANON:0:$${\#SYSROOT_DIR_CANON}} == $${SYSROOT_DIR_CANON} ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
 			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
 		fi ; \
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e70989e..1fed720 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -188,6 +188,56 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 
 	  This toolchain uses software-floating point.
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506
+	bool "Codescape MTI GNU Linux Toolchain 2015.06"
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on BR2_mips_32r2 || BR2_mips_64r2
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	help
+	  Codescape MTI GNU Linux Toolchain 2015.06 for the MIPS
+	  architecture, from Imagination Technologies. It uses gcc
+	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
+	  headers 4.0. It has support for the following variants:
+	    - MIPS32r2 - Big-Endian, O32
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	    - MIPS32r2 - Little-Endian, O32
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
+	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
+	    - MIPS32r2 - Little-Endian, 2008 NaN, O32, microMIPS
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008 -mmicromips'
+	    - MIPS64r2 - Big-Endian, N32
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n32' Target ABI
+	    - MIPS64r2 - Little-Endian, N32
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n32' Target ABI
+	    - MIPS64r2 - Big-Endian, N64
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n64' Target ABI
+	    - MIPS64r2 - Little-Endian, N64
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n64' Target ABI
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 	bool "Sourcery CodeBench MIPS 2015.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -914,6 +964,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
+	default "mips-mti-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 3980c62..2361f0e 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -55,6 +55,12 @@ sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-lin
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 
+# Codescape toolchains from Imagination Technologies
+# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-03/
+md5 80e98c7425e4c9f7df255f5098bf7a10  Codescape.GNU.Tools.Package.2015.06-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+# Locally calculated
+sha256 c44857522fa80b99e6918cfe8ffa70100b78a124e97b0749e86c2b71a101e2fd  Codescape.GNU.Tools.Package.2015.06-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+
 # Synopsys DesignWare ARC toolchains
 sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
 sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 5ce4d33..f762dbc 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -144,6 +144,8 @@ endif
 else
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
+TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-03/bin
 else
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
 endif
@@ -253,6 +255,18 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
 endef
 
+# The Codescape toolchain uses a sysroot layout that places them
+# side-by-side instead of nested like multilibs. A symlink is needed
+# much like for the nested sysroots which are handled in
+# copy_toolchain_sysroot but there is not enough information in there
+# to determine whether the sysroot layout was nested or side-by-side.
+# Add the symlink here for now.
+define TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
+	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))"; \
+	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
+	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
+endef
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
@@ -284,6 +298,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
+TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-03
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.3.6
