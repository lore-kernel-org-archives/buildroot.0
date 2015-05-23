From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:14:26 +0300
Subject: [Buildroot] [PATCH 36/38] samba: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <12c8c34cbd4d1196b3074bee8c11b4168af38e3f.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/samba/nmbd.service | 12 ++++++++++++
 package/samba/samba.mk     | 12 ++++++++++++
 package/samba/smbd.service | 12 ++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/samba/nmbd.service
 create mode 100644 package/samba/smbd.service

diff --git a/package/samba/nmbd.service b/package/samba/nmbd.service
new file mode 100644
index 0000000..52b3920
--- /dev/null
+++ b/package/samba/nmbd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Samba NMB daemon
+After=network.target
+
+[Service]
+ExecStartPre=mkdir -p /var/log/samba
+ExecStart=/usr/sbin/nmbd -F
+Restart=always
+PermissionsStartOnly=true
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 68da9d9..9ba0cf4 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -186,4 +186,16 @@ define SAMBA_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb
 endef
 
+define SAMBA_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/samba/nmbd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/nmbd.service
+	$(INSTALL) -D -m 644 package/samba/smbd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/smbd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/nmbd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nmbd.service
+	ln -sf /usr/lib/systemd/system/smbd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/smbd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/samba/smbd.service b/package/samba/smbd.service
new file mode 100644
index 0000000..4c97ce3
--- /dev/null
+++ b/package/samba/smbd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Samba SMB daemon
+After=network.target
+
+[Service]
+ExecStartPre=mkdir -p /var/log/samba
+ExecStart=/usr/sbin/smbd -F
+Restart=always
+PermissionsStartOnly=true
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
