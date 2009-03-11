From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 20:32:39 +0000 (UTC)
Subject: [Buildroot] svn commit: [25614] trunk/buildroot/package/dropbear
Message-ID: <20090311203239.B2FA47645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 20:32:39 +0000 (Wed, 11 Mar 2009)
New Revision: 25614

Log:
dropbear: convert to Makefile.autotools.in format

Patch by Gustavo Zacarias <gustavo@zacarias.com.ar>

Closes #179.

Modified:
   trunk/buildroot/package/dropbear/dropbear.mk


Changeset:
Modified: trunk/buildroot/package/dropbear/dropbear.mk
===================================================================
--- trunk/buildroot/package/dropbear/dropbear.mk	2009-03-11 15:59:49 UTC (rev 25613)
+++ trunk/buildroot/package/dropbear/dropbear.mk	2009-03-11 20:32:39 UTC (rev 25614)
@@ -3,79 +3,39 @@
 # dropbear
 #
 #############################################################
-DROPBEAR_VERSION:=0.52
-DROPBEAR_SOURCE:=dropbear-$(DROPBEAR_VERSION).tar.gz
-DROPBEAR_SITE:=http://matt.ucc.asn.au/dropbear/releases/
-DROPBEAR_DIR:=$(BUILD_DIR)/dropbear-$(DROPBEAR_VERSION)
-DROPBEAR_CAT:=$(ZCAT)
-DROPBEAR_BINARY:=dropbearmulti
-DROPBEAR_TARGET_BINARY:=usr/sbin/dropbear
 
-$(DL_DIR)/$(DROPBEAR_SOURCE):
-	 $(call DOWNLOAD,$(DROPBEAR_SITE),$(DROPBEAR_SOURCE))
+DROPBEAR_VERSION = 0.52
+DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.gz
+DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
+DROPBEAR_DEPENDENCIES = uclibc zlib
+DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
+DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
+		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
-dropbear-source: $(DL_DIR)/$(DROPBEAR_SOURCE)
+$(eval $(call AUTOTARGETS,package,dropbear))
 
-$(DROPBEAR_DIR)/.unpacked: $(DL_DIR)/$(DROPBEAR_SOURCE)
-	$(DROPBEAR_CAT) $(DL_DIR)/$(DROPBEAR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DROPBEAR_DIR) package/dropbear/ dropbear\*.patch
-	$(SED) 's,^/\* #define DROPBEAR_MULTI.*,#define DROPBEAR_MULTI,g' $(DROPBEAR_DIR)/options.h
+$(DROPBEAR_HOOK_POST_EXTRACT):
 	$(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND "/usr/bin/xauth,g' $(DROPBEAR_DIR)/options.h
-	$(CONFIG_UPDATE) $(DROPBEAR_DIR)
 	touch $@
 
-$(DROPBEAR_DIR)/.configured: $(DROPBEAR_DIR)/.unpacked
-	(cd $(DROPBEAR_DIR); rm -rf config.cache; \
-		autoconf; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		$(DISABLE_NLS) \
-		--with-shared \
-	)
-	touch $@
-
-$(DROPBEAR_DIR)/$(DROPBEAR_BINARY): $(DROPBEAR_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) LD=$(TARGET_CC) \
-		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" \
-		MULTI=1 SCPPROGRESS=1 -C $(DROPBEAR_DIR)
-
-$(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY): $(DROPBEAR_DIR)/$(DROPBEAR_BINARY)
-	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/sbin
-	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
-	$(INSTALL) -m 755 $(DROPBEAR_DIR)/$(DROPBEAR_BINARY) \
-		$(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/scp
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/ssh
+$(DROPBEAR_TARGET_INSTALL_TARGET):
+	$(call MESSAGE,"Installing to target")
+	$(INSTALL) -m 755 $(DROPBEAR_DIR)/dropbearmulti \
+		$(TARGET_DIR)/usr/sbin/dropbear
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dbclient
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearkey
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearconvert
-	mkdir -p $(TARGET_DIR)/etc/init.d
-	$(INSTALL) -m 755 package/dropbear/S50dropbear $(TARGET_DIR)/etc/init.d/S50dropbear
+	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/scp
+	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/ssh
+	if [ ! -f $(TARGET_DIR)/etc/init.d/S50dropbear ]; then \
+		$(INSTALL) -m 0755 -D package/dropbear/S50dropbear $(TARGET_DIR)/etc/init.d; \
+	fi
+	touch $@
 
-dropbear: uclibc zlib $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
-
-dropbear-clean:
-	-$(MAKE) -C $(DROPBEAR_DIR) clean
-	rm -f $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/usr/bin/{scp,ssh,dbclient,dropbearkey,dropbearconvert}
+$(DROPBEAR_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/sbin/dropbear
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(DROPBEAR_TARGET_BINS))
 	rm -f $(TARGET_DIR)/etc/init.d/S50dropbear
+	rm -f $(DROPBEAR_TARGET_INSTALL_TARGET) $(DROPBEAR_HOOK_POST_INSTALL)
 
-dropbear-dirclean:
-	rm -rf $(DROPBEAR_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DROPBEAR),y)
-TARGETS+=dropbear
-endif
