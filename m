From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 21:36:15 +0100
Subject: [Buildroot] [git commit] fs: use pseudo instead of fakeroot
Message-ID: <20161103203922.8DFE981992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8035ceb56cc3ba2541aba0d0ead3f29900d9e310
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fakeroot misbhaves when there are SElinux contexts, as reported in #9386,
and further detailed in https://bugzilla.redhat.com/show_bug.cgi?id=1238802

A proposal in the FC bug is to use pseudo instead of fakeroot. Pseudo is
a from-scratch re-implementation of fakeroot; it is used in Poky/OE
instead of fakeroot.

Fixes #9386.

Reported-by: Andrey Yurovsky <yurovsky@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Andrey Yurovsky <yurovsky@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 2b31e12..2dbef4d 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -43,7 +43,7 @@ ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 define ROOTFS_TARGET_INTERNAL
 
 # extra deps
-ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
+ROOTFS_$(2)_DEPENDENCIES += host-pseudo host-makedevs \
 	$$(if $$(PACKAGES_USERS)$$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
@@ -97,7 +97,7 @@ endif
 		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
