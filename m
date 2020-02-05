From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2020 15:57:56 +0100
Subject: [Buildroot] [git commit] system: don't attempt swapon/swapoff in
 inittab if not available
Message-ID: <20200205144652.538818C9ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4dce0ae0f5d5d7fecb6f493e974e131a6df43da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default inittab files added by busybox and sysvinit run 'swapon -a'
during init and 'swapoff -a' during shutdown.

But, the swapon/swapoff programs are not guaranteed to be
available. For the busybox versions, it is steered by
CONFIG_SWAPON/CONFIG_SWAPOFF. For the util-linux versions, it is steered by
BR2_PACKAGE_UTIL_LINUX_BINARIES.

In a case where swapon/swapoff is not available but the inittab tries to
execute them, the boot log would be polluted by error messages like:

    swapon: not found

Avoid this by commenting out the swapon/swapoff lines if the swapon/swapoff
binaries are not available.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Peter: test with -x]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk   |  1 +
 package/sysvinit/sysvinit.mk |  1 +
 system/system.mk             | 13 +++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6283bc96ea..45f74271f2 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -226,6 +226,7 @@ endif # BR2_TARGET_GENERIC_GETTY
 BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_SET_GETTY
 
 BUSYBOX_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
+BUSYBOX_TARGET_FINALIZE_HOOKS += SYSTEM_UPDATE_SWAPON_SWAPOFF_INITTAB
 
 endif # BR2_INIT_BUSYBOX
 
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index c778a9cde5..a717ae0459 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -45,5 +45,6 @@ endif # BR2_TARGET_GENERIC_GETTY
 SYSVINIT_TARGET_FINALIZE_HOOKS += SYSVINIT_SET_GETTY
 
 SYSVINIT_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
+SYSVINIT_TARGET_FINALIZE_HOOKS += SYSTEM_UPDATE_SWAPON_SWAPOFF_INITTAB
 
 $(eval $(generic-package))
diff --git a/system/system.mk b/system/system.mk
index 8fe2c138b0..6f1f5c27b1 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -96,6 +96,19 @@ define SYSTEM_REMOUNT_ROOT_INITTAB
 endef
 endif
 
+define SYSTEM_UPDATE_SWAPON_SWAPOFF_INITTAB
+	if [ -x $(TARGET_DIR)/sbin/swapon ]; then \
+		$(SED) '\%:/sbin/swapon%s/^#*//' $(TARGET_DIR)/etc/inittab ; \
+	else \
+		$(SED) '\%:/sbin/swapon%s/^#*/#/' $(TARGET_DIR)/etc/inittab ; \
+	fi
+	if [ -x $(TARGET_DIR)/sbin/swapoff ]; then \
+		$(SED) '\%:/sbin/swapoff%s/^#*//' $(TARGET_DIR)/etc/inittab ; \
+	else \
+		$(SED) '\%:/sbin/swapoff%s/^#*/#/' $(TARGET_DIR)/etc/inittab ; \
+	fi
+endef
+
 ifeq ($(BR_BUILDING)$(BR2_SYSTEM_DEFAULT_PATH),y"")
 $(error BR2_SYSTEM_DEFAULT_PATH can't be empty)
 endif
