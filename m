From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Jul 2020 15:58:43 +0200
Subject: [Buildroot] [PATCH] package/vsftpd: add systemd init
Message-ID: <20200711135843.1789746-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/vsftpd/vsftpd.mk      |  5 +++++
 package/vsftpd/vsftpd.service | 12 ++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/vsftpd/vsftpd.service

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 2f86d91ba..8a9aac2d2 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -47,6 +47,11 @@ define VSFTPD_USERS
 	ftp -1 ftp -1 * /home/ftp - - Anonymous FTP User
 endef
 
+define VSFTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/vsftpd/vsftpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/vsftpd.service
+endef
+
 define VSFTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/vsftpd/S70vsftpd $(TARGET_DIR)/etc/init.d/S70vsftpd
 endef
diff --git a/package/vsftpd/vsftpd.service b/package/vsftpd/vsftpd.service
new file mode 100644
index 000000000..eba61adda
--- /dev/null
+++ b/package/vsftpd/vsftpd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=vsftpd FTP server
+After=network.target
+
+[Service]
+Type=simple
+ExecStart=/usr/sbin/vsftpd /etc/vsftpd.conf
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.25.1
