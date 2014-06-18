From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 19 Jun 2014 01:22:28 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: Add support for Sourcery
	Codebench Standard
Message-ID: <1403133748-17745-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
Buildroot configuration:
Since these toolchain can't be downloaded, use the Custom toolchain backend.

Select:
  Toolchain type (External toolchain)
  Toolchain (Custom toolchain)
  Toolchain origin (Pre-installed toolchain)
  or
  Toolchain origin (Toolchain to be downloaded and installed)*

Then set all toolchain settings (kernel headers, libc, rpc, c++ etc...)

Last but not least, set the Target Optimizations with -msgxx-glibc

*Just copy the toolchain archive to dl directory.
---
 toolchain/helpers.mk                               | 23 ++++++++++++++--------
 toolchain/toolchain-external/toolchain-external.mk | 11 +++++++++--
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 81e02b7..73bab86 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -193,16 +193,22 @@ check_glibc_feature = \
 # Check the availability of RPC support in a glibc toolchain
 #
 # $1: sysroot directory
+# $2: arch sysroot directory
 #
 check_glibc_rpc_feature = \
 	IS_IN_LIBC=`test -f $(1)/usr/include/rpc/rpc.h && echo y` ; \
-	if [ "$(BR2_TOOLCHAIN_HAS_NATIVE_RPC)" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
-		echo "RPC support available in C library, please enable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
-		exit 1 ; \
+	IS_IN_ARCH_LIBC=`test -f $(2)/usr/include/rpc/rpc.h && echo y` ; \
+	if [ "$(BR2_TOOLCHAIN_HAS_NATIVE_RPC)" != "y" ] ; then \
+		if [ "$${IS_IN_ARCH_LIBC}" = "y" -o "$${IS_IN_LIBC}" = "y" ] ; then \
+			echo "RPC support available in C library, please enable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
+			exit 1 ; \
+		fi ; \
 	fi ; \
-	if [ "$(BR2_TOOLCHAIN_HAS_NATIVE_RPC)" = "y" -a "$${IS_IN_LIBC}" != "y" ] ; then \
-		echo "RPC support not available in C library, please disable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
-		exit 1 ; \
+	if [ "$(BR2_TOOLCHAIN_HAS_NATIVE_RPC)" = "y" ] ; then \
+		if [ "$${IS_IN_ARCH_LIBC}" != "y" -a "$${IS_IN_LIBC}" != "y" ] ; then \
+			echo "RPC support not available in C library, please disable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
+			exit 1 ; \
+		fi ; \
 	fi
 
 #
@@ -216,12 +222,13 @@ check_glibc_rpc_feature = \
 #
 check_glibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if test `find $${SYSROOT_DIR}/ -maxdepth 2 -name 'ld-linux*.so.*' -o -name 'ld.so.*' -o -name 'ld64.so.*' | wc -l` -eq 0 ; then \
+	ARCH_SYSROOT_DIR="$(strip $2)"; \
+	if test `find $${SYSROOT_DIR}/ -maxdepth 3 -name 'ld-linux*.so.*' -o -name 'ld.so.*' -o -name 'ld64.so.*' | wc -l` -eq 0 ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
-	$(call check_glibc_rpc_feature,$${SYSROOT_DIR})
+	$(call check_glibc_rpc_feature,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR})
 
 #
 # Check that the selected C library really is musl
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 10ae089..69ccf64 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -458,8 +458,12 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
+	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	if test ! -d "$${SYSROOT_DIR}"  ; then \
+		SYSROOT_DIR=$$(echo -n "$${ARCH_SYSROOT_DIR}" | sed -r 's:(/libc/)([^&]*):\1:') ; \
+	fi ; \
 	$(call check_kernel_headers_version,\
-		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
+		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)),\
 		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
 	if test "$(BR2_arm)" = "y" ; then \
 		$(call check_arm_abi,\
@@ -474,7 +478,7 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	elif test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
 		$(call check_musl,$${SYSROOT_DIR}) ; \
 	else \
-		$(call check_glibc,$${SYSROOT_DIR}) ; \
+		$(call check_glibc,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR}) ; \
 	fi
 endef
 
@@ -548,6 +552,9 @@ define TOOLCHAIN_EXTERNAL_INSTALL_CORE
 		exit 1 ; \
 	fi ; \
 	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	if test ! -d "$${SYSROOT_DIR}"  ; then \
+		SYSROOT_DIR=$$(echo -n "$${ARCH_SYSROOT_DIR}" | sed -r 's:(/libc/)([^&]*):\1:') ; \
+	fi ; \
 	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	SUPPORT_LIB_DIR="" ; \
 	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-- 
1.9.3
