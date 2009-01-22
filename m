From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Jan 2009 22:58:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20090122225856.DFD08765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-22 22:58:55 +0000 (Thu, 22 Jan 2009)
New Revision: 24971

Log:
Use /usr/lib for ncurses instead of /lib

Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2009-01-22 22:58:29 UTC (rev 24970)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2009-01-22 22:58:55 UTC (rev 24971)
@@ -58,7 +58,7 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -82,7 +82,7 @@
 	$(MAKE1) DESTDIR=$(STAGING_DIR) -C $(NCURSES_DIR) \
 		libs panel menu form headers
 
-$(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
+$(STAGING_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION): $(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
 	$(MAKE1) \
 	    prefix=$(STAGING_DIR)/usr/ \
 	    exec_prefix=$(STAGING_DIR) \
@@ -92,7 +92,7 @@
 	    datadir=$(STAGING_DIR)/usr/share \
 	    sysconfdir=$(STAGING_DIR)/etc \
 	    localstatedir=$(STAGING_DIR)/var \
-	    libdir=$(STAGING_DIR)/lib \
+	    libdir=$(STAGING_DIR)/usr/lib \
 	    infodir=$(STAGING_DIR)/usr/info \
 	    mandir=$(STAGING_DIR)/usr/man \
 	    includedir=$(STAGING_DIR)/usr/include \
@@ -102,8 +102,8 @@
 	chmod a-x $(NCURSES_DIR)/lib/libncurses.so*
 	touch -c $@
 
-$(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
-	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
+$(TARGET_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION): $(STAGING_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION)
+	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PANEL),y)
 	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/usr/lib/
 endif
@@ -143,12 +143,12 @@
 	 ln -fs libncurses.a libtermcap.a; \
 	)
 	(cd $(TARGET_DIR)/usr/include; ln -fs curses.h ncurses.h)
-	rm -f $(TARGET_DIR)/lib/libncurses.so
-	(cd $(TARGET_DIR)/usr/lib; ln -fs ../../lib/libncurses.so.$(NCURSES_VERSION) libncurses.so)
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
+	rm -f $(TARGET_DIR)/usr/lib/libncurses.so
+	(cd $(TARGET_DIR)/usr/lib; ln -fs libncurses.so.$(NCURSES_VERSION) libncurses.so)
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION)
 	touch -c $@
 
-ncurses: $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
+ncurses: $(TARGET_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION)
 
 ncurses-unpacked: $(NCURSES_DIR)/.patched
 
@@ -157,7 +157,6 @@
 ncurses-source: $(DL_DIR)/$(NCURSES_SOURCE)
 
 ncurses-clean:
-	rm -f $(STAGING_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/libncurses.so*
 	rm -f $(STAGING_DIR)/usr/lib/libncurses.so* $(TARGET_DIR)/usr/lib/libncurses.so*
 	rm -rf $(STAGING_DIR)/usr/share/tabset $(TARGET_DIR)/usr/share/tabset
 	rm -rf $(STAGING_DIR)/usr/share/terminfo $(TARGET_DIR)/usr/share/terminfo
