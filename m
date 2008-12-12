From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Fri, 12 Dec 2008 01:03:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libiconv
Message-ID: <20081212090347.DF9393C2BB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-12 01:03:47 -0800 (Fri, 12 Dec 2008)
New Revision: 24388

Log:
libiconv: strip installed library and remove the preloadable library

This patch is mainly for size reduction, removing more than half the
needed footprint.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/libiconv/libiconv.mk


Changeset:
Modified: trunk/buildroot/package/libiconv/libiconv.mk
===================================================================
--- trunk/buildroot/package/libiconv/libiconv.mk	2008-12-12 02:14:35 UTC (rev 24387)
+++ trunk/buildroot/package/libiconv/libiconv.mk	2008-12-12 09:03:47 UTC (rev 24388)
@@ -16,3 +16,11 @@
 
 $(eval $(call AUTOTARGETS,package,libiconv))
 
+$(LIBICONV_HOOK_POST_INSTALL):
+	# Remove not used preloadable libiconv.so
+	rm -f $(STAGING_DIR)/usr/lib/preloadable_libiconv.so
+	rm -f $(TARGET_DIR)/usr/lib/preloadable_libiconv.so
+ifneq ($(BR2_ENABLE_DEBUG),y)
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libiconv.so.*
+endif
+	touch $@
