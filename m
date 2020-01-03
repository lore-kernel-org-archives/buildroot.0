From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Jan 2020 20:57:05 +0100
Subject: [Buildroot] [PATCH 2/2] package/linux-tools: add hyperv integration
 services
In-Reply-To: <cover.1578081397.git.yann.morin.1998@free.fr>
References: <cover.1578081397.git.yann.morin.1998@free.fr>
Message-ID: <07a3e4666570e40666cc8dd518ffce582bbf7f38.1578081397.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pascal de Bruijn <p.debruijn@unilogic.nl>

The hyperv integration services offer convenience features for guest
operating systems running on the microsoft hyperv virtualization
platform. They roughly are for HyperV what openvmtools are for VMWare.

The installed binary names are derived from what seems common in large
distros like RedHat:

  linux kernel source name -> installed binary name
             hv_vss_daemon -> hypervvssd
             hv_kvp_daemon -> hypervkvpd
           hv_fcopy_daemon -> hypervfcopyd

Each tool was introduced at different points in the kernel history, so
we need to check each of them.

We provide a single init script that is responsible for starting all
enabled programs. The global status will be the status of the last
program to fail to start, or empty (i.e. success) if they all started
successfuly.

However, we provide one systemd unit per program, because it is not easy
to use a single unit to start (and monitor) more than one executable.
Additionally, we do not provide a template that is filled at tinstall
time either, because it does not gain much (three simple units vs. a
template and some replacement code in the .mk).

Finally, the key-value daemon uses a few helper scripts to get/set the
network config. All are optional (their presence is checked before
running them), but one, hv_set_ifconfig. However, it is not strictly
speaking required either, so we just symlink it to /bin/true to avoid
any warning at runtime. Providing actual helpers is left to the end
user, to adapt to their own environment.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
[yann.morin.1998 at free.fr:
  - aggregate all three tools in a single sub-package
  - introduce the main HV option, use a sub-option for each tool
  - aggregate the three init scripts into one
  - don't install the helpers; symlink the mandatory one
  - don't create symlinks for systemd units (systemctl preset-all does
    it for us now)
  - expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                               |  3 ++
 package/linux-tools/Config.in            | 37 +++++++++++++
 package/linux-tools/S10hyperv            | 66 ++++++++++++++++++++++++
 package/linux-tools/hypervfcopyd.service | 11 ++++
 package/linux-tools/hypervkvpd.service   | 11 ++++
 package/linux-tools/hypervvssd.service   | 11 ++++
 package/linux-tools/linux-tool-hv.mk.in  | 61 ++++++++++++++++++++++
 7 files changed, 200 insertions(+)
 create mode 100644 package/linux-tools/S10hyperv
 create mode 100644 package/linux-tools/hypervfcopyd.service
 create mode 100644 package/linux-tools/hypervkvpd.service
 create mode 100644 package/linux-tools/hypervvssd.service
 create mode 100644 package/linux-tools/linux-tool-hv.mk.in

diff --git a/DEVELOPERS b/DEVELOPERS
index 90941dd4c8..63e6981570 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1861,6 +1861,9 @@ F:	package/scrypt/
 
 N:	Pascal de Bruijn <p.debruijn@unilogic.nl>
 F:	package/libargon2/
+F:	package/linux-tools/S10hyperv
+F:	package/linux-tools/hyperv*.service
+F:	package/linux-tools/linux-tool-hv.mk.in
 
 N:	Pascal Huerst <pascal.huerst@gmail.com>
 F:	package/google-breakpad/
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ab8cc3891c..0936ce31b4 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -116,4 +116,41 @@ config BR2_PACKAGE_LINUX_TOOLS_TMON
 	  tmon is a terminal-based tool (using curses) that allows the
 	  user to access thermal information about the system.
 
+config BR2_PACKAGE_LINUX_TOOLS_HV
+	bool "hv"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_LINUX_TOOLS
+	select BR2_PACKAGE_LINUX_TOOLS_HV_KVP_DAEMON if !BR2_PACKAGE_LINUX_TOOLS_HV_HAS_ONE
+	help
+	  Microsoft HyperV integration services
+
+	  Relevant kernel configuration options: HYPERV, HYPERV_UTILS
+
+if BR2_PACKAGE_LINUX_TOOLS_HV
+
+config BR2_PACKAGE_LINUX_TOOLS_HV_HAS_ONE
+	bool
+
+config BR2_PACKAGE_LINUX_TOOLS_HV_KVP_DAEMON
+	bool "hypervkvpd (hv_kvp_daemon)"
+	help
+	  HyperV uses hypervkvpd (Key/Value Pair daemon) to retrieve
+	  status information from your virtualized guest OS
+
+config BR2_PACKAGE_LINUX_TOOLS_HV_FCOPY_DAEMON
+	bool "hypervfcopyd (hv_fcopy_daemon)"
+	select BR2_PACKAGE_LINUX_TOOLS_HV_HAS_ONE
+	help
+	  HyperV uses hypervfcopyd (File Copy daemon) to easily transfer
+	  files to and from your virtualized guest OS
+
+config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
+	bool "hypervvssd (hv_vss_daemon)"
+	select BR2_PACKAGE_LINUX_TOOLS_HV_HAS_ONE
+	help
+	  HyperV uses hypervvssd (Volume Snapshot Service daemon) to
+	  freeze your filesystems during snapshots and backups
+
+endif # BR2_PACKAGE_LINUX_TOOLS_HV
+
 endmenu
