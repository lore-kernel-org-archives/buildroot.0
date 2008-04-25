From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri, 25 Apr 2008 09:45:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20080425164549.A09BC3C78E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-25 09:45:49 -0700 (Fri, 25 Apr 2008)
New Revision: 21861

Log:
Change freetype makefile to fix $(STAGING_DIR)/usr/bin/freetype-config

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2008-04-25 16:45:27 UTC (rev 21860)
+++ trunk/buildroot/package/freetype/freetype.mk	2008-04-25 16:45:49 UTC (rev 21861)
@@ -4,23 +4,61 @@
 #
 #############################################################
 FREETYPE_VERSION = $(strip $(subst ",, $(BR2_FREETYPE_VERSION)))
-FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
+FREETYPE_NAME = freetype-$(FREETYPE_VERSION)
+FREETYPE_DIR = $(BUILD_DIR)/$(FREETYPE_NAME)
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
-FREETYPE_AUTORECONF = NO
-FREETYPE_INSTALL_STAGING = YES
-FREETYPE_INSTALL_TARGET = YES
-FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+FREETYPE_SOURCE:=$(FREETYPE_NAME).tar.bz2
+FREETYPE_DESTDIR:=$(STAGING_DIR)/usr/lib
+FREETYPE_CAT:=$(BZCAT)
 
-FREETYPE_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+$(DL_DIR)/$(FREETYPE_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(FREETYPE_SITE)/$(FREETYPE_SOURCE)
+
+$(FREETYPE_DIR)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
+	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/ \*.patch
+	$(CONFIG_UPDATE) $(FREETYPE_DIR)
+	touch $@
+
+$(FREETYPE_DIR)/.configured: $(FREETYPE_DIR)/.unpacked
+	(cd $(FREETYPE_DIR) && \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --prefix=/usr \
 		--exec-prefix=/usr --bindir=/usr/bin \
 		--sbindir=/usr/sbin --libdir=/usr/lib \
 		--libexecdir=/usr/lib --sysconfdir=/etc \
 		--datadir=/usr/share --localstatedir=/var \
 		--includedir=/usr/include --mandir=/usr/man \
-		--infodir=/usr/info 
+		--infodir=/usr/info \ )
+	touch $@
 
-FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
-FREETYPE_DEPENDENCIES = uclibc pkgconfig
+$(FREETYPE_DIR)/.compiled: $(FREETYPE_DIR)/.configured
+	$(MAKE) CCexe="$(HOSTCC)" -C $(FREETYPE_DIR)
+	touch $@
 
-$(eval $(call AUTOTARGETS,package,freetype))
\ No newline at end of file
+$(FREETYPE_DIR)/.installed: $(FREETYPE_DIR)/.compiled
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FREETYPE_DIR) install
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(FREETYPE_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libfreetype.la
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/freetype-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/freetype-config
+	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/freetype-config
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/bin/freetype-config
+	touch $@
+
+freetype: uclibc pkgconfig $(FREETYPE_DIR)/.installed
+
+freetype-clean:
+	-$(MAKE) -C $(FREETYPE_DIR) clean
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_FREETYPE)),y)
+TARGETS+=freetype
+endif
\ No newline at end of file
