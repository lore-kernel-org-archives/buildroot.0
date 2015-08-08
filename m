From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:03 -0000
Subject: [Buildroot] [git commit branch/next] chrony: systemd support
Message-ID: <20150808105630.AE35E7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6946f24cc1e4cbb8aaff1a2192c1a95d539ca5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

systemd has its own NTP daemon, which must be disabled before
starting chrony. Possible (but unlikely) conflict with openntpd
is not marked in either package.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/chrony/chrony.mk      |    8 ++++++++
 package/chrony/chrony.service |   11 +++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 8e41ddc..f8012ac 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -45,4 +45,12 @@ define CHRONY_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/chrony/S49chrony $(TARGET_DIR)/etc/init.d/S49chrony
 endef
 
+define CHRONY_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/chrony/chrony.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/chrony.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/chrony.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/chrony.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/chrony/chrony.service b/package/chrony/chrony.service
new file mode 100644
index 0000000..6000fce
--- /dev/null
+++ b/package/chrony/chrony.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Chrony Network Time Daemon
+After=syslog.target network.target
+Conflicts=systemd-timesyncd.service
+
+[Service]
+ExecStart=/usr/bin/chronyd -n
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
