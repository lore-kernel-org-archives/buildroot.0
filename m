From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 31 Jul 2014 23:26:38 +0800
Subject: [Buildroot] [PATCH v2] Add option to copy config file to rootfs
Message-ID: <1406820398-2105-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_CONFIG_COPY copies the config file to /etc/buildroot.config
as 0600 during target-finalize after overlay copy, but before
post-build script install.

---
Changes v1 to v2
 - Corrected wording of config helper message (Thomas De Schampheleire)
 - Moved order in menu to reflect actual order of the operation
---
 Makefile         |  4 ++++
 system/Config.in | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Makefile b/Makefile
index 022beea..cc49291 100644
--- a/Makefile
+++ b/Makefile
@@ -614,6 +614,10 @@ endif
 			--chmod=Du+w --exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
+ifeq ($(BR2_CONFIG_COPY),y)
+	$(INSTALL) -m 0600 .config $(TARGET_DIR)/etc/buildroot.config
+endif
+
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
diff --git a/system/Config.in b/system/Config.in
index e7e146a..a1ff23f 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -339,6 +339,17 @@ config BR2_ROOTFS_OVERLAY
 	  They are copied as-is into the rootfs, excluding files ending with
 	  ~ and .git, .svn and .hg directories.
 
+config BR2_CONFIG_COPY
+	bool "Copy buildroot .config file to rootfs"
+	help
+	  Copies the buildroot .config file into the rootfs.
+	  This may be useful for debugging.
+
+	  It will be put in /etc/buildroot.config with a mode of 0600
+
+	  However, be wary that it will contain the root password
+	  (if set) and other possibly sensitive data.
+
 config BR2_ROOTFS_POST_BUILD_SCRIPT
 	string "Custom scripts to run before creating filesystem images"
 	default ""
-- 
2.0.1
