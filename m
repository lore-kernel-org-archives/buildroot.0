From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri,  3 Jan 2020 09:53:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/linux-tools: add hyperv integration
 services
Message-ID: <20200103085357.7698-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hyperv integration services offer convenience features
for guest operating systems running on the microsoft hyperv
virtualization platform.

  linux kernel source name -> installed binary name
             hv_vss_daemon -> hypervvssd
             hv_kvp_daemon -> hypervkvpd
           hv_fcopy_daemon -> hypervfcopyd

The installed binary names are derived from what seems common
in large distros like RedHat/Ubuntu.

The hyperv integration services are a rough functional
equivalent of openvmtools (in context of vmware)

This commits depends on
  "add hooks for busybox init and systemd service installation"

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 DEVELOPERS                                         |  9 +++++
 package/linux-tools/Config.in                      | 43 ++++++++++++++++++++
 .../linux-tools/linux-tool-hv_fcopy_daemon.init    | 47 ++++++++++++++++++++++
 .../linux-tools/linux-tool-hv_fcopy_daemon.mk.in   | 39 ++++++++++++++++++
 .../linux-tools/linux-tool-hv_fcopy_daemon.service | 11 +++++
 package/linux-tools/linux-tool-hv_kvp_daemon.init  | 47 ++++++++++++++++++++++
 package/linux-tools/linux-tool-hv_kvp_daemon.mk.in | 42 +++++++++++++++++++
 .../linux-tools/linux-tool-hv_kvp_daemon.service   | 11 +++++
 package/linux-tools/linux-tool-hv_vss_daemon.init  | 47 ++++++++++++++++++++++
 package/linux-tools/linux-tool-hv_vss_daemon.mk.in | 38 +++++++++++++++++
 .../linux-tools/linux-tool-hv_vss_daemon.service   | 11 +++++
 11 files changed, 345 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-hv_fcopy_daemon.init
 create mode 100644 package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in
 create mode 100644 package/linux-tools/linux-tool-hv_fcopy_daemon.service
 create mode 100644 package/linux-tools/linux-tool-hv_kvp_daemon.init
 create mode 100644 package/linux-tools/linux-tool-hv_kvp_daemon.mk.in
 create mode 100644 package/linux-tools/linux-tool-hv_kvp_daemon.service
 create mode 100644 package/linux-tools/linux-tool-hv_vss_daemon.init
 create mode 100644 package/linux-tools/linux-tool-hv_vss_daemon.mk.in
 create mode 100644 package/linux-tools/linux-tool-hv_vss_daemon.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 90941dd..209b546 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1861,6 +1861,15 @@ F:	package/scrypt/
 
 N:	Pascal de Bruijn <p.debruijn@unilogic.nl>
 F:	package/libargon2/
+F:	package/linux-tools/linux-tool-hv_fcopy_daemon.init
+F:	package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in
+F:	package/linux-tools/linux-tool-hv_fcopy_daemon.service
+F:	package/linux-tools/linux-tool-hv_kvp_daemon.init
+F:	package/linux-tools/linux-tool-hv_kvp_daemon.mk.in
+F:	package/linux-tools/linux-tool-hv_kvp_daemon.service
+F:	package/linux-tools/linux-tool-hv_vss_daemon.init
+F:	package/linux-tools/linux-tool-hv_vss_daemon.mk.in
+F:	package/linux-tools/linux-tool-hv_vss_daemon.service
 
 N:	Pascal Huerst <pascal.huerst@gmail.com>
 F:	package/google-breakpad/
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ab8cc38..c37a8c1 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -116,4 +116,47 @@ config BR2_PACKAGE_LINUX_TOOLS_TMON
 	  tmon is a terminal-based tool (using curses) that allows the
 	  user to access thermal information about the system.
 
+menu "Microsoft HyperV Integration Services"
+
+config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
+	bool "hypervvssd (hv_vss_daemon)"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  Microsoft HyperV Volume Snapshot Service daemon
+
+	  HyperV uses hypervvssd to freeze your filesystems
+	  during snapshots and backups
+
+	  Relevant kernel configuration options:
+	  HYPERV, HYPERV_UTILS
+
+config BR2_PACKAGE_LINUX_TOOLS_HV_KVP_DAEMON
+	bool "hypervkvpd (hv_kvp_daemon)"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  Microsoft HyperV Key/Value Pair daemon
+
+	  HyperV uses hypervkvpd to retrieve status information
+	  from your virtualized guest OS
+
+	  Relevant kernel configuration options:
+	  HYPERV, HYPERV_UTILS
+
+config BR2_PACKAGE_LINUX_TOOLS_HV_FCOPY_DAEMON
+	bool "hypervfcopyd (hv_fcopy_daemon)"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  Microsoft HyperV File Copy daemon
+
+	  HyperV uses hypervfcopyd to easily transfer files
+	  to and from your virtualized guest OS
+
+	  Relevant kernel configuration options:
+	  HYPERV, HYPERV_UTILS
+
+endmenu
+
 endmenu
