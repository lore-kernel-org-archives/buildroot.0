From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Nov 2007 06:49:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20071125144946.45B8DA6853@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-25 06:49:45 -0800 (Sun, 25 Nov 2007)
New Revision: 20533

Log:
Fix dependency loop in dbus

Modified:
   trunk/buildroot/package/dbus/Config.in


Changeset:
Modified: trunk/buildroot/package/dbus/Config.in
===================================================================
--- trunk/buildroot/package/dbus/Config.in	2007-11-25 12:53:25 UTC (rev 20532)
+++ trunk/buildroot/package/dbus/Config.in	2007-11-25 14:49:45 UTC (rev 20533)
@@ -1,11 +1,15 @@
 config BR2_PACKAGE_DBUS
 	bool "dbus"
 	default n
+	depends on BR2_PACKAGE_EXPAT || BR2_PACKAGE_LIBXML2
 	help
 	  The D-Bus message bus system.
 
 	  http://www.freedesktop.org/wiki/Software/dbus
 
+comment "dbus not available (need expat or libxml2)
+	depends on !BR2_PACKAGE_EXPAT && !BR2_PACKAGE_LIBXML2
+
 choice
 	prompt "XML library to use"
 	depends BR2_PACKAGE_DBUS
@@ -17,11 +21,11 @@
 	  Expat is significant smaller.
 
 	config BR2_DBUS_EXPAT
-	       bool "Expat"
-	       select BR2_PACKAGE_EXPAT
+		bool "Expat"
+		depends on BR2_PACKAGE_EXPAT
 
 	config BR2_DBUS_LIBXML2
-	       bool "libxml2"
-	       select BR2_PACKAGE_LIBXML2
+		bool "libxml2"
+		depends on BR2_PACKAGE_LIBXML2
 
 endchoice
