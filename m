From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sun,  4 Jan 2009 06:04:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libtool
Message-ID: <20090104060450.ABF7D769EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-04 06:04:50 +0000 (Sun, 04 Jan 2009)
New Revision: 24683

Log:
Use target ar & ranlib when generating static archives, the host tools were being used when libltdl.a was being generated


Modified:
   trunk/buildroot/package/libtool/libtool.mk


Changeset:
Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2009-01-04 06:02:30 UTC (rev 24682)
+++ trunk/buildroot/package/libtool/libtool.mk	2009-01-04 06:04:50 UTC (rev 24683)
@@ -56,7 +56,7 @@
 	touch $@
 
 $(LIBTOOL_DIR)/$(LIBTOOL_BINARY): $(LIBTOOL_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBTOOL_DIR)
+	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LIBTOOL_DIR)
 	touch -c $@
 
 $(TARGET_DIR)/$(LIBTOOL_TARGET_BINARY): $(LIBTOOL_DIR)/$(LIBTOOL_BINARY)
@@ -90,7 +90,7 @@
 libtool: uclibc $(TARGET_DIR)/$(LIBTOOL_TARGET_BINARY)
 
 libtool-clean:
-	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIBTOOL_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LIBTOOL_DIR) uninstall
 	-$(MAKE) -C $(LIBTOOL_DIR) clean
 
 libtool-cross: uclibc $(LIBTOOL_DIR)/$(LIBTOOL_BINARY)
