From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] external-toolchain: adjust
	tests on TARGET_CC and TARGET_CXX
Message-ID: <20100708115826.456118269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=08235f7144d08bc111b07d3523ac6439f6fd0b94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the changes to TARGET_CC/TARGET_CXX to include the --sysroot
option, these variables not only contain the path to the compiler, but
also the --sysroot option. For that reason, we cannot anymore just use
"test -x" to test for the compiler presence. Instead, we see if
$(TARGET_CC) -v and $(TARGET_CXX) -v return a zero status.

Moreover, --sysroot now needs to be filtered out of $(TARGET_CC) and
not $(TARGET_CFLAGS) when asking the toolchain for its original
sysroot and arch sysroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 7ca138b..9ad1e31 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -262,7 +262,8 @@ check_arm_abi = \
 # Check that the external toolchain supports C++
 #
 check_cplusplus = \
-	if ! test -x $(TARGET_CXX) ; then \
+	$(TARGET_CXX) -v > /dev/null 2>&1 ; \
+	if test $$? -ne 0 ; then \
 		echo "BR2_INSTALL_LIBSTDCPP is selected but C++ support not available in external toolchain" ; \
 		exit 1 ; \
 	fi ; \
@@ -271,8 +272,9 @@ check_cplusplus = \
 # Check that the cross-compiler given in the configuration exists
 #
 check_cross_compiler_exists = \
-	if ! test -x $(TARGET_CC) ; then \
-		echo "Cannot find cross-compiler $(TARGET_CC)" ; \
+	$(TARGET_CC) -v > /dev/null 2>&1 ; \
+	if test $$? -ne 0 ; then \
+		echo "Cannot execute cross-compiler '$(TARGET_CC)'" ; \
 		exit 1 ; \
 	fi ; \
 
@@ -301,9 +303,10 @@ endif # ! no threads
 # could select a multilib variant as we want the "main" sysroot, which
 # contains all variants of the C library in the case of multilib
 # toolchains.
-SYSROOT_DIR=$(shell $(TARGET_CC) -print-sysroot 2>/dev/null)
+TARGET_CC_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CC))
+SYSROOT_DIR=$(shell $(TARGET_CC_NO_SYSROOT) -print-sysroot 2>/dev/null)
 ifeq ($(SYSROOT_DIR),)
-SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC) -print-file-name=libc.a |sed -r -e 's:usr/lib/libc\.a::;'))
+SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a |sed -r -e 's:usr/lib/libc\.a::;'))
 endif
 
 # Now, find if the toolchain specifies a sub-directory for the
@@ -315,8 +318,7 @@ endif
 # subdirectory, in the main SYSROOT_DIR, that corresponds to the
 # selected architecture variant. ARCH_SYSROOT_DIR will contain the
 # full path to this location.
-TARGET_CFLAGS_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CFLAGS))
-ARCH_SUBDIR=$(shell $(TARGET_CC) $(TARGET_CFLAGS_NO_SYSROOT) -print-multi-directory)
+ARCH_SUBDIR=$(shell $(TARGET_CC_NO_SYSROOT) $(TARGET_CFLAGS) -print-multi-directory)
 ARCH_SYSROOT_DIR=$(SYSROOT_DIR)/$(ARCH_SUBDIR)
 
 $(STAMP_DIR)/ext-toolchain-installed:
-- 
1.7.1
