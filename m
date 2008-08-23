From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 23 Aug 2008 06:08:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20080823130837.A5AC0F801B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-23 06:08:37 -0700 (Sat, 23 Aug 2008)
New Revision: 23186

Log:
libxml2: use install-strip instead of install-exec for target install

Use install-strip so binaries gets stripped and man pages / header files
gets installed.

Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2008-08-23 13:08:34 UTC (rev 23185)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2008-08-23 13:08:37 UTC (rev 23186)
@@ -10,6 +10,7 @@
 LIBXML2_AUTORECONF = NO
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_INSTALL_TARGET = YES
+LIBXML2_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
@@ -25,5 +26,7 @@
 $(eval $(call AUTOTARGETS,package,libxml2))
 
 $(LIBXML2_HOOK_POST_INSTALL):
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libxml2*so*
+	rm -rf $(TARGET_DIR)/usr/share/aclocal \
+	       $(TARGET_DIR)/usr/share/doc/libxml2-$(LIBXML2_VERSION) \
+	       $(TARGET_DIR)/usr/share/gtk-doc
 	touch $@
