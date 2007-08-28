From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 28 Aug 2007 15:23:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rxvt
Message-ID: <20070828222308.2D99FA65C5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-28 15:23:08 -0700 (Tue, 28 Aug 2007)
New Revision: 19725

Log:
This is my attempt to realize a rxvt-version for xorg, tinyx and the new x11r7.
I tested it with xorg and x11r7. (Don't know if it works with tinyx,
because the tinyx-build fails)


Signed-off-by: Simon Pasch <fpasch@googlemail.com>



Modified:
   trunk/buildroot/package/rxvt/Config.in
   trunk/buildroot/package/rxvt/rxvt.mk


Changeset:
Modified: trunk/buildroot/package/rxvt/Config.in
===================================================================
--- trunk/buildroot/package/rxvt/Config.in	2007-08-28 22:21:35 UTC (rev 19724)
+++ trunk/buildroot/package/rxvt/Config.in	2007-08-28 22:23:08 UTC (rev 19725)
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_RXVT
 	bool "rxvt"
 	default n
-	depends BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx
-
+	depends BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx || BR2_PACKAGE_XSERVER_x11r7
 	help
 	  A nice small colour vt102 X terminal emulator.
-	  Does not build for X11R7 yet.
 
 	  http://www.rxvt.org/

Modified: trunk/buildroot/package/rxvt/rxvt.mk
===================================================================
--- trunk/buildroot/package/rxvt/rxvt.mk	2007-08-28 22:21:35 UTC (rev 19724)
+++ trunk/buildroot/package/rxvt/rxvt.mk	2007-08-28 22:23:08 UTC (rev 19725)
@@ -27,6 +27,18 @@
 RXVT_DIR:=$(BUILD_DIR)/rxvt-$(RXVT_VERSION)
 RXVT_BINARY:=$(RXVT_DIR)/src/rxvt
 
+ifeq ($(strip $(BR2_PACKAGE_XSERVER_xorg)),y)
+RXVT_PREFIX:=/usr/X11R6
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_XSERVER_tinyx)),y)
+RXVT_PREFIX:=/usr/X11R6
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_XSERVER_x11r7)),y)
+RXVT_PREFIX:=/usr
+endif
+
 $(DL_DIR)/$(RXVT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(RXVT_SITE)/$(RXVT_SOURCE)
 
@@ -46,11 +58,11 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr/X11R6 \
+		--prefix=$(RXVT_PREFIX) \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--x-includes=$(STAGING_DIR)/usr/X11R6/include \
-		--x-libraries=$(STAGING_DIR)/usr/X11R6/lib \
+		--x-includes=$(STAGING_DIR)$(RXVT_PREFIX)/include \
+		--x-libraries=$(STAGING_DIR)$(RXVT_PREFIX)/lib \
 		--disable-resources \
 		--disable-memset \
 	)
@@ -60,14 +72,14 @@
 	$(MAKE) CC=$(TARGET_CC) -C $(RXVT_DIR)
 	$(STRIP) $(STRIP_DISCARD_ALL) $(RXVT_BINARY)
 
-$(TARGET_DIR)/usr/X11R6/bin/rxvt: $(RXVT_BINARY)
-	cp -f $(RXVT_BINARY) $(TARGET_DIR)/usr/X11R6/bin
-	(cd $(TARGET_DIR)/usr/X11R6/bin; ln -fs rxvt xterm)
+$(TARGET_DIR)$(RXVT_PREFIX)/bin/rxvt: $(RXVT_BINARY)
+	cp -f $(RXVT_BINARY) $(TARGET_DIR)$(RXVT_PREFIX)/bin
+	(cd $(TARGET_DIR)$(RXVT_PREFIX)/bin; ln -fs rxvt xterm)
 
-rxvt: $(XSERVER) $(TARGET_DIR)/usr/X11R6/bin/rxvt
+rxvt: $(XSERVER) $(TARGET_DIR)$(RXVT_PREFIX)/bin/rxvt
 
 rxvt-clean:
-	rm -f $(TARGET_DIR)/usr/X11R6/bin/rxvt
+	rm -f $(TARGET_DIR)$(RXVT_PREFIX)/bin/rxvt
 	-$(MAKE) -C $(RXVT_DIR) clean
 
 rxvt-dirclean:
