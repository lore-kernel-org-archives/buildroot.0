From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 21:46:43 +0000 (UTC)
Subject: [Buildroot] svn commit: [25801] trunk/buildroot/package: autoconf
	automake
Message-ID: <20090323214643.A579A76A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 21:46:43 +0000 (Mon, 23 Mar 2009)
New Revision: 25801

Log:
autoconf: cleanup

- Convert into Makefile.autotools.in format for target build
- Build host version in BUILD_DIR and install into HOST_DIR

Modified:
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/automake/automake.mk


Changeset:
Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2009-03-23 21:46:37 UTC (rev 25800)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2009-03-23 21:46:43 UTC (rev 25801)
@@ -3,136 +3,60 @@
 # autoconf
 #
 #############################################################
-AUTOCONF_VERSION:=2.63
-AUTOCONF_SOURCE:=autoconf-$(AUTOCONF_VERSION).tar.bz2
-AUTOCONF_SITE:=$(BR2_GNU_MIRROR)/autoconf
-AUTOCONF_CAT:=$(BZCAT)
-AUTOCONF_SRC_DIR:=$(TOOL_BUILD_DIR)/autoconf-$(AUTOCONF_VERSION)
-AUTOCONF_DIR:=$(BUILD_DIR)/autoconf-$(AUTOCONF_VERSION)
-AUTOCONF_HOST_DIR:=$(TOOL_BUILD_DIR)/autoconf-$(AUTOCONF_VERSION)-host
-AUTOCONF_BINARY:=autoconf
-AUTOCONF_TARGET_BINARY:=usr/bin/autoconf
-AUTOCONF:=$(STAGING_DIR)/usr/bin/autoconf
+AUTOCONF_VERSION = 2.63
+AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
+AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-# variables used by other packages
-AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
-
-$(DL_DIR)/$(AUTOCONF_SOURCE):
-	 $(call DOWNLOAD,$(AUTOCONF_SITE),$(AUTOCONF_SOURCE))
-
-autoconf-source: $(DL_DIR)/$(AUTOCONF_SOURCE)
-
-$(AUTOCONF_SRC_DIR)/.unpacked: $(DL_DIR)/$(AUTOCONF_SOURCE)
-	$(AUTOCONF_CAT) $(DL_DIR)/$(AUTOCONF_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(AUTOCONF_SRC_DIR)
-	touch $@
-
-#############################################################
-#
-# autoconf for the target
-#
-#############################################################
-
-$(AUTOCONF_DIR)/.configured: $(AUTOCONF_SRC_DIR)/.unpacked
-	mkdir -p $(AUTOCONF_DIR)
-	(cd $(AUTOCONF_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		EMACS="no" \
-		$(AUTOCONF_SRC_DIR)/configure \
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
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-	)
-	touch $@
-
-$(AUTOCONF_DIR)/bin/$(AUTOCONF_BINARY): $(AUTOCONF_DIR)/.configured
-	$(MAKE1) -C $(AUTOCONF_DIR)
-
-$(TARGET_DIR)/$(AUTOCONF_TARGET_BINARY): $(AUTOCONF_DIR)/bin/$(AUTOCONF_BINARY)
-	$(MAKE) \
-	    prefix=$(TARGET_DIR)/usr \
-	    exec_prefix=$(TARGET_DIR)/usr \
-	    bindir=$(TARGET_DIR)/usr/bin \
-	    sbindir=$(TARGET_DIR)/usr/sbin \
-	    libexecdir=$(TARGET_DIR)/usr/lib \
-	    datadir=$(TARGET_DIR)/usr/share \
-	    sysconfdir=$(TARGET_DIR)/etc \
-	    localstatedir=$(TARGET_DIR)/var \
-	    libdir=$(TARGET_DIR)/usr/lib \
-	    infodir=$(TARGET_DIR)/usr/share/info \
-	    mandir=$(TARGET_DIR)/usr/share/man \
-	    includedir=$(TARGET_DIR)/usr/include \
-	    -C $(AUTOCONF_DIR) install
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
+ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
+AUTOCONF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
-	touch -c $@
 
-autoconf: uclibc $(TARGET_DIR)/$(AUTOCONF_TARGET_BINARY)
+AUTOCONF_CONF_ENV = EMACS="no"
 
-autoconf-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(AUTOCONF_DIR) uninstall
-	-$(MAKE) -C $(AUTOCONF_DIR) clean
+AUTOCONF_DEPENDENCIES = uclibc microperl
 
-autoconf-dirclean:
-	rm -rf $(AUTOCONF_DIR)
+$(eval $(call AUTOTARGETS,package,autoconf))
 
-#############################################################
-#
 # autoconf for the host
-#
-#############################################################
+AUTOCONF_HOST_DIR:=$(BUILD_DIR)/autoconf-$(AUTOCONF_VERSION)-host
 
-$(AUTOCONF_HOST_DIR)/.configured: $(AUTOCONF_SRC_DIR)/.unpacked
+# variables used by other packages
+AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
+AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
+
+$(STAMP_DIR)/host_autoconf_unpacked: $(DL_DIR)/$(AUTOCONF_SOURCE)
 	mkdir -p $(AUTOCONF_HOST_DIR)
+	$(INFLATE$(suffix $(AUTOCONF_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(AUTOCONF_HOST_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(AUTOCONF_HOST_DIR) package/autoconf/ \*.patch
+	touch $@
+
+$(STAMP_DIR)/host_autoconf_configured: $(STAMP_DIR)/host_autoconf_unpacked
 	(cd $(AUTOCONF_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		EMACS="no" \
-		$(AUTOCONF_SRC_DIR)/configure \
-		--prefix=$(STAGING_DIR)/usr \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+		--disable-static \
 	)
 	touch $@
 
-$(AUTOCONF_HOST_DIR)/bin/$(AUTOCONF_BINARY): $(AUTOCONF_HOST_DIR)/.configured
-	$(MAKE1) -C $(AUTOCONF_HOST_DIR)
+$(STAMP_DIR)/host_autoconf_compiled: $(STAMP_DIR)/host_autoconf_configured
+	$(MAKE) -C $(AUTOCONF_HOST_DIR)
+	touch $@
 
-$(AUTOCONF): $(AUTOCONF_HOST_DIR)/bin/$(AUTOCONF_BINARY)
+$(STAMP_DIR)/host_autoconf_installed: $(STAMP_DIR)/host_autoconf_compiled
 	$(MAKE) -C $(AUTOCONF_HOST_DIR) install
+	touch $@
 
-host-autoconf: host-m4 host-libtool $(AUTOCONF)
+host-autoconf: $(STAMP_DIR)/host_autoconf_installed
 
 host-autoconf-clean:
-	$(MAKE) CC=$(HOST_CC) -C $(AUTOCONF_HOST_DIR) uninstall
+	rm -f $(addprefix $(STAMP_DIR)/host_autoconf_,unpacked configured compiled installed)
+	-$(MAKE) -C $(AUTOCONF_HOST_DIR) uninstall
 	-$(MAKE) -C $(AUTOCONF_HOST_DIR) clean
 
 host-autoconf-dirclean:
 	rm -rf $(AUTOCONF_HOST_DIR)
-
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_AUTOCONF),y)
-TARGETS+=autoconf
-endif

Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2009-03-23 21:46:37 UTC (rev 25800)
+++ trunk/buildroot/package/automake/automake.mk	2009-03-23 21:46:43 UTC (rev 25801)
@@ -30,7 +30,7 @@
 	toolchain/patch-kernel.sh $(AUTOMAKE_HOST_DIR) package/automake/ \*.patch
 	touch $@
 
-$(STAMP_DIR)/host_automake_configured: $(STAMP_DIR)/host_automake_unpacked
+$(STAMP_DIR)/host_automake_configured: $(STAMP_DIR)/host_automake_unpacked $(STAMP_DIR)/host_autoconf_installed
 	(cd $(AUTOMAKE_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
