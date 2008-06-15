From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Jun 2008 13:44:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
Message-ID: <20080615204406.99DA33C932@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-15 13:44:05 -0700 (Sun, 15 Jun 2008)
New Revision: 22359

Log:
valgrind: there is no vgskin_none.so anymore, use coregrind/valgrind instead


Modified:
   trunk/buildroot/package/valgrind/valgrind.mk


Changeset:
Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2008-06-15 20:20:33 UTC (rev 22358)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2008-06-15 20:44:05 UTC (rev 22359)
@@ -39,12 +39,11 @@
 	)
 	touch $(VALGRIND_DIR)/.configured
 
-$(VALGRIND_DIR)/none/vgskin_none.so: $(VALGRIND_DIR)/.configured
+$(VALGRIND_DIR)/coregrind/valgrind: $(VALGRIND_DIR)/.configured
 	$(MAKE) -C $(VALGRIND_DIR)
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(VALGRIND_DIR)/*.so*
-	touch -c $(VALGRIND_DIR)/none/vgskin_none.so
+	touch -c $@
 
-$(TARGET_DIR)/usr/bin/valgrind: $(VALGRIND_DIR)/none/vgskin_none.so
+$(TARGET_DIR)/usr/bin/valgrind: $(VALGRIND_DIR)/coregrind/valgrind
 	$(MAKE) \
 	    prefix=$(TARGET_DIR)/usr \
 	    exec_prefix=$(TARGET_DIR)/usr \
@@ -69,7 +68,7 @@
 	#cp $(VALGRIND_DIR)/valgrind.default $(TARGET_DIR)/etc/default/valgrind
 	#mkdir -p $(TARGET_DIR)/usr/lib/valgrind
 	#cp $(VALGRIND_DIR)/woody.supp $(TARGET_DIR)/usr/lib/valgrind/
-	touch -c $(TARGET_DIR)/usr/bin/valgrind
+	touch -c $@
 
 valgrind: $(TARGET_DIR)/usr/bin/valgrind
 
