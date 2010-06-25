From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 26 Jun 2010 00:15:28 +0200
Subject: [Buildroot] [PATCH 1/5] toolchain: move helper functions from
	external toolchain
In-Reply-To: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1277504132-11184-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The helper functions used for external toolchains may also be useful
to alternate toolchain backends (currently, the external toolchain is
the sole user).

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 Makefile                                 |    1 +
 toolchain/external-toolchain/ext-tool.mk |  214 -----------------------------
 toolchain/helpers.mk                     |  217 ++++++++++++++++++++++++++++++
 3 files changed, 218 insertions(+), 214 deletions(-)
 create mode 100644 toolchain/helpers.mk

diff --git a/Makefile b/Makefile
index 09be31b..fe320df 100644
--- a/Makefile
+++ b/Makefile
@@ -306,6 +306,7 @@ include toolchain/mklibs/mklibs.mk
 include toolchain/sstrip/sstrip.mk
 include toolchain/uClibc/uclibc.mk
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+include toolchain/helpers.mk
 include toolchain/*/*.mk
 endif
 
diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 8daae15..c8e7892 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -35,220 +35,6 @@
 #  cross-compiler binaries remains external, all libraries and headers
 #  are imported into the Buildroot tree.
 
-#
-# Copy a toolchain library and its symbolic links from the sysroot
-# directory to the target directory. Also optionaly strips the
-# library.
-#
-# $1: arch specific sysroot directory
-# $2: library name
-# $3: destination directory
-# $4: strip (y|n), default is to strip
-#
-copy_toolchain_lib_root = \
-	ARCH_SYSROOT_DIR="$(strip $1)"; \
-	LIB="$(strip $2)"; \
-	STRIP="$(strip $4)"; \
- \
-	LIBS=`(cd $${ARCH_SYSROOT_DIR}; find . -path "./lib/$${LIB}.*" -o -path "./usr/lib/$${LIB}.*")` ; \
-	for FILE in $${LIBS} ; do \
-		LIB=`basename $${FILE}`; \
-		LIBDIR=`dirname $${FILE}` ; \
-		while test \! -z "$${LIB}"; do \
-			FULLPATH="$${ARCH_SYSROOT_DIR}/$${LIBDIR}/$${LIB}" ; \
-			rm -fr $(TARGET_DIR)/$${LIBDIR}/$${LIB}; \
-			mkdir -p $(TARGET_DIR)/$${LIBDIR}; \
-			if test -h $${FULLPATH} ; then \
-				cp -d $${FULLPATH} $(TARGET_DIR)/$${LIBDIR}/; \
-			elif test -f $${FULLPATH}; then \
-				$(INSTALL) -D -m0755 $${FULLPATH} $(TARGET_DIR)/$${LIBDIR}/$${LIB}; \
-				case "$${STRIP}" in \
-				(0 | n | no) \
-;; \
-				(*) \
-					$(TARGET_CROSS)strip "$(TARGET_DIR)/$${LIBDIR}/$${LIB}"; \
-;; \
-				esac; \
-			else \
-				exit -1; \
-			fi; \
-			LIB="`readlink $${FULLPATH}`"; \
-		done; \
-	done; \
- \
-	echo -n
-
-#
-# Copy the full external toolchain sysroot directory to the staging
-# dir. The operation of this function is rendered a little bit
-# complicated by the support for multilib toolchains.
-#
-# We start by copying etc, lib, sbin and usr from the sysroot of the
-# selected architecture variant (as pointed by ARCH_SYSROOT_DIR). This
-# allows to import into the staging directory the C library and
-# companion libraries for the correct architecture variant. We
-# explictly only copy etc, lib, sbin and usr since other directories
-# might exist for other architecture variants (on Codesourcery
-# toolchain, the sysroot for the default architecture variant contains
-# the armv4t and thumb2 subdirectories, which are the sysroot for the
-# corresponding architecture variants), and we don't want to import
-# them.
-#
-# Then, if the selected architecture variant is not the default one
-# (i.e, if SYSROOT_DIR != ARCH_SYSROOT_DIR), then we :
-#
-#  * Import the header files from the default architecture
-#    variant. Header files are typically shared between the sysroots
-#    for the different architecture variants. If we use the
-#    non-default one, header files were not copied by the previous
-#    step, so we copy them here from the sysroot of the default
-#    architecture variant.
-#
-#  * Create a symbolic link that matches the name of the subdirectory
-#    for the architecture variant in the original sysroot. This is
-#    required as the compiler will by default look in
-#    sysroot_dir/arch_variant/ for libraries and headers, when the
-#    non-default architecture variant is used. Without this, the
-#    compiler fails to find libraries and headers.
-#
-# $1: main sysroot directory of the toolchain
-# $2: arch specific sysroot directory of the toolchain
-# $3: arch specific subdirectory in the sysroot
-#
-copy_toolchain_sysroot = \
-	SYSROOT_DIR="$(strip $1)"; \
-	ARCH_SYSROOT_DIR="$(strip $2)"; \
-	ARCH_SUBDIR="$(strip $3)"; \
-	for i in etc lib sbin usr ; do \
-		cp -a $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
-	done ; \
-	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
-		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
-			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
-		fi ; \
-		ln -s . $(STAGING_DIR)/$(ARCH_SUBDIR) ; \
-	fi ; \
-	find $(STAGING_DIR) -type d | xargs chmod 755
-
-#
-# Check the availability of a particular glibc feature. We assume that
-# all Buildroot toolchain options are supported by glibc, so we just
-# check that they are enabled.
-#
-# $1: Buildroot option name
-# $2: feature description
-#
-check_glibc_feature = \
-	if [ x$($(1)) != x"y" ] ; then \
-		echo "$(2) available in C library, please enable $(1)" ; \
-		exit 1 ; \
-	fi
-
-#
-# Check the correctness of a glibc external toolchain configuration.
-#  1. Check that the C library selected in Buildroot matches the one
-#     of the external toolchain
-#  2. Check that all the C library-related features are enabled in the
-#     config, since glibc always supports all of them
-#
-# $1: sysroot directory
-#
-check_glibc = \
-	SYSROOT_DIR="$(strip $1)"; \
-	if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* ; then \
-		echo "Incorrect selection of the C library"; \
-		exit -1; \
-	fi; \
-	$(call check_glibc_feature,BR2_LARGEFILE,Large file support) ;\
-	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
-	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
-	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
-	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
-	$(call check_glibc_feature,BR2_PROGRAM_INVOCATION,Program invocation support)
-
-#
-# Check the conformity of Buildroot configuration with regard to the
-# uClibc configuration of the external toolchain, for a particular
-# feature.
-#
-# $1: uClibc macro name
-# $2: Buildroot option name
-# $3: uClibc config file
-# $4: feature description
-#
-check_uclibc_feature = \
-	IS_IN_LIBC=`grep -q "\#define $(1) 1" $(3) && echo y` ; \
-	if [ x$($(2)) != x"y" -a x$${IS_IN_LIBC} == x"y" ] ; then \
-		echo "$(4) available in C library, please enable $(2)" ; \
-		exit 1 ; \
-	fi ; \
-	if [ x$($(2)) == x"y" -a x$${IS_IN_LIBC} != x"y" ] ; then \
-		echo "$(4) not available in C library, please disable $(2)" ; \
-		exit 1 ; \
-	fi
-
-#
-# Check the correctness of a uclibc external toolchain configuration
-#  1. Check that the C library selected in Buildroot matches the one
-#     of the external toolchain
-#  2. Check that the features enabled in the Buildroot configuration
-#     match the features available in the uClibc of the external
-#     toolchain
-#
-# $1: sysroot directory
-#
-check_uclibc = \
-	SYSROOT_DIR="$(strip $1)"; \
-	if ! test -f $${SYSROOT_DIR}/lib/ld-uClibc.so.* ; then \
-		echo "Incorrect selection of the C library"; \
-		exit -1; \
-	fi; \
-	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
-	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
-
-#
-# Check that the Buildroot configuration of the ABI matches the
-# configuration of the external toolchain.
-#
-check_arm_abi = \
-	EXT_TOOLCHAIN_TARGET=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Target | cut -f2 -d ' ') ; \
-	if echo $${EXT_TOOLCHAIN_TARGET} | grep -q 'eabi$$' ; then \
-		EXT_TOOLCHAIN_ABI="eabi" ; \
-	else \
-		EXT_TOOLCHAIN_ABI="oabi" ; \
-	fi ; \
-	if [ x$(BR2_ARM_OABI) == x"y" -a $${EXT_TOOLCHAIN_ABI} == "eabi" ] ; then \
-		echo "Incorrect ABI setting" ; \
-		exit 1 ; \
-	fi ; \
-	if [ x$(BR2_ARM_EABI) == x"y" -a $${EXT_TOOLCHAIN_ABI} == "oabi" ] ; then \
-		echo "Incorrect ABI setting" ; \
-		exit 1 ; \
-	fi ; \
-
-#
-# Check that the external toolchain supports C++
-#
-check_cplusplus = \
-	if ! test -x $(TARGET_CXX) ; then \
-		echo "BR2_INSTALL_LIBSTDCPP is selected but C++ support not available in external toolchain" ; \
-		exit 1 ; \
-	fi ; \
-
-#
-# Check that the cross-compiler given in the configuration exists
-#
-check_cross_compiler_exists = \
-	if ! test -x $(TARGET_CC) ; then \
-		echo "Cannot find cross-compiler $(TARGET_CC)" ; \
-		exit 1 ; \
-	fi ; \
-
 uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
 EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
new file mode 100644
index 0000000..2c7d34c
--- /dev/null
+++ b/toolchain/helpers.mk
@@ -0,0 +1,217 @@
+# This Makefile fragment declares helper functions, usefull to handle
+# non- buildroot-built toolchains, eg. purely external toolchains or
+# toolchains (internally) built using crosstool-NG.
+
+#
+# Copy a toolchain library and its symbolic links from the sysroot
+# directory to the target directory. Also optionaly strips the
+# library.
+#
+# $1: arch specific sysroot directory
+# $2: library name
+# $3: destination directory
+# $4: strip (y|n), default is to strip
+#
+copy_toolchain_lib_root = \
+	ARCH_SYSROOT_DIR="$(strip $1)"; \
+	LIB="$(strip $2)"; \
+	STRIP="$(strip $4)"; \
+ \
+	LIBS=`(cd $${ARCH_SYSROOT_DIR}; find . -path "./lib/$${LIB}.*" -o -path "./usr/lib/$${LIB}.*")` ; \
+	for FILE in $${LIBS} ; do \
+		LIB=`basename $${FILE}`; \
+		LIBDIR=`dirname $${FILE}` ; \
+		while test \! -z "$${LIB}"; do \
+			FULLPATH="$${ARCH_SYSROOT_DIR}/$${LIBDIR}/$${LIB}" ; \
+			rm -fr $(TARGET_DIR)/$${LIBDIR}/$${LIB}; \
+			mkdir -p $(TARGET_DIR)/$${LIBDIR}; \
+			if test -h $${FULLPATH} ; then \
+				cp -d $${FULLPATH} $(TARGET_DIR)/$${LIBDIR}/; \
+			elif test -f $${FULLPATH}; then \
+				$(INSTALL) -D -m0755 $${FULLPATH} $(TARGET_DIR)/$${LIBDIR}/$${LIB}; \
+				case "$${STRIP}" in \
+				(0 | n | no) \
+;; \
+				(*) \
+					$(TARGET_CROSS)strip "$(TARGET_DIR)/$${LIBDIR}/$${LIB}"; \
+;; \
+				esac; \
+			else \
+				exit -1; \
+			fi; \
+			LIB="`readlink $${FULLPATH}`"; \
+		done; \
+	done; \
+ \
+	echo -n
+
+#
+# Copy the full external toolchain sysroot directory to the staging
+# dir. The operation of this function is rendered a little bit
+# complicated by the support for multilib toolchains.
+#
+# We start by copying etc, lib, sbin and usr from the sysroot of the
+# selected architecture variant (as pointed by ARCH_SYSROOT_DIR). This
+# allows to import into the staging directory the C library and
+# companion libraries for the correct architecture variant. We
+# explictly only copy etc, lib, sbin and usr since other directories
+# might exist for other architecture variants (on Codesourcery
+# toolchain, the sysroot for the default architecture variant contains
+# the armv4t and thumb2 subdirectories, which are the sysroot for the
+# corresponding architecture variants), and we don't want to import
+# them.
+#
+# Then, if the selected architecture variant is not the default one
+# (i.e, if SYSROOT_DIR != ARCH_SYSROOT_DIR), then we :
+#
+#  * Import the header files from the default architecture
+#    variant. Header files are typically shared between the sysroots
+#    for the different architecture variants. If we use the
+#    non-default one, header files were not copied by the previous
+#    step, so we copy them here from the sysroot of the default
+#    architecture variant.
+#
+#  * Create a symbolic link that matches the name of the subdirectory
+#    for the architecture variant in the original sysroot. This is
+#    required as the compiler will by default look in
+#    sysroot_dir/arch_variant/ for libraries and headers, when the
+#    non-default architecture variant is used. Without this, the
+#    compiler fails to find libraries and headers.
+#
+# $1: main sysroot directory of the toolchain
+# $2: arch specific sysroot directory of the toolchain
+# $3: arch specific subdirectory in the sysroot
+#
+copy_toolchain_sysroot = \
+	SYSROOT_DIR="$(strip $1)"; \
+	ARCH_SYSROOT_DIR="$(strip $2)"; \
+	ARCH_SUBDIR="$(strip $3)"; \
+	for i in etc lib sbin usr ; do \
+		cp -a $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
+	done ; \
+	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
+		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
+			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
+		fi ; \
+		ln -s . $(STAGING_DIR)/$(ARCH_SUBDIR) ; \
+	fi ; \
+	find $(STAGING_DIR) -type d | xargs chmod 755
+
+#
+# Check the availability of a particular glibc feature. We assume that
+# all Buildroot toolchain options are supported by glibc, so we just
+# check that they are enabled.
+#
+# $1: Buildroot option name
+# $2: feature description
+#
+check_glibc_feature = \
+	if [ x$($(1)) != x"y" ] ; then \
+		echo "$(2) available in C library, please enable $(1)" ; \
+		exit 1 ; \
+	fi
+
+#
+# Check the correctness of a glibc external toolchain configuration.
+#  1. Check that the C library selected in Buildroot matches the one
+#     of the external toolchain
+#  2. Check that all the C library-related features are enabled in the
+#     config, since glibc always supports all of them
+#
+# $1: sysroot directory
+#
+check_glibc = \
+	SYSROOT_DIR="$(strip $1)"; \
+	if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* ; then \
+		echo "Incorrect selection of the C library"; \
+		exit -1; \
+	fi; \
+	$(call check_glibc_feature,BR2_LARGEFILE,Large file support) ;\
+	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
+	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
+	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
+	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
+	$(call check_glibc_feature,BR2_PROGRAM_INVOCATION,Program invocation support)
+
+#
+# Check the conformity of Buildroot configuration with regard to the
+# uClibc configuration of the external toolchain, for a particular
+# feature.
+#
+# $1: uClibc macro name
+# $2: Buildroot option name
+# $3: uClibc config file
+# $4: feature description
+#
+check_uclibc_feature = \
+	IS_IN_LIBC=`grep -q "\#define $(1) 1" $(3) && echo y` ; \
+	if [ x$($(2)) != x"y" -a x$${IS_IN_LIBC} == x"y" ] ; then \
+		echo "$(4) available in C library, please enable $(2)" ; \
+		exit 1 ; \
+	fi ; \
+	if [ x$($(2)) == x"y" -a x$${IS_IN_LIBC} != x"y" ] ; then \
+		echo "$(4) not available in C library, please disable $(2)" ; \
+		exit 1 ; \
+	fi
+
+#
+# Check the correctness of a uclibc external toolchain configuration
+#  1. Check that the C library selected in Buildroot matches the one
+#     of the external toolchain
+#  2. Check that the features enabled in the Buildroot configuration
+#     match the features available in the uClibc of the external
+#     toolchain
+#
+# $1: sysroot directory
+#
+check_uclibc = \
+	SYSROOT_DIR="$(strip $1)"; \
+	if ! test -f $${SYSROOT_DIR}/lib/ld-uClibc.so.* ; then \
+		echo "Incorrect selection of the C library"; \
+		exit -1; \
+	fi; \
+	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
+	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
+
+#
+# Check that the Buildroot configuration of the ABI matches the
+# configuration of the external toolchain.
+#
+check_arm_abi = \
+	EXT_TOOLCHAIN_TARGET=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Target | cut -f2 -d ' ') ; \
+	if echo $${EXT_TOOLCHAIN_TARGET} | grep -q 'eabi$$' ; then \
+		EXT_TOOLCHAIN_ABI="eabi" ; \
+	else \
+		EXT_TOOLCHAIN_ABI="oabi" ; \
+	fi ; \
+	if [ x$(BR2_ARM_OABI) == x"y" -a $${EXT_TOOLCHAIN_ABI} == "eabi" ] ; then \
+		echo "Incorrect ABI setting" ; \
+		exit 1 ; \
+	fi ; \
+	if [ x$(BR2_ARM_EABI) == x"y" -a $${EXT_TOOLCHAIN_ABI} == "oabi" ] ; then \
+		echo "Incorrect ABI setting" ; \
+		exit 1 ; \
+	fi ; \
+
+#
+# Check that the external toolchain supports C++
+#
+check_cplusplus = \
+	if ! test -x $(TARGET_CXX) ; then \
+		echo "BR2_INSTALL_LIBSTDCPP is selected but C++ support not available in external toolchain" ; \
+		exit 1 ; \
+	fi ; \
+
+#
+# Check that the cross-compiler given in the configuration exists
+#
+check_cross_compiler_exists = \
+	if ! test -x $(TARGET_CC) ; then \
+		echo "Cannot find cross-compiler $(TARGET_CC)" ; \
+		exit 1 ; \
+	fi ; \
-- 
1.7.1
