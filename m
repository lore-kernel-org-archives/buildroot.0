From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:02:59 +0300
Subject: [Buildroot] [PATCH 04/38] dmraid: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <721c6d3ea01303daf85283ddf882cb50416a6c23.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is not really a service, just a start-stop script.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/dmraid/dmraid.mk      |  8 ++++++++
 package/dmraid/dmraid.service | 12 ++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/dmraid/dmraid.service

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index fbb2387..913d89e 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -21,4 +21,12 @@ define DMRAID_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
+define DMRAID_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/dmraid/dmraid.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/dmraid.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/dmraid.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dmraid.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/dmraid/dmraid.service b/package/dmraid/dmraid.service
new file mode 100644
index 0000000..6318471
--- /dev/null
+++ b/package/dmraid/dmraid.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=dmraid device management
+
+[Service]
+Type=oneshot
+ExecStartPre=modprobe dm-mod
+ExecStart=/usr/sbin/dmraid --activate yes --ignorelocking
+ExecStop=/usr/sbin/dmraid --activate no --ignorelocking
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