diff --git a/package/linux-tools/S10hyperv b/package/linux-tools/S10hyperv
new file mode 100644
index 0000000000..ec934bc972
--- /dev/null
+++ b/package/linux-tools/S10hyperv
@@ -0,0 +1,66 @@
+#!/bin/sh
+
+PROGS="@PROGS@"
+PIDDIR="/var/run"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/hyperv" ] && . "/etc/default/hyperv"
+
+start_one() {
+	printf 'Starting %s: ' "$1"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDDIR/$1.pid" -x "/sbin/$1" -- -n
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return $status
+}
+
+start() {
+	# shellcheck disable=SC2086 # we need the word splitting
+	for prog in ${PROGS}; do
+		start_one "${prog}" || ret=$?
+	done
+    return $ret
+}
+
+stop_one() {
+	printf 'Stopping %s: ' "$1"
+	start-stop-daemon -K -q -p "$PIDDIR/$1.pid"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDDIR/$1.pid"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return $status
+}
+
+stop() {
+	# shellcheck disable=SC2086 # we need the word splitting
+	for prog in ${PROGS}; do
+		stop_one "${prog}" || ret=$?
+	done
+    return $ret
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
diff --git a/package/linux-tools/hypervfcopyd.service b/package/linux-tools/hypervfcopyd.service
new file mode 100644
index 0000000000..c43fc1bc8e
--- /dev/null
+++ b/package/linux-tools/hypervfcopyd.service
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
diff --git a/package/linux-tools/hypervkvpd.service b/package/linux-tools/hypervkvpd.service
new file mode 100644
index 0000000000..6ed630278c
--- /dev/null
+++ b/package/linux-tools/hypervkvpd.service
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
diff --git a/package/linux-tools/hypervvssd.service b/package/linux-tools/hypervvssd.service
new file mode 100644
index 0000000000..3fd80029c7
--- /dev/null
+++ b/package/linux-tools/hypervvssd.service
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
diff --git a/package/linux-tools/linux-tool-hv.mk.in b/package/linux-tools/linux-tool-hv.mk.in
new file mode 100644
index 0000000000..6996c55271
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv.mk.in
@@ -0,0 +1,61 @@
+################################################################################
+#
+# hv_fcopy_daemon
+#
+################################################################################
+
+LINUX_TOOLS += hv
+
+# The programs to build, as known by the kernel:
+HV_PROGS_$(BR2_PACKAGE_LINUX_TOOLS_HV_KVP_DAEMON) += hv_kvp_daemon
+HV_PROGS_$(BR2_PACKAGE_LINUX_TOOLS_HV_FCOPY_DAEMON) += hv_fcopy_daemon
+HV_PROGS_$(BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON) += hv_vss_daemon
+
+# Give each tools the name most distros install them as:
+HV_hv_kvp_daemon = hypervkvpd
+HV_hv_fcopy_daemon = hypervfcopyd
+HV_hv_vss_daemon = hypervvssd
+
+HV_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+
+define HV_BUILD_CMDS
+	$(Q)for prog in $(HV_PROGS_y); do \
+		if test ! -f $(LINUX_DIR)/tools/hv/$${prog}.c ; then \
+			printf "Your kernel version is too old and does not have the HyperV %s tool." "$${prog}" ; \
+			exit 1 ; \
+		fi; \
+	done
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+		$(HV_MAKE_OPTS) \
+		$(HV_PROGS_y)
+endef
+
+ifeq ($(BR2_PACKAGE_LINUX_TOOLS_HV_KVP_DAEMON),y)
+define HV_KVP_HELPER
+	@mkdir -p $(TARGET_DIR)/usr/libexec/hypervkvpd
+	$(Q)ln -sf /bin/true $(TARGET_DIR)/usr/libexec/hypervkvpd/hv_set_ifconfig
+endef
+endif
+
+define HV_INSTALL_TARGET_CMDS
+	$(foreach prog,$(HV_PROGS_y), \
+		$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/$(prog) \
+			$(TARGET_DIR)/usr/sbin/$(HV_$(prog))
+	)
+	$(HV_KVP_HELPER)
+endef
+
+define HV_INSTALL_INIT_SYSTEMD
+	$(foreach prog,$(HV_PROGS_y), \
+		$(INSTALL) -m 0644 -D package/linux-tools/$(HV_$(prog)).service \
+			$(TARGET_DIR)/usr/lib/systemd/system/$(HV_$(prog)).service
+	)
+endef
+
+define HV_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/linux-tools/S10hyperv \
+		$(TARGET_DIR)/etc/init.d/S10hyperv
+	$(SED) 's/@PROGS@/$(foreach prog,$(HV_PROGS_y),$(HV_$(prog)))/' \
+		$(TARGET_DIR)/etc/init.d/S10hyperv
+endef
-- 
2.20.1
