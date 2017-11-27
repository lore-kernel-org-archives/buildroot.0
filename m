From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 27 Nov 2017 08:41:31 -0200
Subject: [Buildroot] [PATCH 3/3] libvirt: new package
In-Reply-To: <20171127104131.27975-1-casantos@datacom.ind.br>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
Message-ID: <20171127104131.27975-4-casantos@datacom.ind.br>
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

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
History:
v1: primitive package, for experimental purposes only
v1->v2:
  - Clarify dependence on !BR2_TOOLCHAIN_USES_MUSL
  - Add run-time dependence dnsmask
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
---
 package/Config.in                |   1 +
 package/libvirt/Config.in        |  44 ++++++++
 package/libvirt/S30devkvmperms   |  28 +++++
 package/libvirt/S90libvirt       | 139 +++++++++++++++++++++++
 package/libvirt/device_table.txt |  39 +++++++
 package/libvirt/libvirt.hash     |   2 +
 package/libvirt/libvirt.mk       | 233 +++++++++++++++++++++++++++++++++++++++
 7 files changed, 486 insertions(+)
 create mode 100644 package/libvirt/Config.in
 create mode 100755 package/libvirt/S30devkvmperms
 create mode 100644 package/libvirt/S90libvirt
 create mode 100644 package/libvirt/device_table.txt
 create mode 100644 package/libvirt/libvirt.hash
 create mode 100644 package/libvirt/libvirt.mk

diff --git a/package/Config.in b/package/Config.in
index cdfb90151a..1c040f0e1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1925,6 +1925,7 @@ menu "System tools"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
+	source "package/libvirt/Config.in"
 	source "package/lxc/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
