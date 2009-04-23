From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 23 Apr 2009 14:24:58 +0000 (UTC)
Subject: [Buildroot] svn commit: [26196] trunk/buildroot/package/dbus-glib
Message-ID: <20090423142458.805D176454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-23 14:24:58 +0000 (Thu, 23 Apr 2009)
New Revision: 26196

Log:
dbus-glib: workaround Kconfig issue with select

Kconfig gets confused about the selects and thinks there's a recursive
dependency around expat, so implement an alternative solution instead.

Modified:
   trunk/buildroot/package/dbus-glib/Config.in


Changeset:
Modified: trunk/buildroot/package/dbus-glib/Config.in
===================================================================
--- trunk/buildroot/package/dbus-glib/Config.in	2009-04-23 12:49:36 UTC (rev 26195)
+++ trunk/buildroot/package/dbus-glib/Config.in	2009-04-23 14:24:58 UTC (rev 26196)
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_DBUS_GLIB
 	bool "dbus-glib"
 	depends on BR2_PACKAGE_DBUS
+	depends on BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_EXPAT
 	help
 	  GLib bindings for D-Bus.
 
 	  http://www.freedesktop.org/software/dbus
+
+comment "dbus-glib needs dbus to be compiled with expat support"
+	depends on !BR2_PACKAGE_EXPAT
