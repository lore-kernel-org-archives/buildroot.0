From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:02:10 +0300
Subject: [Buildroot] [PATCH 01/38] at: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <f3aa3efc49568ce60fa774f02c3f031ccbf40da2.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/at/at.mk       |  8 ++++++++
 package/at/atd.service | 11 +++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/at/atd.service

diff --git a/package/at/at.mk b/package/at/at.mk
index 1504e32..be4c0b2 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -25,4 +25,12 @@ define AT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
 endef
 
+define AT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/at/atd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/atd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/atd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/atd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/at/atd.service b/package/at/atd.service
new file mode 100644
index 0000000..543cbc3
--- /dev/null
+++ b/package/at/atd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Run jobs queued for later execution
+After=syslog.target
+
+[Service]
+UMask=077
+ExecStart=/usr/sbin/atd -f
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
