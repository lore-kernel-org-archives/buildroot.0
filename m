From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 10:35:29 +0200
Subject: [Buildroot] [PATCH 2/8] external-toolchain: better documentation,
	cleanup, sysroot check
In-Reply-To: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
Message-ID: <57692e2535be4197debe2b1eea4fd50dea8a9c26.1247819731.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * Introduce documentation for each function of ext-tool.mk, and
   document all parameters of the functions.

 * Pass SYSROOT_DIR as argument to all functions that require it,
   instead of computing it manually everywhere

 * Use $(shell) instead of backquotes

 * Check that the SYSROOT_DIR variable is not empty, which means that
   the external toolchain doesn't support --sysroot. In that case,
   bail out with a nice error message.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |  115 +++++++++++++++++++++---------
 1 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 72bb567..7a0132a 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -1,19 +1,20 @@
 #
-# copy_toolchain_lib_root
+# Copy a toolchain library and its symbolic links from the sysroot
+# directory to the target directory. Also optionaly strips the
+# library.
 #
-# $1: source
-# $2: destination
-# $3: strip (y|n)       default is to strip
+# $1: sysroot directory
+# $2: library name
+# $3: destination directory
+# $4: strip (y|n), default is to strip
 #
 copy_toolchain_lib_root = \
-	LIB="$(strip $1)"; \
-	DST="$(strip $2)"; \
-	STRIP="$(strip $3)"; \
+	SYSROOT_DIR="$(strip $1)"; \
+	LIB="$(strip $2)"; \
+	DST="$(strip $3)"; \
+	STRIP="$(strip $4)"; \
  \
-	SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; \
 	LIB_DIR="$${SYSROOT_DIR}/lib" ; \
- \
-	LIB="$(strip $1)"; \
 	for FILE in `find $${LIB_DIR} -maxdepth 1 -type l -name "$${LIB}*"`; do \
 		LIB=`basename $${FILE}`; \
 		while test \! -z "$${LIB}"; do \
@@ -39,29 +40,42 @@ copy_toolchain_lib_root = \
  \
 	echo -n
 
+#
+# Copy the full external toolchain sysroot directory to the staging
+# dir
+#
+# $1: sysroot directory
+#
 copy_toolchain_sysroot = \
-	SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; \
-	if [ -n "$${SYSROOT_DIR}" ]; then cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
-	find $(STAGING_DIR) -type d | xargs chmod 755; fi
+	SYSROOT_DIR="$(strip $1)"; \
+	cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
+	find $(STAGING_DIR) -type d | xargs chmod 755
 
-EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-EXTERNAL_LIBS+=ld-uClibc.so
-else
-EXTERNAL_LIBS+=ld-linux.so libnss_files.so
-endif
-
-# 1: Buildroot option name
-# 2: message
+#
+# Check the availability of a particular glibc feature. We assume that
+# all Buildroot toolchain options are supported by glibc, so we just
+# check that they are enabled.
+#
+# $1: Buildroot option name
+# $2: feature description
+#
 check_glibc_feature = \
 	if [ x$($(1)) != x"y" ] ; then \
 		echo "$(2) available in C library, please enable $(1)" ; \
 		exit 1 ; \
 	fi
 
+#
+# Check the correctness of a glibc external toolchain configuration.
+#  1. Check that the C library selected in Buildroot matches the one
+#     of the external toolchain
+#  2. Check that all the C library-related features are enabled in the
+#     config, since glibc always supports all of them
+#
+# $1: sysroot directory
+#
 check_glibc = \
-	SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; \
-	echo $${SYSROOT_DIR}/lib/ld-linux.so.* ; \
+	SYSROOT_DIR="$(strip $1)"; \
 	if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
@@ -72,10 +86,16 @@ check_glibc = \
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support)
 
-# 1: uClibc macro name
-# 2: Buildroot option name
-# 3: uClibc config file
-# 4: message
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
 check_uclibc_feature = \
 	IS_IN_LIBC=`grep -q "\#define $(1) 1" $(3) && echo y` ; \
 	if [ x$($(2)) != x"y" -a x$${IS_IN_LIBC} == x"y" ] ; then \
@@ -87,8 +107,18 @@ check_uclibc_feature = \
 		exit 1 ; \
 	fi
 
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
 check_uclibc = \
-	SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; \
+	SYSROOT_DIR="$(strip $1)"; \
 	if ! test -f $${SYSROOT_DIR}/lib/ld-uClibc.so.* ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
@@ -100,8 +130,12 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 
+#
+# Check that the Buildroot configuration of the ABI matches the
+# configuration of the external toolchain.
+#
 check_arm_abi = \
-	EXT_TOOLCHAIN_TARGET=`$(TARGET_CC) -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
+	EXT_TOOLCHAIN_TARGET=$(shell $(TARGET_CC) -v 2>&1 | grep ^Target | cut -f2 -d ' ') ; \
 	if echo $${EXT_TOOLCHAIN_TARGET} | grep -q 'eabi$$' ; then \
 		EXT_TOOLCHAIN_ABI="eabi" ; \
 	else \
@@ -118,21 +152,34 @@ check_arm_abi = \
 
 uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
+EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+EXTERNAL_LIBS+=ld-uClibc.so
+else
+EXTERNAL_LIBS+=ld-linux.so libnss_files.so
+endif
+
+SYSROOT_DIR=$(shell $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
+
 $(STAMP_DIR)/ext-toolchain-installed:
 	@echo "Checking external toolchain settings"
+ifeq ($(strip $(SYSROOT_DIR)),)
+	@echo "External toolchain doesn't support --sysroot. Cannot use."
+	exit 1
+endif
 ifeq ($(BR2_arm),y)
 	@$(call check_arm_abi)
 endif
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-	@$(call check_uclibc)
+	@$(call check_uclibc,$(SYSROOT_DIR))
 else
-	@$(call check_glibc)
+	@$(call check_glibc,$(SYSROOT_DIR))
 endif
 	mkdir -p $(TARGET_DIR)/lib
 	@echo "Copy external toolchain libraries to target..."
 	@for libs in $(EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root, $$libs, /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
+		$(call copy_toolchain_lib_root,$(SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
 	@echo "Copy external toolchain sysroot to staging..."
-	@$(call copy_toolchain_sysroot)
+	@$(call copy_toolchain_sysroot,$(SYSROOT_DIR))
 	@touch $@
-- 
1.6.0.4
