From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 25 Aug 2008 02:04:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/psmisc
Message-ID: <20080825090444.5208F3C61F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-25 02:04:39 -0700 (Mon, 25 Aug 2008)
New Revision: 23197

Log:
psmisc: convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/psmisc/psmisc.mk


Changeset:
Modified: trunk/buildroot/package/psmisc/psmisc.mk
===================================================================
--- trunk/buildroot/package/psmisc/psmisc.mk	2008-08-24 16:25:40 UTC (rev 23196)
+++ trunk/buildroot/package/psmisc/psmisc.mk	2008-08-25 09:04:39 UTC (rev 23197)
@@ -6,55 +6,13 @@
 PSMISC_VERSION:=22.2
 PSMISC_SOURCE:=psmisc-$(PSMISC_VERSION).tar.gz
 PSMISC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
-PSMISC_DIR:=$(BUILD_DIR)/psmisc-$(PSMISC_VERSION)
-PSMISC_BINARY:=src/killall
-PSMISC_TARGET_BINARY:=bin/killall
+PSMISC_AUTORECONF:=no
+PSMISC_INSTALL_STAGING:=no
+PSMISC_INSTALL_TARGET:=YES
+PSMISC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
+PSMISC_CONF_ENV:=ac_cv_func_malloc_0_nonnull=yes \
+		 ac_cv_func_realloc_0_nonnull=yes
+PSMISC_CONF_OPT:= $(DISABLE_NLS) $(DISABLE_IPV6)
+PSMISC_DEPENDENCIES:=uclibc ncurses
 
-$(DL_DIR)/$(PSMISC_SOURCE):
-	$(WGET) -P $(DL_DIR) $(PSMISC_SITE)/$(PSMISC_SOURCE)
-
-$(PSMISC_DIR)/.unpacked: $(DL_DIR)/$(PSMISC_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(PSMISC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(PSMISC_DIR)/.unpacked
-
-$(PSMISC_DIR)/.configured: $(PSMISC_DIR)/.unpacked
-	(cd $(PSMISC_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
-		$(DISABLE_NLS) \
-		$(DISABLE_IPV6) \
-	)
-	touch $(PSMISC_DIR)/.configured
-
-$(PSMISC_DIR)/$(PSMISC_BINARY): $(PSMISC_DIR)/.configured
-	$(MAKE) -C $(PSMISC_DIR)
-
-$(TARGET_DIR)/$(PSMISC_TARGET_BINARY): $(PSMISC_DIR)/$(PSMISC_BINARY)
-	$(MAKE) -C $(PSMISC_DIR) install DESTDIR=$(TARGET_DIR)
-	rm -Rf $(TARGET_DIR)/usr/share/man
-
-psmisc: uclibc ncurses $(TARGET_DIR)/$(PSMISC_TARGET_BINARY)
-
-psmisc-source: $(DL_DIR)/$(PSMISC_SOURCE)
-
-psmisc-clean:
-	for bin in fuser killall pstree oldfuser pstree.x11; do \
-		rm -f $(TARGET_DIR)/bin/$${bin}; \
-	done
-
-psmisc-dirclean:
-	rm -rf $(PSMISC_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_PSMISC)),y)
-TARGETS+=psmisc
-endif
+$(eval $(call AUTOTARGETS,package,psmisc))
