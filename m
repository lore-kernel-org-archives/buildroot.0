From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri, 20 Mar 2020 16:25:16 +0100
Subject: [Buildroot] [PATCH v6 1/2] package/netdata: new package
Message-ID: <20200320152517.3108669-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Always provide --disable-dbengine configuration option, because we do
not support libjudy dependency that is required otherwise.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
changes v5 -> v6:
 - rework S60netdata init script to match package/sysklogd/S01syslogd
   template (suggested by Carlos)

changes v4 -> v5:
 - use 1.20.0 instead of 1.19.0 version
 - libuv is hard requirement now, so it was added to dependencies
 - zlib is hard requirement as well, because it is needed to properly
   compile project (missing uLong typedef otherwise)
 - patch solving race condition during installation has been dropped,
   because it is already part of 1.20.0

changes v3 -> v4:
 - use 1.19.0 instead of 1.18.1 version
 - drop musl fix, which is now part of 1.19.0 netdata version
 - use patch from upstream netdata (which will be part of next release) that
   removes use of .keep files
 - rebase on Builroot master

changes v2 -> v3:
 - add patch that removes installation of .keep files for /var/cache/netdata and
   /var/log/netdata directories; this solves a race condition when installing
   .keep file to the same directory (/tmp/netdata with default skeleton) from
   multiple threads
 - add S60netdata sysv-init script, which creates needed directories
   (/var/cache/netdata and /var/log/netdata) (suggested by Matt)

changes v1 -> v2:
 - squash DEVELOPERS update (suggested by Arnout),
 - reduce number of required dependencies and support them as optional:
   - json-c: there are few custom JSON handling function if json-c library is
     not provided,
   - openssl: enable or disable https support based on its availability (and
     solve openssl not being in netdata.mk file - suggested by Matt),
 - add optional dependencies on cups, nfacct and zlib,
 - enable or disable -flto based on BR2_GCC_ENABLE_LTO
 - drop libuv and lz4 dependencies, because it is not required with
   --disable-dbengine option,
 - add comment about NETDATA_AUTORECONF (suggested by Matt),
 - apply upstreamed patch to fix musl build (musl build was not failing with v1
   patch but did with v2).

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/netdata/Config.in    | 22 ++++++++++++++
 package/netdata/S60netdata   | 57 ++++++++++++++++++++++++++++++++++++
 package/netdata/netdata.hash |  3 ++
 package/netdata/netdata.mk   | 55 ++++++++++++++++++++++++++++++++++
 6 files changed, 139 insertions(+)
 create mode 100644 package/netdata/Config.in
 create mode 100644 package/netdata/S60netdata
 create mode 100644 package/netdata/netdata.hash
 create mode 100644 package/netdata/netdata.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 98220a961b..1a39112386 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1555,6 +1555,7 @@ F:	package/lua-flu/
 F:	package/lua-stdlib/
 F:	package/luaossl/
 F:	package/murata-cyw-fw/
+F:	package/netdata/
 F:	package/rs485conf/
 F:	package/turbolua/
 
diff --git a/package/Config.in b/package/Config.in
index afe32f52b4..85cc4a44f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1942,6 +1942,7 @@ menu "Miscellaneous"
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
index 0000000000..6cb50c3b71
--- /dev/null
+++ b/package/netdata/S60netdata
@@ -0,0 +1,57 @@
+#!/bin/sh
+
+DAEMON="netdata"
+PIDFILE="/var/run/$DAEMON.pid"
+
+NETDATA_ARGS="-u root -P $PIDFILE"
+
+# Create needed directories.
+[ -d "/var/cache/$DAEMON" ] || mkdir -p "/var/cache/$DAEMON"
+[ -d "/var/lib/$DAEMON" ] || mkdir -p "/var/lib/$DAEMON"
+[ -d "/var/log/$DAEMON" ] || mkdir -p "/var/log/$DAEMON"
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
index 0000000000..5ba94c7eda
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
+NETDATA_LICENSE = GPL-3.0
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
-- 
2.25.0
