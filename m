From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 15:53:15 +0200
Subject: [Buildroot] [git commit] rpi-userland: systemd support
Message-ID: <20150714135330.3205680720@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a126ed3122cd9ad6dc655181d6f58e99020a7817
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: use relative path for the symbolic link.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-userland/rpi-userland.mk |    7 +++++++
 package/rpi-userland/vcfiled.service |    8 ++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 1a1c9c6..e2eadb2 100644
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
+	ln -sf ../../../../usr/lib/systemd/system/vcfiled.service \
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
