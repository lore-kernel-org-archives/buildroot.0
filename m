From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 08:48:35 +0200
Subject: [Buildroot] [git commit] external toolchain: respect $(Q)
Message-ID: <20090717205405.7DF42775BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82bf777ed73f449587aea59a6ce5b41164a6819f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Use $(Q) in external toolchain support so that the user can get the
full output by passing V=1 to make, and still get a nice and clean
output by default.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index e772cda..c9692a1 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -203,18 +203,18 @@ ifeq ($(strip $(SYSROOT_DIR)),)
 	exit 1
 endif
 ifeq ($(BR2_arm),y)
-	@$(call check_arm_abi)
+	$(Q)$(call check_arm_abi)
 endif
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-	@$(call check_uclibc,$(SYSROOT_DIR))
+	$(Q)$(call check_uclibc,$(SYSROOT_DIR))
 else
-	@$(call check_glibc,$(SYSROOT_DIR))
+	$(Q)$(call check_glibc,$(SYSROOT_DIR))
 endif
 	mkdir -p $(TARGET_DIR)/lib
 	@echo "Copy external toolchain libraries to target..."
-	@for libs in $(EXTERNAL_LIBS); do \
+	$(Q)for libs in $(EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root,$(SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
 	@echo "Copy external toolchain sysroot to staging..."
-	@$(call copy_toolchain_sysroot,$(SYSROOT_DIR))
+	$(Q)$(call copy_toolchain_sysroot,$(SYSROOT_DIR))
 	@touch $@
-- 
1.6.3.3
