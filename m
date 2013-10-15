From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Date: Tue, 15 Oct 2013 08:21:02 -0500
Subject: [Buildroot] [RFC PATCH] fs/common.mk: Add support for fakeroot
	script
Message-ID: <20131015132102.GA20116@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a BR2_ROOTFS_FAKE_ROOT_SCRIPT (similar to
BR2_ROOTFS_POST_BUILD_SCRIPT and BR2_ROOTFS_POST_IMAGE_SCRIPT). This
script is called inside the fakeroot which allows the script to change
permissions, create device nodes, etc.

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
---
 I am using this script as part of a configuration that creates a bunch
 of directories that need to have specific ownership.  I can create
 the directories in a post-build script, but permissions needed to be
 done in a fakeroot environment.  Didn't see any other way to hook into
 the fakeroot.

 fs/common.mk     |  2 ++
 system/Config.in | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 4dab7ea..dfcc647 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -58,6 +58,8 @@ endif
 endif
 	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' > $(USERS_TABLE)
 	$(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
+	$$(foreach s, $$(call qstrip,$$(BR2_ROOTFS_FAKE_ROOT_SCRIPT)), \
+		echo $$(s) $$(TARGET_DIR) $$(call qstrip,$$(BR2_ROOTFS_POST_SCRIPT_ARGS)) "|| exit"  >> $$(FAKEROOT_SCRIPT)$$(sep))
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	$$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
diff --git a/system/Config.in b/system/Config.in
index 4c80087..ef9c689 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -312,9 +312,23 @@ config BR2_ROOTFS_POST_IMAGE_SCRIPT
 	  first argument. The script is executed from the main Buildroot
 	  source directory as the current directory.
 
+config BR2_ROOTFS_FAKE_ROOT_SCRIPT
+	string "Custom scripts to run during fakeroot image creation"
+	default ""
+	help
+	  Specify a space-separated list of scripts to be run after the build
+	  has finished at the end of the fakeroot filesystem image creation.
+
+	  This gives a final chance to change permissions, create device
+	  nodes, etc.
+
+	  These scripts are called with the target directory name as first
+	  argument. Make sure the exit code of those scripts are 0, otherwise
+	  make will stop after calling them.
+
 config BR2_ROOTFS_POST_SCRIPT_ARGS
 	string "Extra post-{build,image} arguments"
-	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" || BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
+	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" || BR2_ROOTFS_POST_IMAGE_SCRIPT != "" || BR2_ROOTFS_FAKE_ROOT_SCRIPT != ""
 	help
 	  Pass these aditional arguments to each post-build or post-image
 	  scripts.
-- 
1.8.4.rc3
