From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 21:43:17 +0100
Subject: [Buildroot] [git commit] openntpd: add systemd unit file
Message-ID: <20150123204619.5BD0A80E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35f37d762648bb921aafd43fb34476c76e4eec91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openntpd/ntpd.service |   11 +++++++++++
 package/openntpd/openntpd.mk  |    8 ++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

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
