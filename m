From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 31 Dec 2008 09:35:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20081231093516.DED6176FDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-31 09:35:15 +0000 (Wed, 31 Dec 2008)
New Revision: 24625

Log:
libgtk2: add init script to create /etc/gtk-2.0/gdk-pixbuf.loaders

It would be nicer to do this at compile time, but then we would need to
compile libgtk2 for the host as well.

Added:
   trunk/buildroot/package/libgtk2/S26libgtk2

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Added: trunk/buildroot/package/libgtk2/S26libgtk2
===================================================================
--- trunk/buildroot/package/libgtk2/S26libgtk2	                        (rev 0)
+++ trunk/buildroot/package/libgtk2/S26libgtk2	2008-12-31 09:35:15 UTC (rev 24625)
@@ -0,0 +1,19 @@
+#!/bin/sh
+#
+# run pgdk-pixbuf-query-loaders if needed
+
+FILE=/etc/gtk-2.0/gdk-pixbuf.loaders
+
+case "$1" in
+    start|"")
+	if [ ! -f "$FILE" ] ; then
+	    /usr/bin/gdk-pixbuf-query-loaders > "$FILE"
+	fi
+	;;
+    stop)
+	;;
+    *)
+	echo "Usage: $0 {start|stop}" >&2
+	exit 1
+	;;
+esac

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2008-12-31 09:35:11 UTC (rev 24624)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2008-12-31 09:35:15 UTC (rev 24625)
@@ -123,3 +123,7 @@
 endif
 
 $(eval $(call AUTOTARGETS,package,libgtk2))
+
+$(LIBGTK2_HOOK_POST_INSTALL):
+	$(INSTALL) -m 755 package/libgtk2/S26libgtk2 $(TARGET_DIR)/etc/init.d/
+	touch $@
