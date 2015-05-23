From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:07:07 +0300
Subject: [Buildroot] [PATCH 25/38] rpi-userland: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <be47e4f10ee527a05bf4ac9831ef3db640d9d257.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/rpi-userland/rpi-userland.mk | 7 +++++++
 package/rpi-userland/vcfiled.service | 8 ++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 package/rpi-userland/vcfiled.service

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 20a6af0..e1ce2b6 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -19,6 +19,13 @@ define RPI_USERLAND_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/rpi-userland/S94vcfiled \
 		$(TARGET_DIR)/etc/init.d/S94vcfiled
 endef
+define RPI_USERLAND_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/rpi-userland/vcfiled.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/vcfiled.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/vcfiled.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/vcfiled.service
+endef
 endif
 
 define RPI_USERLAND_POST_TARGET_CLEANUP
diff --git a/package/rpi-userland/vcfiled.service b/package/rpi-userland/vcfiled.service
new file mode 100644
index 0000000..2b8f1dc
--- /dev/null
+++ b/package/rpi-userland/vcfiled.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=VideoCore file server daemon
+
+[Service]
+ExecStart=/usr/sbin/vcfiled --foreground
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
