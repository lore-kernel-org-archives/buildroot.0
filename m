From: Stephan Henningsen <stephan@asklandd.dk>
Date: Wed, 23 Oct 2019 23:14:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/sudo: removed template config,
 added convenient 'sudo' group config options.
Message-ID: <20191023211439.7754-1-stephan+buildroot@asklandd.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
---
 package/sudo/Config.in | 21 ++++++++++++++++++++-
 package/sudo/sudo.mk   | 20 ++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index cbef15d67b..aee077fe3b 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_SUDO
+menuconfig BR2_PACKAGE_SUDO
 	bool "sudo"
 	# uses fork()
 	depends on BR2_USE_MMU
@@ -9,3 +9,22 @@ config BR2_PACKAGE_SUDO
 	  but still allow people to get their work done.
 
 	  http://www.sudo.ws/sudo/
+
+
+if BR2_PACKAGE_SUDO
+
+config BR2_PACKAGE_SUDO_GROUP
+	bool "add system group 'sudo'"
+	help
+	  Create a convenient system group named 'sudo' for
+	  granting users sudo permissions.
+
+config BR2_PACKAGE_SUDO_GROUP_RULE
+	bool "allow member of group 'sudo' to execute any command."
+	select BR2_PACKAGE_SUDO_GROUP
+	help
+	  Reinserts this rule from the /etc/sudoers configuration file:
+
+	  %sudo ALL=(ALL) ALL
+
+endif
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index cf8b63b1db..34b1869e98 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -64,4 +64,24 @@ define SUDO_PERMISSIONS
 	/usr/bin/sudo f 4755 0 0 - - - - -
 endef
 
+ifeq ($(BR2_PACKAGE_SUDO_GROUP_RULE),y)
+define SUDO_ENABLE_SUDO_GROUP_RULE
+sed -e '/^# \%sudo\tALL=(ALL) ALL/s/^# //' -i $(TARGET_DIR)/etc/sudoers
+endef
+SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
+endif
+
+
+ifeq ($(BR2_PACKAGE_SUDO_GROUP),y)
+define SUDO_USERS
+    -               -1   sudo            -1   -             -            -         -
+endef
+endif
+
+define SUDO_REMOVE_GARBAGE
+	$(RM) -fv $(TARGET_DIR)/etc/sudoers.dist # Remove stray example file
+	$(RM) -frv $(TARGET_DIR)/etc/sudoers.d # Remove unused configuration directory
+endef
+SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_REMOVE_GARBAGE
+
 $(eval $(autotools-package))
-- 
2.17.1
