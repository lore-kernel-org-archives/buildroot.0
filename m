From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 20:53:44 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cups
Message-ID: <20090125205344.6649776D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 20:53:43 +0000 (Sun, 25 Jan 2009)
New Revision: 25020

Log:
Make cups build, support perl/php option

Modified:
   trunk/buildroot/package/cups/cups.mk


Changeset:
Modified: trunk/buildroot/package/cups/cups.mk
===================================================================
--- trunk/buildroot/package/cups/cups.mk	2009-01-25 20:50:59 UTC (rev 25019)
+++ trunk/buildroot/package/cups/cups.mk	2009-01-25 20:53:43 UTC (rev 25020)
@@ -3,25 +3,61 @@
 # cups
 #
 ################################################################################
-CUPS_VERSION = 1.3.5
+CUPS_VERSION = 1.3.9
 CUPS_NAME = cups-$(CUPS_VERSION)
 CUPS_DIR = $(BUILD_DIR)/$(CUPS_NAME)
-CUPS_SITE = http://ftp.easysw.com/pub/cups/1.3.5
+CUPS_SITE = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
 CUPS_SOURCE:=$(CUPS_NAME)-source.tar.bz2
 CUPS_DESTDIR:=$(STAGING_DIR)/usr/lib
 CUPS_CAT:=$(BZCAT)
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-        CUPS_CONF_OPT_DBUS =--enable-dbus
-        CUPS_DEPENDENCIES_DBUS = dbus
+	CUPS_CONF_OPT += --enable-dbus
+	CUPS_DEPENDENCIES += dbus
 else
-        CUPS_CONF_OPT_DBUS =--disable-dbus
+	CUPS_CONF_OPT += --disable-dbus
 endif
 
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
-        CUPS_DEPENDENCIES_X = xlib_libX11
+	CUPS_DEPENDENCIES += xlib_libX11
 endif
 
+CUPS_CONF_OPT +=	--disable-perl
+CUPS_CONF_OPT +=	--disable-java
+CUPS_CFLAGS = $(TARGET_CFLAGS)
+
+
+ifeq ($(BR2_PACKAGE_PERL),disabled)	# We do not provide perl (yet)
+	CUPS_CONF_ENV +=	ac_cv_path_perl=$(STAGING_DIR)/usr/bin/perl
+	CUPS_CONF_OPT +=	--with-perl
+	CUPS_DEPENDENCIES +=	microperl
+else
+	CUPS_CONF_OPT +=	--disable-perl
+endif
+
+ifeq ($(BR2_PACKAGE_PHP),y)
+	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php
+	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/main
+	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/regex
+	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/TSRM
+	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/Zend
+	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/ext
+	CUPS_CONF_ENV +=	ac_cv_path_php=$(STAGING_DIR)/usr/bin/php
+	CUPS_CONF_OPT +=	--with-php
+	CUPS_DEPENDENCIES +=	php
+else
+	CUPS_CONF_OPT +=	--disable-php
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+	CUPS_CONF_ENV +=	ac_cv_path_python=$(STAGING_DIR)/usr/bin/python
+	CUPS_CONF_OPT +=	--with-python
+	CUPS_DEPENDENCIES +=	python
+else
+	CUPS_CONF_OPT +=	--disable-python
+endif
+
 $(DL_DIR)/$(CUPS_SOURCE):
 	 $(call DOWNLOAD,$(CUPS_SITE),$(CUPS_SOURCE))
 
@@ -35,13 +71,33 @@
 	(cd $(CUPS_DIR) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		$(CUPS_CONF_ENV) \
+		CFLAGS="$(CUPS_CFLAGS)" \
 		./configure \
-		--prefix=/usr $(CUPS_CONF_OPT_DBUS) --includedir=/usr/include  \
-		--libdir=/usr/lib --disable-gnutls --disable-gssapi --host=$(ARCH) \ )
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--includedir=/usr/include  \
+		--libdir=/usr/lib \
+		--exec-prefix=/ \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--with-config-file-path=/etc \
+		--datadir=/usr/share/misc \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--disable-gnutls \
+		--disable-gssapi \
+		$(CUPS_CONF_OPT) \
+		)
 	touch $@
 
 $(CUPS_DIR)/.compiled: $(CUPS_DIR)/.configured
-	$(MAKE) -C $(CUPS_DIR) cups backend berkeley cgi-bin filter \
+	$(MAKE) CFLAGS="$(CUPS_CFLAGS)" -C $(CUPS_DIR) cups backend berkeley cgi-bin filter \
 	locale monitor notifier pdftops scheduler systemv scripting/php \
 	conf data doc fonts ppd templates
 	touch $@
@@ -55,11 +111,14 @@
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/bin/cups-config
 	touch $@
 
-cups: uclibc $(CUPS_DEPENDENCIES_DBUS) $(CUPS_DEPENDENCIES_X) $(CUPS_DIR)/.installed
+cups: uclibc $(CUPS_DEPENDENCIES) $(CUPS_DIR)/.installed
 
 cups-clean:
 	-$(MAKE) -C $(CUPS_DIR) clean
 
+cups-dirclean:
+	rm -fr $(CUPS_DIR)
+
 #############################################################
 #
 # Toplevel Makefile options
@@ -67,4 +126,5 @@
 #############################################################
 ifeq ($(BR2_PACKAGE_CUPS),y)
 TARGETS+=cups
-endif
\ No newline at end of file
+endif
+
