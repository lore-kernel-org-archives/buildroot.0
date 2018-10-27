From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Oct 2018 09:45:59 +0200
Subject: [Buildroot] [PATCH 2/3] fs: be oblivious of pre-existing xattrs
In-Reply-To: <cover.1540626349.git.yann.morin.1998@free.fr>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
Message-ID: <ee8beeb5af2d893714d4aa82915e7068154ba46e.1540626349.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we handle permissions in each filesystems, and no longer in the
intermediate tarball, we no longer need tar to store extended attributes.

What's more, we really want it to store no attributes at all, to be sure
we don't have rogue extended attributes leaking in...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/common.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 569e5d60c5..fd1e80ab93 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -45,6 +45,7 @@ ROOTFS_COMMON_TAR = $(FS_DIR)/rootfs.common.tar
 # Command to create the common tarball from the base target directory.
 define ROOTFS_COMMON_TAR_CMD
 	tar cf $(ROOTFS_COMMON_TAR) --numeric-owner \
+		--no-xattrs \
 		--exclude=$(notdir $(TARGET_DIR_WARNING_FILE)) \
 		-C $(TARGET_DIR) .
 endef
@@ -52,7 +53,9 @@ endef
 # Command to extract the common tarball into the per-rootfs target directory
 define ROOTFS_COMMON_UNTAR_CMD
 	mkdir -p $(TARGET_DIR)
-	tar xf $(ROOTFS_COMMON_TAR) -C $(TARGET_DIR)
+	tar xf $(ROOTFS_COMMON_TAR) \
+		--no-xattrs \
+		-C $(TARGET_DIR)
 endef
 
 .PHONY: rootfs-common
-- 
2.14.1
