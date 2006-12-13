From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 01:13:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libraw1394
Message-ID: <20061213091316.926C948563@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 01:13:15 -0800 (Wed, 13 Dec 2006)
New Revision: 16879

Log:
- add libraw1394, thanks to Lars Munch


Added:
   trunk/buildroot/package/libraw1394/
   trunk/buildroot/package/libraw1394/Config.in
   trunk/buildroot/package/libraw1394/libraw1394.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-12-13 09:04:58 UTC (rev 16878)
+++ trunk/buildroot/package/Config.in	2006-12-13 09:13:15 UTC (rev 16879)
@@ -75,6 +75,7 @@
 source "package/libmad/Config.in"
 source "package/libpcap/Config.in"
 source "package/libpng/Config.in"
+source "package/libraw1394/Config.in"
 source "package/libsysfs/Config.in"
 source "package/libtool/Config.in"
 source "package/libusb/Config.in"

Added: trunk/buildroot/package/libraw1394/Config.in
===================================================================
--- trunk/buildroot/package/libraw1394/Config.in	2006-12-13 09:04:58 UTC (rev 16878)
+++ trunk/buildroot/package/libraw1394/Config.in	2006-12-13 09:13:15 UTC (rev 16879)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBRAW1394
+	bool "libraw1394"
+	default n
+	help
+		Library for direct access to IEEE 1394 bus.
+
+		Through libraw1394/raw1394, applications can directly
+		send to and receive from other nodes without requiring
+		a kernel driver for the protocol in question.
+
+		http://www.linux1394.org/

Added: trunk/buildroot/package/libraw1394/libraw1394.mk
===================================================================
--- trunk/buildroot/package/libraw1394/libraw1394.mk	2006-12-13 09:04:58 UTC (rev 16878)
+++ trunk/buildroot/package/libraw1394/libraw1394.mk	2006-12-13 09:13:15 UTC (rev 16879)
@@ -0,0 +1,60 @@
+#############################################################
+#
+# libraw1394
+#
+#############################################################
+
+LIBRAW1394_VERSION:=1.2.1
+LIBRAW1394_SOURCE:=libraw1394-$(LIBRAW1394_VERSION).tar.gz
+LIBRAW1394_SITE:=http://www.linux1394.org/dl
+LIBRAW1394_DIR:=$(BUILD_DIR)/libraw1394-$(LIBRAW1394_VERSION)
+
+$(DL_DIR)/$(LIBRAW1394_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBRAW1394_SITE)/$(LIBRAW1394_SOURCE)
+
+$(LIBRAW1394_DIR)/.source: $(DL_DIR)/$(LIBRAW1394_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(LIBRAW1394_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(LIBRAW1394_DIR)/.source
+
+$(LIBRAW1394_DIR)/.configured: $(LIBRAW1394_DIR)/.source
+	(cd $(LIBRAW1394_DIR); \
+		$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD="$(HOSTCC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+			--target=$(GNU_TARGET_NAME) \
+			--host=$(GNU_TARGET_NAME) \
+			--build=$(GNU_HOST_NAME) \
+			--prefix=$(STAGING_DIR) \
+	);
+	touch $(LIBRAW1394_DIR)/.configured;
+
+$(LIBRAW1394_DIR)/.compiled: $(LIBRAW1394_DIR)/.configured
+	$(MAKE) -C $(LIBRAW1394_DIR)
+	touch $(LIBRAW1394_DIR)/.compiled
+
+$(STAGING_DIR)/lib/libraw1394.so: $(LIBRAW1394_DIR)/.compiled
+	make -C $(LIBRAW1394_DIR)/src install
+
+$(TARGET_DIR)/usr/lib/libraw1394.so: $(STAGING_DIR)/lib/libraw1394.so
+	cp -dpf $(STAGING_DIR)/lib/libraw1394.so* $(TARGET_DIR)/usr/lib/
+
+libraw1394: uclibc $(TARGET_DIR)/usr/lib/libraw1394.so
+
+libraw1394-source: $(DL_DIR)/$(LIBRAW1394_SOURCE)
+
+libraw1394-clean:
+	rm $(TARGET_DIR)/usr/lib/libraw1394.so*
+	-$(MAKE) -C $(LIBRAW1394_DIR) clean
+
+libraw1394-dirclean:
+	rm -rf $(LIBRAW1394_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBRAW1394)),y)
+TARGETS+=libraw1394
+endif
+
