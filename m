From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 15 Jan 2007 13:28:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070115212815.EB53E48595@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-15 13:28:15 -0800 (Mon, 15 Jan 2007)
New Revision: 17317

Log:
do not install build stuff into the target unless specifically asked to do so


Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2007-01-15 21:27:17 UTC (rev 17316)
+++ trunk/buildroot/package/gettext/gettext.mk	2007-01-15 21:28:15 UTC (rev 17317)
@@ -137,12 +137,14 @@
 		$(TARGET_DIR)/usr/include/libintl.h
 	-rmdir $(TARGET_DIR)/usr/include
 
-libintl: $(TARGET_DIR)/lib/libintl.so
-
 $(TARGET_DIR)/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
-	cp -a $(STAGING_DIR)/lib/libintl.so* $(TARGET_DIR)/lib
+	cp -a $(STAGING_DIR)/lib/libgettext*.so* $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libintl*.so* $(TARGET_DIR)/lib/
+	rm -f $(TARGET_DIR)/lib/libgettext*.so*.la $(TARGET_DIR)/lib/libintl*.so*.la
 	touch $@
 
+libintl: $(TARGET_DIR)/lib/libintl.so
+
 #############################################################
 #
 # Toplevel Makefile options
@@ -152,5 +154,5 @@
 TARGETS+=libintl
 endif
 ifeq ($(strip $(BR2_PACKAGE_GETTEXT)),y)
-TARGETS+=gettext-target
+TARGETS+=gettext
 endif
