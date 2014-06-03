From: Stephan Hoffmann <sho@relinux.de>
Date: Tue,  3 Jun 2014 11:29:11 +0200
Subject: [Buildroot] [PATCH v2] Allow setting the password for user default
Message-ID: <1401787751-32600-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
Since we can set the password for root while configuring the system
it seems logical to have the same possibility for user "default".

Changes v1 -> v2
  - remove rewording in help text for BR2_TARGET_GENERIC_ROOT_PASSWD
---
 system/Config.in | 23 ++++++++++++++++++++++-
 system/system.mk | 11 ++++++++++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 53bca53..d5408e1 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -211,6 +211,27 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  in the build log! Avoid using a valuable password if either the
 	  .config file or the build log may be distributed!
 
+config BR2_TARGET_GENERIC_DEFAULT_PASSWD
+	string "Password for user default"
+	default ""
+	help
+	  Set the initial password for user default (in clear). It will be encrypted.
+
+	  If set to empty (the default), then no password will be set,
+	  and default will need no password to log in.
+
+	  WARNING! WARNING!
+	  Although pretty strong, MD5 is now an old hash function, and
+	  suffers from some weaknesses, which makes it susceptible to attacks.
+	  It is showing its age, so this root password should not be trusted
+	  to properly secure any product that can be shipped to the wide,
+	  hostile world.
+
+	  WARNING! WARNING!
+	  The password appears in clear in the .config file, and may appear
+	  in the build log! Avoid using a valuable password if either the
+	  .config file or the build log may be distributed!
+
 config BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
 	default y
diff --git a/system/system.mk b/system/system.mk
index 01a6c3a..367a8c4 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -1,6 +1,7 @@
 TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
+TARGET_GENERIC_DEFAULT_PASSWD:=$(call qstrip,$(BR2_TARGET_GENERIC_DEFAULT_PASSWD))
 TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
 TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
@@ -29,6 +30,14 @@ target-root-passwd:
 		TARGET_GENERIC_ROOT_PASSWD_HASH=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
 	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
 
+ifneq ($(TARGET_GENERIC_DEFAULT_PASSWD),)
+target-default-passwd: host-mkpasswd
+endif
+target-default-passwd:
+	[ -n "$(TARGET_GENERIC_DEFAULT_PASSWD)" ] && \
+		TARGET_GENERIC_DEFAULT_PASSWD_HASH=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_DEFAULT_PASSWD)"); \
+	$(SED) "s,^default:[^:]*:,default:$$TARGET_GENERIC_DEFAULT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
+
 target-generic-getty-busybox:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
@@ -60,7 +69,7 @@ TARGETS += target-generic-issue
 endif
 
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
-TARGETS += target-root-passwd
+TARGETS += target-root-passwd target-default-passwd
 
 ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
 TARGETS += target-generic-getty-$(if $(BR2_PACKAGE_SYSVINIT),sysvinit,busybox)
-- 
2.0.0.rc2
