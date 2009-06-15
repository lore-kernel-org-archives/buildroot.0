From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jun 2009 21:19:48 +0200
Subject: [Buildroot] [PATCH 2/2] Improve external toolchain checks
In-Reply-To: <1245093588-17565-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1245093588-17565-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1245093588-17565-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1245093588-17565-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds some checks on the external toolchains.

First, it checks that the C library selection is correct, by looking
if gcc is able to find the main C library file through the
-print-file-name option.

Then, it attempts to check if the Buildroot toolchain options match
the configuration of the toolchain :

 * for glibc, it checks that IPv6, RPC, locales, wide-char, large file
   support Buildroot options are enabled, since with glibc all these
   features are always available (at least this is the assumption we
   make) ;

 * for uClibc, it checks the Buildroot options with the uClibc
   configuration file in $SYSROOT_DIR/usr/include/bits/uClibc_config.h

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |   51 ++++++++++++++++++++++++++++++
 1 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index ca71137..b904775 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -56,10 +56,61 @@ EXTERNAL_LIBC=libc.so.6
 EXTERNAL_LIBS=ld-linux.so.3 libcrypt.so.1 libdl.so.2 libgcc_s.so.1 libm.so.6 libnsl.so.1 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1 libnss_files.so.2
 endif
 
+check_clibrary = \
+	if ! test -f `$(TARGET_CC) -print-file-name=$(EXTERNAL_LIBC)` ; then \
+		echo "Incorrect selection of the C library"; \
+		exit -1; \
+	fi
+
+# 1: Buildroot option name
+# 2: message
+check_glibc_feature = \
+	if [ x$($(1)) != x"y" ] ; then \
+		echo "$(2) available in C library, please enable $(1)" ; \
+		exit 1 ; \
+	fi
+
+check_glibc = \
+	$(call check_glibc_feature,BR2_LARGEFILE,Large file support) ;\
+	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
+	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
+	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
+	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support)
+
+# 1: uClibc macro name
+# 2: Buildroot option name
+# 3: uClibc config file
+# 4: message
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
+check_uclibc = \
+	SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`; \
+	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
+	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 
 uclibc: dependencies $(TARGET_DIR)/lib/$(EXTERNAL_LIBC)
 
 $(TARGET_DIR)/lib/$(EXTERNAL_LIBC):
+	@echo "Checking external toolchain settings"
+	@$(call check_clibrary)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+	@$(call check_uclibc)
+else
+	@$(call check_glibc)
+endif
 	mkdir -p $(TARGET_DIR)/lib
 	@echo "Copy external toolchain libraries to target..."
 	@$(call copy_toolchain_lib_root, $(EXTERNAL_LIBC), /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP))
-- 
1.5.6.3
