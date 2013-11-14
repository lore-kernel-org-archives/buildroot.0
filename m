From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2013 19:46:59 +0100
Subject: [Buildroot] [PATCH 5/5] fs: ensure $(TARGET_DIR_WARNING_FILE) is
	writable
In-Reply-To: <cover.1384454667.git.yann.morin.1998@free.fr>
References: <cover.1384454667.git.yann.morin.1998@free.fr>
Message-ID: <9bc9c11ace25603f32efc9248e9a513581192f59.1384454667.git.yann.morin.1998@free.fr>
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
index b2b962c..d9125f4 100644
--- a/Makefile
+++ b/Makefile
@@ -435,7 +435,7 @@ $(BUILD_DIR)/.root:
 	rsync -a $(RSYNC_VCS_EXCLUSIONS) \
 		--chmod=Du+w --exclude .empty --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
-	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
 	@mkdir -p $(TARGET_DIR)/usr
 	@ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
diff --git a/fs/common.mk b/fs/common.mk
index aa9d961..76d648b 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -82,7 +82,7 @@ endif
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
