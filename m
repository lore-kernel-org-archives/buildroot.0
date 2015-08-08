From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:41 -0000
Subject: [Buildroot] [git commit branch/next] supervisor: systemd support
Message-ID: <20150808105631.946B080414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bdbcb8ada7c48f4e9a19b57053ccda0043b6dea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Running supervisord under systemd sounds wrong, but it is possible
and probably makes sense in some cases.

[Thomas: use relative symbolic link instead of an absolute symbolic
link.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/supervisor/supervisor.mk       |    8 ++++++++
 package/supervisor/supervisord.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 6bd64a9..a6a4731 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -22,4 +22,12 @@ define SUPERVISOR_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S99supervisord
 endef
 
+define SUPERVISOR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/supervisor/supervisord.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/supervisord.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/supervisord.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/supervisord.service
+endef
+
 $(eval $(python-package))
diff --git a/package/supervisor/supervisord.service b/package/supervisor/supervisord.service
new file mode 100644
index 0000000..92c38c7
--- /dev/null
+++ b/package/supervisor/supervisord.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Process Control System
+After=syslog.target
+
+[Service]
+ExecStart=/usr/bin/supervisord -n
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
