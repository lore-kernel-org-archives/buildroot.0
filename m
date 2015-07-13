From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 18:18:38 +0200
Subject: [Buildroot] [git commit] dcron: systemd support
Message-ID: <20150713161845.021F97FA9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ab06dd1e95abf1b9c8b0ee38bae25b8a305b5e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dcron/dcron.mk      |    8 ++++++++
 package/dcron/dcron.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index fcb585d..840471f 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -33,4 +33,12 @@ define DCRON_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/dcron/S90dcron $(TARGET_DIR)/etc/init.d/S90dcron
 endef
 
+define DCRON_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/dcron/dcron.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/dcron.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/dcron.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dcron.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/dcron/dcron.service b/package/dcron/dcron.service
new file mode 100644
index 0000000..b9fa489
--- /dev/null
+++ b/package/dcron/dcron.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Task scheduler daemon
+After=syslog.target
+
+[Service]
+ExecStart=/usr/sbin/crond -f -S
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
