From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:45 -0000
Subject: [Buildroot] [git commit branch/next] triggerhappy: systemd support
Message-ID: <20150808105632.B0A85818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ee5eb933d9d148d31598adafc41cf7fd4c76c9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas: use a relative symbolic link.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/triggerhappy/triggerhappy.mk      |    8 ++++++++
 package/triggerhappy/triggerhappy.service |    9 +++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index d3dfc6a..3a68e50 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -34,4 +34,12 @@ define TRIGGERHAPPY_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S10triggerhappy
 endef
 
+define TRIGGERHAPPY_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/triggerhappy/triggerhappy.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/triggerhappy.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/triggerhappy.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/triggerhappy.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/triggerhappy/triggerhappy.service b/package/triggerhappy/triggerhappy.service
new file mode 100644
index 0000000..8449c1c
--- /dev/null
+++ b/package/triggerhappy/triggerhappy.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Triggerhappy daemon
+
+[Service]
+ExecStart=/usr/sbin/thd --triggers /etc/triggerhappy/triggers.d --socket /var/run/thd.socket --user nobody /dev/input/event*
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
