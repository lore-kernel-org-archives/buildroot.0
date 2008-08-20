From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 20 Aug 2008 07:15:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rsync
Message-ID: <20080820141511.09EE33C6FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-20 07:15:10 -0700 (Wed, 20 Aug 2008)
New Revision: 23118

Log:
rsync: convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/rsync/rsync.mk


Changeset:
Modified: trunk/buildroot/package/rsync/rsync.mk
===================================================================
--- trunk/buildroot/package/rsync/rsync.mk	2008-08-20 08:50:02 UTC (rev 23117)
+++ trunk/buildroot/package/rsync/rsync.mk	2008-08-20 14:15:10 UTC (rev 23118)
@@ -3,57 +3,17 @@
 # rsync
 #
 #############################################################
+
 RSYNC_VERSION:=2.6.9
 RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
 RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
-RSYNC_DIR:=$(BUILD_DIR)/rsync-$(RSYNC_VERSION)
-RSYNC_CAT:=$(ZCAT)
-RSYNC_BINARY:=rsync
-RSYNC_TARGET_BINARY:=usr/bin/rsync
+RSYNC_AUTORECONF:=no
+RSYNC_INSTALL_STAGING:=NO
+RSYNC_INSTALL_TARGET:=YES
+RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
+			  STRIPPROG="$(TARGET_STRIP)" install-strip
+RSYNC_CONF_OPT:=--with-included-popt
 
-$(DL_DIR)/$(RSYNC_SOURCE):
-	$(WGET) -P $(DL_DIR) $(RSYNC_SITE)/$(RSYNC_SOURCE)
+RSYNC_DEPENDENCIES:=uclibc
 
-rsync-source: $(DL_DIR)/$(RSYNC_SOURCE)
-
-$(RSYNC_DIR)/.unpacked: $(DL_DIR)/$(RSYNC_SOURCE)
-	$(RSYNC_CAT) $(DL_DIR)/$(RSYNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(RSYNC_DIR) package/rsync/ rsync\*.patch
-	$(CONFIG_UPDATE) $(RSYNC_DIR)
-	touch $@
-
-$(RSYNC_DIR)/.configured: $(RSYNC_DIR)/.unpacked
-	(cd $(RSYNC_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--with-included-popt \
-	)
-	touch $@
-
-$(RSYNC_DIR)/$(RSYNC_BINARY): $(RSYNC_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(RSYNC_DIR)
-
-$(TARGET_DIR)/$(RSYNC_TARGET_BINARY): $(RSYNC_DIR)/$(RSYNC_BINARY)
-	install -D $(RSYNC_DIR)/$(RSYNC_BINARY) $(TARGET_DIR)/$(RSYNC_TARGET_BINARY)
-
-rsync: uclibc $(TARGET_DIR)/$(RSYNC_TARGET_BINARY)
-
-rsync-clean:
-	rm -f $(TARGET_DIR)/$(RSYNC_TARGET_BINARY)
-	-$(MAKE) -C $(RSYNC_DIR) clean
-
-rsync-dirclean:
-	rm -rf $(RSYNC_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_RSYNC)),y)
-TARGETS+=rsync
-endif
+$(eval $(call AUTOTARGETS,package,rsync))
