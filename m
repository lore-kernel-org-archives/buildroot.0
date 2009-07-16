From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2009 19:37:47 +0200
Subject: [Buildroot] [git commit] external toolchain: fix libraries copy and
	add ARM ABI check
Message-ID: <20090717205404.78C40777FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00eddf0ee63e976e1ecc07ad00e72a02a81ae501
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Instead of hardcoding the C library versions, just copy the version
available in $SYSROOT_DIR/lib.

Add a check on the ARM ABI configured in Buildroot with regard to the
ABI of the external toolchain provided.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |   57 +++++++++++++++++++----------
 1 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index b904775..72bb567 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -10,12 +10,8 @@ copy_toolchain_lib_root = \
 	DST="$(strip $2)"; \
 	STRIP="$(strip $3)"; \
  \
-	LIB_DIR=`$(TARGET_CC) -print-file-name=$${LIB} | sed -e "s,$${LIB}\$$,,"`; \
- \
-	if test -z "$${LIB_DIR}"; then \
-		echo "copy_toolchain_lib_root: lib=$${LIB} not found"; \
-		exit -1; \
-	fi; \
+	SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; \
+	LIB_DIR="$${SYSROOT_DIR}/lib" ; \
  \
 	LIB="$(strip $1)"; \
 	for FILE in `find $${LIB_DIR} -maxdepth 1 -type l -name "$${LIB}*"`; do \
@@ -48,20 +44,13 @@ copy_toolchain_sysroot = \
 	if [ -n "$${SYSROOT_DIR}" ]; then cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
 	find $(STAGING_DIR) -type d | xargs chmod 755; fi
 
+EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-EXTERNAL_LIBC=libc.so.0
-EXTERNAL_LIBS=ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0
+EXTERNAL_LIBS+=ld-uClibc.so
 else
-EXTERNAL_LIBC=libc.so.6
-EXTERNAL_LIBS=ld-linux.so.3 libcrypt.so.1 libdl.so.2 libgcc_s.so.1 libm.so.6 libnsl.so.1 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1 libnss_files.so.2
+EXTERNAL_LIBS+=ld-linux.so libnss_files.so
 endif
 
-check_clibrary = \
-	if ! test -f `$(TARGET_CC) -print-file-name=$(EXTERNAL_LIBC)` ; then \
-		echo "Incorrect selection of the C library"; \
-		exit -1; \
-	fi
-
 # 1: Buildroot option name
 # 2: message
 check_glibc_feature = \
@@ -71,6 +60,12 @@ check_glibc_feature = \
 	fi
 
 check_glibc = \
+	SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; \
+	echo $${SYSROOT_DIR}/lib/ld-linux.so.* ; \
+	if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* ; then \
+		echo "Incorrect selection of the C library"; \
+		exit -1; \
+	fi; \
 	$(call check_glibc_feature,BR2_LARGEFILE,Large file support) ;\
 	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
 	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
@@ -94,6 +89,10 @@ check_uclibc_feature = \
 
 check_uclibc = \
 	SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; \
+	if ! test -f $${SYSROOT_DIR}/lib/ld-uClibc.so.* ; then \
+		echo "Incorrect selection of the C library"; \
+		exit -1; \
+	fi; \
 	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
 	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
@@ -101,11 +100,29 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 
-uclibc: dependencies $(TARGET_DIR)/lib/$(EXTERNAL_LIBC)
+check_arm_abi = \
+	EXT_TOOLCHAIN_TARGET=`$(TARGET_CC) -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
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
 
-$(TARGET_DIR)/lib/$(EXTERNAL_LIBC):
+uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
+
+$(STAMP_DIR)/ext-toolchain-installed:
 	@echo "Checking external toolchain settings"
-	@$(call check_clibrary)
+ifeq ($(BR2_arm),y)
+	@$(call check_arm_abi)
+endif
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 	@$(call check_uclibc)
 else
@@ -113,9 +130,9 @@ else
 endif
 	mkdir -p $(TARGET_DIR)/lib
 	@echo "Copy external toolchain libraries to target..."
-	@$(call copy_toolchain_lib_root, $(EXTERNAL_LIBC), /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP))
 	@for libs in $(EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root, $$libs, /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
 	@echo "Copy external toolchain sysroot to staging..."
 	@$(call copy_toolchain_sysroot)
+	@touch $@
-- 
1.6.3.3
