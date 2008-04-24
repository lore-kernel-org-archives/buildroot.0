From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 06:18:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20080424131851.1DBB43C84D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 06:18:50 -0700 (Thu, 24 Apr 2008)
New Revision: 21835

Log:
update lighttpd

Added:
   trunk/buildroot/package/lighttpd/lighttpd-1.4.19-configure.patch

Removed:
   trunk/buildroot/package/lighttpd/rc.lighttpd

Modified:
   trunk/buildroot/package/lighttpd/Config.in
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Modified: trunk/buildroot/package/lighttpd/Config.in
===================================================================
--- trunk/buildroot/package/lighttpd/Config.in	2008-04-24 13:18:03 UTC (rev 21834)
+++ trunk/buildroot/package/lighttpd/Config.in	2008-04-24 13:18:50 UTC (rev 21835)
@@ -12,10 +12,24 @@
 		 
 	  http://www.lighttpd.net/
 
+if BR2_PACKAGE_LIGHTTPD
+menu "lighttpd packages"
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
-	bool "lighttpd-openssl"
+	bool "openssl"
 	default y
 	depends on BR2_PACKAGE_LIGHTTPD
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable OpenSSL support for lighttpd.
+
+config BR2_PACKAGE_LIGHTTPD_PCRE
+	bool "pcre"
+	default n
+	depends on BR2_PACKAGE_LIGHTTPD
+	select BR2_PACKAGE_PCRE
+	help
+	  Enable PCRE support. Needed to support mod_rewrite
+
+endmenu
+endif

