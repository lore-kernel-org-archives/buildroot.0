From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 22:17:53 +0200
Subject: [Buildroot] [git commit] getty: add the ability to pass options to
	getty
Message-ID: <20130915201927.104B888DFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a68a51257e9ba0f1654d6ca087bb5259841952e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/Config.in |    7 +++++++
 system/system.mk |    5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 92dc7dd..73986fb 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -244,6 +244,13 @@ config BR2_TARGET_GENERIC_GETTY_TERM
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
 endmenu
 endif
 
diff --git a/system/system.mk b/system/system.mk
index 0d23d54..01a6c3a 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -5,6 +5,7 @@ TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD)
 TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
+TARGET_GENERIC_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
 
 target-generic-securetty:
 	grep -q '^$(TARGET_GENERIC_GETTY_PORT)$$' $(TARGET_DIR)/etc/securetty || \
@@ -29,13 +30,13 @@ target-root-passwd:
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
