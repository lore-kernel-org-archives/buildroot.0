From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 06:51:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: autoconf automake
	libtool
Message-ID: <20070628135108.28F41A4584@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 06:51:07 -0700 (Thu, 28 Jun 2007)
New Revision: 18962

Log:
- provide autotools for the host (Julien Letessier)


Modified:
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/automake/automake.mk
   trunk/buildroot/package/libtool/libtool.mk


Changeset:
Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2007-06-28 13:06:21 UTC (rev 18961)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2007-06-28 13:51:07 UTC (rev 18962)
@@ -7,25 +7,38 @@
 AUTOCONF_SOURCE:=autoconf-$(AUTOCONF_VER).tar.bz2
 AUTOCONF_SITE:=http://ftp.gnu.org/pub/gnu/autoconf
 AUTOCONF_CAT:=$(BZCAT)
+AUTOCONF_SRC_DIR:=$(TOOL_BUILD_DIR)/autoconf-$(AUTOCONF_VER)
 AUTOCONF_DIR:=$(BUILD_DIR)/autoconf-$(AUTOCONF_VER)
+AUTOCONF_HOST_DIR:=$(TOOL_BUILD_DIR)/autoconf-$(AUTOCONF_VER)-host
 AUTOCONF_BINARY:=autoconf
 AUTOCONF_TARGET_BINARY:=usr/bin/autoconf
+AUTOCONF:=$(STAGING_DIR)/usr/bin/autoconf
 
+# variables used by other packages
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
+
 $(DL_DIR)/$(AUTOCONF_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AUTOCONF_SITE)/$(AUTOCONF_SOURCE)
 
 autoconf-source: $(DL_DIR)/$(AUTOCONF_SOURCE)
 
