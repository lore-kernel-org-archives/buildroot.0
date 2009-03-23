From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 21:46:51 +0000 (UTC)
Subject: [Buildroot] svn commit: [25803] trunk/buildroot/package: autoconf
	libtool
Message-ID: <20090323214651.C860C76A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 21:46:51 +0000 (Mon, 23 Mar 2009)
New Revision: 25803

Log:
libtool: cleanup

- Convert into Makefile.autotools.in format for target build
- Build host version in BUILD_DIR and install into HOST_DIR

Modified:
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/libtool/libtool.mk


Changeset:
Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2009-03-23 21:46:47 UTC (rev 25802)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2009-03-23 21:46:51 UTC (rev 25803)
@@ -31,7 +31,7 @@
 	toolchain/patch-kernel.sh $(AUTOCONF_HOST_DIR) package/autoconf/ \*.patch
 	touch $@
 
-$(STAMP_DIR)/host_autoconf_configured: $(STAMP_DIR)/host_autoconf_unpacked $(STAMP_DIR)/host_m4_installed
+$(STAMP_DIR)/host_autoconf_configured: $(STAMP_DIR)/host_autoconf_unpacked $(STAMP_DIR)/host_m4_installed  $(STAMP_DIR)/host_libtool_installed
 	(cd $(AUTOCONF_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \

Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2009-03-23 21:46:47 UTC (rev 25802)
+++ trunk/buildroot/package/libtool/libtool.mk	2009-03-23 21:46:51 UTC (rev 25803)
@@ -3,152 +3,57 @@
 # libtool
 #
 #############################################################
-LIBTOOL_VERSION:=1.5.24
-LIBTOOL_SOURCE:=libtool-$(LIBTOOL_VERSION).tar.gz
-LIBTOOL_SITE:=$(BR2_GNU_MIRROR)/libtool
-LIBTOOL_CAT:=$(ZCAT)
-LIBTOOL_SRC_DIR:=$(TOOL_BUILD_DIR)/libtool-$(LIBTOOL_VERSION)
-LIBTOOL_DIR:=$(BUILD_DIR)/libtool-$(LIBTOOL_VERSION)
-LIBTOOL_HOST_DIR:=$(TOOL_BUILD_DIR)/libtool-$(LIBTOOL_VERSION)-host
-LIBTOOL_BINARY:=libtool
-LIBTOOL_TARGET_BINARY:=usr/bin/libtool
-LIBTOOL:=$(STAGING_DIR)/usr/bin/libtool
+LIBTOOL_VERSION = 1.5.24
+LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
+LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 
-$(DL_DIR)/$(LIBTOOL_SOURCE):
-	 $(call DOWNLOAD,$(LIBTOOL_SITE),$(LIBTOOL_SOURCE))
-
-libtool-source: $(DL_DIR)/$(LIBTOOL_SOURCE)
-
-$(LIBTOOL_SRC_DIR)/.unpacked: $(DL_DIR)/$(LIBTOOL_SOURCE)
-	$(LIBTOOL_CAT) $(DL_DIR)/$(LIBTOOL_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(LIBTOOL_SRC_DIR)
-	$(CONFIG_UPDATE) $(LIBTOOL_SRC_DIR)/libltdl
-	touch $@
-
-#############################################################
-#
-# libtool for the target
-#
-#############################################################
-
-$(LIBTOOL_DIR)/.configured: $(LIBTOOL_SRC_DIR)/.unpacked
-	mkdir -p $(LIBTOOL_DIR)
-	(cd $(LIBTOOL_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(LIBTOOL_SRC_DIR)/configure \
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
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(LIBTOOL_DIR)/$(LIBTOOL_BINARY): $(LIBTOOL_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LIBTOOL_DIR)
-	touch -c $@
-
-$(TARGET_DIR)/$(LIBTOOL_TARGET_BINARY): $(LIBTOOL_DIR)/$(LIBTOOL_BINARY)
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
-	    -C $(LIBTOOL_DIR) install
-	$(STRIPCMD) $(TARGET_DIR)//usr/lib/libltdl.so.*.*.* > /dev/null 2>&1
-	$(SED) "s,^CC.*,CC=\"/usr/bin/gcc\"," $(TARGET_DIR)/usr/bin/libtool
-	$(SED) "s,^LD.*,LD=\"/usr/bin/ld\"," $(TARGET_DIR)/usr/bin/libtool
-	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
+ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
+LIBTOOL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-	touch -c $@
 
-libtool: uclibc $(TARGET_DIR)/$(LIBTOOL_TARGET_BINARY)
+LIBTOOL_DEPENDENCIES = uclibc
 
-libtool-clean:
-	-$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LIBTOOL_DIR) uninstall
-	-$(MAKE) -C $(LIBTOOL_DIR) clean
+$(eval $(call AUTOTARGETS,package,libtool))
 
-libtool-cross: uclibc $(LIBTOOL_DIR)/$(LIBTOOL_BINARY)
-
-libtool-cross-clean:
-	-$(MAKE) -C $(LIBTOOL_DIR) clean
-
-libtool-dirclean:
-	rm -rf $(LIBTOOL_DIR)
-
-#############################################################
-#
 # libtool for the host
-#
-#############################################################
+LIBTOOL_HOST_DIR:=$(BUILD_DIR)/libtool-$(LIBTOOL_VERSION)-host
 
-$(LIBTOOL_HOST_DIR)/.configured: $(LIBTOOL_SRC_DIR)/.unpacked
+# variables used by other packages
+LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
+
+$(STAMP_DIR)/host_libtool_unpacked: $(DL_DIR)/$(LIBTOOL_SOURCE)
 	mkdir -p $(LIBTOOL_HOST_DIR)
+	$(INFLATE$(suffix $(LIBTOOL_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LIBTOOL_HOST_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBTOOL_HOST_DIR) package/libtool/ \*.patch
+	touch $@
+
+$(STAMP_DIR)/host_libtool_configured: $(STAMP_DIR)/host_libtool_unpacked
 	(cd $(LIBTOOL_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(LIBTOOL_SRC_DIR)/configure \
-		--prefix=$(STAGING_DIR)/usr \
-		$(DISABLE_NLS) \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+		--disable-static \
 	)
 	touch $@
 
-$(LIBTOOL_HOST_DIR)/$(LIBTOOL_BINARY): $(LIBTOOL_HOST_DIR)/.configured
+$(STAMP_DIR)/host_libtool_compiled: $(STAMP_DIR)/host_libtool_configured
 	$(MAKE) -C $(LIBTOOL_HOST_DIR)
-	touch -c $@
+	touch $@
 
-$(LIBTOOL): $(LIBTOOL_HOST_DIR)/$(LIBTOOL_BINARY)
+$(STAMP_DIR)/host_libtool_installed: $(STAMP_DIR)/host_libtool_compiled
 	$(MAKE) -C $(LIBTOOL_HOST_DIR) install
-	rm -rf $(STAGING_DIR)/share/locale
-	rm -rf $(STAGING_DIR)/usr/share/doc
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(STAGING_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(STAGING_DIR)/usr/share/man
-endif
-	touch -c $@
+	touch $@
 
-host-libtool: $(LIBTOOL)
+host-libtool: $(STAMP_DIR)/host_libtool_installed
 
 host-libtool-clean:
+	rm -f $(addprefix $(STAMP_DIR)/host_libtool_,unpacked configured compiled installed)
 	-$(MAKE) -C $(LIBTOOL_HOST_DIR) uninstall
 	-$(MAKE) -C $(LIBTOOL_HOST_DIR) clean
 
 host-libtool-dirclean:
 	rm -rf $(LIBTOOL_HOST_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBTOOL),y)
-TARGETS+=libtool
-endif