diff --git a/package/linux-tools/linux-tool-hv_fcopy_daemon.init b/package/linux-tools/linux-tool-hv_fcopy_daemon.init
new file mode 100644
index 0000000..260aed3
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_fcopy_daemon.init
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+DAEMON="hypervfcopyd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" -- -n
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in b/package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in
new file mode 100644
index 0000000..b0c150d
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in
@@ -0,0 +1,39 @@
+################################################################################
+#
+# hv_fcopy_daemon
+#
+################################################################################
+
+LINUX_TOOLS += hv_fcopy_daemon
+
+HV_FCOPY_DAEMON_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+
+define HV_FCOPY_DAEMON_BUILD_CMDS
+	$(Q)if test ! -f $(LINUX_DIR)/tools/hv/hv_fcopy_daemon.c ; then \
+		echo "Your kernel version is too old and does not have the HyperV FCOPY daemon tool." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+		$(HV_FCOPY_DAEMON_MAKE_OPTS) \
+		hv_fcopy_daemon
+endef
+
+define HV_FCOPY_DAEMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_fcopy_daemon \
+		$(TARGET_DIR)/usr/sbin/hypervfcopyd
+endef
+
+define HV_FCOPY_DAEMON_INSTALL_INIT_SYSTEMD
+        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+        $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_fcopy_daemon.service \
+                $(TARGET_DIR)/usr/lib/systemd/system/hypervfcopyd.service
+	ln -sf ../../../../usr/lib/systemd/system/hv_fcopy_daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hypervfcopyd.service
+endef
+
+define HV_FCOPY_DAEMON_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/linux-tools/linux-tool-hv_fcopy_daemon.init \
+		$(TARGET_DIR)/etc/init.d/S10hypervfcopyd
+endef
+
diff --git a/package/linux-tools/linux-tool-hv_fcopy_daemon.service b/package/linux-tools/linux-tool-hv_fcopy_daemon.service
new file mode 100644
index 0000000..c43fc1b
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_fcopy_daemon.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=HyperV FCopy daemon
+After=syslog.target
+ConditionVirtualization=microsoft
+
+[Service]
+Type=simple
+ExecStart=/usr/sbin/hypervfcopyd -n
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/linux-tools/linux-tool-hv_kvp_daemon.init b/package/linux-tools/linux-tool-hv_kvp_daemon.init
new file mode 100644
index 0000000..dd47179
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_kvp_daemon.init
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+DAEMON="hypervkvpd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" -- -n
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/linux-tools/linux-tool-hv_kvp_daemon.mk.in b/package/linux-tools/linux-tool-hv_kvp_daemon.mk.in
new file mode 100644
index 0000000..08199b1
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_kvp_daemon.mk.in
@@ -0,0 +1,42 @@
+################################################################################
+#
+# hv_kvp_daemon
+#
+################################################################################
+
+LINUX_TOOLS += hv_kvp_daemon
+
+HV_KVP_DAEMON_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+
+define HV_KVP_DAEMON_BUILD_CMDS
+	$(Q)if test ! -f $(LINUX_DIR)/tools/hv/hv_kvp_daemon.c ; then \
+		echo "Your kernel version is too old and does not have the HyperV KVP daemon tool." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+		$(HV_KVP_DAEMON_MAKE_OPTS) \
+		hv_kvp_daemon
+endef
+
+define HV_KVP_DAEMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_kvp_daemon \
+		$(TARGET_DIR)/usr/sbin/hypervkvpd
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_get_dhcp_info.sh \
+		$(TARGET_DIR)/usr/libexec/hypervkvpd/hv_get_dhcp_info
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_get_dns_info.sh \
+		$(TARGET_DIR)/usr/libexec/hypervkvpd/hv_get_dns_info
+endef
+
+define HV_KVP_DAEMON_INSTALL_INIT_SYSTEMD
+        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+        $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_kvp_daemon.service \
+                $(TARGET_DIR)/usr/lib/systemd/system/hypervkvpd.service
+	ln -sf ../../../../usr/lib/systemd/system/hv_kvp_daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hypervkvpd.service
+endef
+
+define HV_KVP_DAEMON_INSTALL_INIT_SYSV
+        $(INSTALL) -m 0755 -D package/linux-tools/linux-tool-hv_kvp_daemon.init \
+                $(TARGET_DIR)/etc/init.d/S10hypervkvpd
+endef
diff --git a/package/linux-tools/linux-tool-hv_kvp_daemon.service b/package/linux-tools/linux-tool-hv_kvp_daemon.service
new file mode 100644
index 0000000..6ed6302
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_kvp_daemon.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=HyperV KVP daemon
+After=syslog.target
+ConditionVirtualization=microsoft
+
+[Service]
+Type=simple
+ExecStart=/usr/sbin/hypervkvpd -n
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.init b/package/linux-tools/linux-tool-hv_vss_daemon.init
new file mode 100644
index 0000000..664c5ba
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_vss_daemon.init
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+DAEMON="hypervvssd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" -- -n
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.mk.in b/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
new file mode 100644
index 0000000..e165f45
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
@@ -0,0 +1,38 @@
+################################################################################
+#
+# hv_vss_daemon
+#
+################################################################################
+
+LINUX_TOOLS += hv_vss_daemon
+
+HV_VSS_DAEMON_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
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
+		$(TARGET_DIR)/usr/sbin/hypervvssd
+endef
+
+define HV_VSS_DAEMON_INSTALL_INIT_SYSTEMD
+        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+        $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_vss_daemon.service \
+                $(TARGET_DIR)/usr/lib/systemd/system/hypervvssd.service
+	ln -sf ../../../../usr/lib/systemd/system/hv_vss_daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hypervvssd.service
+endef
+
+define HV_VSS_DAEMON_INSTALL_INIT_SYSV
+        $(INSTALL) -m 0755 -D package/linux-tools/linux-tool-hv_vss_daemon.init \
+                $(TARGET_DIR)/etc/init.d/S10hypervvssd
+endef
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.service b/package/linux-tools/linux-tool-hv_vss_daemon.service
new file mode 100644
index 0000000..3fd8002
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
+ExecStart=/usr/sbin/hypervvssd -n
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4
