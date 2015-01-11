From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jan 2015 20:44:52 +0100
Subject: [Buildroot] [git commit] bandwidthd: Add systemd unit file and
	install it to run at startup.
Message-ID: <20150111194509.BF9448015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1b07c06fa44fc33efab515a549f62f721315d21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bandwidthd/bandwidthd.mk      |   10 ++++++++++
 package/bandwidthd/bandwidthd.service |   11 +++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
index ca991f9..2773490 100644
--- a/package/bandwidthd/bandwidthd.mk
+++ b/package/bandwidthd/bandwidthd.mk
@@ -31,4 +31,14 @@ else
 BANDWIDTHD_CONF_OPTS += --with-sqlite-storage=false
 endif
 
+define BANDWIDTHD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/bandwidthd/bandwidthd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/bandwidthd.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -sf /usr/lib/systemd/system/bandwidthd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/bandwidthd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/bandwidthd/bandwidthd.service b/package/bandwidthd/bandwidthd.service
new file mode 100644
index 0000000..9c03d42
--- /dev/null
+++ b/package/bandwidthd/bandwidthd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Bandwidth usage monitor and reporter
+After=network.target
+
+[Service]
+Type=forking
+ExecStart=/usr/bin/bandwidthd
+PIDFile=/var/run/bandwidthd.pid
+
+[Install]
+WantedBy=multi-user.target
