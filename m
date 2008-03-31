From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 07:44:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20080331144432.852303C52F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-31 07:44:32 -0700 (Mon, 31 Mar 2008)
New Revision: 21596

Log:
ncurses: cleanup /usr/lib/terminfo symlink handling


Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2008-03-31 14:32:38 UTC (rev 21595)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2008-03-31 14:44:32 UTC (rev 21596)
@@ -104,7 +104,7 @@
 
 $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
 	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
-	-cp -dpf $(STAGING_DIR)/usr/lib/terminfo $(TARGET_DIR)/usr/lib/
+	ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-color $(TARGET_DIR)/usr/share/terminfo/x
@@ -129,8 +129,7 @@
 	cp -dpf $(NCURSES_DIR)/include/unctrl.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(NCURSES_DIR)/include/termcap.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(NCURSES_DIR)/lib/libncurses.a $(TARGET_DIR)/usr/lib/
-	rm -f $(TARGET_DIR)/usr/lib/terminfo
-	(cd $(TARGET_DIR)/usr/lib; ln -fs ../share/terminfo; \
+	(cd $(TARGET_DIR)/usr/lib; \
 	 ln -fs libncurses.a libcurses.a; \
 	 ln -fs libncurses.a libtermcap.a; \
 	)
@@ -151,6 +150,7 @@
 	rm -f $(STAGING_DIR)/usr/lib/libncurses.so* $(TARGET_DIR)/usr/lib/libncurses.so*
 	rm -rf $(STAGING_DIR)/usr/share/tabset $(TARGET_DIR)/usr/share/tabset
 	rm -rf $(STAGING_DIR)/usr/share/terminfo $(TARGET_DIR)/usr/share/terminfo
+	rm -rf $(TARGET_DIR)/usr/lib/terminfo
 	-$(MAKE) -C $(NCURSES_DIR) clean
 
 ncurses-dirclean:
