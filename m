From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 03:11:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: mdnsresponder
	ncftp php proftpd
Message-ID: <20070822101118.E0397A5D35@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 03:11:18 -0700 (Wed, 22 Aug 2007)
New Revision: 19641

Log:
- fix unpacking the tarballs, minor cleanups while at it.


Modified:
   trunk/buildroot/package/mdnsresponder/mdnsresponder.mk
   trunk/buildroot/package/ncftp/ncftp.mk
   trunk/buildroot/package/php/php.mk
   trunk/buildroot/package/proftpd/proftpd.mk


Changeset:
Modified: trunk/buildroot/package/mdnsresponder/mdnsresponder.mk
===================================================================
--- trunk/buildroot/package/mdnsresponder/mdnsresponder.mk	2007-08-22 10:06:25 UTC (rev 19640)
+++ trunk/buildroot/package/mdnsresponder/mdnsresponder.mk	2007-08-22 10:11:18 UTC (rev 19641)
@@ -7,7 +7,7 @@
 MDNSRESPONDER_SOURCE:=mDNSResponder-$(MDNSRESPONDER_VERSION).tar.gz
 MDNSRESPONDER_SITE:=http://www.opensource.apple.com/darwinsource/tarballs/other/$(MDNSRESPONDER_SOURCE)
 MDNSRESPONDER_DIR:=$(BUILD_DIR)/mDNSResponder-$(MDNSRESPONDER_VERSION)
-MDNSRESPONDER_CAT:=zcat
+MDNSRESPONDER_CAT:=$(ZCAT)
 MDNSRESPONDER_INSTDEPS:=
 
 ifeq ($(BR2_PACKAGE_MDNSRESPONDER_UTILS),y)
