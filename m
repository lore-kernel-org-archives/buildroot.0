From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri, 25 Apr 2008 09:45:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cups
Message-ID: <20080425164528.18C6C3C758@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-25 09:45:27 -0700 (Fri, 25 Apr 2008)
New Revision: 21860

Log:
Change cups makefile to fix $(STAGING_DIR)/usr/bin/cups-config

Modified:
   trunk/buildroot/package/cups/cups.mk


Changeset:
Modified: trunk/buildroot/package/cups/cups.mk
===================================================================
--- trunk/buildroot/package/cups/cups.mk	2008-04-25 13:43:00 UTC (rev 21859)
+++ trunk/buildroot/package/cups/cups.mk	2008-04-25 16:45:27 UTC (rev 21860)
@@ -3,30 +3,68 @@
 # cups
 #
 ################################################################################
-
 CUPS_VERSION = 1.3.5
-CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
+CUPS_NAME = cups-$(CUPS_VERSION)
+CUPS_DIR = $(BUILD_DIR)/$(CUPS_NAME)
 CUPS_SITE = http://ftp.easysw.com/pub/cups/1.3.5
-CUPS_AUTORECONF = NO
-CUPS_INSTALL_STAGING = YES
-CUPS_INSTALL_TARGET = YES
-CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install DSTROOT=$(STAGING_DIR)
-CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install DSTROOT=$(TARGET_DIR)
+CUPS_SOURCE:=$(CUPS_NAME)-source.tar.bz2
+CUPS_DESTDIR:=$(STAGING_DIR)/usr/lib
+CUPS_CAT:=$(BZCAT)
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-        CUPS_CONF_OPT_DBUS =--disable-dbus
+        CUPS_CONF_OPT_DBUS =--enable-dbus
         CUPS_DEPENDENCIES_DBUS = dbus
 else
-        CUPS_CONF_OPT_DBUS =--enable-dbus
+        CUPS_CONF_OPT_DBUS =--disable-dbus
 endif
 
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
         CUPS_DEPENDENCIES_X = xlib_libX11
 endif
 
-CUPS_CONF_OPT = --prefix=/usr --includedir=/usr/include --libdir=/usr/lib --disable-gnutls --disable-gssapi $(CUPS_CONF_OPT_DBUS)
-CUPS_MAKE_OPT = cups backend berkeley cgi-bin filter locale monitor notifier pdftops scheduler systemv scripting/php conf data doc fonts ppd templates
+$(DL_DIR)/$(CUPS_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(CUPS_SITE)/$(CUPS_SOURCE)
 
-CUPS_DEPENDENCIES = $(CUPS_DEPENDENCIES_DBUS) $(CUPS_DEPENDENCIES_X) 
+$(CUPS_DIR)/.unpacked: $(DL_DIR)/$(CUPS_SOURCE)
+	$(CUPS_CAT) $(DL_DIR)/$(CUPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(CUPS_DIR) package/cups/ \*.patch
+	$(CONFIG_UPDATE) $(CUPS_DIR)
+	touch $@
 
-$(eval $(call AUTOTARGETS,package,cups))
+$(CUPS_DIR)/.configured: $(CUPS_DIR)/.unpacked
+	(cd $(CUPS_DIR) && \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--prefix=/usr $(CUPS_CONF_OPT_DBUS) --includedir=/usr/include  \
+		--libdir=/usr/lib --disable-gnutls --disable-gssapi --host=$(ARCH) \ )
+	touch $@
+
+$(CUPS_DIR)/.compiled: $(CUPS_DIR)/.configured
+	$(MAKE) -C $(CUPS_DIR) cups backend berkeley cgi-bin filter \
+	locale monitor notifier pdftops scheduler systemv scripting/php \
+	conf data doc fonts ppd templates
+	touch $@
+
+$(CUPS_DIR)/.installed: $(CUPS_DIR)/.compiled
+	$(MAKE) -C $(CUPS_DIR) DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
+	$(MAKE) -C $(CUPS_DIR) DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/cups-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/cups-config
+	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/cups-config
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/bin/cups-config
+	touch $@
+
+cups: uclibc $(CUPS_DEPENDENCIES_DBUS) $(CUPS_DEPENDENCIES_X) $(CUPS_DIR)/.installed
+
+cups-clean:
+	-$(MAKE) -C $(CUPS_DIR) clean
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_CUPS)),y)
+TARGETS+=cups
+endif
\ No newline at end of file
