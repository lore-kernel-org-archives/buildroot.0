From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:07:26 +0300
Subject: [Buildroot] [PATCH 26/38] sunxi-mali: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <96bc5f669829401ce7c13f49c31f47a0fc6c2c95.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The startup script too complex to embed it completely into
the .service file, so it is left as a standalone script.

Since there is really nothing sysv-specific there,
the actual initscript is used without any changes.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/sunxi-mali/mali.service  | 11 +++++++++++
 package/sunxi-mali/sunxi-mali.mk | 10 ++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/sunxi-mali/mali.service

diff --git a/package/sunxi-mali/mali.service b/package/sunxi-mali/mali.service
new file mode 100644
index 0000000..807989c
--- /dev/null
+++ b/package/sunxi-mali/mali.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Mali graphics driver
+
+[Service]
+Type=oneshot
+ExecStart=/usr/lib/systemd/scripts/mali start
+ExecStop=/usr/lib/systemd/scripts/mali stop
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index c6900c8..a529e2d 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -80,4 +80,14 @@ define SUNXI_MALI_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S80mali
 endef
 
+define SUNXI_MALI_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 755 package/sunxi-mali/S80mali \
+		$(TARGET_DIR)/usr/lib/systemd/scripts/mali
+	$(INSTALL) -D -m 644 package/sunxi-mali/mali.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mali.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/mali.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mali.service
+endef
+
 $(eval $(generic-package))
-- 
2.0.3
