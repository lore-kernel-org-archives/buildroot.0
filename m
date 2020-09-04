From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 10:49:30 +0200
Subject: [Buildroot] [git commit] fs/common.mk: set SELinux file security
 contexts
Message-ID: <20200904123951.9338D87D64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b843d7817398e0b085a126f95d13ecd42b3ce33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set the SELinux file security contexts using setfiles when generating
root filesystem images.

Without such security contexts created at build time, they need to be
setup at first boot by running the restorecon utility on the target.
This has two drawbacks:

 - You have to special case the first boot, which cannot be done in
   enforcing mode, and will have to run restorecon, then reboot.

 - You cannot support read-only filesystems.

By setting up the security contexts at build time, we can have a
filesystem image that is immediately ready to boot an SELinux system
in enforcing mode, including if the root filesystem is read-only.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/common.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 842ea924a5..1b44dc42ba 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -49,6 +49,16 @@ ROOTFS_COMMON_DEPENDENCIES = \
 	$(BR2_TAR_HOST_DEPENDENCY) \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
+ifeq ($(BR2_PACKAGE_REFPOLICY),y)
+define ROOTFS_SELINUX
+	$(HOST_DIR)/sbin/setfiles -m -r $(TARGET_DIR) \
+		-c $(TARGET_DIR)/etc/selinux/targeted/policy/policy.$(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION) \
+		$(TARGET_DIR)/etc/selinux/targeted/contexts/files/file_contexts \
+		$(TARGET_DIR)
+endef
+ROOTFS_COMMON_DEPENDENCIES += host-policycoreutils
+endif
+
 ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES = $(sort \
 	$(if $(filter undefined,$(origin ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES__X)), \
 		$(eval ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES__X := \
@@ -172,6 +182,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
+	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) FAKEROOTDONTTRYCHOWN=1 $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
