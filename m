From: correa at uclibc.org <correa@uclibc.org>
Date: Thu, 12 Mar 2009 02:53:55 +0000 (UTC)
Subject: [Buildroot] svn commit: [25623] trunk/buildroot/package/qtopia4
Message-ID: <20090312025355.A5A017645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-03-12 02:53:54 +0000 (Thu, 12 Mar 2009)
New Revision: 25623

Log:
Update Qtopia to 4.5.0, which introduces a new licensing option: LGPL. This will be default now.

Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2009-03-11 23:30:29 UTC (rev 25622)
+++ trunk/buildroot/package/qtopia4/Config.in	2009-03-12 02:53:54 UTC (rev 25623)
@@ -41,10 +41,13 @@
 
 choice
 	prompt "Qtopia 4 Core license type"
-	default BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL
+	default BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_LGPL
 	help
 	  Selects the type of license you which to use for Qtopia 4 Core.
 
+config BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_LGPL
+	bool "LGPL license"
+
 config BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL
 	bool "GPL license"
 
@@ -53,16 +56,17 @@
 
 endchoice
 
-config BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED
-	bool "Approve Qtopia Core 4 GPL licence"
-	depends on BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL
+config BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED
+	bool "Approve Qtopia Core 4 license"
+	depends on BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL || BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_LGPL
 	help
-	  Select this if you approve the GNU GENERAL PUBLIC LICENSE Version 2
-	  on the Qtopia Core 4 library. By doing this you will not be asked
-	  while the library is compiled. Please read and understand the GPL
-	  licence before approving this.
+	  Select this if you approve the above selected license for the
+	  Qtopia Core 4 library.
+	  By doing this you will not be asked while the library is compiled.
+	  Please read and understand the license terms before approving this.
 
-	  For full GPL version 2 see http://www.gnu.org/licenses/gpl.txt
+	  For full GPL version 2 see http://www.gnu.org/licenses/gpl2.txt
+	  For full LGPL see http://www.gnu.org/licenses/lgpl.txt
 
 
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2009-03-11 23:30:29 UTC (rev 25622)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2009-03-12 02:53:54 UTC (rev 25623)
@@ -16,7 +16,7 @@
 # (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
 # to fix
 
-QTOPIA4_VERSION:=4.4.3
+QTOPIA4_VERSION:=4.5.0
 QTOPIA4_CAT:=$(BZCAT)
 
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
@@ -36,7 +36,7 @@
 QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/source
 QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.bz2
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION)
-ifeq ($(BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED),y)
+ifeq ($(BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED),y)
 QTOPIA4_CONFIGURE+= -confirm-license
 endif
 endif
