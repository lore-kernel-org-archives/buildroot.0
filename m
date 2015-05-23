From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:05:13 +0300
Subject: [Buildroot] [PATCH 14/38] mongoose: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <fa462132229bb0c222bd9d3598cd0c8c9e741f8c.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/mongoose/mongoose.mk      |  8 ++++++++
 package/mongoose/mongoose.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/mongoose/mongoose.service

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 6797e58..38f76af 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -36,6 +36,14 @@ define MONGOOSE_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S85mongoose
 endef
 
+define MONGOOSE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/mongoose/mongoose.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mongoose.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/mongoose.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mongoose.service
+endef
+
 define MONGOOSE_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 644 $(@D)/libmongoose.a \
 		$(STAGING_DIR)/usr/lib/libmongoose.a
diff --git a/package/mongoose/mongoose.service b/package/mongoose/mongoose.service
new file mode 100644
index 0000000..12a731c
--- /dev/null
+++ b/package/mongoose/mongoose.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Mongoose HTTP server
+After=network.target
+
+[Service]
+ExecStart=/usr/sbin/mongoose -document_root /var/www -listening_port 80
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
