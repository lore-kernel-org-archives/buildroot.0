From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Sep 2007 08:35:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20070920153527.553303004A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-20 08:35:26 -0700 (Thu, 20 Sep 2007)
New Revision: 19910

Log:
Make sure libdaemon finds AC_PROG_LIBTOOL

Removed:
   trunk/buildroot/package/libdaemon/libdaemon-0.10.patch.bz2

Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Deleted: trunk/buildroot/package/libdaemon/libdaemon-0.10.patch.bz2
===================================================================
(Binary files differ)

Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2007-09-20 12:07:10 UTC (rev 19909)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2007-09-20 15:35:26 UTC (rev 19910)
@@ -26,17 +26,11 @@
 $(LIBDAEMON_DIR)/.unpacked: $(DL_DIR)/$(LIBDAEMON_SOURCE)
 	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
-# Ulf, what was this supposed to fix? Your patch is broken
-# (hardcoded for /home/ulf/..)
-#	mkdir -p $(PROJECT_BUILD_DIR)/patches
-#	$(BZCAT) package/libdaemon/$(LIBDAEMON_NAME).patch.bz2 \
-#		> $(PROJECT_BUILD_DIR)/patches/$(LIBDAEMON_NAME).patch
-#	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) $(PROJECT_BUILD_DIR)/patches/ $(LIBDAEMON_NAME)\*.patch
-#	$(CONFIG_UPDATE) $(LIBDAEMON_DIR)
+	$(CONFIG_UPDATE) $(LIBDAEMON_DIR)
 	touch $@
 
 $(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
-	(cd $(LIBDAEMON_DIR) && rm -rf config.cache && autoconf)
+	(cd $(LIBDAEMON_DIR) && rm -rf config.cache && autoreconf)
 	(cd $(LIBDAEMON_DIR) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
