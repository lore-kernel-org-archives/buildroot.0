From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:06:47 +0300
Subject: [Buildroot] [PATCH 22/38] ptpd2: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <d811a41ac827e1b29179240409630095e2b79284.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following package and sysv initscript naming scheme,
the service is "ptpd2" instead of just "ptpd" version 2.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/ptpd2/ptpd2.mk      |  8 ++++++++
 package/ptpd2/ptpd2.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/ptpd2/ptpd2.service

diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index e1d4f27..54e881f 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -29,4 +29,12 @@ define PTPD2_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S65ptpd2
 endef
 
+define PTPD2_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/ptpd2/ptpd2.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ptpd2.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/ptpd2.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptpd2.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/ptpd2/ptpd2.service b/package/ptpd2/ptpd2.service
new file mode 100644
index 0000000..8610d98
--- /dev/null
+++ b/package/ptpd2/ptpd2.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Precision Time Protocol daemon
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/ptpd2 -C -s
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
