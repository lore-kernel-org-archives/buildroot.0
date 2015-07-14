From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 14:03:03 +0200
Subject: [Buildroot] [git commit] tinyhttpd: systemd support
Message-ID: <20150714120327.7E21F81D3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7afea9500de01a9b41c32045de6ec72c209d59e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: use relative symlink.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinyhttpd/tinyhttpd.mk      |    8 ++++++++
 package/tinyhttpd/tinyhttpd.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 0934b71..194249b 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -24,4 +24,12 @@ define TINYHTTPD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S85tinyhttpd
 endef
 
+define TINYHTTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/tinyhttpd/tinyhttpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/tinyhttpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/tinyhttpd.service \
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
