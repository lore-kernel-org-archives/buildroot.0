From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 16 Jul 2007 13:13:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libxml2
Message-ID: <20070716201325.607F6A685B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-16 13:13:22 -0700 (Mon, 16 Jul 2007)
New Revision: 19113

Log:
Add libxml2 package

Added:
   trunk/buildroot/package/libxml2/
   trunk/buildroot/package/libxml2/Config.in
   trunk/buildroot/package/libxml2/libxml2.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-16 19:03:46 UTC (rev 19112)
+++ trunk/buildroot/package/Config.in	2007-07-16 20:13:22 UTC (rev 19113)
@@ -68,6 +68,7 @@
 source "package/libfloat/Config.in"
 source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
+source "package/libxml2/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"

Added: trunk/buildroot/package/libxml2/Config.in
===================================================================
--- trunk/buildroot/package/libxml2/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libxml2/Config.in	2007-07-16 20:13:22 UTC (rev 19113)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBXML2
+	bool "libxml2"
+	default n
+	help
+	  XML C Parser
+	  Requires WCHAR
+
+	  ftp://xmlsoft.org/libxml2

Added: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	                        (rev 0)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2007-07-16 20:13:22 UTC (rev 19113)
@@ -0,0 +1,77 @@
+#############################################################
+#
+# libxml2
+#
+#############################################################
+
+LIBXML2_VERSION=2.6.29
+LIBXML2_SOURCE=libxml2-sources-$(LIBXML2_VERSION).tar.gz
+LIBXML2_SITE=ftp://xmlsoft.org/libxml2
+LIBXML2_DIR=$(BUILD_DIR)/libxml2-$(LIBXML2_VERSION)
+LIBXML2_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(LIBXML2_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBXML2_SITE)/$(LIBXML2_SOURCE)
+
+$(LIBXML2_DIR)/.unpacked: $(DL_DIR)/$(LIBXML2_SOURCE)
+	$(LIBXML2_CAT) $(DL_DIR)/$(LIBXML2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(LIBXML2_DIR)/.unpacked
+
+$(LIBXML2_DIR)/.configured: $(LIBXML2_DIR)/.unpacked
+	(cd $(LIBXML2_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--enable-shared \
+		$(DISABLE_NLS) \
+	);
+	touch $(LIBXML2_DIR)/.configured
+
+$(LIBXML2_DIR)/libxml2.la: $(LIBXML2_DIR)/.configured
+	rm -f $@
+	$(MAKE) CC=$(TARGET_CC) -C $(LIBXML2_DIR)
+
+$(STAGING_DIR)/usr/lib/libxml2.so: $(LIBXML2_DIR)/libxml2.la
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBXML2_DIR) install
+
+$(TARGET_DIR)/usr/lib/libxml2.so: $(STAGING_DIR)/usr/lib/libxml2.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libxml2.so* $(TARGET_DIR)/usr/lib/
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libxml2.so*
+
+$(TARGET_DIR)/usr/lib/libxml2.a: $(STAGING_DIR)/usr/lib/libxml2.so
+	mkdir -p $(TARGET_DIR)/usr/include
+	cp -dpf $(STAGING_DIR)/usr/lib/libxml2.*a $(TARGET_DIR)/usr/lib/
+#	cp -dpf $(STAGING_DIR)/usr/include/mad.h $(TARGET_DIR)/usr/include/
+
+libxml2:	uclibc $(TARGET_DIR)/usr/lib/libxml2.so
+
+libxml2-headers: $(TARGET_DIR)/usr/lib/libxml2.a
+
+libxml2-source: $(DL_DIR)/$(LIBXML2_SOURCE)
+
+libxml2-clean:
+	@if [ -d $(LIBXML2_DIR)/Makefile ] ; then \
+		$(MAKE) -C $(LIBXML2_DIR) clean ; \
+	fi;
+	rm -f $(STAGING_DIR)/usr/lib/libxml2.*
+	rm -f $(TARGET_DIR)/usr/lib/libxml2.*
+
+
+libxml2-dirclean:
+	rm -rf $(LIBXML2_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBXML2)),y)
+TARGETS+=libxml2
+endif
+ifeq ($(strip $(BR2_PACKAGE_LIBXML2_TARGET_HEADERS)),y)
+TARGETS+=libxml2-headers
+endif
