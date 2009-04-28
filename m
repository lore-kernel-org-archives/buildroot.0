From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Tue, 28 Apr 2009 17:33:44 +0000 (UTC)
Subject: [Buildroot] svn commit: [26225] trunk/buildroot
Message-ID: <20090428173345.49B65766D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2009-04-28 17:33:44 +0000 (Tue, 28 Apr 2009)
New Revision: 26225

Log:
Older versions of 'find' don't have the '-delete' option

Use find's '-print0' and 'xargs -0' as an equivalent alternative.

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-04-28 07:07:11 UTC (rev 26224)
+++ trunk/buildroot/Makefile	2009-04-28 17:33:44 UTC (rev 26225)
@@ -334,8 +334,8 @@
 		fi; \
 		touch $(STAGING_DIR)/.fakeroot.00000; \
 	fi
-	-find $(TARGET_DIR) -type d -name CVS -o -name .svn | xargs rm -rf
-	-find $(TARGET_DIR) -type f -name .empty | xargs rm -rf
+	-find $(TARGET_DIR) -type d -name CVS -o -name .svn -print0 | xargs -0 rm -rf
+	-find $(TARGET_DIR) -type f -name .empty -print0 | xargs -0 rm -rf
 	touch $@
 
 $(TARGET_DIR): $(PROJECT_BUILD_DIR)/.root
@@ -348,8 +348,8 @@
 	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig
-	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -delete
-	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -delete
+	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 endif
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
