From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  9 Jan 2009 13:35:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/grep
Message-ID: <20090109133510.718B0768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-09 13:35:09 +0000 (Fri, 09 Jan 2009)
New Revision: 24732

Log:
grep: convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/grep/grep.mk


Changeset:
Modified: trunk/buildroot/package/grep/grep.mk
===================================================================
--- trunk/buildroot/package/grep/grep.mk	2009-01-09 13:34:53 UTC (rev 24731)
+++ trunk/buildroot/package/grep/grep.mk	2009-01-09 13:35:09 UTC (rev 24732)
@@ -3,65 +3,12 @@
 # grep
 #
 #############################################################
-GNUGREP_VERSION:=2.5.3
-GNUGREP_SOURCE:=grep-$(GNUGREP_VERSION).tar.gz
-GNUGREP_SITE:=$(BR2_GNU_MIRROR)/grep
-GNUGREP_DIR:=$(BUILD_DIR)/grep-$(GNUGREP_VERSION)
-GNUGREP_CAT:=$(ZCAT)
-GNUGREP_BINARY:=src/grep
-GNUGREP_TARGET_BINARY:=bin/grep
+GREP_VERSION:=2.5.3
+GREP_SOURCE:=grep-$(GREP_VERSION).tar.bz2
+GREP_SITE:=$(BR2_GNU_MIRROR)/grep
+GREP_CONF_OPT = --disable-perl-regexp --without-included-regex \
+	$(DISABLE_NLS) $(DISABLE_LARGEFILE)
 
-$(DL_DIR)/$(GNUGREP_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(GNUGREP_SITE)/$(GNUGREP_SOURCE)
+GREP_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),gettext libintl)
 
-grep-source: $(DL_DIR)/$(GNUGREP_SOURCE)
-
-$(GNUGREP_DIR)/.unpacked: $(DL_DIR)/$(GNUGREP_SOURCE)
-	rm -rf $(GNUGREP_DIR).xxx
-	$(GNUGREP_CAT) $(DL_DIR)/$(GNUGREP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(GNUGREP_DIR)
-	touch $@
-
-$(GNUGREP_DIR)/.configured: $(GNUGREP_DIR)/.unpacked
-	(cd $(GNUGREP_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-		--disable-perl-regexp \
-		--without-included-regex \
-	)
-	touch $@
-
-$(GNUGREP_DIR)/$(GNUGREP_BINARY): $(GNUGREP_DIR)/.configured
-	$(MAKE) -C $(GNUGREP_DIR)
-
-$(TARGET_DIR)/$(GNUGREP_TARGET_BINARY): $(GNUGREP_DIR)/$(GNUGREP_BINARY)
-	for i in egrep fgrep grep; do \
-		$(INSTALL) $(GNUGREP_DIR)/src/$$i $(@D); \
-	done
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-grep: uclibc $(if $(BR2_ENABLE_LOCALE),gettext libintl) \
-	 $(TARGET_DIR)/$(GNUGREP_TARGET_BINARY)
-	echo deps: $^
-grep-clean:
-	rm -f $(addprefix $(TARGET_DIR)/bin/,egrep fgrep grep)
-	-$(MAKE) -C $(GNUGREP_DIR) clean
-
-grep-dirclean:
-	rm -rf $(GNUGREP_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_GREP),y)
-TARGETS+=grep
-endif
+$(eval $(call AUTOTARGETS,package,grep))
