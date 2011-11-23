From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 23 Nov 2011 17:24:06 -0500
Subject: [Buildroot] [PATCH] rootfs: clean up /etc/inittab
Message-ID: <1322087046-5473-1-git-send-email-twoerner@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If, for example, sysklogd is not selected try to strip out the logging
commands from /etc/inittab.
---
 target/generic/Makefile.in |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 4185202..bd400c3 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -31,6 +31,20 @@ target-generic-do-remount-rw:
 target-generic-dont-remount-rw:
 	$(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
 
+target-generic-no-util-linux:
+	$(SED) '/\<mount\>/d' $(TARGET_DIR)/etc/inittab
+	$(SED) '/\<umount\>/d' $(TARGET_DIR)/etc/inittab
+	$(SED) '/\<swapoff\>/d' $(TARGET_DIR)/etc/inittab
+
+target-generic-no-coreutils:
+	$(SED) '/\<mkdir\>/d' $(TARGET_DIR)/etc/inittab
+	$(SED) '/\<hostname\>/d' $(TARGET_DIR)/etc/inittab
+	$(SED) '/\<touch\>/d' $(TARGET_DIR)/etc/inittab
+
+target-generic-no-sysklogd:
+	$(SED) '/\<klogd\>/d' $(TARGET_DIR)/etc/inittab
+	$(SED) '/\<syslogd\>/d' $(TARGET_DIR)/etc/inittab
+
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 TARGETS += target-generic-hostname
 endif
@@ -50,4 +64,15 @@ TARGETS += target-generic-do-remount-rw
 else
 TARGETS += target-generic-dont-remount-rw
 endif
+ifneq ($(BR2_PACKAGE_BUSYBOX),y)
+ifneq ($(BR2_PACKAGE_UTIL_LINUX),y)
+TARGETS += target-generic-no-util-linux
+endif
+ifneq ($(BR2_PACAKGE_COREUTILS),y)
+TARGETS += target-generic-no-coreutils
+endif
+ifneq ($(BR2_PACKAGE_SYSKLOGD),y)
+TARGETS += target-generic-no-sysklogd
+endif
+endif
 endif
-- 
1.7.6.233.gd79bc
