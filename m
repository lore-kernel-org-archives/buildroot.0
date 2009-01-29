From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 10:13:03 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gamin
Message-ID: <20090129101303.4BE2C76D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-29 10:13:02 +0000 (Thu, 29 Jan 2009)
New Revision: 25117

Log:
gamin: fix build

Dependencies were wrong, and it didn't build without largefile support.

Modified:
   trunk/buildroot/package/gamin/Config.in
   trunk/buildroot/package/gamin/gamin.mk


Changeset:
Modified: trunk/buildroot/package/gamin/Config.in
===================================================================
--- trunk/buildroot/package/gamin/Config.in	2009-01-29 09:36:35 UTC (rev 25116)
+++ trunk/buildroot/package/gamin/Config.in	2009-01-29 10:13:02 UTC (rev 25117)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GAMIN
 	bool "gamin"
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  the File Alteration Monitor
 

Modified: trunk/buildroot/package/gamin/gamin.mk
===================================================================
--- trunk/buildroot/package/gamin/gamin.mk	2009-01-29 09:36:35 UTC (rev 25116)
+++ trunk/buildroot/package/gamin/gamin.mk	2009-01-29 10:13:02 UTC (rev 25117)
@@ -10,13 +10,17 @@
 GAMIN_INSTALL_STAGING = YES
 GAMIN_INSTALL_TARGET = YES
 
-GAMIN_CONF_OPT = --program-prefix=""
+GAMIN_CONF_OPT = --program-prefix="" --disable-debug
 
 GAMIN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 GAMIN_CONF_ENV = have_abstract_sockets=no
 
-GAMIN_DEPENDENCIES = uclibc libgtk2
+ifneq ($(BR2_LARGEFILE),y)
+GAMIN_CONF_ENV += CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
+endif
 
+GAMIN_DEPENDENCIES = uclibc libglib2
+
 $(eval $(call AUTOTARGETS,package,gamin))
 
