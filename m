From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Mon, 10 Mar 2008 08:22:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20080310152243.544A212C5F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-10 08:22:43 -0700 (Mon, 10 Mar 2008)
New Revision: 21282

Log:
added dev files in target option

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-03-10 15:15:57 UTC (rev 21281)
+++ trunk/buildroot/Config.in	2008-03-10 15:22:43 UTC (rev 21282)
@@ -239,6 +239,13 @@
 	  If you say n here, your target will not contain any
 	  infopage.
 
+config BR2_TARGET_DEV_FILES
+	bool "Development files in target filesystem"
+	default n
+	help
+	  Install headers and static libraries in the
+	  target filesystem
+
 source package/gnuconfig/Config.in
 
 endmenu

Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-10 15:15:57 UTC (rev 21281)
+++ trunk/buildroot/Makefile	2008-03-10 15:22:43 UTC (rev 21282)
@@ -245,7 +245,7 @@
 # target stuff is last so it can override anything else
 include target/Makefile.in
 
-TARGETS+=erase-fakeroots
+TARGETS+=erase-fakeroots target-devfiles
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
@@ -317,6 +317,21 @@
 erase-fakeroots:
 	rm -f $(PROJECT_BUILD_DIR)/.fakeroot*
 
+target-devfiles:
+ifeq ($(strip $(BR2_TARGET_DEV_FILES)),y)
+	cp -a $(STAGING_DIR)/usr/include $(TARGET_DIR)/usr
+	cp $(STAGING_DIR)/usr/lib/*.a $(TARGET_DIR)/usr/lib
+	cp $(STAGING_DIR)/lib/*.a $(TARGET_DIR)/lib
+	cp $(STAGING_DIR)/usr/lib/*.la $(TARGET_DIR)/usr/lib
+	cp $(STAGING_DIR)/lib/*.la $(TARGET_DIR)/lib
+else
+	rm -rf $(TARGET_DIR)/usr/include
+	find $(TARGET_DIR)/usr/lib -name '*.a' -delete
+	find $(TARGET_DIR)/lib -name '*.a' -delete
+	find $(TARGET_DIR)/usr/lib -name '*.la' -delete
+	find $(TARGET_DIR)/lib -name '*.la' -delete
+endif
+
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 _source-check:

Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-03-10 15:15:57 UTC (rev 21281)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-03-10 15:22:43 UTC (rev 21282)
@@ -230,10 +230,6 @@
 	$(if $(BR2_HAVE_INCLUDES),,for d in include; do \
 		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
-	find $(TARGET_DIR) -name '*.la' -delete
-	find $(TARGET_DIR)/lib -name '*.a' -delete
-	find $(TARGET_DIR)/usr/lib -name '*.a' -delete
-
 	touch $@
 
 $(BUILD_DIR)/%/.stamp_cleaned:
