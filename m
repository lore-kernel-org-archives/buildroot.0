From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 23:23:57 +0200
Subject: [Buildroot] [git commit] netplug: systemd support
Message-ID: <20150713212420.338AD81974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8da356e5d81d4e87c74c093a7d27d4dc030b87f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: use relative symlink instead of absolute symlink.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netplug/netplug.mk      |    8 ++++++++
 package/netplug/netplug.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index 0bd7c78..aeebcad 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -23,4 +23,12 @@ define NETPLUG_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S29netplug
 endef
 
+define NETPLUG_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/netplug/netplug.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/netplug.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/netplug.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/netplug.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/netplug/netplug.service b/package/netplug/netplug.service
new file mode 100644
index 0000000..017a21f
--- /dev/null
+++ b/package/netplug/netplug.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Network cable hotplug management daemon
+After=syslog.target network.target
+
+[Service]
+ExecStart=/sbin/netplugd -F
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
