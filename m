From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 08:59:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070822155958.2074EA5E13@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 08:59:56 -0700 (Wed, 22 Aug 2007)
New Revision: 19650

Log:
- honour BR2_HAVE_MANPAGES BR2_HAVE_INFOPAGES, BR2_HAVE_INCLUDES


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-08-22 15:52:01 UTC (rev 19649)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-08-22 15:59:56 UTC (rev 19650)
@@ -216,10 +216,16 @@
 $(BUILD_DIR)/%/.stamp_target_installed:
 	$(call MESSAGE,"Installing to target")
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
-	for d in man include info share/info ; do \
+	$(if $(BR2_HAVE_MANPAGES),,for d in man ; do \
 		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d ; \
-	done
-	find $(TARGET_DIR) -name '*.a' -o -name '*.la' -delete
+	done)
+	$(if $(BR2_HAVE_INFOPAGES),,for d in info share/info ; do \
+		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d ; \
+	done)
+	$(if $(BR2_HAVE_INCLUDES),,for d in include ; do \
+		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d ; \
+	done)
+	find $(TARGET_DIR) -name '*.la' -delete
 	touch $@
 
 $(BUILD_DIR)/%/.stamp_cleaned:
