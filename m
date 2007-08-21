From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 03:56:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070821105638.ABD3AA65A0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 03:56:38 -0700 (Tue, 21 Aug 2007)
New Revision: 19609

Log:
- fix incorrect invocation of non-existing binary named "-find"
  This bloated the target needlessly (and used to work before)


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-21 10:54:59 UTC (rev 19608)
+++ trunk/buildroot/Makefile	2007-08-21 10:56:38 UTC (rev 19609)
@@ -250,14 +250,14 @@
 
 $(PROJECT_BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
-	if ! [ -d "$(TARGET_DIR)/bin" ] ; then \
-		if [ -d "$(TARGET_SKELETON)" ] ; then \
-			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
+	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
+		if [ -d "$(TARGET_SKELETON)" ]; then \
+			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/ ; \
 		fi; \
 		touch $(STAGING_DIR)/.fakeroot.00000 ; \
-		-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf ; \
-		-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf ; \
-	fi;
+	fi
+	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
+	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
 	touch $@
 
 $(TARGET_DIR):	$(PROJECT_BUILD_DIR)/.root
