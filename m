From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 12:02:25 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/rsyslog: install
 default service file
Message-ID: <20210426093832.A7F5A860F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b870cfab061b060bac60f112c4d30ce66b711bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

As of v8.2008 rsyslog no longer provides a default service file, and now
suggests using the platform suggested defaults. For Buildroot, install
the Debian service file which has been added in the same version,
however is not included in the official release.

Upstream commit which adds this service file:
https://github.com/rsyslog/rsyslog/commit/cfd07503ba055100a84d75d1a78a5c6cceb9fdab

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4732b78221145ea9fd738d5959ac29cae5a30c0b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk      |  5 +++++
 package/rsyslog/rsyslog.service | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index d20a13dbdd..62ef756f9d 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -89,6 +89,11 @@ RSYSLOG_CONF_OPTS += \
 	--disable-omjournal
 endif
 
+define RSYSLOG_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0755 -D package/rsyslog/rsyslog.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/rsyslog.service
+endef
+
 define RSYSLOG_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslogd \
 		$(TARGET_DIR)/etc/init.d/S01rsyslogd
diff --git a/package/rsyslog/rsyslog.service b/package/rsyslog/rsyslog.service
new file mode 100644
index 0000000000..40c7c2202d
--- /dev/null
+++ b/package/rsyslog/rsyslog.service
@@ -0,0 +1,19 @@
+[Unit]
+Description=System Logging Service
+Requires=syslog.socket
+Documentation=man:rsyslogd(8)
+Documentation=https://www.rsyslog.com/doc/
+
+[Service]
+Type=notify
+ExecStart=/usr/sbin/rsyslogd -n -iNONE
+StandardOutput=null
+Restart=on-failure
+
+# Increase the default a bit in order to allow many simultaneous
+# files to be monitored, we might need a lot of fds.
+LimitNOFILE=16384
+
+[Install]
+WantedBy=multi-user.target
+Alias=syslog.service
