From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:25:33 +0100
Subject: [Buildroot] [git commit] package/netdata: new package
Message-ID: <20200324212004.67C00881A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d2bb469078b5818aa2390b9868cd632200f17a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Always use the --disable-dbengine configuration option, because we do
not support libjudy dependency that is required otherwise.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/netdata/Config.in    | 22 ++++++++++++++++++
 package/netdata/S60netdata   | 55 ++++++++++++++++++++++++++++++++++++++++++++
 package/netdata/netdata.hash |  3 +++
 package/netdata/netdata.mk   | 55 ++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 137 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 14deb2aa0b..256be1b2b7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1572,6 +1572,7 @@ F:	package/lua-flu/
 F:	package/lua-stdlib/
 F:	package/luaossl/
 F:	package/murata-cyw-fw/
+F:	package/netdata/
 F:	package/rs485conf/
 F:	package/turbolua/
 
diff --git a/package/Config.in b/package/Config.in
index b4033721e2..614ec921e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1946,6 +1946,7 @@ menu "Miscellaneous"
 	source "package/linux-syscall-support/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
+	source "package/netdata/Config.in"
 	source "package/proj/Config.in"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
diff --git a/package/netdata/Config.in b/package/netdata/Config.in
new file mode 100644
index 0000000000..88f88cb7ed
--- /dev/null
+++ b/package/netdata/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_NETDATA
+	bool "netdata"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_ZLIB
+	help
+	  Netdata is distributed, real-time, performance and health
+	  monitoring for systems and applications. It is a highly
+	  optimized monitoring agent you install on all your systems and
+	  containers.
+
+	  https://github.com/netdata/netdata
+
+comment "netdata needs a toolchain w/ NPTL, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/netdata/S60netdata b/package/netdata/S60netdata
new file mode 100644
index 0000000000..421f0715c0
--- /dev/null
+++ b/package/netdata/S60netdata
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+DAEMON="netdata"
+PIDFILE="/var/run/$DAEMON.pid"
+
+NETDATA_ARGS="-u root -P $PIDFILE"
+
+# Create needed directories.
+mkdir -p /var/cache/$DAEMON /var/lib/$DAEMON /var/log/$DAEMON
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $NETDATA_ARGS
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
diff --git a/package/netdata/netdata.hash b/package/netdata/netdata.hash
new file mode 100644
index 0000000000..6c79e97017
--- /dev/null
+++ b/package/netdata/netdata.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 c739e0fa8d6d7f433c0c7c8016b763e8f70519d67f0b5e7eca9ee5318f210d90  netdata-1.20.0.tar.gz
+sha256 0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
new file mode 100644
index 0000000000..d169881a9c
--- /dev/null
+++ b/package/netdata/netdata.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# netdata
+#
+################################################################################
+
+NETDATA_VERSION = 1.20.0
+NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
+NETDATA_LICENSE = GPL-3.0+
+NETDATA_LICENSE_FILES = LICENSE
+# netdata's source code is released without a generated configure script
+NETDATA_AUTORECONF = YES
+NETDATA_CONF_OPTS = --disable-dbengine
+NETDATA_DEPENDENCIES = libuv util-linux zlib
+
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+NETDATA_CONF_OPTS += --enable-lto
+else
+NETDATA_CONF_OPTS += --disable-lto
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+NETDATA_CONF_OPTS += --enable-plugin-cups
+NETDATA_DEPENDENCIES += cups
+else
+NETDATA_CONF_OPTS += --disable-plugin-cups
+endif
+
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+NETDATA_CONF_OPTS += --enable-jsonc
+NETDATA_DEPENDENCIES += json-c
+else
+NETDATA_CONF_OPTS += --disable-jsonc
+endif
+
+ifeq ($(BR2_PACKAGE_NFACCT),y)
+NETDATA_CONF_OPTS += --enable-plugin-nfacct
+NETDATA_DEPENDENCIES += nfacct
+else
+NETDATA_CONF_OPTS += --disable-plugin-nfacct
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+NETDATA_CONF_OPTS += --enable-https
+NETDATA_DEPENDENCIES += openssl
+else
+NETDATA_CONF_OPTS += --disable-https
+endif
+
+define NETDATA_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/netdata/S60netdata \
+		$(TARGET_DIR)/etc/init.d/S60netdata
+endef
+
+$(eval $(autotools-package))
