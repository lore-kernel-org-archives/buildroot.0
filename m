From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 14:57:23 +0100
Subject: [Buildroot] [git commit master 1/1] thttpd: install into /usr,
	cleanup install handling
Message-ID: <20101105135802.A22F08DBB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aba71b77f16ddcaa5f19ef761b2f32421f6b7593
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/thttpd/thttpd.mk |   32 +++++++++++++-------------------
 1 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 80eba3a..c67aa49 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -21,37 +21,31 @@ THTTPD_POST_PATCH_HOOKS = THTTPD_DEBIAN_PATCHES
 THTTPD_MAKE=$(MAKE1)
 
 define THTTPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/thttpd $(TARGET_DIR)/sbin/thttpd
-	$(INSTALL) -D -m 0755 $(@D)/extras/htpasswd $(TARGET_DIR)/bin/htpasswd
-	$(INSTALL) -D -m 0755 $(@D)/extras/makeweb $(TARGET_DIR)/bin/makeweb
-	$(INSTALL) -D -m 0755 $(@D)/extras/syslogtocern $(TARGET_DIR)/bin/syslogtocern
-	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd_wrapper $(TARGET_DIR)/sbin/thttpd_wrapper
+	$(INSTALL) -D -m 0755 $(@D)/thttpd $(TARGET_DIR)/usr/sbin/thttpd
+	$(INSTALL) -D -m 0755 $(@D)/extras/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
+	$(INSTALL) -D -m 0755 $(@D)/extras/makeweb $(TARGET_DIR)/usr/bin/makeweb
+	$(INSTALL) -D -m 0755 $(@D)/extras/syslogtocern $(TARGET_DIR)/usr/bin/syslogtocern
+	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd_wrapper $(TARGET_DIR)/usr/sbin/thttpd_wrapper
+	$(SED) 's:/usr/local/sbin:/usr/sbin:g' -e \
+		's:/usr/local/www:/var/www:g' $(TARGET_DIR)/usr/sbin/thttpd_wrapper
 	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
-	cp $(TARGET_DIR)/etc/init.d/S90thttpd $(TARGET_DIR)/etc/init.d/S90thttpd.in
-	cp $(TARGET_DIR)/sbin/thttpd_wrapper $(TARGET_DIR)/sbin/thttpd_wrapper.in
-	sed -e "s:/usr/local/sbin:/sbin:g" -e "s:/usr/local/www:/var/www:g" \
-		< $(TARGET_DIR)/sbin/thttpd_wrapper.in > $(TARGET_DIR)/sbin/thttpd_wrapper
-	sed -e "s:/usr/local/sbin:/sbin:g" < $(TARGET_DIR)/etc/init.d/S90thttpd.in \
-		> $(TARGET_DIR)/etc/init.d/S90thttpd
-	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd.in $(TARGET_DIR)/sbin/thttpd_wrapper.in
+	$(SED) 's:/usr/local/sbin:/usr/sbin:g' $(TARGET_DIR)/etc/init.d/S90thttpd
 	$(INSTALL) -d $(TARGET_DIR)/var/www/data
 	$(INSTALL) -d $(TARGET_DIR)/var/www/logs
 	echo "dir=/var/www/data" > $(TARGET_DIR)/var/www/thttpd_config
 	echo 'cgipat=**.cgi' >> $(TARGET_DIR)/var/www/thttpd_config
 	echo "logfile=/var/www/logs/thttpd_log" >> $(TARGET_DIR)/var/www/thttpd_config
 	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)/var/www/thttpd_config
-	echo "<HTML><BODY>thttpd test page</BODY></HTML>" > $(TARGET_DIR)/var/www/data/index.html
 endef
 
 define THTTPD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/thttpd
-	rm -f $(TARGET_DIR)/sbin/httpd_wrapper
-	rm -f $(TARGET_DIR)/sbin/thttpd_wrapper
+	rm -f $(TARGET_DIR)/usr/sbin/thttpd
+	rm -f $(TARGET_DIR)/usr/sbin/thttpd_wrapper
 	rm -rf $(TARGET_DIR)/var/www
 	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd
-	rm -f $(TARGET_DIR)/bin/htpasswd
-	rm -f $(TARGET_DIR)/bin/makeweb
-	rm -f $(TARGET_DIR)/bin/syslogtocern
+	rm -f $(TARGET_DIR)/usr/bin/htpasswd
+	rm -f $(TARGET_DIR)/usr/bin/makeweb
+	rm -f $(TARGET_DIR)/usr/bin/syslogtocern
 endef
 
 $(eval $(call AUTOTARGETS,package,thttpd))
-- 
1.7.1
