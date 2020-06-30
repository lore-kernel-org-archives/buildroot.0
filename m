From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Tue, 30 Jun 2020 16:16:41 -0500
Subject: [Buildroot] [PATCH v7 1/1] package/libvirt: new package
Message-ID: <20200630211641.16926-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libvirt is collection of software that provides a convenient way to
manage virtual machines and other virtualization functionality, such as
storage and network interface management. These software pieces include
an API library, a daemon (libvirtd), and a command line utility (virsh).

   http://libvirt.org/

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

--
History:
v1: primitive package, for experimental purposes only
v1->v2:
  - Clarify dependence on !BR2_TOOLCHAIN_USES_MUSL
  - Add run-time dependence on dnsmask
  - Add dependence on eudev and libpciaccess when eudev is selected
    (thus detected by configure).
v2->v3:
  - Condition the use of libtirpc to !BR2_TOOLCHAIN_HAS_NATIVE_RPC
  - Check for BR2_PACKAGE_HAS_UDEV instead of BR2_PACKAGE_EUDEV
v3->v4:
  - Fix version history :-).
  - Add optional dependency on several packages (e.g. attr, libpcap),
    depending on wether they are selected or not, and explicitly disable
    features whose required packages are not selected. This is very
    important to prevent selection of features based on leaks from the
    host environment (e.g. finding /usr/bin/numad on the host machine).
  - Enable the "interface" driver if either udev or netcf is available.
  - Disable pm-utils support, since there is no package for Buildroot.
  - Use either openssl or gnutls, if available.
  - Run qemu as user "qemu", group "kvm", not as root.
  - Add a LIBVIRT_USERS variable to create user "qemu" an group "kvm".
  - Add a device table file to set the ownership and permissions of the
    libvirt directories under /etc, /run and /var.
  - If udev is not available, add an init script to set the ownership
    and permissions of /dev/kvm to root:kvm and 0660; otherwise create a
    corresponding /etc/udev/rules.d/90-kvm.rules file.
  - Enable support for systemd, if applicable; otherwise install an init
    script to start/stop/restart libvirtd.
  - Ensure that a modern netcat is available.
v4->v5:
  - Changed SOB, since I don't work for DATACOM anymore.
  - Bump to version 5.8.0.
  - Add hash for license file.
  - Drop OpenSSL options, since it's not supported anymore.
  - Use https to access libvirt.org, since http is always redirected to
    https.
  - Make libvirt daemon optional. If not selected, build only the client
    utilities. Reorganize run-time dependencies accordingly.
  - Load all vfio modules on startup, if they exist, otherwise virtual
    machines that depend on the PCI Passthrough feature fail to load.
    vfio-pci is not enough. Other modules, like vfio_iommu_type1, may be
    necessary.
  - Fix stopping dnsmasq in start/stop script. dnsmasq is not always
    started by libvirtd, so we must chech if it is running before
    attempting to stop it.
  - Move /etc/libvirt/{qemu,secrets,storage} to /var/lib/libvirt. It may
    be necessary to create persistent files (e.g. VM definitions) in
    these directories. Move them to /var/lib because /etc may be on a
    read-only or volatile (initramfs) filesystem. We could tweak the
    code to change these paths but the patch would be large and would
    break compatibility with ordinary installations and with the
    documentation.
  - Prevent an error message if pid file dissappears. start-stop-daemon
    sends a TERM signal to the process but does not wait for its
    termination, so we may reach rm_stale_pidfile while libvirtd.pid
    still exists but execute the cat command when the file is already
    gone, which leads cat to show an error message. We could use the
    '--retry' option to wait for the process termination but it is not
    supported by BusyBox. Let's just send the error messages to
    /dev/null and attempt to remove the file if any command fails, since
    'rm -f' does nothing if the file does not exist.
  - Move device table creation to LIBVIRT_DEVICES instead of using the
    device_table.txt file.
  - Select libseccomp to enable seccomp support in qemu, as required by
    libvirt.
  - Select hwdata (pci.ids). It is required by libvirt to show device
    names when we use virtual machine manager to add hardware via PCI
    passthrough, otherwise only the PCI bus information (slot, port,
    function) is shown.
  - Add systemd support.
  - Restrict to libvirt with udev support. Drop netcf usage, which
    requires a new package and is hard to test. Support for non-udev
    systems will be added later.
  - Remove package/libvirt/S30devkvmperms
  - Fine-tune the configuration and pass host/target executable paths
    in ac_cv_path_* variables via LIBVIRT_CONF_ENV.
  - Use LIBVIRT_PERMISSIONS to set directory permissions.
  - Drop hook to set user/group in /etc/libvirt/qemu.conf, since it's
    not necessary.
  - Pull two upstream patches that fix building with musl.
  - Do not check for executables existence in the startup script.
  - Use separate init scripts for virtlogd and libvirtd. Make them
    compliant to the current pattern (as much as possible).
  - Do not start/stop virtlockd, since it is controlled by libvirtd.
