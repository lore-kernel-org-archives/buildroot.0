From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 31 Dec 2008 09:35:12 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pango
Message-ID: <20081231093512.405A876FDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-31 09:35:11 +0000 (Wed, 31 Dec 2008)
New Revision: 24624

Log:
pango: add init script to create /etc/pango/pango.modules

It would be nicer to do this at compile time, but then we would need to
compile pango for the host as well.

Added:
   trunk/buildroot/package/pango/S25pango

Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Added: trunk/buildroot/package/pango/S25pango
===================================================================
--- trunk/buildroot/package/pango/S25pango	                        (rev 0)
+++ trunk/buildroot/package/pango/S25pango	2008-12-31 09:35:11 UTC (rev 24624)
@@ -0,0 +1,19 @@
+#! /bin/sh
+#
+# run pango-querymodules if needed
+
+FILE=/etc/pango/pango.modules
+
+case "$1" in
+    start|"")
+	if [ ! -f "$FILE" ] ; then
+	    /usr/bin/pango-querymodules > "$FILE"
+	fi
+	;;
+    stop)
+	;;
+    *)
+	echo "Usage: $0 {start|stop}" >&2
+	exit 1
+	;;
+esac

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2008-12-31 09:35:06 UTC (rev 24623)
+++ trunk/buildroot/package/pango/pango.mk	2008-12-31 09:35:11 UTC (rev 24624)
@@ -55,3 +55,7 @@
 PANGO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 $(XSERVER) cairo
 
 $(eval $(call AUTOTARGETS,package,pango))
+
+$(PANGO_HOOK_POST_INSTALL):
+	$(INSTALL) -m 755 package/pango/S25pango $(TARGET_DIR)/etc/init.d/
+	touch $@
