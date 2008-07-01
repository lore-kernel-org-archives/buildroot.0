From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Jul 2008 12:24:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20080701192437.353BD3C650@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-01 12:24:36 -0700 (Tue, 01 Jul 2008)
New Revision: 22597

Log:
ncurses: don't follow symlink on ln invocation

The ln -sf command would fail if $TARGET_DIR/usr/lib/terminfo already exists
as we don't have write permissions to the symlink target. Fixed by adding
-n option (don't dereference link).

Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2008-07-01 19:09:50 UTC (rev 22596)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2008-07-01 19:24:36 UTC (rev 22597)
@@ -113,7 +113,7 @@
 ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_MENU)),y)
 	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/usr/lib/
 endif
-	ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
+	ln -snf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-color $(TARGET_DIR)/usr/share/terminfo/x
