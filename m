From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 11:43:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
Message-ID: <20070811184359.8B7F0A470F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 11:43:58 -0700 (Sat, 11 Aug 2007)
New Revision: 19433

Log:
Bump dropbear to 0.50, /dev/urandom is now default

Modified:
   trunk/buildroot/package/dropbear/Config.in
   trunk/buildroot/package/dropbear/dropbear.mk


Changeset:
Modified: trunk/buildroot/package/dropbear/Config.in
===================================================================
--- trunk/buildroot/package/dropbear/Config.in	2007-08-11 18:25:17 UTC (rev 19432)
+++ trunk/buildroot/package/dropbear/Config.in	2007-08-11 18:43:58 UTC (rev 19433)
@@ -5,17 +5,3 @@
 	  A small SSH 2 server designed for small memory environments.
 
 	  http://matt.ucc.asn.au/dropbear/dropbear.html
-
-config BR2_PACKAGE_DROPBEAR_URANDOM
-	bool "Use /dev/urandom (low entropy systems only)?"
-	default n
-	depends on BR2_PACKAGE_DROPBEAR
-	help
-	  By default, dropbear uses the much more secure /dev/random.  If you
-	  are using a system lacking usable entropy sources, this could cause
-	  the dropbear ssh daemon to block forever waiting for entropy that
-	  will never arrive.  By making dropbear use /dev/urandom, you can
-	  prevent Dropbear from blocking while waiting on the random device.
-	  This could however significantly reduce the security of your ssh
-	  connections.  Make sure you know what you are doing if you enable
-	  this option -- most people should answer N.

Modified: trunk/buildroot/package/dropbear/dropbear.mk
===================================================================
--- trunk/buildroot/package/dropbear/dropbear.mk	2007-08-11 18:25:17 UTC (rev 19432)
+++ trunk/buildroot/package/dropbear/dropbear.mk	2007-08-11 18:43:58 UTC (rev 19433)
@@ -3,7 +3,7 @@
 # dropbear
 #
 #############################################################
-DROPBEAR_VERSION:=0.49
+DROPBEAR_VERSION:=0.50
 DROPBEAR_SOURCE:=dropbear-$(DROPBEAR_VERSION).tar.gz
 DROPBEAR_SITE:=http://matt.ucc.asn.au/dropbear/releases/
 DROPBEAR_DIR:=$(BUILD_DIR)/dropbear-$(DROPBEAR_VERSION)
@@ -21,7 +21,7 @@
 	toolchain/patch-kernel.sh $(DROPBEAR_DIR) package/dropbear/ dropbear\*.patch
 	$(SED) 's,^/\* #define DROPBEAR_MULTI.*,#define DROPBEAR_MULTI,g' $(DROPBEAR_DIR)/options.h
 	$(CONFIG_UPDATE) $(DROPBEAR_DIR)
-	touch $(DROPBEAR_DIR)/.unpacked
+	touch $@
 
 $(DROPBEAR_DIR)/.configured: $(DROPBEAR_DIR)/.unpacked
 	(cd $(DROPBEAR_DIR); rm -rf config.cache; \
@@ -33,24 +33,12 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
 		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
 		$(DISABLE_NLS) \
 		--with-shared \
 	);
-ifeq ($(strip $(BR2_PACKAGE_DROPBEAR_URANDOM)),y)
-	$(SED) 's,^#define DROPBEAR_RANDOM_DEV.*,#define DROPBEAR_RANDOM_DEV \"/dev/urandom\",' \
-		$(DROPBEAR_DIR)/options.h
-endif
-	touch $(DROPBEAR_DIR)/.configured
+	touch $@
 
 $(DROPBEAR_DIR)/$(DROPBEAR_BINARY): $(DROPBEAR_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) LD=$(TARGET_CC) \
@@ -58,21 +46,17 @@
 		MULTI=1 SCPPROGRESS=1 -C $(DROPBEAR_DIR)
 
 $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY): $(DROPBEAR_DIR)/$(DROPBEAR_BINARY)
-	#$(MAKE) DESTDIR=$(TARGET_DIR) $(TARGET_CONFIGURE_OPTS) \
-	#	LD=$(TARGET_CC) -C $(DROPBEAR_DIR) install
-	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-	install -d -m 755 $(TARGET_DIR)/usr/sbin
-	install -d -m 755 $(TARGET_DIR)/usr/bin
-	install -m 755 $(DROPBEAR_DIR)/$(DROPBEAR_BINARY) \
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/sbin
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 755 $(DROPBEAR_DIR)/$(DROPBEAR_BINARY) \
 		$(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
-	$(STRIP) $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/scp
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/ssh
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dbclient
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearkey
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearconvert
-	cp $(DROPBEAR_DIR)/S50dropbear $(TARGET_DIR)/etc/init.d/
+	cp -dpf $(DROPBEAR_DIR)/S50dropbear $(TARGET_DIR)/etc/init.d/
 	chmod a+x $(TARGET_DIR)/etc/init.d/S50dropbear
 
 dropbear: uclibc zlib $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
