From: Assaf Inbal <shmuelzon@gmail.com>
Date: Sun, 25 Aug 2013 14:13:39 +0300
Subject: [Buildroot] [PATCH v2 2/2] getty: add the ability to pass options
	to getty
In-Reply-To: <1377429219-25140-1-git-send-email-shmuelzon@gmail.com>
References: <[Buildroot] [PATCH] getty: add the ability to pass options to
 getty> <1377429219-25140-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1377429219-25140-2-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 system/Config.in |    7 +++++++
 system/system.mk |    4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 403b229..1a1c34c 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -239,6 +239,13 @@ config BR2_TARGET_GENERIC_GETTY_TERM
 	default "vt100"
 	help
 	  Specify a TERM type.
+
+config BR2_TARGET_GENERIC_GETTY_OPTIONS
+	string "other options to pass to getty"
+	default ""
+	help
+	  Any other flags you want to pass to getty,
+	  Refer to getty --help for details.
 endif
 
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
diff --git a/system/system.mk b/system/system.mk
index c9e7cf7..01a6c3a 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -30,13 +30,13 @@ target-root-passwd:
 	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
 
 target-generic-getty-busybox:
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
 
 # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
 # skip the "tty" part and keep only the remaining.
 target-generic-getty-sysvinit:
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
 
 # Find commented line, if any, and remove leading '#'s
-- 
1.7.9.5
