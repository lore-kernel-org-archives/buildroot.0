From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 29 Sep 2010 10:21:06 +0200
Subject: [Buildroot] [PATCHv2 2/4] Enable terminal type configuration for
	/etc/inittab
Message-ID: <4CA2F6F2.4010303@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

String value BR2_TARGET_GENERIC_GETTY_TERMINAL_TYPE will be used
to store a terminal type like vt100, ansi, linux etc.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Index: b/target/generic/Config.in
===================================================================
--- a/target/generic/Config.in	2010-09-29 10:00:30.000000000 +0200
+++ b/target/generic/Config.in	2010-09-29 10:02:34.000000000 +0200
@@ -155,6 +155,12 @@
 	bool "115200"
 endchoice
 
+config BR2_TARGET_GENERIC_GETTY_TERMINAL_TYPE
+	string "Terminal type"
+	default "vt100"
+	help
+	  Specify a terminal type like vt100, linux etc.
+
 config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 	string
 	default "0"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP
Index: b/target/generic/Makefile.in
===================================================================
--- a/target/generic/Makefile.in	2010-09-29 10:00:30.000000000 +0200
+++ b/target/generic/Makefile.in	2010-09-29 10:01:41.000000000 +0200
@@ -2,6 +2,7 @@
 TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
+TARGET_GENERIC_GETTY_TERMINAL_TYPE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERMINAL_TYPE))
 
 target-generic-hostname:
 	mkdir -p $(TARGET_DIR)/etc
@@ -12,7 +13,7 @@
 	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
 
 target-generic-getty:
-	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERMINAL_TYPE) #~' \
 		$(TARGET_DIR)/etc/inittab
 
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
