From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:41 -0000
Subject: [Buildroot] [git commit branch/next] olsr: systemd support
Message-ID: <20150808105632.4899F818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b39faff8c5d425fe5f9fa64baf4b9ceb77b432f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas: use relative symlink instead of absolute symlink]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/olsr.mk      |    8 ++++++++
 package/olsr/olsr.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 7e28b1e..0dec8dc 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -40,4 +40,12 @@ define OLSR_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50olsr
 endef
 
+define OLSR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/olsr/olsr.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/olsr.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/olsr.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/olsr.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/olsr/olsr.service b/package/olsr/olsr.service
new file mode 100644
index 0000000..9ec8930
--- /dev/null
+++ b/package/olsr/olsr.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Ad-hoc wireless mesh routing daemon
+After=network.target
+
+[Service]
+ExecStart=/usr/sbin/olsrd -nofork
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
