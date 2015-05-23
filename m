From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:13:27 +0300
Subject: [Buildroot] [PATCH 29/38] tftpd: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <23834175280549825307d0d73e7684efe024ccc3.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The code below assumes sysv initscript is correct.
Which I have doubts about.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/tftpd/tftpd.mk      |  8 ++++++++
 package/tftpd/tftpd.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/tftpd/tftpd.service

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 78df835..0d6a2ed 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -23,4 +23,12 @@ define TFTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/S80tftpd-hpa
 endef
 
+define TFTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/tftpd/tftpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/tftpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/tftpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/tftpd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/tftpd/tftpd.service b/package/tftpd/tftpd.service
new file mode 100644
index 0000000..b7a29a3
--- /dev/null
+++ b/package/tftpd/tftpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=TFTP daemon
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/tftpd -L -c -s /var/lib/tftpboot
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
