From: Norbert Lange <nolange79@gmail.com>
Date: Sat,  6 Jun 2020 00:48:57 +0200
Subject: [Buildroot] [PATCH 2/2] fs: clean the volatile /run and /tmp
 directories
In-Reply-To: <20200605224858.12870-1-nolange79@gmail.com>
References: <20200605224858.12870-1-nolange79@gmail.com>
Message-ID: <20200605224858.12870-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scripts in the fakeroot environment could call
tools preparing the early environment, leaving
traces in /run or /tmp.

mkusers might create home directories in /run for
example.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 fs/common.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/common.mk b/fs/common.mk
index 842ea924a5..a5c6b4ea96 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -171,6 +171,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
+	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-- 
2.26.2
