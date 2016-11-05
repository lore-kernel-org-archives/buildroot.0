From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Nov 2016 11:46:08 +0100
Subject: [Buildroot] [PATCH 2/2] Revert "fs: use pseudo instead of fakeroot"
In-Reply-To: <cover.1478342758.git.yann.morin.1998@free.fr>
References: <cover.1478342758.git.yann.morin.1998@free.fr>
Message-ID: <36f1f34245e00371a238d122d495393e9d383dc8.1478342758.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using pseudo instead of fakeroot is not without bringing new issues:
  - dependency on sqlite3 and attr,
  - not compatible with python3.

The last one is the most troublesome, as it is very difficult to make it
compatible (as <dkc> said on IRC: we played the "is this a string or a
byte array?" game).

Revert back to using fakeroot for the release.

We can revisit using pseudo when upstream has fixed the python3 issues
(the process is on-going).

This reverts commit 8035ceb56cc3ba2541aba0d0ead3f29900d9e310.

Reported-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/common.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 2dbef4d..2b31e12 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -43,7 +43,7 @@ ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 define ROOTFS_TARGET_INTERNAL
 
 # extra deps
-ROOTFS_$(2)_DEPENDENCIES += host-pseudo host-makedevs \
+ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
 	$$(if $$(PACKAGES_USERS)$$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
@@ -97,7 +97,7 @@ endif
 		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo -- $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
-- 
2.7.4
