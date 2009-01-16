From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 13:56:23 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  tinylogin
Message-ID: <20090116135624.1D0BA77566@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 13:56:23 +0000 (Fri, 16 Jan 2009)
New Revision: 24879

Log:
package: remove tinylogin

It's ancient and upstream is gone, people should just use the login stuff
in busybox instead.

Removed:
   trunk/buildroot/package/tinylogin/Config.in
   trunk/buildroot/package/tinylogin/tinylogin.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-01-16 13:27:08 UTC (rev 24878)
+++ trunk/buildroot/package/Config.in	2009-01-16 13:56:23 UTC (rev 24879)
@@ -108,7 +108,6 @@
 source "package/sysklogd/Config.in"
 # busybox has init and the runit stuff
 source "package/sysvinit/Config.in"
-source "package/tinylogin/Config.in"
 source "package/util-linux/Config.in"
 source "package/which/Config.in"
 endif

Deleted: trunk/buildroot/package/tinylogin/Config.in
===================================================================
--- trunk/buildroot/package/tinylogin/Config.in	2009-01-16 13:27:08 UTC (rev 24878)
+++ trunk/buildroot/package/tinylogin/Config.in	2009-01-16 13:56:23 UTC (rev 24879)
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_TINYLOGIN
-	bool "tinylogin"
-	help
-	  Suite of tiny Unix utilities for handling logging into,
-	  being authenticated by, changing one's password for, and
-	  otherwise maintaining users and groups on an embedded system.
-
-	  http://tinylogin.busybox.net/

Deleted: trunk/buildroot/package/tinylogin/tinylogin.mk
===================================================================
--- trunk/buildroot/package/tinylogin/tinylogin.mk	2009-01-16 13:27:08 UTC (rev 24878)
+++ trunk/buildroot/package/tinylogin/tinylogin.mk	2009-01-16 13:56:23 UTC (rev 24879)
@@ -1,62 +0,0 @@
-#############################################################
-#
-# tinylogin
-#
-#############################################################
-# Enable this to use the tinylogin daily snapshot
-TINYLOGIN_VERSION:=1.4
-USE_TINYLOGIN_SNAPSHOT=true
-
-ifeq ($(USE_TINYLOGIN_SNAPSHOT),true)
-# Be aware that this changes daily....
-TINYLOGIN_DIR:=$(BUILD_DIR)/tinylogin
-TINYLOGIN_SOURCE:=tinylogin-snapshot.tar.bz2
-TINYLOGIN_SITE:=http://tinylogin.busybox.net/downloads/snapshots
-else
-TINYLOGIN_DIR:=$(BUILD_DIR)/tinylogin-$(TINYLOGIN_VERSION)
-TINYLOGIN_SOURCE:=tinylogin-$(TINYLOGIN_VERSION).tar.bz2
-TINYLOGIN_SITE:=http://tinylogin.busybox.net/downloads
-endif
-TINYLOGIN_CAT:=$(BZCAT)
-
-$(DL_DIR)/$(TINYLOGIN_SOURCE):
-	$(call DOWNLOAD,$(TINYLOGIN_SITE),$(TINYLOGIN_SOURCE))
-
-tinylogin-source: $(DL_DIR)/$(TINYLOGIN_SOURCE)
-
-$(TINYLOGIN_DIR)/Config.h: $(DL_DIR)/$(TINYLOGIN_SOURCE)
-	$(TINYLOGIN_CAT) $(DL_DIR)/$(TINYLOGIN_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(SED) "s/\`id -u\` -ne 0/0 == 1/" \
-		$(TINYLOGIN_DIR)/install.sh
-	$(SED) "s/4755 --owner=root --group=root/755/" \
-		$(TINYLOGIN_DIR)/install.sh
-	$(SED) "s/^DOSTATIC.*/DOSTATIC=false/g;" $(TINYLOGIN_DIR)/Makefile
-	$(SED) "s/^DODEBUG.*/DODEBUG=false/g;" $(TINYLOGIN_DIR)/Makefile
-	# date test this one
-	touch $(TINYLOGIN_DIR)/Config.h
-
-$(TINYLOGIN_DIR)/tinylogin: $(TINYLOGIN_DIR)/Config.h
-	$(MAKE) CC=$(TARGET_CC) CROSS="$(TARGET_CROSS)" \
-		CFLAGS_EXTRA="$(TARGET_CFLAGS)" -C $(TINYLOGIN_DIR)
-
-$(TARGET_DIR)/bin/tinylogin: $(TINYLOGIN_DIR)/tinylogin
-	$(MAKE) CC=$(TARGET_CC) CROSS="$(TARGET_CROSS)" \
-		PREFIX="$(TARGET_DIR)" -C $(TINYLOGIN_DIR) \
-		CFLAGS_EXTRA="$(TARGET_CFLAGS)" install
-
-tinylogin: uclibc $(TARGET_DIR)/bin/tinylogin
-
-tinylogin-clean:
-	rm -f $(TARGET_DIR)/bin/tinylogin
-	-$(MAKE) -C $(TINYLOGIN_DIR) clean
-
-tinylogin-dirclean:
-	rm -rf $(TINYLOGIN_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_TINYLOGIN),y)
-TARGETS+=tinylogin
-endif
