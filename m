From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 May 2011 21:56:10 +0200
Subject: [Buildroot] [git commit] external-toolchain: fix support
Message-ID: <20110508200027.B4620833E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c59d0247541a85c62227b79d4fdb77405c4e6c99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent commit adding the external toolchain wrapper has broken the
support for external toolchain. The check_arm_eabi, check_cplusplus
and check_cross_compiler_exists functions were using TARGET_CC, which
points to the toolchain wrapper, but at the moment those functions are
called, the wrapper hasn't been generated yet.

We fix this by passing to these functions the path to the C or C++
compiler they should use for their tests.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk                     |   17 +++++++++++++----
 toolchain/toolchain-external/ext-tool.mk |    7 ++++---
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index db7c7f1..13dbebb 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -201,8 +201,11 @@ check_uclibc = \
 # Check that the Buildroot configuration of the ABI matches the
 # configuration of the external toolchain.
 #
+# $1: cross-gcc path
+#
 check_arm_abi = \
-	EXT_TOOLCHAIN_TARGET=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Target | cut -f2 -d ' ') ; \
+	__CROSS_CC=$(strip $1) ; \
+	EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
 	if echo $${EXT_TOOLCHAIN_TARGET} | grep -q 'eabi$$' ; then \
 		EXT_TOOLCHAIN_ABI="eabi" ; \
 	else \
@@ -220,8 +223,11 @@ check_arm_abi = \
 #
 # Check that the external toolchain supports C++
 #
+# $1: cross-g++ path
+#
 check_cplusplus = \
-	$(TARGET_CXX) -v > /dev/null 2>&1 ; \
+	__CROSS_CXX=$(strip $1) ; \
+	$${__CROSS_CXX} -v > /dev/null 2>&1 ; \
 	if test $$? -ne 0 ; then \
 		echo "C++ support is selected but is not available in external toolchain" ; \
 		exit 1 ; \
@@ -230,9 +236,12 @@ check_cplusplus = \
 #
 # Check that the cross-compiler given in the configuration exists
 #
+# $1: cross-gcc path
+#
 check_cross_compiler_exists = \
-	$(TARGET_CC) -v > /dev/null 2>&1 ; \
+	__CROSS_CC=$(strip $1) ; \
+	$${__CROSS_CC} -v > /dev/null 2>&1 ; \
 	if test $$? -ne 0 ; then \
-		echo "Cannot execute cross-compiler '$(TARGET_CC)'" ; \
+		echo "Cannot execute cross-compiler '$${__CROSS_CC}'" ; \
 		exit 1 ; \
 	fi
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 328f908..6f5de81 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -122,6 +122,7 @@ endif
 
 TOOLCHAIN_EXTERNAL_CROSS=$(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 TOOLCHAIN_EXTERNAL_CC=$(TOOLCHAIN_EXTERNAL_CROSS)gcc
+TOOLCHAIN_EXTERNAL_CXX=$(TOOLCHAIN_EXTERNAL_CROSS)g++
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS = \
 	-DBR_CROSS_PATH='"$(TOOLCHAIN_EXTERNAL_BIN)/"' \
 	-DBR_SYSROOT='"$(STAGING_DIR)"'
@@ -201,7 +202,7 @@ $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
 # type of C library and all C library features.
 $(STAMP_DIR)/ext-toolchain-checked:
 	@echo "Checking external toolchain settings"
-	$(Q)$(call check_cross_compiler_exists)
+	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)SYSROOT_DIR=`$(TOOLCHAIN_EXTERNAL_CC) -print-sysroot 2>/dev/null` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
@@ -211,10 +212,10 @@ $(STAMP_DIR)/ext-toolchain-checked:
 		exit 1 ; \
 	fi ; \
 	if test x$(BR2_arm) == x"y" ; then \
-		$(call check_arm_abi) ; \
+		$(call check_arm_abi,$(TOOLCHAIN_EXTERNAL_CC)) ; \
 	fi ; \
 	if test x$(BR2_INSTALL_LIBSTDCPP) == x"y" ; then \
-		$(call check_cplusplus) ; \
+		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
 	fi ; \
 	if test x$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC) == x"y" ; then \
 		$(call check_uclibc,$${SYSROOT_DIR}) ; \
-- 
1.7.3.4
