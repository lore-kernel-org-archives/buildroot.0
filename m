From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 23:16:03 +0100
Subject: [Buildroot] [git commit] tpm2-abrmd: new package
Message-ID: <20180318222454.AE542836EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dab335d901be0b26a1e8ea4e0c3343352d442e35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: drop add default DAEMON_ARGS to init script, drop /etc/default file,
	drop S30devtpmperms and fix permissions in S80tpm2-abrmd]
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                  |  1 +
 package/tpm2-abrmd/Config.in       | 25 ++++++++++++
 package/tpm2-abrmd/S80tpm2-abrmd   | 78 ++++++++++++++++++++++++++++++++++++++
 package/tpm2-abrmd/tpm2-abrmd.hash |  3 ++
 package/tpm2-abrmd/tpm2-abrmd.mk   | 32 ++++++++++++++++
 5 files changed, 139 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 449ffcc47b..af94c0ad91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2012,6 +2012,7 @@ menu "System tools"
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
 	source "package/tpm-tools/Config.in"
+	source "package/tpm2-abrmd/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 	source "package/xen/Config.in"
diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
new file mode 100644
index 0000000000..31c5ae7d6b
--- /dev/null
+++ b/package/tpm2-abrmd/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_TPM2_ABRMD
+	bool "tpm2-abrmd"
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
diff --git a/package/tpm2-abrmd/S80tpm2-abrmd b/package/tpm2-abrmd/S80tpm2-abrmd
new file mode 100755
index 0000000000..3db5e6fa1d
--- /dev/null
+++ b/package/tpm2-abrmd/S80tpm2-abrmd
@@ -0,0 +1,78 @@
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
+	chown tss:tss /dev/tpm[0-9]* && chmod 600 /dev/tpm*
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
+# defaults
+DAEMON_OPTS="--tcti=device --logger=syslog --max-connections=20 --max-transient-objects=20 --fail-on-loaded-trans"
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
diff --git a/package/tpm2-abrmd/tpm2-abrmd.hash b/package/tpm2-abrmd/tpm2-abrmd.hash
new file mode 100644
index 0000000000..6af991d469
--- /dev/null
+++ b/package/tpm2-abrmd/tpm2-abrmd.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 e32e19de93b539374a485d9df7fe9415ce147ec03c8d9ba6593e50f7a67a7a51  tpm2-abrmd-1.3.0.tar.gz
+sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
new file mode 100644
index 0000000000..0d6a167210
--- /dev/null
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# tpm2-abrmd
+#
+################################################################################
+
+TPM2_ABRMD_VERSION = 1.3.0
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
+define TPM2_ABRMD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(TPM2_ABRMD_PKGDIR)/S80tpm2-abrmd \
+		$(TARGET_DIR)/etc/init.d/S80tpm2-abrmd
+endef
+
+define TPM2_ABRMD_USERS
+	tss -1 tss -1 * - - - TPM2 Access Broker & Resource Management daemon
+endef
+
+$(eval $(autotools-package))
