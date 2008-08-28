From: laird at uclibc.org <laird@uclibc.org>
Date: Thu, 28 Aug 2008 03:56:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20080828105639.73E743C7AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-28 03:56:38 -0700 (Thu, 28 Aug 2008)
New Revision: 23274

Log:
libxml2: Post process xml2-config file to actually work and bump version

Version bumped to 2.6.31
(2.6.32 has .rej files so patch target fails - upstream need to be informed).

The xml2-config file in staging dir needs to have prefix / exec-prefix setup
to understand the staging directory location.

This then means that packages that call xml2-config to get include paths/cflags
and libs etc work properly. 

This is very similar to what freetype does to freetype-config.



Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2008-08-28 07:33:17 UTC (rev 23273)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2008-08-28 10:56:38 UTC (rev 23274)
@@ -3,11 +3,9 @@
 # libxml2
 #
 #############################################################
-
-LIBXML2_VERSION = 2.6.29
+LIBXML2_VERSION = 2.6.31
 LIBXML2_SOURCE = libxml2-sources-$(LIBXML2_VERSION).tar.gz
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
-LIBXML2_AUTORECONF = NO
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_INSTALL_TARGET = YES
 LIBXML2_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
@@ -26,6 +24,8 @@
 $(eval $(call AUTOTARGETS,package,libxml2))
 
 $(LIBXML2_HOOK_POST_INSTALL):
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 	rm -rf $(TARGET_DIR)/usr/share/aclocal \
 	       $(TARGET_DIR)/usr/share/doc/libxml2-$(LIBXML2_VERSION) \
 	       $(TARGET_DIR)/usr/share/gtk-doc
