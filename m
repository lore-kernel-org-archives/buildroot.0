From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 20:37:51 +0200
Subject: [Buildroot] [git commit master] external toolchain: check
	BR2_INSTALL_LIBSTDCPP
Message-ID: <20100521184447.A61669C144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fad3b5a7bee8ce6dd1cf17f230de693d8ed9230f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Verify that the value of BR2_INSTALL_LIBSTDCPP set by the user in the
Buildroot configuration really matches the external toolchain
capabilities by checking that a C++ cross-compiler is available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 2c2562c..bb4809c 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -232,6 +232,15 @@ check_arm_abi = \
 	fi ; \
 
 #
+# Check that the external toolchain supports C++
+#
+check_cplusplus = \
+	if ! test -x $(TARGET_CXX) ; then \
+		echo "BR2_INSTALL_LIBSTDCPP is selected but C++ support not available in external toolchain" ; \
+		exit 1 ; \
+	fi ; \
+
+#
 # Check that the cross-compiler given in the configuration exists
 #
 check_cross_compiler_exists = \
@@ -288,6 +297,9 @@ endif
 ifeq ($(BR2_arm),y)
 	$(Q)$(call check_arm_abi)
 endif
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+	$(Q)$(call check_cplusplus)
+endif
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 	$(Q)$(call check_uclibc,$(SYSROOT_DIR))
 else
-- 
1.6.3.3
