From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jan 2014 21:11:25 +0100
Subject: [Buildroot] [PATCH 5/5] fs: ensure $(TARGET_DIR_WARNING_FILE) is
	writable
In-Reply-To: <cover.1390939719.git.yann.morin.1998@free.fr>
References: <cover.1390939719.git.yann.morin.1998@free.fr>
Message-ID: <be9f56b1fa250b4860de767e4c118980796732d8.1390939719.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

If the Buildroot tree is read-only, then $(TARGET_DIR_WARNING_FILE) is
copied read-only into target/ but we may want to remove it during the
build process.

This poses no real problem, since target/ itself is guaranteed to be
writable, but for good measure, force $(TARGET_DIR_WARNING_FILE) to be
writable itself.

Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile     | 2 +-
 fs/common.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d8a8dad..dc57cf4 100644
--- a/Makefile
+++ b/Makefile
@@ -475,7 +475,7 @@ $(BUILD_DIR)/.root:
 	rsync -a $(RSYNC_VCS_EXCLUSIONS) \
 		--chmod=Du+w --exclude .empty --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
-	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
 	@mkdir -p $(TARGET_DIR)/usr
 	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
diff --git a/fs/common.mk b/fs/common.mk
index 9f32620..30e7524 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -83,7 +83,7 @@ endif
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	$$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
-	cp support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	$$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
-- 
1.8.1.2