v5->v6:
  - Remove stray '\' in S91virtlogd

Signed-off-by: Carlos Santos <unixmania@gmail.com>

v6->v7:
  - Carlos Santos is no longer contributing to buildroot.
  - Adjusted handling of bash-completion to add dependency if it is
    enabled.
  - Bump to version 6.4.0

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 ...nfigure-remove-build-directory-check.patch |  34 ++
 package/libvirt/90-kvm.rules                  |   1 +
 package/libvirt/Config.in                     | 111 +++++
 package/libvirt/S91virtlogd                   |  65 +++
 package/libvirt/S92libvirtd                   | 132 ++++++
 package/libvirt/libvirt.hash                  |   3 +
 package/libvirt/libvirt.mk                    | 389 ++++++++++++++++++
 9 files changed, 739 insertions(+)
 create mode 100644 package/libvirt/0001-configure-remove-build-directory-check.patch
 create mode 100644 package/libvirt/90-kvm.rules
 create mode 100644 package/libvirt/Config.in
 create mode 100644 package/libvirt/S91virtlogd
 create mode 100644 package/libvirt/S92libvirtd
 create mode 100644 package/libvirt/libvirt.hash
 create mode 100644 package/libvirt/libvirt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3915bba477..3d20e9bed2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1174,6 +1174,9 @@ F:	package/python-pexpect/
 F:	package/python-ptyprocess/
 F:	package/zynq-boot-bin/
 
+N:	Jared Bents <jared.bents@rockwellcollins.com>
+F:	package/libvirt/
+
 N:	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
 F:	package/quota/
 
diff --git a/package/Config.in b/package/Config.in
index 3447dee034..ab61a5faf1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2320,6 +2320,7 @@ menu "System tools"
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
 	source "package/libostree/Config.in"
+	source "package/libvirt/Config.in"
 	source "package/lxc/Config.in"
 	source "package/mender/Config.in"
 	source "package/mender-grubenv/Config.in"
