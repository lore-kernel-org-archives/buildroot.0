From: Arnar Mar Sig <antab@valka.is>
Date: Tue, 1 Apr 2008 23:58:27 +0000
Subject: [Buildroot] [PATCH] Update lighttpd package
Message-ID: <DA636050-A5F5-4DA6-9D61-8B2C1FD153FE@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps lighttpd up to version 1.4.19 and adds the option to  
compile with pcre support to enable mod_rewrite. Tested on AVR32

diff -purN buildroot-upstream/package/lighttpd/Config.in buildroot- 
mine/package/lighttpd/Config.in
--- buildroot-upstream/package/lighttpd/Config.in	2008-03-10  
13:14:36.000000000 +0000
+++ buildroot-mine/package/lighttpd/Config.in	2008-04-01  
23:45:41.000000000 +0000
@@ -19,3 +19,11 @@ config BR2_PACKAGE_LIGHTTPD_OPENSSL
	select BR2_PACKAGE_OPENSSL
	help
	  Enable OpenSSL support for lighttpd.
+
+config BR2_PACKAGE_LIGHTTPD_PCRE
+	bool "lighttpd-pcre"
+	default n
+	depends on BR2_PACKAGE_LIGHTTPD
+	select BR2_PACKAGE_PCRE
+	help
+	  Enable PCRE support. Needed to support mod_rewrite
diff -purN buildroot-upstream/package/lighttpd/lighttpd-1.4.19- 
configure.patch buildroot-mine/package/lighttpd/lighttpd-1.4.19- 
configure.patch
--- buildroot-upstream/package/lighttpd/lighttpd-1.4.19- 
configure.patch	1970-01-01 00:00:00.000000000 +0000
+++ buildroot-mine/package/lighttpd/lighttpd-1.4.19-configure.patch	 
2008-04-01 23:43:56.000000000 +0000
@@ -0,0 +1,11 @@
+--- lighttpd-1.4.19-org/configure	2008-03-10 21:46:12.000000000 +0000
++++ lighttpd-1.4.19/configure	2008-03-31 06:58:41.000000000 +0000
+@@ -23971,7 +23971,7 @@
+ { echo "$as_me:$LINENO: result: $WITH_PCRE" >&5
+ echo "${ECHO_T}$WITH_PCRE" >&6; }
+
+-if test "x$cross_compiling" = xno -a "$WITH_PCRE" != "no"; then
++if test "$WITH_PCRE" != "no"; then
+   # Extract the first word of "pcre-config", so it can be a program  
name with args.
+ set dummy pcre-config; ac_word=$2
+ { echo "$as_me:$LINENO: checking for $ac_word" >&5
diff -purN buildroot-upstream/package/lighttpd/lighttpd.mk buildroot- 
mine/package/lighttpd/lighttpd.mk
--- buildroot-upstream/package/lighttpd/lighttpd.mk	2008-03-10  
13:14:36.000000000 +0000
+++ buildroot-mine/package/lighttpd/lighttpd.mk	2008-04-01  
23:43:56.000000000 +0000
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
-
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
-	$(LIGHTTPD_CAT) $(DL_DIR)/$(LIGHTTPD_SOURCE) | tar -C $(BUILD_DIR) $ 
(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIGHTTPD_DIR) package/lighttpd/ lighttpd 
\*.patch
-ifneq ($(LIGHTTPD_PATCH),)
-	(cd $(LIGHTTPD_DIR)&&$(LIGHTTPD_CAT) $(LIGHTTPD_PATCH_FILE)|patch -p1)
-endif
-	if [ -d $(LIGHTTPD_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(LIGHTTPD_DIR) $(LIGHTTPD_DIR)/debian/ 
patches \*.dpatch; \
-	fi
-	$(CONFIG_UPDATE) $(@D)
-	$(SED) 's/-lfs/-largefile/g;s/_lfs/_largefile/g' $(LIGHTTPD_DIR)/ 
configure
-	touch $@
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

ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_OPENSSL)),y)
-LIGHTTPD_OPENSSL:=--with-openssl
+LIGHTTPD_DEPENDENCIES += openssl
+LIGHTTPD_CONF_OPT += --with-openssl
else
-LIGHTTPD_OPENSSL:=--without-openssl
-endif
-
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
-$(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY): $(LIGHTTPD_DIR)/$ 
(LIGHTTPD_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LIGHTTPD_DIR) install
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
+LIGHTTPD_CONF_OPT += --without-openssl
endif
-	@rm -rf $(TARGET_DIR)/usr/lib/lighttpd/*.la
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/lighttpd/ 
*.so
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$ 
(LIGHTTPD_TARGET_BINARY)
-	@if [ ! -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf ]; then \
-		$(INSTALL) -m 0644 -D $(LIGHTTPD_DIR)/doc/lighttpd.conf \
-			$(TARGET_DIR)/etc/lighttpd/lighttpd.conf; \
-	fi
-	$(INSTALL) -m 0755 -D package/lighttpd/rc.lighttpd \
-		$(TARGET_DIR)/etc/init.d/S99lighttpd

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
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIGHTTPD_DIR)  
uninstall
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
diff -purN buildroot-upstream/package/lighttpd/rc.lighttpd buildroot- 
mine/package/lighttpd/rc.lighttpd
--- buildroot-upstream/package/lighttpd/rc.lighttpd	2008-03-25  
13:47:13.000000000 +0000
+++ buildroot-mine/package/lighttpd/rc.lighttpd	1970-01-01  
00:00:00.000000000 +0000
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
-	start-stop-daemon -S -q -m -p /var/run/lighttpd.pid -b -x /usr/sbin/ 
lighttpd -- -f /etc/lighttpd/lighttpd.conf -D
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
