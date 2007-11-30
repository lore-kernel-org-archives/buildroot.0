From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 30 Nov 2007 04:02:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lxdoom
Message-ID: <20071130120206.2536A30052@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-30 04:02:05 -0800 (Fri, 30 Nov 2007)
New Revision: 20595

Log:
Add lxdoom package

Added:
   trunk/buildroot/package/lxdoom/
   trunk/buildroot/package/lxdoom/Config.in
   trunk/buildroot/package/lxdoom/lxdoom.mk


Changeset:
Added: trunk/buildroot/package/lxdoom/Config.in
===================================================================
--- trunk/buildroot/package/lxdoom/Config.in	                        (rev 0)
+++ trunk/buildroot/package/lxdoom/Config.in	2007-11-30 12:02:05 UTC (rev 20595)
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_DOOM
+	bool "doom"
+	default n
+	help
+	  This is the linux version of the popular doom game.

Added: trunk/buildroot/package/lxdoom/lxdoom.mk
===================================================================
--- trunk/buildroot/package/lxdoom/lxdoom.mk	                        (rev 0)
+++ trunk/buildroot/package/lxdoom/lxdoom.mk	2007-11-30 12:02:05 UTC (rev 20595)
@@ -0,0 +1,82 @@
+#############################################################
+#
+# lxdoom
+#
+#############################################################
+
+LXDOOM_VERSION=1.4.4
+
+# Don't alter below this line unless you (think) you know
+# what you are doing! Danger, Danger!
+
+LXDOOM_SOURCE=lxdoom-$(LXDOOM_VERSION).tar.gz
+LXDOOM_CAT:=$(ZCAT)
+LXDOOM_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lxdoom
+
+LXDOOM_DIR=$(BUILD_DIR)/lxdoom-$(LXDOOM_VERSION)
+
+$(DL_DIR)/$(LXDOOM_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LXDOOM_SITE)/$(LXDOOM_SOURCE)
+
+$(LXDOOM_DIR)/.unpacked: $(DL_DIR)/$(LXDOOM_SOURCE)
+	$(LXDOOM_CAT) $(DL_DIR)/$(LXDOOM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LXDOOM_DIR) package/lxdoom/ lxdoom-$(LXDOOM_VERSION)\*.patch
+	$(CONFIG_UPDATE) $(LXDOOM_DIR)
+	touch $(LXDOOM_DIR)/.unpacked
+
+$(LXDOOM_DIR)/Makefile: $(LXDOOM_DIR)/.unpacked
+	rm -f $(LXDOOM_DIR)/Makefile
+	mkdir -p $(LXDOOM_DIR)
+	(cd $(LXDOOM_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(LXDOOM_DIR)/configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--includedir=/usr/include \
+		--enable-shared \
+		$(DISABLE_NLS); \
+	)
+
+$(LXDOOM_DIR)/lxdoom: $(LXDOOM_DIR)/Makefile
+	rm -f $@
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LXDOOM_DIR)
+
+$(LXDOOM_DIR)/.installed: $(LXDOOM_DIR)/lxdoom
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LXDOOM_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/liblxdoom.la
+	touch $@
+
+$(TARGET_DIR)/usr/bin/lxdoomdec: $(LXDOOM_DIR)/.installed
+	cp -dpf $(STAGING_DIR)/usr/bin/lxdoomdec $(TARGET_DIR)/usr/bin/lxdoomdec
+
+$(TARGET_DIR)/usr/bin/lxdoomenc: $(TARGET_DIR)/usr/bin/lxdoomdec
+	cp -dpf $(STAGING_DIR)/usr/bin/lxdoomenc $(TARGET_DIR)/usr/bin/lxdoomenc
+
+$(TARGET_DIR)/usr/lib/liblxdoom.so: $(TARGET_DIR)/usr/bin/lxdoomenc
+	cp -dpf $(STAGING_DIR)/usr/lib/liblxdoom.so* $(TARGET_DIR)/usr/lib
+
+lxdoom-bins:	
+
+lxdoom: uclibc libogg $(TARGET_DIR)/usr/lib/liblxdoom.so
+
+lxdoom-source: $(DL_DIR)/$(LXDOOM_SOURCE)
+
+lxdoom-clean:
+	@if [ -d $(LXDOOM_DIR)/Makefile ]; then \
+		$(MAKE) -C $(LXDOOM_DIR) clean; \
+	fi
+
+lxdoom-dirclean:
+	rm -rf $(LXDOOM_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LXDOOM)),y)
+TARGETS+=lxdoom
+endif
