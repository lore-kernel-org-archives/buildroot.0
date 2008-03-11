From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 06:12:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  scripts
Message-ID: <20080311131239.7B7E0120140@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 06:12:39 -0700 (Tue, 11 Mar 2008)
New Revision: 21290

Log:
more robust development files in target handler

Added:
   trunk/buildroot/scripts/copy.sh

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-11 13:11:14 UTC (rev 21289)
+++ trunk/buildroot/Makefile	2008-03-11 13:12:39 UTC (rev 21290)
@@ -242,10 +242,12 @@
 
 include package/*/*.mk
 
+TARGETS+=target-devfiles
+
 # target stuff is last so it can override anything else
 include target/Makefile.in
 
-TARGETS+=erase-fakeroots target-devfiles
+TARGETS+=erase-fakeroots 
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
@@ -318,18 +320,14 @@
 	rm -f $(PROJECT_BUILD_DIR)/.fakeroot*
 
 target-devfiles:
-ifeq ($(strip $(BR2_HAVE_DEVFILES)),y)
-	cp -a $(STAGING_DIR)/usr/include $(TARGET_DIR)/usr
-	cp $(STAGING_DIR)/usr/lib/*.a $(TARGET_DIR)/usr/lib
-	cp $(STAGING_DIR)/lib/*.a $(TARGET_DIR)/lib
-	cp $(STAGING_DIR)/usr/lib/*.la $(TARGET_DIR)/usr/lib
-	cp $(STAGING_DIR)/lib/*.la $(TARGET_DIR)/lib
+ifeq ($(BR2_HAVE_DEVFILES),y)
+	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
 	rm -rf $(TARGET_DIR)/usr/include
-	find $(TARGET_DIR)/usr/lib -name '*.a' -delete
-	find $(TARGET_DIR)/lib -name '*.a' -delete
-	find $(TARGET_DIR)/usr/lib -name '*.la' -delete
-	find $(TARGET_DIR)/lib -name '*.la' -delete
+	find $(TARGET_DIR)/usr/lib -name '*.a' -delete 
+	find $(TARGET_DIR)/lib -name '*.a' -delete 
+	find $(TARGET_DIR)/usr/lib -name '*.la' -delete 
+	find $(TARGET_DIR)/lib -name '*.la' -delete 
 endif
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)

Added: trunk/buildroot/scripts/copy.sh
===================================================================
--- trunk/buildroot/scripts/copy.sh	                        (rev 0)
+++ trunk/buildroot/scripts/copy.sh	2008-03-11 13:12:39 UTC (rev 21290)
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+STAGING_DIR=$1
+TARGET_DIR=$2
+
+echo "Copying development files to target..."
+
+cp -a ${STAGING_DIR}/usr/include ${TARGET_DIR}/usr
+
+for LIBSDIR in /lib /usr/lib; do
+	for WILDCARD in *.a *.la; do
+		for FILE_PATH in `find ${STAGING_DIR}${LIBSDIR} -name ${WILDCARD}`; do
+			STAGING_STRIPPED=${FILE_PATH##${STAGING_DIR}}
+			EXTENDED_DIR=${PATH_FILE%/${WILDCARD}}
+			mkdir -p ${TARGET_DIR}${EXTENDED_DIR}
+			cp ${FILE_PATH} ${TARGET_DIR}${STAGING_STRIPPED}
+			#echo ${TARGET_DIR}${STAGING_STRIPPED}
+		done
+	done
+done


Property changes on: trunk/buildroot/scripts/copy.sh
___________________________________________________________________
Name: svn:executable
   + *
