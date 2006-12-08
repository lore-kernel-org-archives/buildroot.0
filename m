From: Petr Stetiar <ynezz@true.cz>
Date: Fri, 8 Dec 2006 21:06:54 +0100
Subject: [Buildroot] [PATCH] udev package fixes
Message-ID: <20061208200654.GB3087@ibawizard.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes two issues in udev package:

1. mkdir: cannot create directory `/root/src/buildroot/build_i686/root/ 
   etc/udev/rules.d': No such file or directory
2. /usr/bin/install: cannot stat `package/udev/udev.conf': No such file or
   directory

-- ynezz
-------------- next part --------------
Index: udev.conf
===================================================================
--- udev.conf	(revision 0)
+++ udev.conf	(revision 0)
@@ -0,0 +1,7 @@
+# udev.conf
+
+# The initial syslog(3) priority: "err", "info", "debug" or its
+# numerical equivalent. For runtime debugging, the daemons internal
+# state can be changed with: "udevcontrol log_priority=<value>".
+udev_log="err"
+udev_root=/dev
Index: udev.mk
===================================================================
--- udev.mk	(revision 16820)
+++ udev.mk	(working copy)
@@ -49,7 +49,7 @@
 
 $(TARGET_DIR)/$(UDEV_TARGET_BINARY): $(UDEV_DIR)/$(UDEV_BINARY)
 	-mkdir $(TARGET_DIR)/sys
-	-mkdir $(TARGET_DIR)/etc/udev/rules.d
+	-mkdir -p $(TARGET_DIR)/etc/udev/rules.d
 	$(INSTALL) -D -m 0644 $(UDEV_DIR)/$(UDEV_CONF) \
 		$(TARGET_DIR)/etc/udev/rules.d
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC=$(TARGET_CC)  LD=$(TARGET_CC) \
