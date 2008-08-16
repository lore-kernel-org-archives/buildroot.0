From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 16 Aug 2008 12:36:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcre
Message-ID: <20080816193637.0E5DF3C7BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-16 12:36:36 -0700 (Sat, 16 Aug 2008)
New Revision: 23094

Log:
pcre: fix target install

Use install-strip and clean up documentation files instead of
install-exec so files get stripped and manpages installed if
requested.

Modified:
   trunk/buildroot/package/pcre/pcre.mk


Changeset:
Modified: trunk/buildroot/package/pcre/pcre.mk
===================================================================
--- trunk/buildroot/package/pcre/pcre.mk	2008-08-16 19:13:53 UTC (rev 23093)
+++ trunk/buildroot/package/pcre/pcre.mk	2008-08-16 19:36:36 UTC (rev 23094)
@@ -8,6 +8,7 @@
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_INSTALL_STAGING = YES
 PCRE_INSTALL_TARGET = YES
+PCRE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # pcre will use the host g++ if a cross version isn't available
@@ -17,3 +18,7 @@
 PCRE_DEPENDENCIES = uclibc
 
 $(eval $(call AUTOTARGETS,package,pcre))
+
+$(PCRE_HOOK_POST_INSTALL): $(PCRE_TARGET_INSTALL_TARGET)
+	rm -rf $(TARGET_DIR)/usr/share/doc/pcre
+	touch $@
