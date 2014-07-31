From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 31 Jul 2014 21:46:54 +0800
Subject: [Buildroot] [PATCH 2/2] Add option to copy config file to rootfs
Message-ID: <1406814414-27217-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_CONFIG_COPY copies the config file to /etc/buildroot.config
as 0600 during target-finalize after overlay copy, but before
post-build script install.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
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
index e7e146a..94fb744 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -328,6 +328,17 @@ config BR2_ROOTFS_USERS_TABLES
 
 	  See manual for details on the usage and syntax of these files.
 
+config BR2_CONFIG_COPY
+	bool "Copy buildroot .config file to rootfs"
+	help
+	  Copies the .config file used to build the rootfs into the
+	  rootfs. This may be useful for debugging.
+
+	  It will be put in /etc/buildroot.config with a mode of 0600
+
+	  However, be wary that it will contain the root password
+	  (if set) and other possibly sensitive data.
+
 config BR2_ROOTFS_OVERLAY
 	string "Root filesystem overlay directories"
 	default ""
-- 
2.0.1
