From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 21:01:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netkitbase
Message-ID: <20070507040107.BA26D48562@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 21:01:07 -0700 (Sun, 06 May 2007)
New Revision: 18575

Log:
Install the default configuration file if the platform did not already define one.


Modified:
   trunk/buildroot/package/netkitbase/netkitbase.mk


Changeset:
Modified: trunk/buildroot/package/netkitbase/netkitbase.mk
===================================================================
--- trunk/buildroot/package/netkitbase/netkitbase.mk	2007-05-07 04:00:11 UTC (rev 18574)
+++ trunk/buildroot/package/netkitbase/netkitbase.mk	2007-05-07 04:01:07 UTC (rev 18575)
@@ -38,13 +38,11 @@
 	# Only install a few selected items...
 	mkdir -p $(TARGET_DIR)/usr/sbin
 	cp $(NETKITBASE_DIR)/$(NETKITBASE_BINARY) $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
-	#rm -f $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
-	mkdir -p $(TARGET_DIR)/etc
-	cp $(NETKITBASE_DIR)/etc.sample/inetd.conf $(TARGET_DIR)/etc/
-	$(SED) "s/^\([a-z]\)/#\1/;" $(TARGET_DIR)/etc/inetd.conf
-	#$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETKITBASE_DIR) install
-	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	@if [ ! -f $(TARGET_DIR)/etc/inetd.conf ] ; then \
+		mkdir -p $(TARGET_DIR)/etc; \
+		cp $(NETKITBASE_DIR)/etc.sample/inetd.conf $(TARGET_DIR)/etc/; \
+		$(SED) "s/^\([a-z]\)/#\1/;" $(TARGET_DIR)/etc/inetd.conf; \
+	fi;
 	touch -c $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
 
 netkitbase: uclibc $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
