From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 22:39:09 +0000 (UTC)
Subject: [Buildroot] svn commit: [25741] trunk/buildroot/package/pango
Message-ID: <20090318223910.032E37763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 22:39:09 +0000 (Wed, 18 Mar 2009)
New Revision: 25741

Log:
pango: generate pango.modules at build time rather than run time

Generate pango.modules using the host tools instead of setting up an init
script to do it at run time. Also apply patches to host build to get
identical pango.modules file.

Removed:
   trunk/buildroot/package/pango/S25pango

Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Deleted: trunk/buildroot/package/pango/S25pango
===================================================================
--- trunk/buildroot/package/pango/S25pango	2009-03-18 22:39:03 UTC (rev 25740)
+++ trunk/buildroot/package/pango/S25pango	2009-03-18 22:39:09 UTC (rev 25741)
@@ -1,20 +0,0 @@
-#! /bin/sh
-#
-# run pango-querymodules if needed
-
-FILE=/etc/pango/pango.modules
-
-case "$1" in
-    start|"")
-	if [ ! -f "$FILE" ] ; then
-	    mkdir -p /etc/pango
-	    /usr/bin/pango-querymodules > "$FILE"
-	fi
-	;;
-    stop)
-	;;
-    *)
-	echo "Usage: $0 {start|stop}" >&2
-	exit 1
-	;;
-esac

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2009-03-18 22:39:03 UTC (rev 25740)
+++ trunk/buildroot/package/pango/pango.mk	2009-03-18 22:39:09 UTC (rev 25741)
@@ -57,7 +57,9 @@
 $(eval $(call AUTOTARGETS,package,pango))
 
 $(PANGO_HOOK_POST_INSTALL):
-	$(INSTALL) -m 755 package/pango/S25pango $(TARGET_DIR)/etc/init.d/
+	mkdir -p $(TARGET_DIR)/etc/pango
+	$(PANGO_HOST_BINARY) > $(TARGET_DIR)/etc/pango/pango.modules
+	$(SED) 's~$(HOST_DIR)~~g' $(TARGET_DIR)/etc/pango/pango.modules
 	touch $@
 
 # pango for the host
@@ -68,6 +70,7 @@
 	mkdir -p $(@D)
 	$(INFLATE$(suffix $(PANGO_SOURCE))) $< | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(@D) package/pango/ \*.patch
 	touch $@
 
 $(PANGO_HOST_DIR)/.configured: $(PANGO_HOST_DIR)/.unpacked $(PKGCONFIG_HOST_BINARY) $(CAIRO_HOST_BINARY) $(LIBGLIB2_HOST_BINARY)
