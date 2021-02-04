From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Thu,  4 Feb 2021 08:56:57 -0600
Subject: [Buildroot] [PATCH v8 2/3] package/libvirt: add daemon libvirtd
In-Reply-To: <20210204145658.22974-1-jared.bents@rockwellcollins.com>
References: <20210204145658.22974-1-jared.bents@rockwellcollins.com>
Message-ID: <20210204145658.22974-2-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to add the libvirtd daemon for libvirt

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

--
History:
v8:
  - Split off from patch adding libvirt
---
 package/libvirt/Config.in   |  20 ++++++
 package/libvirt/S91virtlogd |  65 ++++++++++++++++++
 package/libvirt/S92libvirtd | 132 ++++++++++++++++++++++++++++++++++++
 package/libvirt/libvirt.mk  |  49 +++++++++++--
 4 files changed, 260 insertions(+), 6 deletions(-)
 create mode 100644 package/libvirt/S91virtlogd
 create mode 100644 package/libvirt/S92libvirtd

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index f7999fea88..ae5c8aac8a 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -24,6 +24,26 @@ config BR2_PACKAGE_LIBVIRT
 
 	  https://libvirt.org/
 
+if BR2_PACKAGE_LIBVIRT
+
+config BR2_PACKAGE_LIBVIRT_DAEMON
+	bool "libvirtd"
+	default y
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_DNSMASQ
+	select BR2_PACKAGE_EBTABLES
+	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_IPROUTE2
+	# These are required because there is no way to unequivocally select a modern netcat
+	select BR2_PACKAGE_NMAP      if !BR2_PACKAGE_NETCAT_OPENBSD
+	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT_OPENBSD
+	select BR2_PACKAGE_RADVD
+	help
+	  Build the libvirt daemon (libvirtd) otherwise build only the
+	  utility programs.
+
+endif
+
 comment "libvirt needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
diff --git a/package/libvirt/S91virtlogd b/package/libvirt/S91virtlogd
new file mode 100644
index 0000000000..03d17b5dbd
--- /dev/null
+++ b/package/libvirt/S91virtlogd
@@ -0,0 +1,65 @@
+#!/bin/sh
+
+DAEMON="virtlogd"
+EXECFILE="/usr/sbin/$DAEMON"
+PIDFILE="/var/run/$DAEMON.pid"
+
+VIRTLOGD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "$EXECFILE" \
+		-- -d $VIRTLOGD_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE" -x "$EXECFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
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
+# On receipt of SIGUSR1 virtlogd will re-exec() its binary, while maintaining
+# all current logs and clients. This allows for live upgrades of the virtlogd
+# service.
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s USR1 -q -p "$PIDFILE" -x "$EXECFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/libvirt/S92libvirtd b/package/libvirt/S92libvirtd
new file mode 100644
index 0000000000..736519f3d0
--- /dev/null
+++ b/package/libvirt/S92libvirtd
@@ -0,0 +1,132 @@
+#!/bin/sh
+
+DAEMON="libvirtd"
+EXECFILE="/usr/sbin/$DAEMON"
+PIDFILE="/var/run/$DAEMON.pid"
+
+LIBVIRTD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+trap 'rm -f "$TMP_MODULE_LIST" "$TMP_PIDFILE_LIST"' EXIT
+
+is_alive() {
+	[ -e "$1" ] \
+	&& exe="/proc/$(cat "$1" 2>/dev/null)/exe" \
+	&& [ -s "$exe" ] \
+	&& [ "$(readlink -f "$exe")" = "$2" ]
+}
+
+load_modules() {
+	printf 'Loading kernel modules: '
+	kver="$(uname -r)"
+	TMP_MODULE_LIST="$(mktemp -q)" || {
+		echo 'FAIL creating temporary modules list'
+		exit 1
+	}
+	[ -d "/lib/modules/$kver/kernel/drivers/net" ] && \
+		find "/lib/modules/$kver/kernel/drivers/net" \
+		-name "tun.ko*" >> "$TMP_MODULE_LIST"
+	[ -d "/lib/modules/$kver/kernel/drivers/vhost" ] && \
+		find "/lib/modules/$kver/kernel/drivers/vhost" \
+		-name "vhost?net.ko*" >> "$TMP_MODULE_LIST"
+	[ -d "/lib/modules/$kver/kernel/drivers/net" ] && \
+		find "/lib/modules/$kver/kernel/drivers/vfio" \
+		-name "*.ko*" >> "$TMP_MODULE_LIST"
+	while read -r f; do
+		m="$(basename "${f%.ko*}")"
+		if modprobe -q "$m"; then
+			printf '%s ' "$m"
+		else
+			echo "FAIL on $m"
+			exit 1
+		fi
+	done < "$TMP_MODULE_LIST"
+	echo "OK"
+}
+
+#
+# If libvirtd dies it leves behind one stale dnsmasq per virtual network that
+# must be killed before starting libvirtd again.
+#
+rm_stale_dnsmasq() {
+	[ -d /var/run/libvirt/network ] || return 0
+	TMP_PIDFILE_LIST="$(mktemp -q)" || {
+		echo "Could not create temporary pidfile list"
+		exit 1
+	}
+	find /var/run/libvirt/network -name '*.pid' > "$TMP_PIDFILE_LIST"
+	while read -r pidfile; do
+		if is_alive "$pidfile" /usr/sbin/dnsmasq; then
+			start-stop-daemon -K -q -p "$pidfile" -x /usr/sbin/dnsmasq
+			status=$?
+			if [ "$status" -ne 0 ]; then
+				echo "Could not stop stale dnsmasq daemons"
+				exit 1
+			fi
+			rm -f "$pidfile"
+		fi
+	done < "$TMP_PIDFILE_LIST"
+}
+
+start() {
+	if is_alive "$PIDFILE" "$EXECFILE"; then
+		# libvirtd is already running. Leave it alone.
+		printf 'Starting %s: FAIL\n' "$DAEMON"
+		return 1
+	fi
+	rm_stale_dnsmasq
+	load_modules
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "$EXECFILE" \
+		-- -d $LIBVIRTD_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE" -x "$EXECFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm_stale_dnsmasq
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
+# On receipt of SIGHUP libvirtd will reload its configuration.
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "$EXECFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index f249a7906e..8229f9f651 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -24,7 +24,6 @@ LIBVIRT_CONF_OPTS = \
 	-Ddriver_interface=enabled \
 	-Ddriver_libxl=disabled \
 	-Ddriver_lxc=disabled \
-	-Ddriver_network=disabled \
 	-Ddriver_openvz=disabled \
 	-Ddriver_qemu=disabled \
 	-Ddriver_remote=enabled \
@@ -38,19 +37,14 @@ LIBVIRT_CONF_OPTS = \
 	-Dglusterfs=disabled \
 	-Dhost_validate=enabled \
 	-Dinit_script=$(if $(BR2_INIT_SYSTEMD),systemd,none) \
-	-Dlibssh=disabled \
-	-Dlibvirtd=disabled \
 	-Dlogin_shell=disabled \
 	-Dnetcf=disabled \
-	-Dnss=disabled \
 	-Dnumad=disabled \
 	-Dopenwsman=disabled \
 	-Dpciaccess=enabled \
 	-Dpm_utils=disabled \
 	-Dsanlock=disabled \
-	-Dsasl=disabled \
 	-Dsecdriver_apparmor=disabled \
-	-Dssh2=disabled \
 	-Dstorage_mpath=disabled \
 	-Dstorage_iscsi=disabled \
 	-Dstorage_iscsi_direct=disabled \
@@ -122,6 +116,28 @@ else
 LIBVIRT_CONF_OPTS += -Dlibpcap=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBSSH),yy)
