From: Lars Munch <lars@segv.dk>
Date: Tue, 12 Dec 2006 17:35:14 +0100
Subject: [Buildroot] [PATCH] Add libraw1394 to buildroot
Message-ID: <20061212163513.GA1105@tuxedo.home.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

The attached patch adds libraw1394-1.2.1 to buildroot. libraw1394 is a
library for direct access to IEEE 1394 bus.

Please apply.

-- Lars Munch


-------------- next part --------------
Index: buildroot/package/libraw1394/libraw1394.mk
===================================================================
--- buildroot/package/libraw1394/libraw1394.mk	(revision 0)
+++ buildroot/package/libraw1394/libraw1394.mk	(revision 0)
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
+		$(TARGET_CONFIGURE_OPTS) \
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
Index: buildroot/package/libraw1394/Config.in
===================================================================
--- buildroot/package/libraw1394/Config.in	(revision 0)
+++ buildroot/package/libraw1394/Config.in	(revision 0)
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
Index: buildroot/package/Config.in
===================================================================
--- buildroot/package/Config.in	(revision 16852)
+++ buildroot/package/Config.in	(working copy)
@@ -73,6 +73,7 @@
 source "package/libmad/Config.in"
 source "package/libpcap/Config.in"
 source "package/libpng/Config.in"
+source "package/libraw1394/Config.in"
 source "package/libsysfs/Config.in"
 source "package/libtool/Config.in"
 source "package/libusb/Config.in"
