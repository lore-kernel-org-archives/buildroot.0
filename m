From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:19:05 +0200
Subject: [Buildroot] [git commit] package/thttpd: fix systemd startup
Message-ID: <20190915131424.DB8E08E2C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=349501320bd1b50b9624576d4522ceb1e441df53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create the configuration file as /etc/thttpd.conf, as expected by the
systemd unit file.

This matches other web server packages that install configuration files
at /etc/lighttpd/, /etc/apache2, etc.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/thttpd/thttpd.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index a028e48cb4..6cf86e4b95 100644
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
