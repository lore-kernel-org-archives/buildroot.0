From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 08:20:24 +0200
Subject: [Buildroot] [git commit] cups: convert to autotargets
Message-ID: <20120501090031.8DA3396C42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f64a1b850fc897357040bb4c58b6e5e50e71e094
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's still custom autoreconf handling because of autoheader errors.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups.mk |  121 +++++++++++++++-----------------------------------
 1 files changed, 36 insertions(+), 85 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 9efd6e9..2357306 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -3,13 +3,18 @@
 # cups
 #
 ################################################################################
+
 CUPS_VERSION = 1.3.9
-CUPS_NAME = cups-$(CUPS_VERSION)
-CUPS_DIR = $(BUILD_DIR)/$(CUPS_NAME)
+CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
 CUPS_SITE = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
-CUPS_SOURCE:=$(CUPS_NAME)-source.tar.bz2
-CUPS_DESTDIR = $(STAGING_DIR)/usr/lib
-CUPS_CAT:=$(BZCAT)
+CUPS_INSTALL_STAGING = YES
+CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
+CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
+CUPS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(CUPS_CFLAGS)"
+CUPS_CONF_OPT = --without-perl \
+		--without-java \
+		--disable-gnutls \
+		--disable-gssapi
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	CUPS_CONF_OPT += --enable-dbus
@@ -22,19 +27,6 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 	CUPS_DEPENDENCIES += xlib_libX11
 endif
 
-CUPS_CONF_OPT +=	--disable-perl
-CUPS_CONF_OPT +=	--disable-java
-CUPS_CFLAGS = $(TARGET_CFLAGS)
-
-
-ifeq ($(BR2_PACKAGE_PERL),disabled)	# We do not provide perl (yet)
-	CUPS_CONF_ENV +=	ac_cv_path_perl=$(STAGING_DIR)/usr/bin/perl
-	CUPS_CONF_OPT +=	--with-perl
-	CUPS_DEPENDENCIES +=	microperl
-else
-	CUPS_CONF_OPT +=	--disable-perl
-endif
-
 ifeq ($(BR2_PACKAGE_PHP),y)
 	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php
 	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/main
@@ -46,7 +38,7 @@ ifeq ($(BR2_PACKAGE_PHP),y)
 	CUPS_CONF_OPT +=	--with-php
 	CUPS_DEPENDENCIES +=	php
 else
-	CUPS_CONF_OPT +=	--disable-php
+	CUPS_CONF_OPT +=	--without-php
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
@@ -55,7 +47,7 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 	CUPS_CONF_OPT +=	--with-python
 	CUPS_DEPENDENCIES +=	python
 else
-	CUPS_CONF_OPT +=	--disable-python
+	CUPS_CONF_OPT +=	--without-python
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS_PDFTOPS),y)
@@ -64,68 +56,27 @@ else
 	CUPS_CONF_OPT += --disable-pdftops
 endif
 
-$(DL_DIR)/$(CUPS_SOURCE):
-	 $(call DOWNLOAD,$(CUPS_SITE)/$(CUPS_SOURCE))
-
-$(CUPS_DIR)/.unpacked: $(DL_DIR)/$(CUPS_SOURCE)
-	$(CUPS_CAT) $(DL_DIR)/$(CUPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	support/scripts/apply-patches.sh $(CUPS_DIR) package/cups/ \*.patch
-	$(call CONFIG_UPDATE,$(CUPS_DIR))
-	touch $@
-
-$(CUPS_DIR)/.configured: $(CUPS_DIR)/.unpacked
-	cd $(CUPS_DIR) && $(AUTOCONF)
-	(cd $(CUPS_DIR) && \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(CUPS_CONF_ENV) \
-		CFLAGS="$(CUPS_CFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--with-config-file-path=/etc \
-		--disable-gnutls \
-		--disable-gssapi \
-		$(CUPS_CONF_OPT) \
-		)
-	touch $@
-
-$(CUPS_DIR)/.compiled: $(CUPS_DIR)/.configured
-	$(MAKE) CFLAGS="$(CUPS_CFLAGS)" -C $(CUPS_DIR) cups backend berkeley cgi-bin filter \
-	locale monitor notifier pdftops scheduler systemv scripting/php \
-	conf data doc fonts ppd templates
-	touch $@
-
-$(CUPS_DIR)/.installed: $(CUPS_DIR)/.compiled
-	$(MAKE) -C $(CUPS_DIR) DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
-	$(MAKE) -C $(CUPS_DIR) DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/cups-config
-	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/cups-config
-	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/cups-config
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/bin/cups-config
-	touch $@
-
-cups: host-autoconf $(CUPS_DEPENDENCIES) $(CUPS_DIR)/.installed
-
-cups-source: $(DL_DIR)/$(CUPS_SOURCE)
-
-cups-clean:
-	-$(MAKE) -C $(CUPS_DIR) clean
-
-cups-dirclean:
-	rm -fr $(CUPS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_CUPS),y)
-TARGETS+=cups
-endif
-
+# standard autoreconf fails with autoheader failures
+define CUPS_FIXUP_AUTOCONF
+	cd $(@D) && $(AUTOCONF)
+endef
+CUPS_DEPENDENCIES += host-autoconf
+
+CUPS_PRE_CONFIGURE_HOOKS += CUPS_FIXUP_AUTOCONF
+
+# Fixup prefix= and exec_prefix= in cups-config, and remove the
+# -Wl,-rpath option.
+define CUPS_FIXUP_CUPS_CONFIG
+	$(SED) 's%prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
+		$(STAGING_DIR)/usr/bin/cups-config
+	$(SED) 's%exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
+		$(STAGING_DIR)/usr/bin/cups-config
+	$(SED) "s%includedir=.*%includedir=$(STAGING_DIR)/usr/include%" \
+		 $(STAGING_DIR)/usr/bin/cups-config
+	$(SED) 's%-Wl,-rpath,\$${libdir}%%' \
+		$(STAGING_DIR)/usr/bin/cups-config
+endef
+
+CUPS_POST_INSTALL_STAGING_HOOKS += CUPS_FIXUP_CUPS_CONFIG
+
+$(eval $(call AUTOTARGETS))
