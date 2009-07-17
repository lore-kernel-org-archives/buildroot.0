From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 08:53:55 +0200
Subject: [Buildroot] [git commit] external toolchain: check cross-compiler
	existence
Message-ID: <20090717205405.BDF13775BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=901b468e24ff546760ffdf6456d731f6388bad00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


As a minimal test to the external toolchain, check that $(TARGET_CC)
is actually an existing executable file. That way, if the user
misconfigures the toolchain path and/or prefix, a meaningful error
message will be shown.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index c9692a1..d441a92 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -181,6 +181,15 @@ check_arm_abi = \
 		exit 1 ; \
 	fi ; \
 
+#
+# Check that the cross-compiler given in the configuration exists
+#
+check_cross_compiler_exists = \
+	if ! test -x $(TARGET_CC) ; then \
+		echo "Cannot find cross-compiler $(TARGET_CC)" ; \
+		exit 1 ; \
+	fi ; \
+
 uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
 EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so
@@ -198,6 +207,7 @@ SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n"
 
 $(STAMP_DIR)/ext-toolchain-installed:
 	@echo "Checking external toolchain settings"
+	$(Q)$(call check_cross_compiler_exists)
 ifeq ($(strip $(SYSROOT_DIR)),)
 	@echo "External toolchain doesn't support --sysroot. Cannot use."
 	exit 1
-- 
1.6.3.3
