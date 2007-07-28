From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 09:46:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/thttpd
Message-ID: <20070728164636.CFA74A455C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 09:46:36 -0700 (Sat, 28 Jul 2007)
New Revision: 19298

Log:
Cleanup of thttpd package

Modified:
   trunk/buildroot/package/thttpd/thttpd.mk


Changeset:
Modified: trunk/buildroot/package/thttpd/thttpd.mk
===================================================================
--- trunk/buildroot/package/thttpd/thttpd.mk	2007-07-28 16:41:44 UTC (rev 19297)
+++ trunk/buildroot/package/thttpd/thttpd.mk	2007-07-28 16:46:36 UTC (rev 19298)
@@ -9,8 +9,9 @@
 THTTPD_DIR:=$(BUILD_DIR)/thttpd-$(THTTPD_VERSION)
 THTTPD_CAT:=$(ZCAT)
 THTTPD_BINARY:=thttpd
-THTTPD_TARGET_BINARY:=usr/sbin/thttpd
-THTTPD_WEB_DIR:=/var/www
+THTTPD_TARGET_BINARY:=sbin/thttpd
+THTTPD_ROOT:=/var
+THTTPD_WEB_DIR:=$(THTTPD_ROOT)/www
 
 $(DL_DIR)/$(THTTPD_SOURCE):
 	$(WGET) -P $(DL_DIR) $(THTTPD_SITE)/$(THTTPD_SOURCE)
@@ -29,31 +30,48 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
+		--prefix=$(THTTPD_ROOT) \
 	);
 	touch $(THTTPD_DIR)/.configured
 
 $(THTTPD_DIR)/$(THTTPD_BINARY): $(THTTPD_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) WEBDIR=$(THTTPD_WEB_DIR) -C $(THTTPD_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(THTTPD_DIR)
 
 $(TARGET_DIR)/$(THTTPD_TARGET_BINARY): $(THTTPD_DIR)/$(THTTPD_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) prefix=$(TARGET_DIR)/usr WEBDIR=$(THTTPD_WEB_DIR) -C $(THTTPD_DIR) installthis
-	$(STRIP) --strip-unneeded $(THTTPD_DIR)/$(THTTPD_BINARY)
-	$(INSTALL) -d $(TARGET_DIR)$(THTTPD_WEB_DIR)/cgi-bin
-	$(INSTALL) -m 0755 package/thttpd/S90thttpd $(TARGET_DIR)/etc/init.d
-	$(INSTALL) -m 0644 package/thttpd/thttpd.conf $(TARGET_DIR)/etc
+	install -D $(THTTPD_DIR)/$(THTTPD_BINARY) $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
+	install -D $(THTTPD_DIR)/extras/htpasswd $(TARGET_DIR)/bin/htpasswd
+	install -D $(THTTPD_DIR)/extras/makeweb $(TARGET_DIR)/bin/makeweb
+	install -D $(THTTPD_DIR)/extras/syslogtocern $(TARGET_DIR)/bin/syslogtocern
+	install -D $(THTTPD_DIR)/scripts/thttpd_wrapper $(TARGET_DIR)/sbin/thttpd_wrapper
+	install -D $(THTTPD_DIR)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
+	cp $(TARGET_DIR)/etc/init.d/S90thttpd $(TARGET_DIR)/etc/init.d/S90thttpd.in
+	cp $(TARGET_DIR)/sbin/thttpd_wrapper $(TARGET_DIR)/sbin/thttpd_wrapper.in
+	sed -e "s:/usr/local/sbin:/sbin:g" -e "s:/usr/local/www:$(THTTPD_WEB_DIR):g" < $(TARGET_DIR)/sbin/thttpd_wrapper.in > $(TARGET_DIR)/sbin/httpd_wrapper
+	sed -e "s:/usr/local/sbin:/sbin:g" < $(TARGET_DIR)/etc/init.d/S90thttpd.in > $(TARGET_DIR)/etc/init.d/S90thttpd
+	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd.in $(TARGET_DIR)/sbin/thttpd_wrapper.in
+	install -d $(TARGET_DIR)$(THTTPD_WEB_DIR)/data
+	install -d $(TARGET_DIR)$(THTTPD_WEB_DIR)/logs
+	echo "dir=$(THTTPD_WEB_DIR)/data" > $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
+	echo 'cgipat=**.cgi' >> $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
+	echo "logfile=$(THTTPD_WEB_DIR)/logs/thttpd_log" >> $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
+	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
+	echo "<HTML><BODY>thttpd test page</BODY></HTML>" > $(TARGET_DIR)$(THTTPD_WEB_DIR)/data/index.html
 
 thttpd: uclibc $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
 
 thttpd-clean:
 	rm -f $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/sbin/httpd_wrapper
+	rm -f $(TARGET_DIR)/sbin/thttpd_wrapper
 	rm -rf $(TARGET_DIR)/var/www
-	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd $(TARGET_DIR)/etc/thttpd.conf
+	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd
+	rm -f $(TARGET_DIR)/bin/htpasswd
+	rm -f $(TARGET_DIR)/bin/makeweb
+	rm -f $(TARGET_DIR)/bin/syslogtocern
 	-$(MAKE) -C $(THTTPD_DIR) clean
 
 thttpd-dirclean:
 	rm -rf $(THTTPD_DIR)
-
 #############################################################
 #
 # Toplevel Makefile options