diff --git a/package/libvirt/0001-configure-remove-build-directory-check.patch b/package/libvirt/0001-configure-remove-build-directory-check.patch
new file mode 100644
index 0000000000..60f3c8de02
--- /dev/null
+++ b/package/libvirt/0001-configure-remove-build-directory-check.patch
@@ -0,0 +1,34 @@
+From a9dbda8f59a780d82f65718254ab627bda376e52 Mon Sep 17 00:00:00 2001
+From: Jared Bents <jared.bents@rockwellcollins.com>
+Date: Tue, 30 Jun 2020 13:55:06 -0500
+Subject: [PATCH] configure: remove build directory check
+
+remove build directory location check so that autotools still
+works as this check is for the eventual move to being a meson
+package which libvirt has not moved to yet.
+
+Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
+---
+ configure.ac | 5 -----
+ 1 files changed, 5 deletions(-)
+
+diff --git a/configure b/configure
+index 013e8f5..57dad7f 100755
+--- a/configure
++++ b/configure
+@@ -3413,12 +3413,6 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ 
+ 
+ 
+-if test $srcdir = "."
+-then
+-  as_fn_error $? "Build directory must be different from source directory" "$LINENO" 5
+-fi
+-
+-
+ ac_aux_dir=
+ for ac_dir in build-aux "$srcdir"/build-aux; do
+   if test -f "$ac_dir/install-sh"; then
+-- 
+2.17.1
+
diff --git a/package/libvirt/90-kvm.rules b/package/libvirt/90-kvm.rules
new file mode 100644
index 0000000000..5145c27e79
--- /dev/null
+++ b/package/libvirt/90-kvm.rules
@@ -0,0 +1 @@
+KERNEL=="kvm", OWNER="root", GROUP="kvm", MODE="0660"
diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
new file mode 100644
index 0000000000..2a82c3146d
--- /dev/null
+++ b/package/libvirt/Config.in
@@ -0,0 +1,111 @@
+config BR2_PACKAGE_LIBVIRT
+	bool "libvirt"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_aarch64 || BR2_i386 || BR2_x86_64 # dmidecode
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# configure: You must install the pciaccess module to build with udev
+	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	# run-time dependencies
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_DMIDECODE
+	help
+	  Libvirt is collection of software that provides a convenient
+	  way to manage virtual machines and other virtualization
+	  functionality, such as storage and network interface
+	  management. These software pieces include an API library, a
+	  daemon (libvirtd), and a command line utility (virsh).
+
+	  https://libvirt.org/
+
+if BR2_PACKAGE_LIBVIRT
+
+# The daemon requires remote support.
+config BR2_PACKAGE_LIBVIRT_DAEMON
+	bool "libvirtd"
+	default y
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
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
+# Stateful drivers are useful only when building the daemon.
+if BR2_PACKAGE_LIBVIRT_DAEMON
+
+config BR2_PACKAGE_LIBVIRT_QEMU
+	bool "qemu"
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp->qemu
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12  # libseccomp->qemu
+	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
+	select BR2_PACKAGE_HWDATA         # libpciaccess->qemu
+	select BR2_PACKAGE_HWDATA_PCI_IDS # libpciaccess->qemu
+	select BR2_PACKAGE_LIBSECCOMP
+	select BR2_PACKAGE_QEMU
+	select BR2_PACKAGE_QEMU_SYSTEM if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
+	select BR2_PACKAGE_YAJL
+	help
+	  QEMU/KVM support
+
+comment "qemu is not supported on this architecture"
+	depends on !BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET \
+		|| !BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+
+comment "qemu support needs a toolchain w/ headers >= 3.12"
+	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+config BR2_PACKAGE_LIBVIRT_LXC
+	bool "lxc"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # lxc
+	select BR2_PACKAGE_LXC
+	help
+	  Linux Container support
+
+comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library, gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+endif
+
+comment "libvirtd needs 'nmap-ncat' or 'netcat-openbsd'"
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+
+comment "libvirtd needs 'nmap-ncat' or 'netcat-openbsd' but netcat is selected"
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_NETCAT
+
+endif
+
+comment "libvirt needs udev /dev management"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+comment "libvirt needs a toolchain w/ headers >= 3.12"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_PACKAGE_NETCAT
+	depends on !BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+comment "libvirt needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_PACKAGE_NETCAT
+	depends on BR2_STATIC_LIBS || !BR2_USE_MMU || \
+		!BR2_TOOLCHAIN_HAS_THREADS
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
diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
new file mode 100644
index 0000000000..93104cf5e4
--- /dev/null
+++ b/package/libvirt/libvirt.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 586ebcf220369d08a07c6cc17035e8a91bb3741e4300199459904e9e02478be7  libvirt-6.4.0.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
new file mode 100644
index 0000000000..c7ee5dbed3
--- /dev/null
+++ b/package/libvirt/libvirt.mk
@@ -0,0 +1,389 @@
+################################################################################
+#
+# libvirt
+#
+################################################################################
+
+LIBVIRT_VERSION = 6.4.0
+LIBVIRT_SITE = https://libvirt.org/sources
+LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
+LIBVIRT_LICENSE = LGPL-2.1+
+LIBVIRT_LICENSE_FILES = COPYING
+LIBVIRT_DEPENDENCIES = \
+	host-nfs-utils \
+	host-python-docutils \
+	gnutls \
+	libxml2 \
+	libglib2 \
+	udev
+
+LIBVIRT_CONF_ENV = \
+	ac_cv_path_AUGPARSE=/dev/null \
+	ac_cv_path_BRCTL=/usr/sbin/brctl \
+	ac_cv_path_DMIDECODE=/usr/sbin/dmidecode \
+	ac_cv_path_DMSETUP=/usr/sbin/dmsetup \
+	ac_cv_path_DNSMASQ=/usr/sbin/dnsmasq \
+	ac_cv_path_EBTABLES_PATH=/sbin/ebtables \
+	ac_cv_path_IP_PATH=/sbin/ip \
+	ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
+	ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
+	ac_cv_path_ISCSIADM=/usr/sbin/iscsiadm \
+	ac_cv_path_LVCHANGE=/usr/sbin/lvchange \
+	ac_cv_path_LVCREATE=/usr/sbin/lvcreate \
+	ac_cv_path_LVREMOVE=/usr/sbin/lvremove \
+	ac_cv_path_LVS=/usr/sbin/lvs \
+	ac_cv_path_MKFS=/usr/sbin/mkfs \
+	ac_cv_path_MODPROBE=/sbin/modprobe \
+	ac_cv_path_MOUNT=/bin/mount \
+	ac_cv_path_PARTED=/usr/sbin/parted \
+	ac_cv_path_PKCHECK_PATH=/usr/bin/pkcheck \
+	ac_cv_path_PVCREATE=/usr/sbin/pvcreate \
+	ac_cv_path_PVREMOVE=/usr/sbin/pvremove \
+	ac_cv_path_PVS=/usr/sbin/pvs \
+	ac_cv_path_RADVD=/usr/sbin/radvd \
+	ac_cv_path_RPCGEN=$(HOST_DIR)/bin/rpcgen \
+	ac_cv_path_SHOWMOUNT=/usr/sbin/showmount \
+	ac_cv_path_TC=/sbin/tc \
+	ac_cv_path_UDEVADM=/sbin/udevadm \
+	ac_cv_path_UMOUNT=/bin/umount \
+	ac_cv_path_VGCHANGE=/usr/sbin/vgchange \
+	ac_cv_path_VGCREATE=/usr/sbin/vgcreate \
+	ac_cv_path_VGREMOVE=/usr/sbin/vgremove \
+	ac_cv_path_VGS=/usr/sbin/vgs \
+	ac_cv_path_VGSCAN=/usr/sbin/vgscan \
+	ac_cv_path_XMLCATLOG=$(HOST_DIR)/bin/xmlcatalog \
+	ac_cv_path_XMLLINT=$(HOST_DIR)/bin/xmllint \
+	as_ln_s="ln -s"
+
+LIBVIRT_CONF_OPTS = \
+	--disable-rpath \
+	--without-apparmor \
+	--without-bhyve \
+	--without-dtrace \
+	--without-esx \
+	--without-firewalld \
+	--without-firewalld-zone \
+	--without-glusterfs \
+	--without-hal \
+	--with-host-validate \
+	--without-hyperv \
+	--with-init-script=$(if $(BR2_INIT_SYSTEMD),systemd,none) \
+	--with-interface \
+	--without-libxl \
+	--without-login-shell \
+	--without-netcf \
+	--without-numad \
+	--without-openwsman \
+	--without-openvz \
+	--without-phyp \
+	--without-pm-utils \
+	--with-remote \
+	--without-sanlock \
+	--without-secdriver-apparmor \
+	--with-secrets \
+	--without-storage-mpath \
+	--without-storage-iscsi \
+	--without-storage-iscsi-direct \
+	--with-sysctl \
+	--without-test-suite \
+	--with-udev \
+	--without-vmware \
+	--without-vbox \
+	--without-vz \
+	--without-wireshark-dissector
+
+ifeq ($(BR2_PACKAGE_ATTR),y)
+LIBVIRT_CONF_OPTS += --with-attr
+LIBVIRT_DEPENDENCIES += attr
+else
+LIBVIRT_CONF_OPTS += --without-attr
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+LIBVIRT_CONF_OPTS += --with-audit
+LIBVIRT_DEPENDENCIES += audit
+else
+LIBVIRT_CONF_OPTS += --without-audit
+endif
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LIBVIRT_CONF_OPTS += --with-bash-completion
+LIBVIRT_DEPENDENCIES += bash-completion
+else
+LIBVIRT_CONF_OPTS += --without-bash-completion
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+LIBVIRT_CONF_OPTS += --with-blkid
+LIBVIRT_DEPENDENCIES += util-linux
+else
+LIBVIRT_CONF_OPTS += --without-blkid
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+LIBVIRT_CONF_OPTS += --with-capng
+LIBVIRT_DEPENDENCIES += libcap-ng
+else
+LIBVIRT_CONF_OPTS += --without-capng
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBVIRT_CONF_OPTS += --with-curl
+LIBVIRT_DEPENDENCIES += libcurl
+else
+LIBVIRT_CONF_OPTS += --without-curl
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+LIBVIRT_CONF_OPTS += --with-dbus
+LIBVIRT_DEPENDENCIES += dbus
+else
+LIBVIRT_CONF_OPTS += --without-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+LIBVIRT_CONF_OPTS += --with-fuse
+LIBVIRT_DEPENDENCIES += libfuse
+else
+LIBVIRT_CONF_OPTS += --without-fuse
+endif
+
+ifeq ($(BR2_PACKAGE_LIBISCSI),y)
+LIBVIRT_CONF_OPTS += --with-libiscsi
+LIBVIRT_DEPENDENCIES += libiscsi
+else
+LIBVIRT_CONF_OPTS += --without-libiscsi
+endif
+
+# configure needs some help to find pcap-config@$(STAGING_DIR)/usr/bin
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+LIBVIRT_CONF_OPTS += --with-libpcap=$(STAGING_DIR)/usr
+LIBVIRT_DEPENDENCIES += libpcap
+else
+LIBVIRT_CONF_OPTS += --without-libpcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBSSH),yy)
+LIBVIRT_CONF_OPTS += --with-libssh
+LIBVIRT_DEPENDENCIES += libssh
+else
+LIBVIRT_CONF_OPTS += --without-libssh
+endif
+
+# Network is used by daemon, only
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
+LIBVIRT_CONF_OPTS += --with-libvirtd --with-network
+else
+LIBVIRT_CONF_OPTS += --without-libvirtd --without-network
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIRT_LXC),y)
+LIBVIRT_CONF_OPTS += --with-login-shell --with-lxc
+LIBVIRT_DEPENDENCIES += lxc
+else
+LIBVIRT_CONF_OPTS += --without-login-shell --without-lxc
+endif
+
+# libnl >= 1.1 is required for macvtap support
+# virtualport requires macvtap
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+LIBVIRT_CONF_OPTS += --with-macvtap=yes --with-virtualport
+LIBVIRT_DEPENDENCIES += libnl
+else
+LIBVIRT_CONF_ENV += ac_cv_have_decl_DEVLINK_CMD_ESWITCH_GET=no
+LIBVIRT_CONF_OPTS += --with-macvtap=no --without-virtualport
+endif
+
+# Can't build nss plugin without network
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBNSS),yy)
+LIBVIRT_CONF_OPTS += --with-nss-plugin
+LIBVIRT_DEPENDENCIES += libnss
+else
+LIBVIRT_CONF_OPTS += --without-nss-plugin
+endif
+
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+LIBVIRT_CONF_OPTS += --with-numactl
+LIBVIRT_DEPENDENCIES += numactl
+else
+LIBVIRT_CONF_OPTS += --without-numactl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPCIACCESS),y)
+LIBVIRT_CONF_OPTS += --with-pciaccess
+LIBVIRT_DEPENDENCIES += libpciaccess
+else
+LIBVIRT_CONF_OPTS += --without-pciaccess
+endif
+
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+LIBVIRT_CONF_OPTS += --with-polkit
+LIBVIRT_DEPENDENCIES += polkit
+else
+LIBVIRT_CONF_OPTS += --without-polkit
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
+LIBVIRT_CONF_ENV += \
+	ac_cv_path_QEMU_BRIDGE_HELPER=/usr/libexec/qemu-bridge-helper \
+	ac_cv_path_QEMU_PR_HELPER=/usr/bin/qemu-pr-helper
+LIBVIRT_CONF_OPTS += --with-qemu --with-qemu-user=qemu --with-qemu-group=kvm
+else
+LIBVIRT_CONF_OPTS += --without-qemu --with-qemu-user=no --with-qemu-group=no
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+LIBVIRT_CONF_OPTS += --with-readline
+LIBVIRT_DEPENDENCIES += readline
+else
+LIBVIRT_CONF_OPTS += --without-readline
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBGSASL),yy)
+LIBVIRT_CONF_OPTS += --with-sasl
+LIBVIRT_DEPENDENCIES += libgsasl
+else
+LIBVIRT_CONF_OPTS += --without-sasl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LIBVIRT_CONF_OPTS += --with-selinux --with-secdriver-selinux
+LIBVIRT_DEPENDENCIES += libselinux
+else
+LIBVIRT_CONF_OPTS += --without-selinux --with-selinux-mount=/sys/fs/selinux \
+	--without-secdriver-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LIBVIRT_DEPENDENCIES += libtirpc host-pkgconf
+LIBVIRT_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBSSH2),yy)
+LIBVIRT_CONF_OPTS += --with-ssh2
+LIBVIRT_DEPENDENCIES += libssh2
+else
+LIBVIRT_CONF_OPTS += --without-ssh2
+endif
+
+ifeq ($(BR2_PACKAGE_LVM2),y)
+LIBVIRT_CONF_OPTS += --with-storage-lvm
+LIBVIRT_DEPENDENCIES += lvm2
+else
+LIBVIRT_CONF_OPTS += --without-storage-lvm
+endif
+
+ifeq ($(BR2_PACKAGE_YAJL),y)
+LIBVIRT_CONF_OPTS += --with-yajl
+LIBVIRT_DEPENDENCIES += yajl
+else
+LIBVIRT_CONF_OPTS += --without-yajl
+endif
+
+define LIBVIRT_INSTALL_UDEV_RULES
+	$(INSTALL) -D -m 644 package/libvirt/90-kvm.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/90-kvm.rules
+endef
+LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_INSTALL_UDEV_RULES
+
+define LIBVIRT_FIX_PO_MAKEFILE_IN_IN
+	test ! -f $(@D)/po/Makefile.in.in || \
+	$(SED) 's/GETTEXT_MACRO_VERSION = 0.17/GETTEXT_MACRO_VERSION = @GETTEXT_MACRO_VERSION@/' \
+		$(@D)/po/Makefile.in.in
+endef
+
+LIBVIRT_PRE_PATCH_HOOKS += LIBVIRT_FIX_PO_MAKEFILE_IN_IN
+
+# Adjust diretory ownerships and permissions. Notice /var/log is a symlink to
+# /tmp in the default sysvinit skeleton, so some directories may disappear at
+# run-time. Set the permissions anyway, since they are valid for the default
+# systemd skeleton.
+define LIBVIRT_PERMISSIONS
+	/etc/libvirt                             d  700  root  root  -  -  -  -  -
+	/etc/libvirt/nwfilter                    d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt                         d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/boot                    d  711  root  root  -  -  -  -  -
+	/var/lib/libvirt/dnsmasq                 d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/filesystems             d  711  root  root  -  -  -  -  -
+	/var/lib/libvirt/images                  d  711  root  root  -  -  -  -  -
+	/var/lib/libvirt/network                 d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu                    d  751  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/autostart          d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/networks           d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/networks/autostart d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/channel            d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/channel/target     d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/dump               d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/nvram              d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/save               d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/snapshot           d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/secrets                 d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/storage                 d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/storage/autostart       d  755  root  root  -  -  -  -  -
+	/var/cache/libvirt                       d  711  root  root  -  -  -  -  -
+	/var/cache/libvirt/lxc                   d  750  root  root  -  -  -  -  -
+	/var/cache/libvirt/qemu                  d  750  qemu  kvm   -  -  -  -  -
+	/var/cache/libvirt/qemu/capabilities     d  755  root  root  -  -  -  -  -
+	/var/log/libvirt                         d  700  root  root  -  -  -  -  -
+	/var/log/libvirt/lxc                     d  750  root  root  -  -  -  -  -
+	/var/log/libvirt/qemu                    d  750  root  root  -  -  -  -  -
+	/var/log/swtpm                           d  755  root  root  -  -  -  -  -
+	/var/log/swtpm/libvirt                   d  755  root  root  -  -  -  -  -
+	/var/log/swtpm/libvirt/qemu              d  711  root  root  -  -  -  -  -
+endef
+
+# libvirt may need to create persistent files (e.g. VM definitions) in these
+# directories. Move them to /var/lib because /etc may be on a read-only or
+# volatile (initramfs) filesystem. We could tweak the code to change these
+# paths but the patch would be large and would break compatibility with
+# ordinary installations and with the documentation.
+define LIBVIRT_CREATE_SYMLINKS
+	$(INSTALL) -m 700 -d $(TARGET_DIR)/etc/libvirt
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt
+	$(INSTALL) -m 751 -d $(TARGET_DIR)/var/lib/libvirt/qemu
+	$(INSTALL) -m 700 -d $(TARGET_DIR)/var/lib/libvirt/secrets
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt/storage
+	ln -s -f ../../var/lib/libvirt/qemu $(TARGET_DIR)/etc/libvirt/
+	ln -s -f ../../var/lib/libvirt/secrets $(TARGET_DIR)/etc/libvirt/
+	ln -s -f ../../var/lib/libvirt/storage $(TARGET_DIR)/etc/libvirt/
+endef
+
+LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
+
+# Remove directories that conflict with the default skeleton. They will be
+# created by the daemon at run-time.
+define LIBVIRT_PURGE_TMPDIR
+	rm -rf $(TARGET_DIR)/var/{cache,log,run}/libvirt
+endef
+
+LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_PURGE_TMPDIR
+
+ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
+define LIBVIRT_USERS
+	qemu -1 kvm -1 * - - - Libvirt qemu/kvm daemon
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
+define LIBVIRT_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 755 -t $(TARGET_DIR)/etc/init.d \
+		package/libvirt/S91virtlogd \
+		package/libvirt/S92libvirtd
+endef
+define LIBVIRT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -s -f ../../../../usr/lib/systemd/system/libvirtd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/libvirtd.service
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
+	ln -s -f ../../../../usr/lib/systemd/system/virtlockd.socket \
+		../../../../usr/lib/systemd/system/virtlogd.socket \
+		../../../../usr/lib/systemd/system/libvirtd.socket \
+		../../../../usr/lib/systemd/system/libvirtd-ro.socket \
+		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants
+endef
+endif
+
+$(eval $(autotools-package))
-- 
2.17.1
