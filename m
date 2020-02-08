From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2020 20:13:07 +0100
Subject: [Buildroot] [git commit] Revert "system: don't attempt
 swapon/swapoff in inittab if not available"
Message-ID: <20200208190924.601288D506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffb189ed5a96576f2df2ef4c4b181ccee5fec657
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit c4dce0ae0f5d5d7fecb6f493e974e131a6df43da.

A different fix will be provided in a forthcoming patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk   |  1 -
 package/sysvinit/sysvinit.mk |  1 -
 system/system.mk             | 13 -------------
 3 files changed, 15 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 45f74271f2..6283bc96ea 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -226,7 +226,6 @@ endif # BR2_TARGET_GENERIC_GETTY
 BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_SET_GETTY
 
 BUSYBOX_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
-BUSYBOX_TARGET_FINALIZE_HOOKS += SYSTEM_UPDATE_SWAPON_SWAPOFF_INITTAB
 
 endif # BR2_INIT_BUSYBOX
 
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index a717ae0459..c778a9cde5 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -45,6 +45,5 @@ endif # BR2_TARGET_GENERIC_GETTY
 SYSVINIT_TARGET_FINALIZE_HOOKS += SYSVINIT_SET_GETTY
 
 SYSVINIT_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
-SYSVINIT_TARGET_FINALIZE_HOOKS += SYSTEM_UPDATE_SWAPON_SWAPOFF_INITTAB
 
 $(eval $(generic-package))
diff --git a/system/system.mk b/system/system.mk
index 6f1f5c27b1..8fe2c138b0 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -96,19 +96,6 @@ define SYSTEM_REMOUNT_ROOT_INITTAB
 endef
 endif
 
-define SYSTEM_UPDATE_SWAPON_SWAPOFF_INITTAB
-	if [ -x $(TARGET_DIR)/sbin/swapon ]; then \
-		$(SED) '\%:/sbin/swapon%s/^#*//' $(TARGET_DIR)/etc/inittab ; \
-	else \
-		$(SED) '\%:/sbin/swapon%s/^#*/#/' $(TARGET_DIR)/etc/inittab ; \
-	fi
-	if [ -x $(TARGET_DIR)/sbin/swapoff ]; then \
-		$(SED) '\%:/sbin/swapoff%s/^#*//' $(TARGET_DIR)/etc/inittab ; \
-	else \
-		$(SED) '\%:/sbin/swapoff%s/^#*/#/' $(TARGET_DIR)/etc/inittab ; \
-	fi
-endef
-
 ifeq ($(BR_BUILDING)$(BR2_SYSTEM_DEFAULT_PATH),y"")
 $(error BR2_SYSTEM_DEFAULT_PATH can't be empty)
 endif
