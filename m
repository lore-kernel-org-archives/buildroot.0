From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 24 Sep 2010 09:37:34 +0200
Subject: [Buildroot] [PATCH 2/4] Enable terminal type configuration for
	/etc/inittab
In-Reply-To: <4C9C54FC.4040609@visionsystems.de>
References: <4C9C54A9.20803@visionsystems.de>
	<4C9C54FC.4040609@visionsystems.de>
Message-ID: <4C9C553E.8040105@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 target/generic/Config.in   |    6 ++++++
 target/generic/Makefile.in |    3 ++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/target/generic/Config.in b/target/generic/Config.in
index 286b0a3..e7b2c9f 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -164,6 +164,12 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
 	bool "115200"
 endchoice
 
+config BR2_TARGET_GENERIC_GETTY_TERMINAL_TYPE
+	string "Terminal type"
+	default "vt100"
+	help
+		Specify a terminal type like vt100, linux etc.
+
 config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 	string
 	default "0"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 1ef2a9d..dce23e6 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -2,6 +2,7 @@ TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
+TARGET_GENERIC_GETTY_TERMINAL_TYPE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERMINAL_TYPE))
 
 target-generic-hostname:
 	mkdir -p $(TARGET_DIR)/etc
@@ -12,7 +13,7 @@ target-generic-issue:
 	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
 
 target-generic-getty:
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERMINAL_TYPE) #~' \
 		$(TARGET_DIR)/etc/inittab
 
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
