From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 28 Aug 2007 16:02:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  rxvt
Message-ID: <20070828230253.59F4AA6076@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-28 16:02:52 -0700 (Tue, 28 Aug 2007)
New Revision: 19727

Log:
Add default X11 install directory

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/rxvt/rxvt.mk


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-08-28 22:46:54 UTC (rev 19726)
+++ trunk/buildroot/package/Config.in	2007-08-28 23:02:52 UTC (rev 19727)
@@ -318,6 +318,14 @@
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
 endchoice
+
+config BR2_X11_PREFIX
+	string
+	default "/usr/X11R6"	if BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx
+	default "/usr"		if !BR2_PACKAGE_XSERVER_xorg && !BR2_PACKAGE_XSERVER_tinyx
+	help
+	  X11 apps root location
+
 if BR2_PACKAGE_XSERVER_x11r7
 source "package/x11r7/Config.in"
 endif

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-08-28 22:46:54 UTC (rev 19726)
+++ trunk/buildroot/package/Makefile.in	2007-08-28 23:02:52 UTC (rev 19727)
@@ -241,5 +241,8 @@
 XSERVER+=xggi
 endif
 
+X11_PREFIX:=$(strip $(subst ",, $(BR2_X11_PREFIX)))
+#"))
+
 include package/Makefile.autotools.in
 

Modified: trunk/buildroot/package/rxvt/rxvt.mk
===================================================================
--- trunk/buildroot/package/rxvt/rxvt.mk	2007-08-28 22:46:54 UTC (rev 19726)
+++ trunk/buildroot/package/rxvt/rxvt.mk	2007-08-28 23:02:52 UTC (rev 19727)
@@ -27,18 +27,6 @@
 RXVT_DIR:=$(BUILD_DIR)/rxvt-$(RXVT_VERSION)
 RXVT_BINARY:=$(RXVT_DIR)/src/rxvt
 
-ifeq ($(strip $(BR2_PACKAGE_XSERVER_xorg)),y)
-RXVT_PREFIX:=/usr/X11R6
-endif
-
-ifeq ($(strip $(BR2_PACKAGE_XSERVER_tinyx)),y)
-RXVT_PREFIX:=/usr/X11R6
-endif
-
-ifeq ($(strip $(BR2_PACKAGE_XSERVER_x11r7)),y)
-RXVT_PREFIX:=/usr
-endif
-
 $(DL_DIR)/$(RXVT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(RXVT_SITE)/$(RXVT_SOURCE)
 
@@ -58,11 +46,11 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=$(RXVT_PREFIX) \
+		--prefix=$(X11_PREFIX) \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--x-includes=$(STAGING_DIR)$(RXVT_PREFIX)/include \
-		--x-libraries=$(STAGING_DIR)$(RXVT_PREFIX)/lib \
+		--x-includes=$(STAGING_DIR)$(X11_PREFIX)/include \
+		--x-libraries=$(STAGING_DIR)$(X11_PREFIX)/lib \
 		--disable-resources \
 		--disable-memset \
 	)
@@ -72,14 +60,14 @@
 	$(MAKE) CC=$(TARGET_CC) -C $(RXVT_DIR)
 	$(STRIP) $(STRIP_DISCARD_ALL) $(RXVT_BINARY)
 
-$(TARGET_DIR)$(RXVT_PREFIX)/bin/rxvt: $(RXVT_BINARY)
-	cp -f $(RXVT_BINARY) $(TARGET_DIR)$(RXVT_PREFIX)/bin
-	(cd $(TARGET_DIR)$(RXVT_PREFIX)/bin; ln -fs rxvt xterm)
+$(TARGET_DIR)$(X11_PREFIX)/bin/rxvt: $(RXVT_BINARY)
+	cp -f $(RXVT_BINARY) $(TARGET_DIR)$(X11_PREFIX)/bin
+	(cd $(TARGET_DIR)$(X11_PREFIX)/bin; ln -fs rxvt xterm)
 
-rxvt: $(XSERVER) $(TARGET_DIR)$(RXVT_PREFIX)/bin/rxvt
+rxvt: $(XSERVER) $(TARGET_DIR)$(X11_PREFIX)/bin/rxvt
 
 rxvt-clean:
-	rm -f $(TARGET_DIR)$(RXVT_PREFIX)/bin/rxvt
+	rm -f $(TARGET_DIR)$(X11_PREFIX)/bin/rxvt
 	-$(MAKE) -C $(RXVT_DIR) clean
 
 rxvt-dirclean:
