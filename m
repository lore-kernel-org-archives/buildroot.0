From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:05:57 +0300
Subject: [Buildroot] [PATCH 17/38] netplug: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <d4fa793b4ff869a339f725d0b9e45924af6867e5.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/netplug/netplug.mk      |  8 ++++++++
 package/netplug/netplug.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/netplug/netplug.service

diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index 0bd7c78..011c084 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -23,4 +23,12 @@ define NETPLUG_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S29netplug
 endef
 
+define NETPLUG_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/netplug/netplug.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/netplug.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/netplug.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/netplug.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/netplug/netplug.service b/package/netplug/netplug.service
new file mode 100644
index 0000000..017a21f
--- /dev/null
+++ b/package/netplug/netplug.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Network cable hotplug management daemon
+After=syslog.target network.target
+
+[Service]
+ExecStart=/sbin/netplugd -F
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