-$(AUTOCONF_DIR)/.unpacked: $(DL_DIR)/$(AUTOCONF_SOURCE)
-	$(AUTOCONF_CAT) $(DL_DIR)/$(AUTOCONF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+$(AUTOCONF_SRC_DIR)/.unpacked: $(DL_DIR)/$(AUTOCONF_SOURCE)
+	$(AUTOCONF_CAT) $(DL_DIR)/$(AUTOCONF_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(AUTOCONF_DIR)/.configured: $(AUTOCONF_DIR)/.unpacked
+#############################################################
+#
+# autoconf for the host
+#
+#############################################################
+
+$(AUTOCONF_DIR)/.configured: $(AUTOCONF_SRC_DIR)/.unpacked
+	mkdir -p $(AUTOCONF_DIR)
 	(cd $(AUTOCONF_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		EMACS="no" \
-		./configure \
+		$(AUTOCONF_SRC_DIR)/configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -63,6 +76,7 @@
 	    -C $(AUTOCONF_DIR) install;
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	touch -c $@
 
 autoconf: uclibc $(TARGET_DIR)/$(AUTOCONF_TARGET_BINARY)
 
@@ -75,6 +89,40 @@
 
 #############################################################
 #
+# autoconf for the host
+#
+#############################################################
+
+$(AUTOCONF_HOST_DIR)/.configured: $(AUTOCONF_SRC_DIR)/.unpacked
+	mkdir -p $(AUTOCONF_HOST_DIR)
+	(cd $(AUTOCONF_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		EMACS="no" \
+		$(AUTOCONF_SRC_DIR)/configure \
+		--prefix=$(STAGING_DIR)/usr \
+	);
+	touch $@
+
+$(AUTOCONF_HOST_DIR)/bin/$(AUTOCONF_BINARY): $(AUTOCONF_HOST_DIR)/.configured
+	$(MAKE1) -C $(AUTOCONF_HOST_DIR)
+
+$(AUTOCONF): $(AUTOCONF_HOST_DIR)/bin/$(AUTOCONF_BINARY)
+	$(MAKE) -C $(AUTOCONF_HOST_DIR) install;
+
+host-autoconf: m4-host host-libtool $(AUTOCONF)
+
+host-autoconf-clean:
+	$(MAKE) CC=$(HOST_CC) -C $(AUTOCONF_HOST_DIR) uninstall
+	-$(MAKE) -C $(AUTOCONF_HOST_DIR) clean
+
+host-autoconf-dirclean:
+	rm -rf $(AUTOCONF_HOST_DIR)
+
+
+#############################################################
+#
 # Toplevel Makefile options
 #
 #############################################################

Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2007-06-28 13:06:21 UTC (rev 18961)
+++ trunk/buildroot/package/automake/automake.mk	2007-06-28 13:51:07 UTC (rev 18962)
@@ -7,26 +7,40 @@
 AUTOMAKE_SOURCE:=automake-$(AUTOMAKE_VER).tar.bz2
 AUTOMAKE_SITE:=http://ftp.gnu.org/pub/gnu/automake
 AUTOMAKE_CAT:=$(BZCAT)
+AUTOMAKE_SRC_DIR:=$(TOOL_BUILD_DIR)/automake-$(AUTOMAKE_VER)
 AUTOMAKE_DIR:=$(BUILD_DIR)/automake-$(AUTOMAKE_VER)
+AUTOMAKE_HOST_DIR:=$(TOOL_BUILD_DIR)/automake-$(AUTOMAKE_VER)-host
 AUTOMAKE_BINARY:=automake
 AUTOMAKE_TARGET_BINARY:=usr/bin/automake
+AUTOMAKE:=$(STAGING_DIR)/usr/bin/automake
 
+# variables used by other packages
+ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
+ACLOCAL = aclocal -I $(ACLOCAL_DIR)
+
 $(DL_DIR)/$(AUTOMAKE_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AUTOMAKE_SITE)/$(AUTOMAKE_SOURCE)
 
 automake-source: $(DL_DIR)/$(AUTOMAKE_SOURCE)
 
-$(AUTOMAKE_DIR)/.unpacked: $(DL_DIR)/$(AUTOMAKE_SOURCE)
-	$(AUTOMAKE_CAT) $(DL_DIR)/$(AUTOMAKE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(AUTOMAKE_DIR)
+$(AUTOMAKE_SRC_DIR)/.unpacked: $(DL_DIR)/$(AUTOMAKE_SOURCE)
+	$(AUTOMAKE_CAT) $(DL_DIR)/$(AUTOMAKE_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(AUTOMAKE_SRC_DIR)
 	touch $@
 
-$(AUTOMAKE_DIR)/.configured: $(AUTOMAKE_DIR)/.unpacked
+#############################################################
+#
+# automake for the target
+#
+#############################################################
+
+$(AUTOMAKE_DIR)/.configured: $(AUTOMAKE_SRC_DIR)/.unpacked
+	mkdir -p $(AUTOMAKE_DIR)
 	(cd $(AUTOMAKE_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		WANT_AUTOCONF=2.5 \
-		./configure \
+		$(AUTOMAKE_SRC_DIR)/configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -46,7 +60,7 @@
 
 $(AUTOMAKE_DIR)/$(AUTOMAKE_BINARY): $(AUTOMAKE_DIR)/.configured
 	$(MAKE) -C $(AUTOMAKE_DIR)
-	touch -c $(AUTOMAKE_DIR)/$(AUTOMAKE_BINARY)
+	touch -c $@
 
 $(TARGET_DIR)/$(AUTOMAKE_TARGET_BINARY): $(AUTOMAKE_DIR)/$(AUTOMAKE_BINARY)
 	$(MAKE) \
@@ -65,9 +79,9 @@
 	    -C $(AUTOMAKE_DIR) install
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-	touch -c $(TARGET_DIR)/$(AUTOMAKE_TARGET_BINARY)
+	touch -c $@
 
-automake: uclibc $(TARGET_DIR)/$(AUTOMAKE_TARGET_BINARY)
+automake: uclibc autoconf $(TARGET_DIR)/$(AUTOMAKE_TARGET_BINARY)
 
 automake-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AUTOMAKE_DIR) uninstall
@@ -78,6 +92,40 @@
 
 #############################################################
 #
+# automake for the host
+#
+#############################################################
+
+$(AUTOMAKE_HOST_DIR)/.configured: $(AUTOMAKE_SRC_DIR)/.unpacked
+	mkdir -p $(AUTOMAKE_HOST_DIR)
+	(cd $(AUTOMAKE_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		WANT_AUTOCONF=2.5 \
+		$(AUTOMAKE_SRC_DIR)/configure \
+		--prefix=$(STAGING_DIR)/usr \
+	);
+	touch $@
+
+$(AUTOMAKE_HOST_DIR)/$(AUTOMAKE_BINARY): $(AUTOMAKE_HOST_DIR)/.configured
+	$(MAKE) -C $(AUTOMAKE_HOST_DIR)
+	touch -c $@
+
+$(AUTOMAKE): $(AUTOMAKE_HOST_DIR)/$(AUTOMAKE_BINARY)
+	$(MAKE) -C $(AUTOMAKE_HOST_DIR) install
+
+host-automake: host-autoconf host-libtool $(AUTOMAKE)
+
+host-automake-clean:
+	$(MAKE) -C $(AUTOMAKE_HOST_DIR) uninstall
+	-$(MAKE) -C $(AUTOMAKE_HOST_DIR) clean
+
+host-automake-dirclean:
+	rm -rf $(AUTOMAKE_HOST_DIR)
+
+#############################################################
+#
 # Toplevel Makefile options
 #
 #############################################################

Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2007-06-28 13:06:21 UTC (rev 18961)
+++ trunk/buildroot/package/libtool/libtool.mk	2007-06-28 13:51:07 UTC (rev 18962)
@@ -7,7 +7,9 @@
 LIBTOOL_SOURCE:=libtool-$(LIBTOOL_VER).tar.gz
 LIBTOOL_SITE:=http://ftp.gnu.org/pub/gnu/libtool
 LIBTOOL_CAT:=$(ZCAT)
+LIBTOOL_SRC_DIR:=$(TOOL_BUILD_DIR)/libtool-$(LIBTOOL_VER)
 LIBTOOL_DIR:=$(BUILD_DIR)/libtool-$(LIBTOOL_VER)
+LIBTOOL_HOST_DIR:=$(TOOL_BUILD_DIR)/libtool-$(LIBTOOL_VER)-host
 LIBTOOL_BINARY:=libtool
 LIBTOOL_TARGET_BINARY:=usr/bin/libtool
 
@@ -16,15 +18,22 @@
 
 libtool-source: $(DL_DIR)/$(LIBTOOL_SOURCE)
 
-$(LIBTOOL_DIR)/.unpacked: $(DL_DIR)/$(LIBTOOL_SOURCE)
-	$(LIBTOOL_CAT) $(DL_DIR)/$(LIBTOOL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LIBTOOL_DIR)/.unpacked
+$(LIBTOOL_SRC_DIR)/.unpacked: $(DL_DIR)/$(LIBTOOL_SOURCE)
+	$(LIBTOOL_CAT) $(DL_DIR)/$(LIBTOOL_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
 
-$(LIBTOOL_DIR)/.configured: $(LIBTOOL_DIR)/.unpacked
+#############################################################
+#
+# libtool for the target
+#
+#############################################################
+
+$(LIBTOOL_DIR)/.configured: $(LIBTOOL_SRC_DIR)/.unpacked
+	mkdir -p $(LIBTOOL_DIR)
 	(cd $(LIBTOOL_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
+		$(LIBTOOL_SRC_DIR)/configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -41,11 +50,11 @@
 		--infodir=/usr/info \
 		$(DISABLE_NLS) \
 	);
-	touch $(LIBTOOL_DIR)/.configured
+	touch $@
 
 $(LIBTOOL_DIR)/$(LIBTOOL_BINARY): $(LIBTOOL_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBTOOL_DIR)
-	touch -c $(LIBTOOL_DIR)/$(LIBTOOL_BINARY)
+	touch -c $@
 
 $(TARGET_DIR)/$(LIBTOOL_TARGET_BINARY): $(LIBTOOL_DIR)/$(LIBTOOL_BINARY)
 	$(MAKE) \
@@ -67,6 +76,7 @@
 	$(SED) "s,^LD.*,LD=\"/usr/bin/ld\"," $(TARGET_DIR)/usr/bin/libtool
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	touch -c $@
 
 libtool: uclibc $(TARGET_DIR)/$(LIBTOOL_TARGET_BINARY)
 
@@ -84,6 +94,43 @@
 
 #############################################################
 #
+# libtool for the host
+#
+#############################################################
+
+$(LIBTOOL_HOST_DIR)/.configured: $(LIBTOOL_SRC_DIR)/.unpacked
+	mkdir -p $(LIBTOOL_HOST_DIR)
+	(cd $(LIBTOOL_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(LIBTOOL_SRC_DIR)/configure \
+		--prefix=$(STAGING_DIR)/usr \
+		$(DISABLE_NLS) \
+	);
+	touch $@
+
+$(LIBTOOL_HOST_DIR)/$(LIBTOOL_BINARY): $(LIBTOOL_HOST_DIR)/.configured
+	$(MAKE) -C $(LIBTOOL_HOST_DIR)
+	touch -c $@
+
+$(STAGING_DIR)/$(LIBTOOL_TARGET_BINARY): $(LIBTOOL_HOST_DIR)/$(LIBTOOL_BINARY)
+	$(MAKE) -C $(LIBTOOL_HOST_DIR) install
+	rm -rf $(STAGING_DIR)/share/locale $(STAGING_DIR)/usr/info \
+		$(STAGING_DIR)/usr/man $(STAGING_DIR)/usr/share/doc
+	touch -c $@
+
+host-libtool: $(STAGING_DIR)/$(LIBTOOL_TARGET_BINARY)
+
+host-libtool-clean:
+	$(MAKE) -C $(LIBTOOL_HOST_DIR) uninstall
+	-$(MAKE) -C $(LIBTOOL_HOST_DIR) clean
+
+host-libtool-dirclean:
+	rm -rf $(LIBTOOL_HOST_DIR)
+
+#############################################################
+#
 # Toplevel Makefile options
 #
 #############################################################
