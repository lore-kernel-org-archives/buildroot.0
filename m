From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 30 Nov 2007 02:28:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libosip2
Message-ID: <20071130102837.4DBEBA6AB6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-30 02:28:36 -0800 (Fri, 30 Nov 2007)
New Revision: 20594

Log:
Add libosip2 package

Added:
   trunk/buildroot/package/libosip2/
   trunk/buildroot/package/libosip2/Config.in
   trunk/buildroot/package/libosip2/libosip2.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-11-30 09:12:09 UTC (rev 20593)
+++ trunk/buildroot/package/Config.in	2007-11-30 10:28:36 UTC (rev 20594)
@@ -153,6 +153,7 @@
 source "package/l2tp/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
+source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
@@ -415,4 +416,14 @@
 source "package/php/Config.in"
 endif
 
+menuconfig BR2_GAMES
+	bool "Games"
+	default y
+	help
+	  Support for games
+
+if BR2_GAMES
+source "package/lxdoom/Config.in"
+endif
+
 endmenu

Added: trunk/buildroot/package/libosip2/Config.in
===================================================================
--- trunk/buildroot/package/libosip2/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libosip2/Config.in	2007-11-30 10:28:36 UTC (rev 20594)
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBOSIP2
+	bool "libosip2"
+	default n
+	help
+	  GNU SIP (Session Initiation Protocol)
+	  This library aims to provide multimedia and telecom software
+	  developers an easy and powerful interface to initiate and
+	  control SIP based sessions in their applications. 
+	  SIP is a open standard replacement from IETF for H323.
+

Added: trunk/buildroot/package/libosip2/libosip2.mk
===================================================================
--- trunk/buildroot/package/libosip2/libosip2.mk	                        (rev 0)
+++ trunk/buildroot/package/libosip2/libosip2.mk	2007-11-30 10:28:36 UTC (rev 20594)
@@ -0,0 +1,81 @@
+#############################################################
+#
+# libosip2
+#
+#############################################################
+
+LIBOSIP2_VERSION=3.0.1
+LIBOSIP2_SOURCE=libosip2-$(LIBOSIP2_VERSION).tar.gz
+LIBOSIP2_SITE=http://www.antisip.com/download/
+LIBOSIP2_DIR=$(BUILD_DIR)/libosip2-$(LIBOSIP2_VERSION)
+LIBOSIP2_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(LIBOSIP2_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBOSIP2_SITE)/$(LIBOSIP2_SOURCE)
+
+$(LIBOSIP2_DIR)/.unpacked: $(DL_DIR)/$(LIBOSIP2_SOURCE)
+	$(LIBOSIP2_CAT) $(DL_DIR)/$(LIBOSIP2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(LIBOSIP2_DIR)
+	touch $(LIBOSIP2_DIR)/.unpacked
+
+$(LIBOSIP2_DIR)/.configured: $(LIBOSIP2_DIR)/.unpacked
+	(cd $(LIBOSIP2_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--includedir=/usr/include \
+		--with-gnu-ld \
+		--enable-shared \
+		--enable-static \
+		$(DISABLE_NLS) \
+	)
+	touch $(LIBOSIP2_DIR)/.configured
+
+$(LIBOSIP2_DIR)/libosip2.so: $(LIBOSIP2_DIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBOSIP2_DIR)
+
+$(STAGING_DIR)/usr/lib/libosip2.so: $(LIBOSIP2_DIR)/.configured
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBOSIP2_DIR) install
+
+$(TARGET_DIR)/usr/lib/libosip2.so: $(STAGING_DIR)/usr/lib/libosip2.so
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libosip2.so* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libosip2.so*
+
+libosip2: uclibc $(TARGET_DIR)/usr/lib/libosip2.so
+
+libosip2-source: $(DL_DIR)/$(LIBOSIP2_SOURCE)
+
+libosip2-clean:
+	@if [ -d $(LIBOSIP2_DIR)/Makefile ]; then \
+		$(MAKE) -C $(LIBOSIP2_DIR) clean; \
+	fi
+	rm -f $(STAGING_DIR)/usr/lib/libosip2.*
+	rm -f $(TARGET_DIR)/usr/lib/libosip2.*
+
+
+libosip2-dirclean:
+	rm -rf $(LIBOSIP2_DIR)
+
+.PHONY: libosip2-headers libosip2-target-headers
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBOSIP2)),y)
+TARGETS+=libosip2
+endif
