From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:45 -0000
Subject: [Buildroot] [git commit branch/next] mongoose: systemd support
Message-ID: <20150808105632.A00BF818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de2dd8f473d5502c61e162594a6a6c3273270a9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas: use relative symbolic link.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mongoose/mongoose.mk      |    8 ++++++++
 package/mongoose/mongoose.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 6797e58..14f2aae 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -36,6 +36,14 @@ define MONGOOSE_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S85mongoose
 endef
 
+define MONGOOSE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/mongoose/mongoose.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mongoose.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/mongoose.service \
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