@@ -19,15 +19,15 @@
 
 $(MDNSRESPONDER_DIR)/.unpacked: $(DL_DIR)/$(MDNSRESPONDER_SOURCE)
 	$(MDNSRESPONDER_CAT) $(DL_DIR)/$(MDNSRESPONDER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(MDNSRESPONDER_DIR)/.unpacked
+	touch $@
 
 $(MDNSRESPONDER_DIR)/.configured: $(MDNSRESPONDER_DIR)/.unpacked
 	$(SED) 's:OPTIONALTARG = nss_mdns::' $(MDNSRESPONDER_DIR)/mDNSPosix/Makefile
-	touch $(MDNSRESPONDER_DIR)/.configured
+	touch $@
 
 $(MDNSRESPONDER_DIR)/.built: $(MDNSRESPONDER_DIR)/.configured
 	$(MAKE1) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared" LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix
-	touch $(MDNSRESPONDER_DIR)/.built
+	touch $@
 
 $(STAGING_DIR)/usr/lib/libdns_sd.so: $(MDNSRESPONDER_DIR)/.built
 	# lib
@@ -65,19 +65,19 @@
 mdnsresponder-clean:
 	rm -f $(MDNSRESPONDER_DIR)/.configured $(MDNSRESPONDER_DIR)/.built $(MDNSRESPONDER_DIR)/.staged
 	-$(MAKE1) os=linux -C $(MDNSRESPONDER_DIR)/mDNSPosix clean
-	rm -f $(TARGET_DIR)/usr/sbin/dnsextd
-	rm -f $(TARGET_DIR)/usr/sbin/mDNSResponderPosix
-	rm -f $(TARGET_DIR)/usr/sbin/mDNSNetMonitor
-	rm -f $(TARGET_DIR)/usr/sbin/mdnsd
-	rm -f $(TARGET_DIR)/usr/bin/dns-sd
-	rm -f $(TARGET_DIR)/usr/bin/mDNSProxyResponderPosix
-	rm -f $(TARGET_DIR)/usr/bin/mDNSIdentify
-	rm -f $(TARGET_DIR)/usr/bin/mDNSClientPosix
-	rm -f $(TARGET_DIR)/usr/lib/libdns_sd.so*
-	rm -f $(STAGING_DIR)/usr/lib/libdns_sd.so*
-	rm -f $(STAGING_DIR)/usr/include/dns_sd.h
-	rm -f $(TARGET_DIR)/etc/mDNSResponderPosix.conf
-	rm -f $(TARGET_DIR)/etc/init.d/S80mdnsresponder
+	rm -f $(TARGET_DIR)/usr/sbin/dnsextd \
+		$(TARGET_DIR)/usr/sbin/mDNSResponderPosix \
+		$(TARGET_DIR)/usr/sbin/mDNSNetMonitor \
+		$(TARGET_DIR)/usr/sbin/mdnsd \
+		$(TARGET_DIR)/usr/bin/dns-sd \
+		$(TARGET_DIR)/usr/bin/mDNSProxyResponderPosix \
+		$(TARGET_DIR)/usr/bin/mDNSIdentify \
+		$(TARGET_DIR)/usr/bin/mDNSClientPosix \
+		$(TARGET_DIR)/usr/lib/libdns_sd.so* \
+		$(STAGING_DIR)/usr/lib/libdns_sd.so* \
+		$(STAGING_DIR)/usr/include/dns_sd.h \
+		$(TARGET_DIR)/etc/mDNSResponderPosix.conf \
+		$(TARGET_DIR)/etc/init.d/S80mdnsresponder
 
 mdnsresponder-dirclean:
 	rm -rf $(MDNSRESPONDER_DIR)

Modified: trunk/buildroot/package/ncftp/ncftp.mk
===================================================================
--- trunk/buildroot/package/ncftp/ncftp.mk	2007-08-22 10:06:25 UTC (rev 19640)
+++ trunk/buildroot/package/ncftp/ncftp.mk	2007-08-22 10:11:18 UTC (rev 19641)
@@ -20,7 +20,7 @@
 	$(WGET) -P $(DL_DIR) $(NCFTP_SITE)/$(NCFTP_SOURCE)
 
 $(NCFTP_DIR)/.source: $(DL_DIR)/$(NCFTP_SOURCE)
-	bzcat $(DL_DIR)/$(NCFTP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(BZCAT) $(DL_DIR)/$(NCFTP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
 $(NCFTP_DIR)/.configured: $(NCFTP_DIR)/.source

Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2007-08-22 10:06:25 UTC (rev 19640)
+++ trunk/buildroot/package/php/php.mk	2007-08-22 10:11:18 UTC (rev 19641)
@@ -7,7 +7,7 @@
 PHP_SOURCE:=php-$(PHP_VER).tar.bz2
 PHP_SITE:=http://us.php.net/get/${PHP_SOURCE}/from/us2.php.net/mirror
 PHP_DIR:=$(BUILD_DIR)/php-$(PHP_VER)
-PHP_CAT=bzcat
+PHP_CAT=$(BZCAT)
 PHP_DEPS=
 PHP_TARGET_DEPS=
 
@@ -55,7 +55,7 @@
 
 $(PHP_DIR)/.unpacked: $(DL_DIR)/$(PHP_SOURCE)
 	$(PHP_CAT) $(DL_DIR)/$(PHP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(PHP_DIR)/.unpacked
+	touch $@
 
 $(PHP_DIR)/.configured: $(PHP_DIR)/.unpacked
 	(cd $(PHP_DIR); rm -rf config.cache; \
@@ -92,15 +92,15 @@
 		$(PHP_CGI) \
 		$(PHP_ZLIB) \
 	)
-	touch $(PHP_DIR)/.configured
+	touch $@
 
 $(PHP_DIR)/.built: $(PHP_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(PHP_DIR)
-	touch $(PHP_DIR)/.built
+	touch $@
 
 $(PHP_DIR)/.staged: $(PHP_DIR)/.built
 	$(MAKE) DESTDIR=$(STAGING_DIR) INSTALL_ROOT=$(STAGING_DIR) CC=$(TARGET_CC) -C $(PHP_DIR) install
-	touch $(PHP_DIR)/.staged
+	touch $@
 
 $(TARGET_DIR)/usr/bin/php: $(PHP_DIR)/.staged
 	cp -dpf $(STAGING_DIR)/usr/bin/php $(TARGET_DIR)/usr/bin/php
@@ -113,7 +113,7 @@
 	$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/php-cgi
 
 $(TARGET_DIR)/etc/php.ini: $(PHP_DIR)/.staged
-	cp $(PHP_DIR)/php.ini-dist $(TARGET_DIR)/etc/php.ini
+	cp -f $(PHP_DIR)/php.ini-dist $(TARGET_DIR)/etc/php.ini
 
 php: uclibc $(PHP_DEPS) $(PHP_TARGET_DEPS) $(TARGET_DIR)/etc/php.ini
 

Modified: trunk/buildroot/package/proftpd/proftpd.mk
===================================================================
--- trunk/buildroot/package/proftpd/proftpd.mk	2007-08-22 10:06:25 UTC (rev 19640)
+++ trunk/buildroot/package/proftpd/proftpd.mk	2007-08-22 10:11:18 UTC (rev 19641)
@@ -7,7 +7,7 @@
 PROFTPD_SOURCE:=proftpd-$(PROFTPD_VERSION).tar.bz2
 PROFTPD_SITE:=ftp://ftp.proftpd.org/distrib/source/
 PROFTPD_DIR:=$(BUILD_DIR)/proftpd-$(PROFTPD_VERSION)
-PROFTPD_CAT:=bzcat
+PROFTPD_CAT:=$(BZCAT)
 PROFTPD_BINARY:=proftpd
 PROFTPD_TARGET_BINARY:=usr/sbin/proftpd
 
@@ -23,7 +23,7 @@
 $(PROFTPD_DIR)/.unpacked: $(DL_DIR)/$(PROFTPD_SOURCE)
 	$(PROFTPD_CAT) $(DL_DIR)/$(PROFTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(PROFTPD_DIR)
-	touch $(PROFTPD_DIR)/.unpacked
+	touch $@
 
 $(PROFTPD_DIR)/.configured: $(PROFTPD_DIR)/.unpacked
 	(cd $(PROFTPD_DIR); rm -rf config.cache; \
@@ -48,7 +48,7 @@
 		$(ENABLE_IPV6) \
 		--with-gnu-ld \
 	)
-	touch $(PROFTPD_DIR)/.configured
+	touch $@
 
 $(PROFTPD_DIR)/$(PROFTPD_BINARY): $(PROFTPD_DIR)/.configured
 	$(MAKE) CC="$(HOSTCC)" CFLAGS="" LDFLAGS=""	\
@@ -56,7 +56,7 @@
 	$(MAKE) -C $(PROFTPD_DIR)
 
 $(TARGET_DIR)/$(PROFTPD_TARGET_BINARY): $(PROFTPD_DIR)/$(PROFTPD_BINARY)
-	cp -a $(PROFTPD_DIR)/$(PROFTPD_BINARY)	\
+	cp -dpf $(PROFTPD_DIR)/$(PROFTPD_BINARY)	\
 		$(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
 	@if [ ! -f $(TARGET_DIR)/etc/proftpd.conf ]; then \
 		$(INSTALL) -m 0644 -D $(PROFTPD_DIR)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
