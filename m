From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 18 Jan 2019 16:46:25 -0200
Subject: [Buildroot] [PATCH] package/syslog-ng: fix startup with systemd
Message-ID: <20190118184625.11484-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default syslog-ng installs a .service that requires a config file at
/etc/default, so provide one with the default values.

It's also necessary to enable the service by means of a symlink created
at /etc/systemd/system/multi-user.target.wants.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/syslog-ng/syslog-ng.mk      | 10 ++++++++++
 package/syslog-ng/syslog-ng at default |  8 ++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/syslog-ng/syslog-ng at default

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index ecde9e8181..0c92b091b4 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -97,6 +97,16 @@ define SYSLOG_NG_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S01syslog-ng
 endef
 
+# By default syslog-ng installs a .service that requires a config file at
+# /etc/default, so provide one with the default values.
+define SYSLOG_NG_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0644 -D package/syslog-ng/syslog-ng at default \
+		$(TARGET_DIR)/etc/default/syslog-ng at default
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/syslog-ng at .service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/syslog-ng at default.service
+endef
+
 # By default syslog-ng installs a number of sample configuration
 # files. Some of these rely on optional features being
 # enabled. Because of this buildroot uninstalls the shipped config
diff --git a/package/syslog-ng/syslog-ng at default b/package/syslog-ng/syslog-ng at default
new file mode 100644
index 0000000000..0fad00ebac
--- /dev/null
+++ b/package/syslog-ng/syslog-ng at default
@@ -0,0 +1,8 @@
+#
+# /etc/default/syslog-ng at default
+#
+CONFIG_FILE=/etc/syslog-ng.conf
+PERSIST_FILE=/var/run/syslog-ng.persist
+CONTROL_FILE=/var/run/syslog-ng.ctl
+PID_FILE=/var/run/syslog-ng.pid
+OTHER_OPTIONS="--enable-core"
-- 
2.14.5