+LIBVIRT_CONF_OPTS += -Dlibssh=enabled
+LIBVIRT_DEPENDENCIES += libssh
+else
+LIBVIRT_CONF_OPTS += -Dlibssh=disabled
+endif
+
+# Network is used by daemon, only
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
+LIBVIRT_CONF_OPTS += -Dlibvirtd=enabled -Ddriver_network=enabled
+else
+LIBVIRT_CONF_OPTS += -Dlibvirtd=disabled -Ddriver_network=disabled
+endif
+
+# Can't build nss plugin without network
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBNSS),yy)
+LIBVIRT_CONF_OPTS += -Dnss=enabled
+LIBVIRT_DEPENDENCIES += libnss
+else
+LIBVIRT_CONF_OPTS += -Dnss=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 LIBVIRT_CONF_OPTS += -Dnumactl=enabled
 LIBVIRT_DEPENDENCIES += numactl
@@ -143,6 +159,13 @@ else
 LIBVIRT_CONF_OPTS += -Dreadline=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBGSASL),yy)
+LIBVIRT_CONF_OPTS += -Dsasl=enabled
+LIBVIRT_DEPENDENCIES += libgsasl
+else
+LIBVIRT_CONF_OPTS += -Dsasl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LIBVIRT_CONF_OPTS += -Dselinux=enabled -Dsecdriver_selinux=enabled \
 	-Dselinux_mount=/sys/fs/selinux
@@ -151,6 +174,13 @@ else
 LIBVIRT_CONF_OPTS += -Dselinux=disabled -Dsecdriver_selinux=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBSSH2),yy)
+LIBVIRT_CONF_OPTS += -Dssh2=enabled
+LIBVIRT_DEPENDENCIES += libssh2
+else
+LIBVIRT_CONF_OPTS += -Dssh2=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LVM2),y)
 LIBVIRT_CONF_OPTS += -Dstorage_lvm=enabled
 LIBVIRT_DEPENDENCIES += lvm2
@@ -209,4 +239,11 @@ endef
 
 LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
+define LIBVIRT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/libvirt/S91virtlogd $(TARGET_DIR)/etc/init.d/S91virtlogd
+	$(INSTALL) -D -m 0755 package/libvirt/S92libvirtd $(TARGET_DIR)/etc/init.d/S92libvirtd
+endef
+endif
+
 $(eval $(meson-package))
-- 
2.17.1
