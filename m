From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 10:59:44 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20061129185944.32BC84858D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 10:59:43 -0800 (Wed, 29 Nov 2006)
New Revision: 16723

Log:
- build a udev for the target rather than for the host.


Modified:
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2006-11-29 18:15:52 UTC (rev 16722)
+++ trunk/buildroot/package/udev/udev.mk	2006-11-29 18:59:43 UTC (rev 16723)
@@ -11,6 +11,13 @@
 UDEV_TARGET_BINARY:=sbin/udev
 UDEV_BINARY:=udev
 
+# 094 had _GNU_SOURCE set
+BR2_UDEV_CFLAGS:= -D_GNU_SOURCE $(TARGET_CFLAGS)
+ifeq ($(BR2_LARGEFILE),)
+BR2_UDEV_CFLAGS+=-U_FILE_OFFSET_BITS
+endif
+
+
 # UDEV_ROOT is /dev so we can replace devfs, not /udev for experiments
 UDEV_ROOT:=/dev
 
@@ -28,7 +35,8 @@
 	touch $(UDEV_DIR)/.configured
 
 $(UDEV_DIR)/$(UDEV_BINARY): $(UDEV_DIR)/.configured
-	$(MAKE) CROSS=$(TARGET_CROSS) GCC=$(TARGET_CC) \
+	$(MAKE) CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LD=$(TARGET_CC) \
+		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR)
 	touch -c $(UDEV_DIR)/$(UDEV_BINARY)
@@ -43,7 +51,10 @@
 	-mkdir $(TARGET_DIR)/sys
 	install -D -m 0644 $(UDEV_DIR)/$(UDEV_CONF) \
 		$(TARGET_DIR)/etc/udev/rules.d/50-udev.rules
-	$(MAKE) CROSS=$(TARGET_CROSS) GCC=$(TARGET_CC) DESTDIR=$(TARGET_DIR) \
+	$(MAKE) CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LD=$(TARGET_CC) \
+		DESTDIR=$(TARGET_DIR) \
+		CFLAGS="$(BR2_UDEV_CFLAGS)" \
+		LDFLAGS="-warn-common" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR) install
 	$(INSTALL) -m 0755 -D package/udev/init-udev $(TARGET_DIR)/etc/init.d/S10udev
