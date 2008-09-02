From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  2 Sep 2008 04:07:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bridge-utils
Message-ID: <20080902110750.49CD93C658@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-02 04:07:49 -0700 (Tue, 02 Sep 2008)
New Revision: 23302

Log:
bridge: convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/bridge-utils/bridge.mk


Changeset:
Modified: trunk/buildroot/package/bridge-utils/bridge.mk
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.mk	2008-09-02 09:00:23 UTC (rev 23301)
+++ trunk/buildroot/package/bridge-utils/bridge.mk	2008-09-02 11:07:49 UTC (rev 23302)
@@ -1,71 +1,28 @@
 #############################################################
 #
-# bridgeutils - User Space Program For Controlling Bridging
+# bridge-utils - User Space Program For Controlling Bridging
 #
 #############################################################
 #
-BRIDGE_VERSION=1.0.6
-BRIDGE_SOURCE_URL=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bridge/
-BRIDGE_SOURCE=bridge-utils-$(BRIDGE_VERSION).tar.gz
-BRIDGE_BUILD_DIR=$(BUILD_DIR)/bridge-utils-$(BRIDGE_VERSION)
-BRIDGE_TARGET_BINARY:=usr/sbin/brctl
+BRIDGE_VERSION:=1.0.6
+BRIDGE_SOURCE:=bridge-utils-$(BRIDGE_VERSION).tar.gz
+BRIDGE_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bridge/
+BRIDGE_INSTALL_STAGING:=NO
+BRIDGE_INSTALL_TARGET:=YES
+BRIDGE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
+BRIDGE_CONF_OPT:=--with-linux-headers=$(LINUX_HEADERS_DIR) $(DISABLE_NLS)
+BRIDGE_DEPENDENCIES:=uclibc
 
-$(DL_DIR)/$(BRIDGE_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(BRIDGE_SOURCE_URL)/$(BRIDGE_SOURCE)
+$(eval $(call AUTOTARGETS,package,bridge))
 
-$(BRIDGE_BUILD_DIR)/.unpacked: $(DL_DIR)/$(BRIDGE_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(BRIDGE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	patch -p1 -d $(BRIDGE_BUILD_DIR) < package/bridge-utils/bridge.patch
-	touch $(BRIDGE_BUILD_DIR)/.unpacked
+# bridge has no install-strip target
+$(BRIDGE_HOOK_POST_INSTALL): $(BRIDGE_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/brctl
+	touch $@
 
-$(BRIDGE_BUILD_DIR)/.configured: $(BRIDGE_BUILD_DIR)/.unpacked
-	(cd $(BRIDGE_BUILD_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-		--with-linux-headers=$(LINUX_HEADERS_DIR) \
-	)
-	touch $(BRIDGE_BUILD_DIR)/.configured
-
-$(BRIDGE_BUILD_DIR)/brctl/brctl: $(BRIDGE_BUILD_DIR)/.configured
-	$(MAKE) -C $(BRIDGE_BUILD_DIR)
-
-$(TARGET_DIR)/$(BRIDGE_TARGET_BINARY): $(BRIDGE_BUILD_DIR)/brctl/brctl
-	cp -af $(BRIDGE_BUILD_DIR)/brctl/brctl $(TARGET_DIR)/$(BRIDGE_TARGET_BINARY)
-	$(STRIPCMD) $(TARGET_DIR)/$(BRIDGE_TARGET_BINARY)
-	#cp -af $(BRIDGE_BUILD_DIR)/brctl/brctld $(TARGET_DIR)/usr/sbin/
-	#$(STRIPCMD) $(TARGET_DIR)/usr/sbin/brctld
-
-bridge-utils: $(TARGET_DIR)/$(BRIDGE_TARGET_BINARY)
-
-bridge-utils-source: $(DL_DIR)/$(BRIDGE_SOURCE)
-
-bridge-utils-clean:
-	#$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BRIDGE_BUILD_DIR) uninstall
-	-$(MAKE) -C $(BRIDGE_BUILD_DIR) clean
-
-bridge-utils-dirclean:
-	rm -rf $(BRIDGE_BUILD_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_BRIDGE)),y)
-TARGETS+=bridge-utils
-endif
+# bridge has no uninstall target
+$(BUILD_DIR)/bridge-$(BRIDGE_VERSION)/.stamp_cleaned:
+	$(call MESSAGE,"Cleaning up")
+	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
+		include/libbridge.h man/man8/brctl.8 sbin/brctl)
+	touch $@
