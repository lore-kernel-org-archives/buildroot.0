From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 14 Oct 2011 15:51:53 +0100
Subject: [Buildroot] [PATCH 1/9] Allow timezone to be set in configuration
In-Reply-To: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1318603921-22899-2-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a config option for the timezone which the user can configure for their needs

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 fs/skeleton/etc/TZ         |    2 +-
 target/generic/Config.in   |    6 ++++++
 target/generic/Makefile.in |    5 +++++
 3 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/fs/skeleton/etc/TZ b/fs/skeleton/etc/TZ
index 9fcb2a3..885c76d 100644
--- a/fs/skeleton/etc/TZ
+++ b/fs/skeleton/etc/TZ
@@ -1 +1 @@
-MST7MDT
+MST7MDT # GENERIC_TIMEZONE
diff --git a/target/generic/Config.in b/target/generic/Config.in
index a91de32..0253f3c 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -127,6 +127,12 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	  read-only.
 	  If unsure, say Y.
 
+config BR2_TARGET_GENERIC_TIMEZONE
+	string "Timezone configured in /etc/TZ"
+	default "MST7MDT"
+	help
+	  Specify the configured timezone.
+
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_ROOTFS_POST_BUILD_SCRIPT
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 4185202..3a33ef4 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -2,6 +2,7 @@ TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
+TARGET_GENERIC_TIMEZONE:=$(call qstrip,$(BR2_TARGET_GENERIC_TIMEZONE))
 
 target-generic-hostname:
 	mkdir -p $(TARGET_DIR)/etc
@@ -31,6 +32,9 @@ target-generic-do-remount-rw:
 target-generic-dont-remount-rw:
 	$(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
 
+target_generic_timezone:
+	$(SED) '/# GENERIC_TIMEZONE$$/s~^.*#~$(TARGET_GENERIC_TIMEZONE) #~' $(TARGET_DIR)/etc/TZ
+
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 TARGETS += target-generic-hostname
 endif
@@ -50,4 +54,5 @@ TARGETS += target-generic-do-remount-rw
 else
 TARGETS += target-generic-dont-remount-rw
 endif
+TARGETS += target_generic_timezone
 endif
-- 
1.7.2.5
