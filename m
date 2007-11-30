From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 30 Nov 2007 04:32:34 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: libeXosip2 libosip2
Message-ID: <20071130123234.789F630058@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-30 04:32:33 -0800 (Fri, 30 Nov 2007)
New Revision: 20596

Log:
Add libeXosip2 package

Added:
   trunk/buildroot/package/libeXosip2/
   trunk/buildroot/package/libeXosip2/Config.in
   trunk/buildroot/package/libeXosip2/libeXosip2.mk

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/libosip2/libosip2.mk


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-11-30 12:02:05 UTC (rev 20595)
+++ trunk/buildroot/package/Config.in	2007-11-30 12:32:33 UTC (rev 20596)
@@ -153,6 +153,7 @@
 source "package/l2tp/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
+source "package/libeXosip2/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
 source "package/links/Config.in"

Added: trunk/buildroot/package/libeXosip2/Config.in
===================================================================
--- trunk/buildroot/package/libeXosip2/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libeXosip2/Config.in	2007-11-30 12:32:33 UTC (rev 20596)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBEXOSIP2
+	bool "libeXosip2"
+	default n
+	help
+	  GNU Higher level SIP (Session Initiation Protocol)
+	  This library aims to provide multimedia and telecom software
+	  developers an easy and powerful interface to initiate and
+	  control SIP based sessions in their applications. 
+	  SIP is a open standard replacement from IETF for H323.
+
+	  http://www.gnu.org/software/osip/

Added: trunk/buildroot/package/libeXosip2/libeXosip2.mk
===================================================================
--- trunk/buildroot/package/libeXosip2/libeXosip2.mk	                        (rev 0)
+++ trunk/buildroot/package/libeXosip2/libeXosip2.mk	2007-11-30 12:32:33 UTC (rev 20596)
@@ -0,0 +1,110 @@
+#############################################################
+#
+# libeXosip2
+#
+#############################################################
+
+LIBEXOSIP2_VERSION=3.0.1
+LIBEXOSIP2_SOURCE=libeXosip2-$(LIBEXOSIP2_VERSION).tar.gz
+LIBEXOSIP2_SITE=http://www.antisip.com/download/
+LIBEXOSIP2_DIR=$(BUILD_DIR)/libeXosip2-$(LIBEXOSIP2_VERSION)
+LIBEXOSIP2_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(LIBEXOSIP2_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBEXOSIP2_SITE)/$(LIBEXOSIP2_SOURCE)
+
+$(LIBEXOSIP2_DIR)/.unpacked: $(DL_DIR)/$(LIBEXOSIP2_SOURCE)
+	$(LIBEXOSIP2_CAT) $(DL_DIR)/$(LIBEXOSIP2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(LIBEXOSIP2_DIR)
+	touch $(LIBEXOSIP2_DIR)/.unpacked
+
+$(LIBEXOSIP2_DIR)/.configured: $(LIBEXOSIP2_DIR)/.unpacked
+	(cd $(LIBEXOSIP2_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=$(STAGING_DIR) \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--libexecdir=/usr/lib \
+		--libdir=/usr/lib \
+		--includedir=$(STAGING_DIR)/usr/include \
+		--oldincludedir=/usr/include \
+		--enable-shared \
+		--enable-static \
+		$(DISABLE_NLS) \
+	)
+	touch $@
+
+#		--with-gnu-ld \
+#		--libexecdir=$(STAGING_DIR)/usr/lib \
+#		--libdir=$(STAGING_DIR)/usr/lib \
+#		--libdir=/usr/lib \
+#		--libexecdir=/usr/lib \
+
+
+$(LIBEXOSIP2_DIR)/.compiled: $(LIBEXOSIP2_DIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBEXOSIP2_DIR)
+	touch $@
+
+#LDFLAGS=$(TARGET_LDFLAGS) 
+
+$(STAGING_DIR)/usr/lib/libeXosip2.so: $(LIBEXOSIP2_DIR)/.compiled
+	cp -dpf $(LIBEXOSIP2_DIR)/src/.libs/libeXosip2.so* $(STAGING_DIR)/usr/lib
+
+$(STAGING_DIR)/usr/lib/libeXosip2.a: $(LIBEXOSIP2_DIR)/.compiled
+	cp -dpf $(LIBEXOSIP2_DIR)/src/.libs/libeXosip2.a $(STAGING_DIR)/usr/lib
+	cp -dpf $(LIBEXOSIP2_DIR)/include/*.h $(STAGING_DIR)/usr/include
+
+$(STAGING_DIR)/usr/lib/libeXosip2.la: $(LIBEXOSIP2_DIR)/.compiled
+	cp -dpf $(LIBEXOSIP2_DIR)/src/libeXosip2.la $(STAGING_DIR)/usr/lib
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libeXosip2.la
+
+$(STAGING_DIR)/usr/bin/sip_reg: $(LIBEXOSIP2_DIR)/.compiled
+	cp -dpf $(LIBEXOSIP2_DIR)/tools/.libs/sip_reg $(STAGING_DIR)/usr/bin
+
+
+$(TARGET_DIR)/usr/lib/libeXosip2.so: $(STAGING_DIR)/usr/lib/libeXosip2.so
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libeXosip2.so* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libeXosip2.so*
+
+$(TARGET_DIR)/usr/bin/sip_reg: $(STAGING_DIR)/usr/bin/sip_reg
+	mkdir -p $(TARGET_DIR)/usr/bin
+	cp -dpf $(STAGING_DIR)/usr/bin/sip_reg $(TARGET_DIR)/usr/bin
+
+
+
+libeXosip2: uclibc $(TARGET_DIR)/usr/lib/libeXosip2.so
+
+libeXosip2-source: $(DL_DIR)/$(LIBEXOSIP2_SOURCE)
+
+libeXosip2-clean:
+	@if [ -d $(LIBEXOSIP2_DIR)/Makefile ]; then \
+		$(MAKE) -C $(LIBEXOSIP2_DIR) clean; \
+	fi
+	rm -f $(STAGING_DIR)/usr/lib/libeXosip2.*
+	rm -f $(TARGET_DIR)/usr/lib/libeXosip2.*
+
+
+libeXosip2-dirclean:
+	rm -rf $(LIBEXOSIP2_DIR)
+
+.PHONY: libeXosip2-headers libeXosip2-target-headers
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBEXOSIP2)),y)
+TARGETS+=libeXosip2
+endif

Modified: trunk/buildroot/package/libosip2/libosip2.mk
===================================================================
--- trunk/buildroot/package/libosip2/libosip2.mk	2007-11-30 12:02:05 UTC (rev 20595)
+++ trunk/buildroot/package/libosip2/libosip2.mk	2007-11-30 12:32:33 UTC (rev 20596)
@@ -49,14 +49,21 @@
 
 $(STAGING_DIR)/usr/lib/libosip2.so: $(LIBOSIP2_DIR)/.configured
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBOSIP2_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libosip2.la
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libosipparser2.la
 
 $(TARGET_DIR)/usr/lib/libosip2.so: $(STAGING_DIR)/usr/lib/libosip2.so
 	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/libosip2.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libosip2.so*
 
-libosip2: uclibc $(TARGET_DIR)/usr/lib/libosip2.so
+$(TARGET_DIR)/usr/lib/libosipparser2.so: $(STAGING_DIR)/usr/lib/libosip2.so
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libosipparser2.so* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libosipparser2.so*
 
+libosip2: uclibc $(TARGET_DIR)/usr/lib/libosip2.so $(TARGET_DIR)/usr/lib/libosipparser2.so
+
 libosip2-source: $(DL_DIR)/$(LIBOSIP2_SOURCE)
 
 libosip2-clean:
