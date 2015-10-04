From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 Oct 2015 18:45:43 +0200
Subject: [Buildroot] [PATCH] vsftpd: Add systemd services
Message-ID: <1443977143-21369-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The systemd services were taken from Arch Linux's repository:
https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/vsftpd

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/vsftpd/vsftpd-ssl.service  | 10 ++++++++++
 package/vsftpd/vsftpd-ssl.socket   |  9 +++++++++
 package/vsftpd/vsftpd-ssl at .service |  9 +++++++++
 package/vsftpd/vsftpd.mk           | 17 +++++++++++++++++
 package/vsftpd/vsftpd.service      | 11 +++++++++++
 package/vsftpd/vsftpd.socket       |  9 +++++++++
 package/vsftpd/vsftpd at .service     |  8 ++++++++
 7 files changed, 73 insertions(+)
 create mode 100644 package/vsftpd/vsftpd-ssl.service
 create mode 100644 package/vsftpd/vsftpd-ssl.socket
 create mode 100644 package/vsftpd/vsftpd-ssl at .service
 create mode 100644 package/vsftpd/vsftpd.service
 create mode 100644 package/vsftpd/vsftpd.socket
 create mode 100644 package/vsftpd/vsftpd at .service

diff --git a/package/vsftpd/vsftpd-ssl.service b/package/vsftpd/vsftpd-ssl.service
new file mode 100644
index 0000000..3343bc9
--- /dev/null
+++ b/package/vsftpd/vsftpd-ssl.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=vsftpd daemon (legacy implicit SSL)
+
+[Service]
+ExecStart=/usr/bin/vsftpd -oimplicit_ssl=yes
+ExecReload=/bin/kill -HUP $MAINPID
+KillMode=process
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/vsftpd/vsftpd-ssl.socket b/package/vsftpd/vsftpd-ssl.socket
new file mode 100644
index 0000000..b18b639
--- /dev/null
+++ b/package/vsftpd/vsftpd-ssl.socket
@@ -0,0 +1,9 @@
+[Unit]
+Conflicts=vsftpd.service
+
+[Socket]
+ListenStream=990
+Accept=yes
+
+[Install]
+WantedBy=sockets.target
diff --git a/package/vsftpd/vsftpd-ssl at .service b/package/vsftpd/vsftpd-ssl at .service
new file mode 100644
index 0000000..8bcf78e
--- /dev/null
+++ b/package/vsftpd/vsftpd-ssl at .service
@@ -0,0 +1,9 @@
+[Unit]
+Description=vsftpd per-connection server (legacy implicit SSL)
+
+[Service]
+ExecStart=-/usr/bin/vsftpd -oimplicit_ssl=yes
+ExecReload=/bin/kill -HUP $MAINPID
+StandardInput=socket
+StandardOutput=socket
+StandardError=syslog
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 1e48264..823ad66 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -47,6 +47,23 @@ define VSFTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/vsftpd/S70vsftpd $(TARGET_DIR)/etc/init.d/S70vsftpd
 endef
 
+define VSFTPD_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
+
+	for f in vsftpd.service vsftpd.socket vsftpd at .service \
+		vsftpd-ssl.service vsftpd-ssl.socket vsftpd-ssl at .service; do \
+		$(INSTALL) -D -m 644 package/vsftpd/$$f \
+			$(TARGET_DIR)/usr/lib/systemd/system/$$f; \
+		wanted_by="multi-user.target.wants"; \
+		if [ $${f##*.} = "socket" ]; then \
+			wanted_by="sockets.target.wants"; \
+		fi; \
+		ln -sf ../../../../usr/lib/systemd/system/$$f \
+			$(TARGET_DIR)/etc/systemd/system/$$wanted_by/$$f; \
+	done
+endef
+
 define VSFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
 	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
diff --git a/package/vsftpd/vsftpd.service b/package/vsftpd/vsftpd.service
new file mode 100644
index 0000000..cc7645f
--- /dev/null
+++ b/package/vsftpd/vsftpd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=vsftpd daemon
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/vsftpd
+ExecReload=/bin/kill -HUP $MAINPID
+KillMode=process
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/vsftpd/vsftpd.socket b/package/vsftpd/vsftpd.socket
new file mode 100644
index 0000000..cdc0d33
--- /dev/null
+++ b/package/vsftpd/vsftpd.socket
@@ -0,0 +1,9 @@
+[Unit]
+Conflicts=vsftpd.service
+
+[Socket]
+ListenStream=21
+Accept=yes
+
+[Install]
+WantedBy=sockets.target
diff --git a/package/vsftpd/vsftpd at .service b/package/vsftpd/vsftpd at .service
new file mode 100644
index 0000000..81e1429
--- /dev/null
+++ b/package/vsftpd/vsftpd at .service
@@ -0,0 +1,8 @@
+[Unit]
+Description=vsftpd per-connection server
+
+[Service]
+ExecStart=-/usr/bin/vsftpd
+ExecReload=/bin/kill -HUP $MAINPID
+StandardInput=socket
+StandardError=syslog
-- 
2.5.3
