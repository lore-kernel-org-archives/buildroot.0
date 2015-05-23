From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:08:37 +0300
Subject: [Buildroot] [PATCH 30/38] tinyhttpd: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <4de07aed2aa8ff5ece608548b6eed6d357f14a3f.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/tinyhttpd/tinyhttpd.mk      |  8 ++++++++
 package/tinyhttpd/tinyhttpd.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/tinyhttpd/tinyhttpd.service

diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 0934b71..998ed26 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -24,4 +24,12 @@ define TINYHTTPD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S85tinyhttpd
 endef
 
+define TINYHTTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/tinyhttpd/tinyhttpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/tinyhttpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/tinyhttpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/tinyhttpd.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/tinyhttpd/tinyhttpd.service b/package/tinyhttpd/tinyhttpd.service
new file mode 100644
index 0000000..0ae5bac
--- /dev/null
+++ b/package/tinyhttpd/tinyhttpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Tiny HTTP daemon
+After=network.target
+
+[Service]
+ExecStart=/usr/sbin/tinyhttpd
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
