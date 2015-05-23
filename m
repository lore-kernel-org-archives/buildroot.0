From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:14:07 +0300
Subject: [Buildroot] [PATCH 34/38] triggerhappy: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <dc9d8d0b528d349289f87b54f476f736d25ea1b4.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/triggerhappy/triggerhappy.mk      | 8 ++++++++
 package/triggerhappy/triggerhappy.service | 9 +++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/triggerhappy/triggerhappy.service

diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index d3dfc6a..a643342 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -34,4 +34,12 @@ define TRIGGERHAPPY_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S10triggerhappy
 endef
 
+define TRIGGERHAPPY_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/triggerhappy/triggerhappy.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/triggerhappy.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/triggerhappy.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/triggerhappy.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/triggerhappy/triggerhappy.service b/package/triggerhappy/triggerhappy.service
new file mode 100644
index 0000000..8449c1c
--- /dev/null
+++ b/package/triggerhappy/triggerhappy.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Triggerhappy daemon
+
+[Service]
+ExecStart=/usr/sbin/thd --triggers /etc/triggerhappy/triggers.d --socket /var/run/thd.socket --user nobody /dev/input/event*
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
