From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Thu,  5 Dec 2019 16:44:28 +0100
Subject: [Buildroot] [PATCH] package/linux-tools: add hv_vss_daemon
Message-ID: <20191205154428.7547-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hyperv integration services for snapshotting a running vm

hv_vss_daemon facilitates a FIFREEZE initiated from the hypervisor

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/linux-tools/Config.in                      |  5 ++++
 package/linux-tools/linux-tool-hv_vss_daemon.mk.in | 34 ++++++++++++++++++++++
 .../linux-tools/linux-tool-hv_vss_daemon.service   | 11 +++++++
 3 files changed, 50 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-hv_vss_daemon.mk.in
 create mode 100644 package/linux-tools/linux-tool-hv_vss_daemon.service

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ab8cc38..4b750e2 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -116,4 +116,9 @@ config BR2_PACKAGE_LINUX_TOOLS_TMON
 	  tmon is a terminal-based tool (using curses) that allows the
 	  user to access thermal information about the system.
 
+config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
+	bool "hv_vss_daemon"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  HyperV VSS snapshot daemon
 endmenu
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.mk.in b/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
new file mode 100644
index 0000000..2de13a7
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
@@ -0,0 +1,34 @@
+################################################################################
+#
+# hv_vss_daemon
+#
+################################################################################
+
+LINUX_TOOLS += hv_vss_daemon
+
+HV_VSS_DAEMON_MAKE_OPTS = CROSS=$(TARGET_CROSS)
+
+define HV_VSS_DAEMON_BUILD_CMDS
+	$(Q)if test ! -f $(LINUX_DIR)/tools/hv/hv_vss_daemon.c ; then \
+		echo "Your kernel version is too old and does not have the HyperV VSS daemon tool." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+		$(HV_VSS_DAEMON_MAKE_OPTS) \
+		hv_vss_daemon
+endef
+
+define HV_VSS_DAEMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_vss_daemon \
+		$(TARGET_DIR)/usr/sbin/hv_vss_daemon
+endef
+
+define HV_VSS_DAEMON_INSTALL_INIT_SYSTEMD
+        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+        $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_vss_daemon.service \
+                $(TARGET_DIR)/usr/lib/systemd/system/hv_vss_daemon.service
+	ln -sf ../../../../usr/lib/systemd/system/hv_vss_daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hv_vss_daemon.service
+endef
+
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.service b/package/linux-tools/linux-tool-hv_vss_daemon.service
new file mode 100644
index 0000000..f653f7b
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_vss_daemon.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=HyperV VSS daemon
+After=syslog.target
+ConditionVirtualization=microsoft
+
+[Service]
+Type=simple
+ExecStart=/usr/sbin/hv_vss_daemon --no-daemon
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4
