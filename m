From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:06:15 +0300
Subject: [Buildroot] [PATCH 20/38] proftpd: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <de424ff6bb3228307c64e35bcafab21db1b75526.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/proftpd/proftpd.mk      |  8 ++++++++
 package/proftpd/proftpd.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/proftpd/proftpd.service

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 023b4dd..81a8a69 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -55,4 +55,12 @@ define PROFTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d/S50proftpd
 endef
 
+define PROFTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/proftpd/proftpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/proftpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/proftpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/proftpd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/proftpd/proftpd.service b/package/proftpd/proftpd.service
new file mode 100644
index 0000000..f1777a5
--- /dev/null
+++ b/package/proftpd/proftpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=FTR server
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/proftpd -n -q
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
