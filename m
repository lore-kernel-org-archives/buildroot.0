From: Martin Banky <martin.banky@gmail.com>
Date: Fri, 5 Nov 2010 14:57:23 +0100
Subject: [Buildroot] [git commit master 1/1] thttpd: convert to autotargets
Message-ID: <20101105135802.707418DBB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dbf7100f2deafb6db251f022c347708e91c3d7fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, changed the site to Debian, to get the latest patches

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/thttpd/thttpd.mk |  101 +++++++++++++++++----------------------------
 1 files changed, 38 insertions(+), 63 deletions(-)

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index d32462e..80eba3a 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -3,64 +3,48 @@
 # thttpd
 #
 #############################################################
-THTTPD_VERSION:=2.25b
-THTTPD_SOURCE:=thttpd-$(THTTPD_VERSION).tar.gz
-THTTPD_SITE:=http://www.acme.com/software/thttpd/
-THTTPD_DIR:=$(BUILD_DIR)/thttpd-$(THTTPD_VERSION)
-THTTPD_CAT:=$(ZCAT)
-THTTPD_BINARY:=thttpd
-THTTPD_TARGET_BINARY:=sbin/thttpd
-THTTPD_ROOT:=/var
-THTTPD_WEB_DIR:=$(THTTPD_ROOT)/www
-
-$(DL_DIR)/$(THTTPD_SOURCE):
-	$(call DOWNLOAD,$(THTTPD_SITE),$(THTTPD_SOURCE))
-
-thttpd-source: $(DL_DIR)/$(THTTPD_SOURCE)
-
-$(THTTPD_DIR)/.unpacked: $(DL_DIR)/$(THTTPD_SOURCE)
-	$(THTTPD_CAT) $(DL_DIR)/$(THTTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(THTTPD_DIR)/.unpacked
+THTTPD_VERSION = 2.25b
+THTTPD_SOURCE = thttpd_$(THTTPD_VERSION).orig.tar.gz
+THTTPD_PATCH = thttpd_$(THTTPD_VERSION)-11.diff.gz
+THTTPD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/t/thttpd/
+
+ifneq ($(THTTPD_PATCH),)
+define THTTPD_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+	fi
+endef
+endif
 
-$(THTTPD_DIR)/.configured: $(THTTPD_DIR)/.unpacked
-	(cd $(THTTPD_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=$(THTTPD_ROOT) \
-	)
-	touch $(THTTPD_DIR)/.configured
+THTTPD_POST_PATCH_HOOKS = THTTPD_DEBIAN_PATCHES
 
-$(THTTPD_DIR)/$(THTTPD_BINARY): $(THTTPD_DIR)/.configured
-	$(MAKE1) -C $(THTTPD_DIR)
+THTTPD_MAKE=$(MAKE1)
 
-$(TARGET_DIR)/$(THTTPD_TARGET_BINARY): $(THTTPD_DIR)/$(THTTPD_BINARY)
-	install -D $(THTTPD_DIR)/$(THTTPD_BINARY) $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
-	install -D $(THTTPD_DIR)/extras/htpasswd $(TARGET_DIR)/bin/htpasswd
-	install -D $(THTTPD_DIR)/extras/makeweb $(TARGET_DIR)/bin/makeweb
-	install -D $(THTTPD_DIR)/extras/syslogtocern $(TARGET_DIR)/bin/syslogtocern
-	install -D $(THTTPD_DIR)/scripts/thttpd_wrapper $(TARGET_DIR)/sbin/thttpd_wrapper
-	install -D $(THTTPD_DIR)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
+define THTTPD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/thttpd $(TARGET_DIR)/sbin/thttpd
+	$(INSTALL) -D -m 0755 $(@D)/extras/htpasswd $(TARGET_DIR)/bin/htpasswd
+	$(INSTALL) -D -m 0755 $(@D)/extras/makeweb $(TARGET_DIR)/bin/makeweb
+	$(INSTALL) -D -m 0755 $(@D)/extras/syslogtocern $(TARGET_DIR)/bin/syslogtocern
+	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd_wrapper $(TARGET_DIR)/sbin/thttpd_wrapper
+	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
 	cp $(TARGET_DIR)/etc/init.d/S90thttpd $(TARGET_DIR)/etc/init.d/S90thttpd.in
 	cp $(TARGET_DIR)/sbin/thttpd_wrapper $(TARGET_DIR)/sbin/thttpd_wrapper.in
-	sed -e "s:/usr/local/sbin:/sbin:g" -e "s:/usr/local/www:$(THTTPD_WEB_DIR):g" < $(TARGET_DIR)/sbin/thttpd_wrapper.in > $(TARGET_DIR)/sbin/thttpd_wrapper
-	sed -e "s:/usr/local/sbin:/sbin:g" < $(TARGET_DIR)/etc/init.d/S90thttpd.in > $(TARGET_DIR)/etc/init.d/S90thttpd
+	sed -e "s:/usr/local/sbin:/sbin:g" -e "s:/usr/local/www:/var/www:g" \
+		< $(TARGET_DIR)/sbin/thttpd_wrapper.in > $(TARGET_DIR)/sbin/thttpd_wrapper
+	sed -e "s:/usr/local/sbin:/sbin:g" < $(TARGET_DIR)/etc/init.d/S90thttpd.in \
+		> $(TARGET_DIR)/etc/init.d/S90thttpd
 	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd.in $(TARGET_DIR)/sbin/thttpd_wrapper.in
-	install -d $(TARGET_DIR)$(THTTPD_WEB_DIR)/data
-	install -d $(TARGET_DIR)$(THTTPD_WEB_DIR)/logs
-	echo "dir=$(THTTPD_WEB_DIR)/data" > $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
-	echo 'cgipat=**.cgi' >> $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
-	echo "logfile=$(THTTPD_WEB_DIR)/logs/thttpd_log" >> $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
-	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
-	echo "<HTML><BODY>thttpd test page</BODY></HTML>" > $(TARGET_DIR)$(THTTPD_WEB_DIR)/data/index.html
-
-thttpd: $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
-
-thttpd-clean:
-	rm -f $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
+	$(INSTALL) -d $(TARGET_DIR)/var/www/data
+	$(INSTALL) -d $(TARGET_DIR)/var/www/logs
+	echo "dir=/var/www/data" > $(TARGET_DIR)/var/www/thttpd_config
+	echo 'cgipat=**.cgi' >> $(TARGET_DIR)/var/www/thttpd_config
+	echo "logfile=/var/www/logs/thttpd_log" >> $(TARGET_DIR)/var/www/thttpd_config
+	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)/var/www/thttpd_config
+	echo "<HTML><BODY>thttpd test page</BODY></HTML>" > $(TARGET_DIR)/var/www/data/index.html
+endef
+
+define THTTPD_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/sbin/thttpd
 	rm -f $(TARGET_DIR)/sbin/httpd_wrapper
 	rm -f $(TARGET_DIR)/sbin/thttpd_wrapper
 	rm -rf $(TARGET_DIR)/var/www
@@ -68,15 +52,6 @@ thttpd-clean:
 	rm -f $(TARGET_DIR)/bin/htpasswd
 	rm -f $(TARGET_DIR)/bin/makeweb
 	rm -f $(TARGET_DIR)/bin/syslogtocern
-	-$(MAKE) -C $(THTTPD_DIR) clean
+endef
 
-thttpd-dirclean:
-	rm -rf $(THTTPD_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_THTTPD),y)
-TARGETS+=thttpd
-endif
+$(eval $(call AUTOTARGETS,package,thttpd))
-- 
1.7.1