Added: trunk/buildroot/package/lighttpd/lighttpd-1.4.19-configure.patch
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd-1.4.19-configure.patch	                        (rev 0)
+++ trunk/buildroot/package/lighttpd/lighttpd-1.4.19-configure.patch	2008-04-24 13:18:50 UTC (rev 21835)
@@ -0,0 +1,11 @@
+--- lighttpd-1.4.19-org/configure	2008-03-10 21:46:12.000000000 +0000
++++ lighttpd-1.4.19/configure	2008-03-31 06:58:41.000000000 +0000
+@@ -23971,7 +23971,7 @@
+ { echo "$as_me:$LINENO: result: $WITH_PCRE" >&5
+ echo "${ECHO_T}$WITH_PCRE" >&6; }
+ 
+-if test "x$cross_compiling" = xno -a "$WITH_PCRE" != "no"; then
++if test "$WITH_PCRE" != "no"; then
+   # Extract the first word of "pcre-config", so it can be a program name with args.
+ set dummy pcre-config; ac_word=$2
+ { echo "$as_me:$LINENO: checking for $ac_word" >&5

Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2008-04-24 13:18:03 UTC (rev 21834)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2008-04-24 13:18:50 UTC (rev 21835)
@@ -3,106 +3,39 @@
 # lighttpd
 #
 #############################################################
-LIGHTTPD_VERSION:=1.4.18
-LIGHTTPD_SOURCE:=lighttpd_$(LIGHTTPD_VERSION).orig.tar.gz
-LIGHTTPD_PATCH:=lighttpd_$(LIGHTTPD_VERSION)-1.diff.gz
-LIGHTTPD_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lighttpd
-LIGHTTPD_DIR:=$(BUILD_DIR)/lighttpd-$(LIGHTTPD_VERSION)
-LIGHTTPD_CAT:=$(ZCAT)
-LIGHTTPD_BINARY:=src/lighttpd
-LIGHTTPD_TARGET_BINARY:=usr/sbin/lighttpd
+LIGHTTPD_VERSION:=1.4.19
+LIGHTTPD_SOURCE:=lighttpd-$(LIGHTTPD_VERSION).tar.bz2
+LIGHTTPD_SITE:=http://www.lighttpd.net/download
+LIGHTTPD_INSTALL_STAGING = NO
+LIGHTTPD_INSTALL_TARGET = YES
+LIGHTTPD_DEPENDENCIES = uclibc
+LIGHTTPD_CONF_ENV = 
+LIGHTTPD_CONF_OPT = \
+	--target=$(GNU_TARGET_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--build=$(GNU_HOST_NAME) \
+	--prefix=/usr \
+	--libdir=/usr/lib/lighttpd \
+	--libexecdir=/usr/lib \
+	--sysconfdir=/etc \
+	--localstatedir=/var \
+	--program-prefix="" \
+	$(DISABLE_IPV6) \
+	$(DISABLE_LARGEFILE)
 
-$(DL_DIR)/$(LIGHTTPD_SOURCE):
-	$(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_SOURCE)
-
-ifneq ($(LIGHTTPD_PATCH),)
-LIGHTTPD_PATCH_FILE:=$(DL_DIR)/$(LIGHTTPD_PATCH)
-$(LIGHTTPD_PATCH_FILE):
-	$(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_PATCH)
-endif
-
-lighttpd-source: $(DL_DIR)/$(LIGHTTPD_SOURCE) $(LIGHTTPD_PATCH_FILE)
-
-$(LIGHTTPD_DIR)/.unpacked: $(DL_DIR)/$(LIGHTTPD_SOURCE)
-	$(LIGHTTPD_CAT) $(DL_DIR)/$(LIGHTTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIGHTTPD_DIR) package/lighttpd/ lighttpd\*.patch
-ifneq ($(LIGHTTPD_PATCH),)
-	(cd $(LIGHTTPD_DIR)&&$(LIGHTTPD_CAT) $(LIGHTTPD_PATCH_FILE)|patch -p1)
-endif
-	if [ -d $(LIGHTTPD_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(LIGHTTPD_DIR) $(LIGHTTPD_DIR)/debian/patches \*.dpatch; \
-	fi
-	$(CONFIG_UPDATE) $(@D)
-	$(SED) 's/-lfs/-largefile/g;s/_lfs/_largefile/g' $(LIGHTTPD_DIR)/configure
-	touch $@
-
 ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_OPENSSL)),y)
-LIGHTTPD_OPENSSL:=--with-openssl
+LIGHTTPD_DEPENDENCIES += openssl
+LIGHTTPD_CONF_OPT += --with-openssl
 else
-LIGHTTPD_OPENSSL:=--without-openssl
+LIGHTTPD_CONF_OPT += --without-openssl
 endif
 
-$(LIGHTTPD_DIR)/.configured: $(LIGHTTPD_DIR)/.unpacked
-	(cd $(LIGHTTPD_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--libdir=/usr/lib/lighttpd \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		$(LIGHTTPD_OPENSSL) \
-		--without-pcre \
-		--program-prefix="" \
-		$(DISABLE_IPV6) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(LIGHTTPD_DIR)/$(LIGHTTPD_BINARY): $(LIGHTTPD_DIR)/.configured
-	$(MAKE) -C $(LIGHTTPD_DIR)
-
-$(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY): $(LIGHTTPD_DIR)/$(LIGHTTPD_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LIGHTTPD_DIR) install
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-	@rm -rf $(TARGET_DIR)/usr/lib/lighttpd/*.la
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/lighttpd/*.so
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY)
-	@if [ ! -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf ]; then \
-		$(INSTALL) -m 0644 -D $(LIGHTTPD_DIR)/doc/lighttpd.conf \
-			$(TARGET_DIR)/etc/lighttpd/lighttpd.conf; \
-	fi
-	$(INSTALL) -m 0755 -D package/lighttpd/rc.lighttpd \
-		$(TARGET_DIR)/etc/init.d/S99lighttpd
-
-ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_OPENSSL)),y)
-lighttpd: uclibc openssl $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY)
+ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_PCRE)),y)
+LIGHTTPD_CONF_ENV += PCRE_LIB="-lpcre"
+LIGHTTPD_DEPENDENCIES += pcre
+LIGHTTPD_CONF_OPT += --with-pcre
 else
-lighttpd: uclibc $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY)
+LIGHTTPD_CONF_OPT += --without-pcre
 endif
 
-lighttpd-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIGHTTPD_DIR) uninstall
-	@rm -rf $(TARGET_DIR)/usr/lib/lighttpd
-	@rm -f $(TARGET_DIR)/etc/init.d/S99lighttpd
-	@rm -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf
-	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/etc/lighttpd
-	-$(MAKE) -C $(LIGHTTPD_DIR) clean
-
-lighttpd-dirclean:
-	rm -rf $(LIGHTTPD_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD)),y)
-TARGETS+=lighttpd
-endif
+$(eval $(call AUTOTARGETS,package,lighttpd))

Deleted: trunk/buildroot/package/lighttpd/rc.lighttpd
===================================================================
--- trunk/buildroot/package/lighttpd/rc.lighttpd	2008-04-24 13:18:03 UTC (rev 21834)
+++ trunk/buildroot/package/lighttpd/rc.lighttpd	2008-04-24 13:18:50 UTC (rev 21835)
@@ -1,39 +0,0 @@
-#!/bin/sh
-#
-# Starts lighttpd
-#
-
-umask 077
-
-start() {
- 	echo -n "Starting lighttpd: "
-	start-stop-daemon -S -q -m -p /var/run/lighttpd.pid -b -x /usr/sbin/lighttpd -- -f /etc/lighttpd/lighttpd.conf -D
-	echo "OK"
-}
-stop() {
-	echo -n "Stopping lighttpd: "
-	start-stop-daemon -K -q -p /var/run/lighttpd.pid
-	echo "OK"
-}
-restart() {
-	stop
-	start
-}
-
-case "$1" in
-  start)
-  	start
-	;;
-  stop)
-  	stop
-	;;
-  restart|reload)
-  	restart
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
-
