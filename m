From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Jan 2015 20:31:26 -0300
Subject: [Buildroot] [PATCH 2/2] openntpd: add systemd unit file
In-Reply-To: <1421796686-19858-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421796686-19858-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421796686-19858-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openntpd/ntpd.service | 11 +++++++++++
 package/openntpd/openntpd.mk  |  8 ++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/openntpd/ntpd.service

diff --git a/package/openntpd/ntpd.service b/package/openntpd/ntpd.service
new file mode 100644
index 0000000..a4ffa73
--- /dev/null
+++ b/package/openntpd/ntpd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=OpenNTP Daemon
+After=network.target
+Conflicts=systemd-timesyncd.service
+
+[Service]
+Type=simple
+ExecStart=/usr/sbin/ntpd -s -d
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index abc75ae..a6460cb 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -9,6 +9,14 @@ OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = COPYING
 
+define OPENNTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/openntpd/ntpd.service \
+		$(TARGET_DIR)/etc/systemd/system/ntpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../ntpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
+endef
+
 define OPENNTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/openntpd/S49ntp \
 		$(TARGET_DIR)/etc/init.d/S49ntp
-- 
2.0.5
