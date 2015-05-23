From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:06:21 +0300
Subject: [Buildroot] [PATCH 21/38] ptpd: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <e1e71965d966c70bec5fb685569364e52d90b1c8.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/ptpd/ptpd.mk      |  8 ++++++++
 package/ptpd/ptpd.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/ptpd/ptpd.service

diff --git a/package/ptpd/ptpd.mk b/package/ptpd/ptpd.mk
index ac9ab98..3f420c4 100644
--- a/package/ptpd/ptpd.mk
+++ b/package/ptpd/ptpd.mk
@@ -22,4 +22,12 @@ define PTPD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S65ptpd
 endef
 
+define PTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/ptpd/ptpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ptpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/ptpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptpd.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/ptpd/ptpd.service b/package/ptpd/ptpd.service
new file mode 100644
index 0000000..580ca51
--- /dev/null
+++ b/package/ptpd/ptpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Precision Time Protocol daemon
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/ptpd -c -S
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
