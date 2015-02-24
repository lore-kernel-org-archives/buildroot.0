From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Tue, 24 Feb 2015 16:47:35 +0100
Subject: [Buildroot] [PATCH 2/2] fs: add custom fakeroot script support
In-Reply-To: <1424792855-14278-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1424792855-14278-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <1424792855-14278-2-git-send-email-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add a new config option, BR2_ROOTFS_FAKEROOT_SCRIPT, a list of
scripts that are executed in the fakeroot environment as the last step
before creating the filesystem image.

The scripts can for example be used to invoke a tool that operates on
file ownerships, device nodes or any other custom action that requires
root privileges.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 fs/common.mk     |  1 +
 system/Config.in | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 1d3926f..5c4cd6a 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -87,6 +87,7 @@ ifneq ($$(ROOTFS_USERS_TABLES),)
 endif
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
 	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
+	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_FAKEROOT_SCRIPT)),echo $$(s) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
diff --git a/system/Config.in b/system/Config.in
index 95e10ab..b416377 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -421,6 +421,22 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
 	  argument. Make sure the exit code of those scripts are 0, otherwise
 	  make will stop after calling them.
 
+config BR2_ROOTFS_FAKEROOT_SCRIPT
+	string "Custom scripts to run as fake root"
+	default ""
+	help
+	  Specify a space-separated list of scripts to be run as part
+	  of the fakeroot script, just before Buildroot packs the
+	  files into selected filesystem images.
+
+	  This can for example be used to invoke a tool that operates on
+	  file ownerships, device nodes or any other custom action that
+	  requires root privileges.
+
+	  These scripts are called with the target directory name as
+	  first argument. The script is executed from the main Buildroot
+	  source directory as the current directory.
+
 config BR2_ROOTFS_POST_IMAGE_SCRIPT
 	string "Custom scripts to run after creating filesystem images"
 	default ""
-- 
1.9.3
