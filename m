From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Oct 2015 14:48:59 +0200
Subject: [Buildroot] [PATCH 7/9 v2] toolchain/external: add MIPS Codescape
	MTI GNU Linux toolchain
In-Reply-To: <cover.1445690712.git.yann.morin.1998@free.fr>
References: <cover.1445690712.git.yann.morin.1998@free.fr>
Message-ID: <f4b3104c312b5008ce17041ff77310768ba3cf4c.1445690712.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

- Add support for MIPS Codescape MTI GNU Linux toolchain
- Add a hash value
- Add logic to 'toolchain/helpers.mk' to allow the SYSROOT_DIR and
  ARCH_SYSROOT_DIR sit side by side instead of nested.
- Add logic for creating the side-by-side symlink as a post install
  hook.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[yann.morin.1998 at free.fr: no need to specify TOOLCHAIN_EXTERNAL_BIN
 now that we use the generic extract commands; tweak commit log title]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                               | 12 ++++-
 toolchain/toolchain-external/Config.in             | 52 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  4 ++
 toolchain/toolchain-external/toolchain-external.mk | 17 +++++++
 4 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1452ec6..af3654f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -114,6 +114,13 @@ copy_toolchain_lib_root = \
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
@@ -142,7 +149,10 @@ copy_toolchain_sysroot = \
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
index 2609e41..481b77c 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -190,6 +190,57 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 
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
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	help
+	  Codescape MTI GNU Linux Toolchain 2015.06 for the MIPS
+	  architecture, from Imagination Technologies. It uses gcc
+	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
+	  headers 4.0. It has support for the following variants:
+	    - MIPS32r2 - Big-Endian, o32
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	    - MIPS32r2 - Little-Endian, o32
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	    - MIPS32r2 - Big-Endian, 2008 NaN, o32
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
+	    - MIPS32r2 - Little-Endian, 2008 NaN, o32
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
+	    - MIPS32r2 - Little-Endian, o32, microMIPS
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
+	    - MIPS64r2 - Big-Endian, n32
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n32' Target ABI
+	    - MIPS64r2 - Little-Endian, n32
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n32' Target ABI
+	    - MIPS64r2 - Big-Endian, n64
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n64' Target ABI
+	    - MIPS64r2 - Little-Endian, n64
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n64' Target ABI
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 	bool "Sourcery CodeBench MIPS 2015.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -934,6 +985,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
+	default "mips-mti-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 8424dca..40bc1e1 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -53,6 +53,10 @@ sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-lin
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 
+# Codescape toolchains from Imagination Technologies
+# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05/
+sha256 f2d12dde626b750987d37ba6c73c6e11839850add94b0d4e4cf77917c1b0944f  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+
 # Synopsys DesignWare ARC toolchains
 sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
 sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 0ba2fd2..4ad726d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -296,6 +296,18 @@ define TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
 		$(TAR) --strip-components=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
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
@@ -329,6 +341,11 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
+TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.9.1
