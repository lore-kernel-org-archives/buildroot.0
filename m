From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Thu, 24 Oct 2019 09:46:45 +0200
Subject: [Buildroot] [PATCH vX 4/5] package/netopeer2-server: add package
In-Reply-To: <20191024074644.10442-1-heiko.thiery@gmail.com>
References: <20191024074644.10442-1-heiko.thiery@gmail.com>
Message-ID: <20191024074644.10442-5-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

Netopeer2 is a set of tools implementing network configuration
tools based on the NETCONF Protocol. This is the second
generation of the toolset, originally available as the Netopeer
project. Netopeer2 is based on the new generation of the NETCONF
and YANG libraries - libyang and libnetconf2. The Netopeer
server uses sysrepo as a NETCONF datastore implementation.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/netopeer2-server/Config.in            | 51 +++++++++++
 package/netopeer2-server/S52netopeer2-server  | 90 +++++++++++++++++++
 .../netopeer2-server/netopeer2-server.hash    |  1 +
 package/netopeer2-server/netopeer2-server.mk  | 33 +++++++
 6 files changed, 177 insertions(+)
 create mode 100644 package/netopeer2-server/Config.in
 create mode 100644 package/netopeer2-server/S52netopeer2-server
 create mode 120000 package/netopeer2-server/netopeer2-server.hash
 create mode 100644 package/netopeer2-server/netopeer2-server.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 55a8bda729..91244be26e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1046,6 +1046,7 @@ N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
 F:	package/libyang/
 F:	package/netopeer2-keystored/
+F:	package/netopeer2-server/
 F:	package/sysrepo/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
diff --git a/package/Config.in b/package/Config.in
index 8579eb5896..6eab83dd20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1658,6 +1658,7 @@ menu "Networking"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
 	source "package/netopeer2-keystored/Config.in"
+	source "package/netopeer2-server/Config.in"
 	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
 	source "package/nss-mdns/Config.in"
