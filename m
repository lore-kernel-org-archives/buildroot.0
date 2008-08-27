From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 22:27:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netcat
Message-ID: <20080827052727.BBBE63C66E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 22:27:27 -0700 (Tue, 26 Aug 2008)
New Revision: 23231

Log:
netcat: convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/netcat/netcat.mk


Changeset:
Modified: trunk/buildroot/package/netcat/netcat.mk
===================================================================
--- trunk/buildroot/package/netcat/netcat.mk	2008-08-26 22:37:34 UTC (rev 23230)
+++ trunk/buildroot/package/netcat/netcat.mk	2008-08-27 05:27:27 UTC (rev 23231)
@@ -4,56 +4,15 @@
 #
 #############################################################
 
-NETCAT_VERSION=0.7.1
-NETCAT_SOURCE=netcat-$(NETCAT_VERSION).tar.gz
-NETCAT_CAT:=$(ZCAT)
+NETCAT_VERSION:=0.7.1
+NETCAT_SOURCE:=netcat-$(NETCAT_VERSION).tar.gz
 NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netcat
-NETCAT_DIR:=$(BUILD_DIR)/netcat-$(NETCAT_VERSION)
-NETCAT_BINARY:=src/netcat
-NETCAT_TARGET_BINARY:=sbin/netcat
+NETCAT_AUTORECONF:=NO
+NETCAT_INSTALL_STAGING:=NO
+NETCAT_INSTALL_TARGET:=YES
+NETCAT_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
+NETCAT_CONF_OPT:= $(DISABLE_NLS)
 
-$(DL_DIR)/$(NETCAT_SOURCE):
-	$(WGET) -P $(DL_DIR) $(NETCAT_SITE)/$(NETCAT_SOURCE)
+NETCAT_DEPENDENCIES = uclibc
 
-netcat-source: $(DL_DIR)/$(NETCAT_SOURCE)
-
-$(NETCAT_DIR)/.unpacked: $(DL_DIR)/$(NETCAT_SOURCE)
-	$(NETCAT_CAT) $(DL_DIR)/$(NETCAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(NETCAT_DIR)
-	touch $@
-
-$(NETCAT_DIR)/.configured: $(NETCAT_DIR)/.unpacked
-	(cd $(NETCAT_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
-	)
-	touch $@
-
-
-$(NETCAT_DIR)/$(NETCAT_BINARY): $(NETCAT_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(NETCAT_DIR)
-
-$(TARGET_DIR)/$(NETCAT_TARGET_BINARY): $(NETCAT_DIR)/$(NETCAT_BINARY)
-	install -D $(NETCAT_DIR)/$(NETCAT_BINARY) $(TARGET_DIR)/$(NETCAT_TARGET_BINARY)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-netcat: uclibc $(TARGET_DIR)/$(NETCAT_TARGET_BINARY)
-
-netcat-clean:
-	rm -f $(TARGET_DIR)/$(NETCAT_TARGET_BINARY)
-	-$(MAKE) -C $(NETCAT_DIR) clean
-netcat-dirclean:
-	rm -rf $(NETCAT_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_NETCAT)),y)
-TARGETS+=netcat
-endif
+$(eval $(call AUTOTARGETS,package,netcat))
