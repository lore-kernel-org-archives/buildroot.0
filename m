From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  2 Feb 2018 13:56:12 -0200
Subject: [Buildroot] [PATCH 2/4] tpm2-abrmd: new package
In-Reply-To: <20180202155614.26938-1-casantos@datacom.ind.br>
References: <20180202155614.26938-1-casantos@datacom.ind.br>
Message-ID: <20180202155614.26938-3-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a system daemon implementing the TPM2 access broker (TAB) &
Resource Manager (RM) spec from the TCG. The daemon (tpm2-abrmd) is
implemented using Glib and the GObject system.

Communication between the daemon and clients using the TPM is done with
a combination of DBus and Unix pipes. DBus is used for discovery,
session management and the 'cancel', 'setLocality', and 'getPollHandles'
API calls (mostly these aren't yet implemented). Pipes are used to send
and receive TPM commands and responses (respectively) between client and
server.

The daemon owns the com.intel.tss2.Tabrmd name on dbus. It can be
configured to connect to either the system or the session bus.

The package also provides a client library for interacting with the
daemon via TPM Command Transmission Interface (TCTI). It is intended for
use with the SAPI library (libsapi) like any other TCTI.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/Config.in                         |  1 +
 package/tpm2-abrmd/Config.in              | 26 +++++++++++
 package/tpm2-abrmd/S30devtpmperms         | 37 ++++++++++++++++
 package/tpm2-abrmd/S80tpm2-abrmd          | 74 +++++++++++++++++++++++++++++++
 package/tpm2-abrmd/etc.default.tpm2-abrmd |  1 +
 package/tpm2-abrmd/tpm2-abrmd.hash        |  3 ++
 package/tpm2-abrmd/tpm2-abrmd.mk          | 36 +++++++++++++++
 7 files changed, 178 insertions(+)
 create mode 100644 package/tpm2-abrmd/Config.in
 create mode 100755 package/tpm2-abrmd/S30devtpmperms
 create mode 100755 package/tpm2-abrmd/S80tpm2-abrmd
 create mode 100644 package/tpm2-abrmd/etc.default.tpm2-abrmd
 create mode 100644 package/tpm2-abrmd/tpm2-abrmd.hash
 create mode 100644 package/tpm2-abrmd/tpm2-abrmd.mk

diff --git a/package/Config.in b/package/Config.in
index 2e1a78efa2..c078d14688 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1996,6 +1996,7 @@ menu "System tools"
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
 	source "package/tpm-tools/Config.in"
+	source "package/tpm2-abrmd/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 	source "package/xen/Config.in"
diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
new file mode 100644
index 0000000000..796f9ea7f9
--- /dev/null
+++ b/package/tpm2-abrmd/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_TPM2_ABRMD
+	bool "tpm2-abrmd"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
+	depends on BR2_USE_MMU # dbus, libglib2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_TPM2_TSS
+	help
+	  A system daemon implementing the TPM2 access broker (TAB) &
+	  Resource Manager (RM) spec from the TCG. It should be started
+	  during the OS boot process. Communication between the daemon
+	  and clients using the TPM is done with a combination of DBus
+	  and Unix pipes.
+
+	  The package also provides a client library for interacting
+	  with the daemon via TPM Command Transmission Interface (TCTI).
+	  It is intended for use with the SAPI library (libsapi) like
+	  any other TCTI.
+
+	  https://github.com/tpm2-software/tpm2-abrmd
+
+comment "tpm2-abrmd needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tpm2-abrmd/S30devtpmperms b/package/tpm2-abrmd/S30devtpmperms
new file mode 100755
index 0000000000..5d9c42d182
--- /dev/null
+++ b/package/tpm2-abrmd/S30devtpmperms
@@ -0,0 +1,37 @@
+#!/bin/sh
+#
+# Set the permissions of /dev/tpm[0-9]*
+#
+
+check_device() {
+	ls -1 /dev/tpm[0-9]* > /dev/null 2>&1 || {
+		echo "device driver not loaded, skipping."
+		exit 0
+	}
+}
+
+start() {
+	printf "Setting the ownership and permissions of /dev/tpm: "
+	check_device
+	chown tss:tss /dev/tpm[0-9]* && chmod 600 /dev/tpm* \
+	&& echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Restoring the ownership and permissions of /dev/tpm: "
+	check_device
+	chown root:root /dev/tpm[0-9]* && chmod 600 /dev/tpm \
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
diff --git a/package/tpm2-abrmd/S80tpm2-abrmd b/package/tpm2-abrmd/S80tpm2-abrmd
new file mode 100755
index 0000000000..053bffdb4f
--- /dev/null
+++ b/package/tpm2-abrmd/S80tpm2-abrmd
@@ -0,0 +1,74 @@
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
+check_device() {
+	ls -1 /dev/tpm[0-9]* > /dev/null 2>&1 || {
+		echo "device driver not loaded, skipping."
+		exit 0
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
+start() {
+	printf "Starting tpm2-abrmd: "
+	check_device
+	rm_stale_pidfile /var/run/tpm2-abrmd.pid /usr/sbin/tpm2-abrmd
+	start-stop-daemon -S -q -o -b -p /var/run/tpm2-abrmd.pid -c tss:tss -x /usr/sbin/tpm2-abrmd -- ${DAEMON_OPTS} || {
+		echo "FAIL"
+		exit 1
+	}
+	pidof /usr/sbin/tpm2-abrmd > /var/run/tpm2-abrmd.pid
+	echo "OK"
+}
+
+stop() {
+	printf "Stopping tpm2-abrmd: "
+	start-stop-daemon -K -q -o -p /var/run/tpm2-abrmd.pid -u tss -x /usr/sbin/tpm2-abrmd || {
+		echo "FAIL"
+		exit 1
+	}
+	rm_stale_pidfile /var/run/tpm2-abrmd.pid /usr/sbin/tpm2-abrmd
+	echo "OK"
+}
+
+check_required_files /usr/sbin/tpm2-abrmd /etc/dbus-1/system.d/tpm2-abrmd.conf
+
+# Read configuration variable file if it is present
+[ -r /etc/default/tpm2-abrmd ] && . /etc/default/tpm2-abrmd
+
+case "$1" in
+	start)
+		start
+	       	;;
+	stop)
+	   	stop
+		;;
+	restart|reload)
+		stop
+		sleep 1
+		start
+		;;
+	*)
+		echo "Usage: tpm2-abrmd {start|stop|restart|reload}" >&2
+		exit 1
+esac
+
+exit 0
diff --git a/package/tpm2-abrmd/etc.default.tpm2-abrmd b/package/tpm2-abrmd/etc.default.tpm2-abrmd
new file mode 100644
index 0000000000..987978a665
--- /dev/null
+++ b/package/tpm2-abrmd/etc.default.tpm2-abrmd
@@ -0,0 +1 @@
+DAEMON_OPTS="--tcti=device --logger=syslog --max-connections=20 --max-transient-objects=20 --fail-on-loaded-trans"
diff --git a/package/tpm2-abrmd/tpm2-abrmd.hash b/package/tpm2-abrmd/tpm2-abrmd.hash
new file mode 100644
index 0000000000..503b83e5e3
--- /dev/null
+++ b/package/tpm2-abrmd/tpm2-abrmd.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 e20d2796c3097f9eec8410cec6a99d1532769d1cc138d6d9331c8ee1f0d305a4  tpm2-abrmd-1.2.0.tar.gz
+sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
new file mode 100644
index 0000000000..c2c3bfed46
--- /dev/null
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# tpm2-abrmd
+#
+################################################################################
+
+TPM2_ABRMD_VERSION = 1.2.0
+TPM2_ABRMD_SITE = https://github.com/tpm2-software/tpm2-abrmd/releases/download/$(TPM2_ABRMD_VERSION)
+TPM2_ABRMD_LICENSE = BSD-2-Clause
+TPM2_ABRMD_LICENSE_FILES = LICENSE
+TPM2_ABRMD_INSTALL_STAGING = YES
+TPM2_ABRMD_DEPENDENCIES = dbus libglib2 tpm2-tss host-pkgconf
+
+TPM2_ABRMD_CONF_OPTS += \
+	--with-systemdsystemunitdir=$(if $(BR2_INIT_SYSTEMD),/usr/lib/systemd/system,no) \
+	--with-udevrulesdir=$(if $(BR2_PACKAGE_HAS_UDEV),/usr/lib/udev/rules.d,no)
+
+define TPM2_ABRMD_INSTALL_INIT_SYSTEMD
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		install-systemdpresetDATA install-systemdsystemunitDATA
+endef
+
+# Without udev we need an init script to set the ownership of /dev/tpm[0-9]*
+define TPM2_ABRMD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 -t $(TARGET_DIR)/etc/init.d \
+		$(if $(BR2_PACKAGE_HAS_UDEV),,$(TPM2_ABRMD_PKGDIR)/S30devtpmperms) \
+		$(TPM2_ABRMD_PKGDIR)/S80tpm2-abrmd
+	$(INSTALL) -D -m 0644 $(TPM2_ABRMD_PKGDIR)/etc.default.tpm2-abrmd \
+		$(TARGET_DIR)/etc/default/tpm2-abrmd
+endef
+
+define TPM2_ABRMD_USERS
+	tss -1 tss -1 * - - - TPM2 Access Broker & Resource Management daemon
+endef
+
+$(eval $(autotools-package))
-- 
2.14.3
