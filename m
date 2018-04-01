From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:40:29 +0200
Subject: [Buildroot] [git commit] fs/ubi: use namespace for internal variable
Message-ID: <20180401064047.F0A2981D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f2b06f455f23bc6e191a8aa2930756d668aca3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

UBINIZE_CONFIG_FILE_PATH is only used inside this file, so rename it to
start with UBI_, following the namespace convention already used by
common packages.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/ubi/ubi.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubi/ubi.mk b/fs/ubi/ubi.mk
index c78feda5a3..9874e73ff6 100644
--- a/fs/ubi/ubi.mk
+++ b/fs/ubi/ubi.mk
@@ -15,16 +15,16 @@ UBI_UBINIZE_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_OPTS))
 ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
 
 ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
-UBINIZE_CONFIG_FILE_PATH = $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE))
+UBI_UBINIZE_CONFIG_FILE_PATH = $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE))
 else
-UBINIZE_CONFIG_FILE_PATH = fs/ubi/ubinize.cfg
+UBI_UBINIZE_CONFIG_FILE_PATH = fs/ubi/ubinize.cfg
 endif
 
 # don't use sed -i as it misbehaves on systems with SELinux enabled when this is
 # executed through fakeroot (see #9386)
 define ROOTFS_UBI_CMD
 	sed 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' \
-		$(UBINIZE_CONFIG_FILE_PATH) > $(BUILD_DIR)/ubinize.cfg
+		$(UBI_UBINIZE_CONFIG_FILE_PATH) > $(BUILD_DIR)/ubinize.cfg
 	$(HOST_DIR)/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
 	rm $(BUILD_DIR)/ubinize.cfg
 endef
