From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu,  9 Jan 2020 15:53:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/netopeer2-server: add package
In-Reply-To: <20200109145339.14445-1-heiko.thiery@gmail.com>
References: <20200109145339.14445-1-heiko.thiery@gmail.com>
Message-ID: <20200109145339.14445-2-heiko.thiery@gmail.com>
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
 package/netopeer2-server/Config.in            | 49 ++++++++++++++++++
 package/netopeer2-server/S52netopeer2-server  | 50 +++++++++++++++++++
 .../netopeer2-server/netopeer2-server.hash    |  2 +
 package/netopeer2-server/netopeer2-server.mk  | 21 ++++++++
 6 files changed, 124 insertions(+)
 create mode 100644 package/netopeer2-server/Config.in
 create mode 100644 package/netopeer2-server/S52netopeer2-server
 create mode 100644 package/netopeer2-server/netopeer2-server.hash
 create mode 100644 package/netopeer2-server/netopeer2-server.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f86c256a5..0afe452b4b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1066,6 +1066,7 @@ F:	package/python-sip/
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
 F:	package/libyang/
+F:	package/netopeer2-server/
 F:	package/sysrepo/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
diff --git a/package/Config.in b/package/Config.in
index 45935ce18e..5b4b3c0ca6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1696,6 +1696,7 @@ menu "Networking"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
+	source "package/netopeer2-server/Config.in"
 	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
 	source "package/nss-mdns/Config.in"
diff --git a/package/netopeer2-server/Config.in b/package/netopeer2-server/Config.in
new file mode 100644
index 0000000000..77d8172a14
--- /dev/null
+++ b/package/netopeer2-server/Config.in
@@ -0,0 +1,49 @@
+comment "netopeer2server needs a toolchain w/ C++, threads, dynamic library, host gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # host-protobuf
+
+config BR2_PACKAGE_NETOPEER2_SERVER
+	bool "netopeer2-server"
+	depends on BR2_USE_MMU # sysrepo
+	depends on !BR2_STATIC_LIBS # sysrepo
+	depends on BR2_INSTALL_LIBSTDCPP # sysrepo
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	# host-protobuf only builds on certain architectures
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_PACKAGE_LIBAVL # sysrepo
+	select BR2_PACKAGE_LIBEV # sysrepo
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_LIBNETCONF2
+	select BR2_PACKAGE_PCRE # sysrepo
+	select BR2_PACKAGE_PCRE_UCP # syrepo
+	select BR2_PACKAGE_PROTOBUF_C # sysrepo
+	select BR2_PACKAGE_SYSREPO
+	# at least one transport mechanism is mandatory
+	select BR2_PACKAGE_NETOPEER2_SERVER_SSH if !BR2_PACKAGE_NETOPEER2_SERVER_TLS
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
index 0000000000..cf53a8f109
--- /dev/null
+++ b/package/netopeer2-server/S52netopeer2-server
@@ -0,0 +1,50 @@
+#!/bin/sh
+
+DAEMON="netopeer2-server"
+PIDFILE="/var/run/$DAEMON.pid"
+
+NETOPEER2_SERVER_ARGS=""
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
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
new file mode 100644
index 0000000000..20ff492b9b
--- /dev/null
+++ b/package/netopeer2-server/netopeer2-server.hash
@@ -0,0 +1,2 @@
+sha256	f855e2f81fc32b0ff9199a4ef8e1993b35f708594c5d72af2e6ecd246c23b1eb  netopeer2-1.1.1.tar.gz
+sha256	b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2-server/netopeer2-server.mk b/package/netopeer2-server/netopeer2-server.mk
new file mode 100644
index 0000000000..23e5cc28b9
--- /dev/null
+++ b/package/netopeer2-server/netopeer2-server.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# netopeer2-server
+#
+################################################################################
+
+NETOPEER2_SERVER_VERSION = 1.1.1
+NETOPEER2_SERVER_SOURCE = netopeer2-$(NETOPEER2_SERVER_VERSION).tar.gz
+NETOPEER2_SERVER_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_SERVER_VERSION))
+NETOPEER2_SERVER_DL_SUBDIR = netopeer2
+NETOPEER2_SERVER_LICENSE = BSD-3-Clause
+NETOPEER2_SERVER_LICENSE_FILES = LICENSE
+NETOPEER2_SERVER_SUBDIR = server
+NETOPEER2_SERVER_DEPENDENCIES = libnetconf2 libyang sysrepo
+
+define NETOPEER2_SERVER_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/netopeer2-server/S52netopeer2-server \
+		$(TARGET_DIR)/etc/init.d/S52netopeer2-server
+endef
+
+$(eval $(cmake-package))
-- 
2.20.1
