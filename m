From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Oct 2009 21:40:05 +0200
Subject: [Buildroot] [git commit master] buildroot: reinstate /etc/{hostname,
	issue} kconfig when using generic target
Message-ID: <20091001194037.85A3E777AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d65976fe26cbf2ef69d5a3bf324349475b5b1b68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These got lost in the recent cleanup, but are handy for minimal rootfs
customization.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/Config.in   |   17 ++++++++++++++++-
 target/generic/Makefile.in |   16 ++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/target/generic/Config.in b/target/generic/Config.in
index 5de5811..b70874a 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -61,9 +61,22 @@ config BR2_TARGET_GENERIC_DEV_SYSTEM
 comment "Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
 	depends on !(BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
 
+if !(BR2_TARGET_ATMEL||BR2_TARGET_KWIKBYTE||BR2_TARGET_VALKA)
+
+config BR2_TARGET_GENERIC_HOSTNAME
+       string "System hostname"
+       default "buildroot"
+       help
+         Select system hostname to be stored in /etc/hostname.
+
+config BR2_TARGET_GENERIC_ISSUE
+       string "System banner"
+       default "Welcome to Buildroot"
+       help
+         Select system banner (/etc/issue) to be displayed at login.
+
 menuconfig BR2_TARGET_GENERIC_GETTY
 	bool "Generic serial port config"
-	depends on !(BR2_TARGET_ATMEL||BR2_TARGET_KWIKBYTE||BR2_TARGET_VALKA)
 
 if BR2_TARGET_GENERIC_GETTY
 
@@ -214,4 +227,6 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 	default "57600"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600
 	default "115200"	if BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
 
+endif # BR2_TARGET_GENERIC_GETTY
+
 endif
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 084acf4..31f4a0c 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -10,10 +10,26 @@ endif
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 
+target-generic-hostname:
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
+
+target-generic-issue:
+	mkdir -p $(TARGET_DIR)/etc
+	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
+
 target-generic-getty:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
 		$(TARGET_DIR)/etc/inittab
 
+ifneq ($(BR2_TARGET_GENERIC_HOSTNAME),)
+TARGETS += target-generic-hostname
+endif
+
+ifneq ($(BR2_TARGET_GENERIC_ISSUE),)
+TARGETS += target-generic-issue
+endif
+
 ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
 TARGETS += target-generic-getty
 endif
-- 
1.6.3.3