new file mode 100644
index 0000000000..8e64c85188
--- /dev/null
+++ b/package/libvirt/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_LIBVIRT
+	bool "libvirt"
+	depends on !BR2_PACKAGE_NETCAT
+	depends on !BR2_STATIC_LIBS # libnl, lvm2
+	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, libtirpc
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# configure: You must install the pciaccess module to build with udev
+	select BR2_PACKAGE_LIBPCIACCESS if BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LVM2
+	# use netcf, if possible, when udev is not available
+	select BR2_PACKAGE_NETCF if !BR2_PACKAGE_HAS_UDEV && !BR2_arc && BR2_USE_WCHAR
+	select BR2_PACKAGE_YAJL
+	# run-time dependencies
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_DMIDECODE
+	select BR2_PACKAGE_DNSMASQ
+	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_IPROUTE2
+	select BR2_PACKAGE_RADVD
+	# These are required because there is no way to unequivocally select a modern netcat
+	select BR2_PACKAGE_NMAP      if !BR2_PACKAGE_NETCAT_OPENBSD
+	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT_OPENBSD
+	help
+	  Libvirt is collection of software that provides a convenient
+	  way to manage virtual machines and other virtualization
+	  functionality, such as storage and network interface
+	  management. These software pieces include an API library, a
+	  daemon (libvirtd), and a command line utility (virsh).
+
+	  http://libvirt.org/
+
+comment "libvirt needs 'nmap-ncat' or 'netcat-openbsd' but netcat is selected"
+	depends on BR2_PACKAGE_NETCAT
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+
+comment "libvirt needs a glibc or uClibc toolchain w/ threads, dynamic library"
+        depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL || !BR2_USE_MMU || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libvirt/S30devkvmperms b/package/libvirt/S30devkvmperms
new file mode 100755
index 0000000000..8953256a03
--- /dev/null
+++ b/package/libvirt/S30devkvmperms
@@ -0,0 +1,28 @@
+#!/bin/sh
+#
+# Set the permissions of /dev/kvm
+#
+
+start() {
+	printf "Setting the ownership and permissions of /dev/kvm: "
+	chown qemu:kvm /dev/kvm && chmod 660 /dev/kvm \
+	&& echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Restoring the ownership and permissions of /dev/kvm: "
+	chown root:root /dev/kvm && chmod 600 /dev/kvm \
+	&& echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+  start|restart|reload)
+      start
+	;;
+  stop)
+      stop
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
diff --git a/package/libvirt/S90libvirt b/package/libvirt/S90libvirt
new file mode 100644
index 0000000000..8ff43b4539
--- /dev/null
+++ b/package/libvirt/S90libvirt
@@ -0,0 +1,139 @@
+#!/bin/sh
+
+my_name="$0"
+
+check_required_files() {
+	[ -x "$1" ] || {
+		echo "$my_name: $1 is missing"
+		exit 1
+	}
+	[ -z "$2" ] || [ -f "$2" ] || {
+		echo "$my_name: $2 is missing"
+		exit 1
+	}
+}
+
+rm_stale_pidfile() {
+	if [ -e "$1" ]; then
+		exe="/proc/$(cat "$1")/exe"
+		{ [ -s "$exe" ] && [ "$(readlink -f "$exe")" = "$2" ]; } || rm -f "$1"
+	fi
+}
+
+start_virtlockd() {
+	printf "Starting virtlockd: "
+	rm_stale_pidfile /var/run/virtlockd.pid /usr/sbin/virtlockd
+	[ ! -e /var/run/virtlockd.pid ] \
+	&& start-stop-daemon -S -q -p /var/run/virtlockd.pid -x /usr/sbin/virtlockd -- -d \
+	&& echo "OK" || echo "FAIL"
+}
+
+start_virtlogd() {
+	printf "Starting virtlogd: "
+	rm_stale_pidfile /var/run/virtlogd.pid /usr/sbin/virtlogd
+	[ ! -e /var/run/virtlogd.pid ] \
+	&& start-stop-daemon -S -q -p /var/run/virtlogd.pid -x /usr/sbin/virtlogd -- -d \
+	&& echo "OK" || echo "FAIL"
+}
+
+start_libvirtd() {
+	printf "Starting libvirtd: "
+	rm_stale_pidfile /var/run/libvirtd.pid /usr/sbin/libvirtd
+	rm_stale_pidfile /var/run/libvirt/network/default.pid /usr/sbin/dnsmasq
+	[ ! -e /var/run/libvirtd.pid ] && [ -e /var/run/libvirt/network/default.pid ] \
+	&& start-stop-daemon -K -q -p /var/run/libvirt/network/default.pid -x /usr/sbin/dnsmasq
+	[ ! -e /var/run/libvirtd.pid ] \
+	&& start-stop-daemon -S -q -p /var/run/libvirtd.pid -x /usr/sbin/libvirtd -- -d \
+	&& echo "OK" || echo "FAIL"
+}
+
+start_libvirt() {
+	start_virtlockd
+	start_virtlogd
+	start_libvirtd
+}
+
+stop_libvirtd() {
+	printf "Stopping libvirtd: "
+	start-stop-daemon -K -q -p /var/run/libvirtd.pid -x /usr/sbin/libvirtd \
+	&& start-stop-daemon -K -q -p /var/run/libvirt/network/default.pid -x /usr/sbin/dnsmasq \
+	&& echo "OK" || echo "FAIL"
+	rm_stale_pidfile /var/run/libvirtd.pid /usr/sbin/libvirtd
+	rm_stale_pidfile /var/run/libvirt/network/default.pid /usr/sbin/dnsmasq
+}
+
+stop_virtlogd() {
+	printf "Stopping virtlogd: "
+	start-stop-daemon -K -q -p /var/run/virtlogd.pid -x /usr/sbin/virtlogd \
+	&& echo "OK" || echo "FAIL"
+	rm_stale_pidfile /var/run/virtlogd.pid /usr/sbin/virtlogd
+}
+
+stop_virtlockd() {
+	printf "Stopping virtlockd: "
+	start-stop-daemon -K -q -p /var/run/virtlockd.pid -x /usr/sbin/virtlockd \
+	&& echo "OK" || echo "FAIL"
+	rm_stale_pidfile /var/run/virtlockd.pid /usr/sbin/virtlockd
+}
+
+stop_libvirt() {
+	stop_libvirtd
+	stop_virtlogd
+	stop_virtlockd
+}
+
+reload_virtlockd() {
+	printf "Reloading virtlockd: "
+	rm_stale_pidfile /var/run/virtlockd.pid /usr/sbin/virtlockd
+	[ -e /var/run/virtlockd.pid ] \
+	&& start-stop-daemon -K -s USR1 -q -p /var/run/virtlockd.pid -x /usr/sbin/virtlockd \
+	&& echo "OK" || echo "FAIL"
+}
+
+reload_virtlogd() {
+	printf "Reloading virtlogd: "
+	rm_stale_pidfile /var/run/virtlogd.pid /usr/sbin/virtlogd
+	[ -e /var/run/virtlogd.pid ] \
+	&& start-stop-daemon -K -s USR1 -q -p /var/run/virtlogd.pid -x /usr/sbin/virtlogd \
+	&& echo "OK" || echo "FAIL"
+}
+
+reload_libvirtd() {
+	printf "Reloading libvirtd: "
+	rm_stale_pidfile /var/run/libvirtd.pid /usr/sbin/libvirtd
+	[ -e /var/run/libvirtd.pid ] \
+	&& start-stop-daemon -K -s HUP -q -p /var/run/libvirtd.pid -x /usr/sbin/libvirtd \
+	&& echo "OK" || echo "FAIL"
+}
+
+reload_libvirt() {
+	reload_virtlockd
+	reload_virtlogd
+	reload_libvirtd
+}
+
+check_required_files /usr/sbin/virtlockd /etc/libvirt/virtlockd.conf
+check_required_files /usr/sbin/virtlogd /etc/libvirt/virtlogd.conf
+check_required_files /usr/sbin/libvirtd /etc/libvirt/libvirtd.conf
+check_required_files /usr/sbin/dnsmasq
+
+case "$1" in
+	start)
+		start_libvirt
+		;;
+	stop)
+		stop_libvirt
+		;;
+	restart)
+		stop_libvirt
+		start_libvirt
+		;;
+	reload)
+		reload_libvirt
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
+
+exit 0
diff --git a/package/libvirt/device_table.txt b/package/libvirt/device_table.txt
new file mode 100644
index 0000000000..a0f155ef24
--- /dev/null
+++ b/package/libvirt/device_table.txt
@@ -0,0 +1,39 @@
+# See package/makedevs/README for details
+#
+# Libvirt directories ownership and permissions
+#
+# <name>				<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+/etc/libvirt				d	700	0	0	-	-	-	-	-
+/etc/libvirt/nwfilter			d	700	0	0	-	-	-	-	-
+/etc/libvirt/qemu			d	700	0	0	-	-	-	-	-
+/etc/libvirt/qemu/autostart		d	700	0	0	-	-	-	-	-
+/etc/libvirt/qemu/networks		d	700	0	0	-	-	-	-	-
+/etc/libvirt/qemu/networks/autostart	d	700	0	0	-	-	-	-	-
+/etc/libvirt/storage			d	755	0	0	-	-	-	-	-
+/etc/libvirt/storage/autostart		d	755	0	0	-	-	-	-	-
+/run/libvirt				d	755	0	0	-	-	-	-	-
+/run/libvirt/hostdevmgr			d	755	0	0	-	-	-	-	-
+/run/libvirt/network			d	755	0	0	-	-	-	-	-
+/run/libvirt/qemu			d	755	0	0	-	-	-	-	-
+/run/libvirt/storage			d	755	0	0	-	-	-	-	-
+/var/lib/libvirt			d	755	0	0	-	-	-	-	-
+/var/lib/libvirt/boot			d	711	0	0	-	-	-	-	-
+/var/lib/libvirt/dnsmasq		d	755	0	0	-	-	-	-	-
+/var/lib/libvirt/filesystems		d	711	0	0	-	-	-	-	-
+/var/lib/libvirt/images			d	711	0	0	-	-	-	-	-
+/var/lib/libvirt/network		d	700	0	0	-	-	-	-	-
+/var/lib/libvirt/qemu			d	751	107	36	-	-	-	-	-
+/var/lib/libvirt/qemu/channel		d	755	107	36	-	-	-	-	-
+/var/lib/libvirt/qemu/channel/target	d	755	107	36	-	-	-	-	-
+/var/lib/libvirt/qemu/dump		d	755	107	36	-	-	-	-	-
+/var/lib/libvirt/qemu/nvram		d	755	107	36	-	-	-	-	-
+/var/lib/libvirt/qemu/save		d	755	107	36	-	-	-	-	-
+/var/lib/libvirt/qemu/snapshot		d	755	107	36	-	-	-	-	-
+# These are lost if /var/cache and/or /var/log are mounted on a tmpfs but they are harmless, anyway
+/var/cache/libvirt			d	711	0	0	-	-	-	-	-
+/var/cache/libvirt/lxc			d	750	0	0	-	-	-	-	-
+/var/cache/libvirt/qemu			d	750	107	36	-	-	-	-	-
+/var/cache/libvirt/qemu/capabilities	d	755	0	0	-	-	-	-	-
+/var/log/libvirt			d	700	0	0	-	-	-	-	-
+/var/log/libvirt/lxc			d	750	0	0	-	-	-	-	-
+/var/log/libvirt/qemu			d	750	107	36	-	-	-	-	-
diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
new file mode 100644
index 0000000000..389a3c1670
--- /dev/null
+++ b/package/libvirt/libvirt.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 4e7bcb209eeef99f026484293abc733e30ed06dabcdde62c4c3e95f71b2b67ba  libvirt-3.7.0.tar.xz
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
new file mode 100644
index 0000000000..8d26869a06
--- /dev/null
+++ b/package/libvirt/libvirt.mk
@@ -0,0 +1,233 @@
+################################################################################
+#
+# libvirt
+#
+################################################################################
+
+LIBVIRT_VERSION = 3.7.0
+LIBVIRT_SITE = http://libvirt.org/sources
+LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
+LIBVIRT_LICENSE = LGPL-2.1+
+LIBVIRT_LICENSE_FILES = COPYING
+LIBVIRT_DEPENDENCIES = libnl libxml2 lvm2 yajl
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LIBVIRT_DEPENDENCIES += libtirpc
+LIBVIRT_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
+endif
+
+LIBVIRT_CONF_OPTS = \
+	--disable-debug \
+	--with-init-script=$(if $(BR2_INIT_SYSTEMD),systemd,none) \
+	--with-macvtap \
+	--with-qemu-user=qemu \
+	--with-qemu-group=kvm \
+	--with-remote \
+	--with-uml \
+	--with-virtualport \
+	--without-apparmor \
+	--without-bhyve \
+	--without-dtrace \
+	--without-esx \
+	--without-firewalld \
+	--without-glusterfs \
+	--without-hal \
+	--without-hyperv \
+	--without-libxl \
+	--without-numad \
+	--without-openwsman \
+	--without-phyp \
+	--without-pm-utils \
+	--without-sanlock \
+	--without-sasl \
+	--without-test-suite \
+	--without-vmware \
+	--without-vbox \
+	--without-vz \
+	--without-wireshark-dissector \
+	--without-xen
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
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+LIBVIRT_CONF_OPTS += --with-avahi
+LIBVIRT_DEPENDENCIES += avahi
+else
+LIBVIRT_CONF_OPTS += --without-avahi
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
+# do not enable openssl and gnutls at the same time.
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBVIRT_CONF_OPTS += --with-openssl --without-gnutls
+LIBVIRT_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBVIRT_CONF_OPTS += --with-gnutls --without-openssl
+LIBVIRT_DEPENDENCIES += gnutls
+else
+LIBVIRT_CONF_OPTS += --without-openssl --without-gnutls
+endif
+
+# configure needs some help to find pcap-config at $(STAGING_DIR)/usr/bin
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+LIBVIRT_CONF_OPTS += --with-libpcap=$(STAGING_DIR)/usr
+LIBVIRT_DEPENDENCIES += libpcap
+else
+LIBVIRT_CONF_OPTS += --without-libpcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSSH),y)
+LIBVIRT_CONF_OPTS += --with-libssh
+LIBVIRT_DEPENDENCIES += libssh
+else
+LIBVIRT_CONF_OPTS += --without-libssh
+endif
+
+ifeq ($(BR2_PACKAGE_LXC),y)
+LIBVIRT_CONF_OPTS += --with-lxc
+LIBVIRT_DEPENDENCIES += lxc
+else
+LIBVIRT_CONF_OPTS += --without-lxc
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
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
+ifeq ($(BR2_PACKAGE_READLINE),y)
+LIBVIRT_CONF_OPTS += --with-readline
+LIBVIRT_DEPENDENCIES += readline
+else
+LIBVIRT_CONF_OPTS += --without-readline
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LIBVIRT_CONF_OPTS += --with-selinux
+LIBVIRT_DEPENDENCIES += libselinux
+else
+LIBVIRT_CONF_OPTS += --without-selinux --with-selinux-mount=/sys/fs/selinux
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSSH2),y)
+LIBVIRT_CONF_OPTS += --with-ssh2
+LIBVIRT_DEPENDENCIES += libssh2
+else
+LIBVIRT_CONF_OPTS += --without-ssh2
+endif
+
+# the interface driver requires either udev or netcf
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBVIRT_CONF_OPTS += --with-udev --without-netcf --with-interface
+LIBVIRT_DEPENDENCIES += udev
+define LIBVIRT_INSTALL_UDEV_RULES
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/udev/rules.d
+	echo 'KERNEL=="kvm", OWNER="root", GROUP="kvm", MODE="0660"' > \
+		$(TARGET_DIR)/etc/udev/rules.d/90-kvm.rules
+endef
+LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_INSTALL_UDEV_RULES
+LIBVIRT_INIT_DEV_KVM_PERMS =
+else
+# No udev, so we need an init script to set the permissions of /dev/kvm.
+LIBVIRT_INIT_DEV_KVM_PERMS = package/libvirt/S30devkvmperms
+ifeq ($(BR2_PACKAGE_NETCF),y)
+LIBVIRT_CONF_OPTS += --with-netcf --without-udev --with-interface
+LIBVIRT_DEPENDENCIES += netcf
+else
+LIBVIRT_CONF_OPTS += --without-udev --without-netcf --without-interface
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIRT),y)
+BR2_ROOTFS_DEVICE_TABLE += package/libvirt/device_table.txt
+endif
+
+define LIBVIRT_USERS
+	qemu 107 kvm 36 * - - - Libvirt qemu/kvm daemon
+endef
+
+define LIBVIRT_SET_USER_GROUP
+	sed -i -e 's/^#user = "root"/user = "qemu"/;s/^#group = "root"/group = "kvm"/' \
+		$(TARGET_DIR)/etc/libvirt/qemu.conf
+endef
+
+LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_SET_USER_GROUP
+
+# S90, to start after S40network, S50radvd and S80dnsmasq
+define LIBVIRT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 -t $(TARGET_DIR)/etc/init.d \
+		$(LIBVIRT_INIT_DEV_KVM_PERMS) package/libvirt/S90libvirt
+endef
+
+$(eval $(autotools-package))
-- 
2.14.3