diff --git a/package/netopeer2-server/Config.in b/package/netopeer2-server/Config.in
new file mode 100644
index 0000000000..abae534a4b
--- /dev/null
+++ b/package/netopeer2-server/Config.in
@@ -0,0 +1,51 @@
+comment "netopeer2server needs a toolchain w/ C++, threads, dynamic library, host gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+
+config BR2_PACKAGE_NETOPEER2_SERVER
+	bool "netopeer2-server"
+	depends on BR2_USE_MMU # sysrepo
+	depends on !BR2_STATIC_LIBS # sysrepo
+	depends on BR2_INSTALL_LIBSTDCPP # sysrepo
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	# host-protobuf only builds on certain architectures
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_PACKAGE_LIBAVL
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_LIBNETCONF2
+	select BR2_PACKAGE_PROTOBUF_C
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_SYSREPO
+	select BR2_PACKAGE_NETOPEER2_KEYSTORED
+	# at the moment SSH transport is mandatory
+	select BR2_PACKAGE_NETOPEER2_SERVER_SSH
+
+	help
+	  Netopeer2 is a set of tools implementing network
+	  configuration tools based on the NETCONF Protocol.
+
+	  This is the server part.
+
+	  https://github.com/CESNET/Netopeer2
+
+if BR2_PACKAGE_NETOPEER2_SERVER
+
+config BR2_PACKAGE_NETOPEER2_SERVER_TLS
+	bool "TLS transport"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable TLS transport layer support.
+
+config BR2_PACKAGE_NETOPEER2_SERVER_SSH
+	bool "SSH transport"
+	select BR2_PACKAGE_LIBSSH
+	select BR2_PACKAGE_LIBSSH_SERVER
+	help
+	  Enable SSH transport layer support.
+
+endif
diff --git a/package/netopeer2-server/S52netopeer2-server b/package/netopeer2-server/S52netopeer2-server
new file mode 100644
index 0000000000..0bad83325a
--- /dev/null
+++ b/package/netopeer2-server/S52netopeer2-server
@@ -0,0 +1,90 @@
+#!/bin/sh
+
+DAEMON="netopeer2-server"
+PIDFILE="/var/run/$DAEMON.pid"
+
+NETOPEER2_SERVER_ARGS=""
+
+KEYSTORED_HOST_KEY="/etc/keystored/keys/ssh_host_rsa_key.pem"
+
+SSHKEYGEN="/usr/bin/dropbearkey"
+DROPBEARKEY="/usr/bin/dropbearkey"
+DROPBEARCONVERT="/usr/bin/dropbearconvert"
+
+dropbear_keygen() {
+	${DROPBEARKEY} -t rsa -f ${KEYSTORED_HOST_KEY}
+	${DROPBEARCONVERT} dropbear openssh ${KEYSTORED_HOST_KEY} ${KEYSTORED_HOST_KEY}
+}
+
+ssh_keygen() {
+	${SSHKEYGEN} -m pem -t rsa -q -N "" -f ${KEYSTORED_HOST_KEY}
+}
+
+keygen() {
+	if [ -x ${DROPBEARKEY} -a -x ${DROPBEARCONVERT} ]; then
+		dropbear_keygen
+		status=$?
+	elif [ -x ${SSHKEYGEN} ]; then
+		ssh_keygen
+		status=$?
+	else
+		status=1
+	fi
+
+	return "$status"
+}
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	if [ ! -f ${KEYSTORED_HOST_KEY} ]; then
+		keygen
+		status=$?
+		if [ "$status" -eq 0 ]; then
+			echo "OK"
+		else
+			echo "FAIL"
+		fi
+	else
+		echo "OK"
+	fi
+
+	start-stop-daemon -S -b -q -p $PIDFILE -x "/usr/bin/$DAEMON" \
+		-- $NETOPEER2_SERVER_ARGS
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
+	start-stop-daemon -K -q -p $PIDFILE
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
+reload() {
+	# we do not support real reload .. just restart
+	restart
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+esac
diff --git a/package/netopeer2-server/netopeer2-server.hash b/package/netopeer2-server/netopeer2-server.hash
new file mode 120000
index 0000000000..47bb47d7e3
--- /dev/null
+++ b/package/netopeer2-server/netopeer2-server.hash
@@ -0,0 +1 @@
+../netopeer2-keystored/netopeer2-keystored.hash
\ No newline at end of file
diff --git a/package/netopeer2-server/netopeer2-server.mk b/package/netopeer2-server/netopeer2-server.mk
new file mode 100644
index 0000000000..39666a8e24
--- /dev/null
+++ b/package/netopeer2-server/netopeer2-server.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# netopeer2-server
+#
+################################################################################
+
+NETOPEER2_SERVER_VERSION = v0.7-r2
+NETOPEER2_SERVER_SOURCE = netopeer2-$(NETOPEER2_SERVER_VERSION).tar.gz
+NETOPEER2_SERVER_SITE = $(call github,CESNET,Netopeer2,$(NETOPEER2_SERVER_VERSION))
+NETOPEER2_SERVER_DL_SUBDIR = netopeer2
+NETOPEER2_SERVER_LICENSE = BSD-3-Clause
+NETOPEER2_SERVER_LICENSE_FILES = LICENSE
+NETOPEER2_SERVER_SUBDIR = server
+NETOPEER2_SERVER_DEPENDENCIES = libyang sysrepo
+
+NETOPEER2_SERVER_CONF_OPTS = \
+	-DENABLE_CONFIGURATION=ON \
+	-DKEYSTORED_KEYS_DIR=/etc/keystored/keys
+
+define NETOPEER2_SERVER_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/netopeer2-server/S52netopeer2-server \
+		$(TARGET_DIR)/etc/init.d/S52netopeer2-server
+endef
+
+define NETOPEER2_SERVER_PERMISSIONS
+	/etc/sysrepo/data/ietf-netconf-server.persist f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-netconf-server.running f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-netconf-server.running.lock f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-netconf-server.startup f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-netconf-server.startup.lock f 600 0 0 - - - - -
+endef
+
+$(eval $(cmake-package))
-- 
2.20.1
