From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 27 Aug 2019 23:16:25 -0300
Subject: [Buildroot] [PATCH 1/2] package/thttpd: fix systemd startup
In-Reply-To: <20190828021626.9688-1-unixmania@gmail.com>
References: <20190828021626.9688-1-unixmania@gmail.com>
Message-ID: <20190828021626.9688-2-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Create the configuration file as /etc/thttpd.conf, as expected by the
systemd unit file.

This matches other web server packages that install configuration files
at /etc/lighttpd/, /etc/apache2, etc.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/thttpd/thttpd.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 29611fff2c..03f148eb35 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -18,13 +18,14 @@ define THTTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/extras/syslogtocern $(TARGET_DIR)/usr/bin/syslogtocern
 	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd_wrapper $(TARGET_DIR)/usr/sbin/thttpd_wrapper
 	$(SED) 's:/usr/local/sbin:/usr/sbin:g' -e \
-		's:/usr/local/www:/var/www:g' $(TARGET_DIR)/usr/sbin/thttpd_wrapper
+		's:/usr/local/www/thttpd_config:/etc/thttpd.conf:g' \
+		$(TARGET_DIR)/usr/sbin/thttpd_wrapper
 	$(INSTALL) -d $(TARGET_DIR)/var/www/data
 	$(INSTALL) -d $(TARGET_DIR)/var/www/logs
-	echo "dir=/var/www/data" > $(TARGET_DIR)/var/www/thttpd_config
-	echo 'cgipat=**.cgi' >> $(TARGET_DIR)/var/www/thttpd_config
-	echo "logfile=/var/www/logs/thttpd_log" >> $(TARGET_DIR)/var/www/thttpd_config
-	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)/var/www/thttpd_config
+	echo "dir=/var/www/data" > $(TARGET_DIR)/etc/thttpd.conf
+	echo 'cgipat=**.cgi' >> $(TARGET_DIR)/etc/thttpd.conf
+	echo "logfile=/var/www/logs/thttpd_log" >> $(TARGET_DIR)/etc/thttpd.conf
+	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)/etc/thttpd.conf
 endef
 
 define THTTPD_INSTALL_INIT_SYSV
-- 
2.18.1
