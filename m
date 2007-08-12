From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 11:21:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20070812182127.DF7F9A65EB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 11:21:27 -0700 (Sun, 12 Aug 2007)
New Revision: 19466

Log:
Bump version of DirectFB to 1.0.0 and add dependency on TSLIB

Modified:
   trunk/buildroot/package/directfb/Config.in
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/Config.in
===================================================================
--- trunk/buildroot/package/directfb/Config.in	2007-08-12 18:19:45 UTC (rev 19465)
+++ trunk/buildroot/package/directfb/Config.in	2007-08-12 18:21:27 UTC (rev 19466)
@@ -6,6 +6,16 @@
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBSYSFS
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_TSLIB
 	help
+	  http://www.directfb.org/
 
-	http://www.directfb.org/
+
+config BR2_PACKAGE_DIRECTFB_MULTI
+	bool "directfb multi application"
+	default n
+	depends on BR2_PACKAGE_DIRECTFB
+	select BR2_PACKAGE_LINUX_FUSION
+	help
+	  Enable use of multiple concurrent DirectFB applications
+	  http://www.directfb.org/

Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-08-12 18:19:45 UTC (rev 19465)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-08-12 18:21:27 UTC (rev 19466)
@@ -3,12 +3,20 @@
 # directfb
 #
 #############################################################
-DIRECTFB_VERSION:=0.9.25.1
+#DIRECTFB_VERSION:=0.9.25.1
+#DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
+DIRECTFB_VERSION:=1.0.0
+DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
-DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
 DIRECTFB_CAT:=$(ZCAT)
 DIRECTFB_DIR:=$(BUILD_DIR)/DirectFB-$(DIRECTFB_VERSION)
 
+ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
+DIRECTFB_MULTI:=--enable-multi
+else
+DIRECTFB_MULTI:=
+endif
+
 $(DL_DIR)/$(DIRECTFB_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DIRECTFB_SITE)/$(DIRECTFB_SOURCE)
 
@@ -32,32 +40,35 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
+		--bindir=/bin \
+		--sbindir=/sbin \
 		--libdir=/lib \
-		--libexecdir=/usr/lib \
+		--libexecdir=/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
+		--datadir=/share \
 		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--includedir=/include \
+		--mandir=/man \
+		--infodir=/info \
 		--with-gfxdrivers=cle266,unichrome \
 		--enable-shared \
+		$(DIRECTFB_MULTI) \
 		--enable-jpeg \
 		--enable-png \
 		--enable-linux-input \
 		--enable-zlib \
 		--enable-freetype \
 		--disable-sysfs \
-		--enable-sdl \
+		--disable-sdl \
 		--disable-video4linux \
 		--disable-video4linux2 \
-		--disable-fusion );
+		--enable-fusion );
 	touch $(DIRECTFB_DIR)/.configured
 
 $(DIRECTFB_DIR)/.compiled: $(DIRECTFB_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(DIRECTFB_DIR)
+	$(MAKE) PATH=$(STAGING_DIR)/usr/lib:$(PATH) \
+		$(TARGET_CONFIGURE_OPTS) \
+		-C $(DIRECTFB_DIR)
 	touch $(DIRECTFB_DIR)/.compiled
 
 $(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
@@ -72,7 +83,7 @@
 		$(TARGET_DIR)/usr/lib/libdirect.so \
 		$(TARGET_DIR)/usr/lib/libfusion.so
 
-directfb: uclibc jpeg libpng freetype libsysfs $(TARGET_DIR)/usr/lib/libdirectfb.so
+directfb: uclibc jpeg libpng freetype libsysfs tslib $(TARGET_DIR)/usr/lib/libdirectfb.so
 
 directfb-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR) uninstall
