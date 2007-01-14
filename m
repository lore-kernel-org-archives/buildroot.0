From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 21:38:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libevent
Message-ID: <20070114053801.894D7485C4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 21:38:00 -0800 (Sat, 13 Jan 2007)
New Revision: 17292

Log:
Add libevent package. I started building all the components needed for NFSv4 support of which libevent is one of them. The rest of the needed components, however, are horrific to get building.


Added:
   trunk/buildroot/package/libevent/
   trunk/buildroot/package/libevent/Config.in
   trunk/buildroot/package/libevent/libevent-time_h.patch
   trunk/buildroot/package/libevent/libevent.mk


Changeset:
Added: trunk/buildroot/package/libevent/Config.in
===================================================================
--- trunk/buildroot/package/libevent/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libevent/Config.in	2007-01-14 05:38:00 UTC (rev 17292)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBEVENT
+	bool "libevent"
+	default n
+	help
+	  Userspace library for handling asynchronous notifications
+
+	  http://monkey.org/~provos/

Added: trunk/buildroot/package/libevent/libevent-time_h.patch
===================================================================
--- trunk/buildroot/package/libevent/libevent-time_h.patch	                        (rev 0)
+++ trunk/buildroot/package/libevent/libevent-time_h.patch	2007-01-14 05:38:00 UTC (rev 17292)
@@ -0,0 +1,11 @@
+diff -ur libevent-1.2/event.c libevent-1.2-patched/event.c
+--- libevent-1.2/event.c	2006-08-12 12:41:36.000000000 -0500
++++ libevent-1.2-patched/event.c	2007-01-13 23:33:05.340351152 -0600
+@@ -41,6 +41,7 @@
+ #else 
+ #include <sys/_time.h>
+ #endif
++#include <time.h>
+ #include <sys/queue.h>
+ #include <stdio.h>
+ #include <stdlib.h>

Added: trunk/buildroot/package/libevent/libevent.mk
===================================================================
--- trunk/buildroot/package/libevent/libevent.mk	                        (rev 0)
+++ trunk/buildroot/package/libevent/libevent.mk	2007-01-14 05:38:00 UTC (rev 17292)
@@ -0,0 +1,62 @@
+#############################################################
+#
+# libevent
+#
+#############################################################
+LIBEVENT_VER:=1.2
+LIBEVENT_SOURCE:=libevent-$(LIBEVENT_VER).tar.gz
+LIBEVENT_SITE:=http://monkey.org/~provos/
+LIBEVENT_DIR:=$(BUILD_DIR)/libevent-$(LIBEVENT_VER)
+LIBEVENT_CAT:=$(ZCAT)
+LIBEVENT_BINARY:=libevent.la
+LIBEVENT_TARGET_BINARY:=usr/lib/libevent.so
+
+$(DL_DIR)/$(LIBEVENT_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBEVENT_SITE)/$(LIBEVENT_SOURCE)
+
+libevent-unpacked: $(LIBEVENT_DIR)/.unpacked
+$(LIBEVENT_DIR)/.unpacked: $(DL_DIR)/$(LIBEVENT_SOURCE)
+	$(LIBEVENT_CAT) $(DL_DIR)/$(LIBEVENT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBEVENT_DIR) package/libevent/ *.patch
+	touch $(LIBEVENT_DIR)/.unpacked
+
+$(LIBEVENT_DIR)/.configured: $(LIBEVENT_DIR)/.unpacked
+	(cd $(LIBEVENT_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD=$(HOSTCC) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--disable-static \
+		--with-gnu-ld \
+	);
+	touch $(LIBEVENT_DIR)/.configured
+
+$(LIBEVENT_DIR)/$(LIBEVENT_BINARY): $(LIBEVENT_DIR)/.configured
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(LIBEVENT_DIR)
+
+$(STAGING_DIR)/$(LIBEVENT_TARGET_BINARY): $(LIBEVENT_DIR)/$(LIBEVENT_BINARY)
+	make -C $(LIBEVENT_DIR) DESTDIR=$(STAGING_DIR) install
+
+$(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY): $(STAGING_DIR)/$(LIBEVENT_TARGET_BINARY)
+	make -C $(LIBEVENT_DIR) DESTDIR=$(TARGET_DIR) install
+	rm -f $(TARGET_DIR)/usr/lib/libevent*.la $(TARGET_DIR)/usr/include/ev*
+
+libevent: uclibc $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY)
+
+libevent-clean:
+	rm -f $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY)
+	-$(MAKE) -C $(LIBEVENT_DIR) clean
+
+libevent-dirclean:
+	rm -rf $(LIBEVENT_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBEVENT)),y)
+TARGETS+=libevent
+endif
