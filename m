From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 16:34:02 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: fix startup with systemd
Message-ID: <20190119153718.4DC458D4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fce8e52044c3b568d826f04155639eff922c9cda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default syslog-ng installs a .service that requires a config file at
/etc/default, so provide one with the default values.

It's also necessary to enable the service by means of a symlink created
at /etc/systemd/system/multi-user.target.wants.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Reviewed-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/syslog-ng.mk      | 10 ++++++++++
 package/syslog-ng/syslog-ng at default |  8 ++++++++
 2 files changed, 18 insertions(+)

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
