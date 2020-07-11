From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 23:51:25 +0200
Subject: [Buildroot] [git commit] package/vsftpd: add systemd unit
Message-ID: <20200711214755.6B10186875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5e71f722d3f85a69cf563619218ab6b5134a10b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vsftpd/vsftpd.mk      |  5 +++++
 package/vsftpd/vsftpd.service | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 2f86d91ba2..8a9aac2d29 100644
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
index 0000000000..eba61addad
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
