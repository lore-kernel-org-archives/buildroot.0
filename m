From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 16 Jun 2020 14:16:45 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/netopeer2: add package
Message-ID: <20200616121644.7039-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Netopeer2 is a set of tools implementing network configuration
tools based on the NETCONF Protocol. This is the second
generation of the toolset, originally available as the Netopeer
project. Netopeer2 is based on the new generation of the NETCONF
and YANG libraries - libyang and libnetconf2. The Netopeer
server uses sysrepo as a NETCONF datastore implementation.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...BUGFIX-take-DESTDIR-into-account-649.patch | 33 ++++++++
 ...HANGE-use-su-only-for-effective-root.patch | 79 +++++++++++++++++++
 package/netopeer2/Config.in                   | 36 +++++++++
 package/netopeer2/S52netopeer2                | 50 ++++++++++++
 package/netopeer2/netopeer2.hash              |  3 +
 package/netopeer2/netopeer2.mk                | 22 ++++++
 8 files changed, 225 insertions(+)
 create mode 100644 package/netopeer2/0001-build-BUGFIX-take-DESTDIR-into-account-649.patch
 create mode 100644 package/netopeer2/0002-scripts-CHANGE-use-su-only-for-effective-root.patch
 create mode 100644 package/netopeer2/Config.in
 create mode 100644 package/netopeer2/S52netopeer2
 create mode 100644 package/netopeer2/netopeer2.hash
 create mode 100644 package/netopeer2/netopeer2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 76a153d695..57628fbead 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1080,6 +1080,7 @@ F:	package/python-sip/
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
 F:	package/libyang/
+F:	package/netopeer2/
 F:	package/sysrepo/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
diff --git a/package/Config.in b/package/Config.in
index d32eadab88..bd89fed041 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1739,6 +1739,7 @@ menu "Networking"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
+	source "package/netopeer2/Config.in"
 	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
 	source "package/nss-mdns/Config.in"
diff --git a/package/netopeer2/0001-build-BUGFIX-take-DESTDIR-into-account-649.patch b/package/netopeer2/0001-build-BUGFIX-take-DESTDIR-into-account-649.patch
new file mode 100644
index 0000000000..bff4337fe7
--- /dev/null
+++ b/package/netopeer2/0001-build-BUGFIX-take-DESTDIR-into-account-649.patch
@@ -0,0 +1,33 @@
+From c6afffafd1e27054ff59b82ffed3a99795814631 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Mon, 8 Jun 2020 09:47:58 +0200
+Subject: [PATCH] build BUGFIX take DESTDIR into account (#649)
+
+When installing yang modules add DESTDIR prefix to the NP2_MODULE_DIR.
+
+Fixes #648
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[patch taken from upstream:
+https://github.com/CESNET/netopeer2/commit/726b1384a3f93090ede1143da86c99d5d24d06c5]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ scripts/setup.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/setup.sh b/scripts/setup.sh
+index 7175bc4..81abf63 100755
+--- a/scripts/setup.sh
++++ b/scripts/setup.sh
+@@ -8,7 +8,7 @@ fi
+ 
+ # avoid problems with sudo path
+ SYSREPOCTL=`su -c "which sysrepoctl" $USER`
+-MODDIR=${NP2_MODULE_DIR}
++MODDIR=${DESTDIR}${NP2_MODULE_DIR}
+ PERMS=${NP2_MODULE_PERMS}
+ OWNER=${NP2_MODULE_OWNER}
+ GROUP=${NP2_MODULE_GROUP}
+-- 
+2.20.1
+
diff --git a/package/netopeer2/0002-scripts-CHANGE-use-su-only-for-effective-root.patch b/package/netopeer2/0002-scripts-CHANGE-use-su-only-for-effective-root.patch
new file mode 100644
index 0000000000..b960a87beb
--- /dev/null
+++ b/package/netopeer2/0002-scripts-CHANGE-use-su-only-for-effective-root.patch
@@ -0,0 +1,79 @@
+From 71cc996faa5500b3bfd499ad0c436c8b96629ea7 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <mvasko@cesnet.cz>
+Date: Wed, 10 Jun 2020 15:20:23 +0200
+Subject: [PATCH] scripts CHANGE use su only for effective root
+
+Fixes #645
+
+[patch taken from upstream:
+https://github.com/CESNET/netopeer2/commit/2161b333009c21ffc8501e5127b82e6f0570ca8e]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ scripts/merge_config.sh  |  8 ++++++--
+ scripts/merge_hostkey.sh | 11 ++++++++---
+ scripts/setup.sh         |  8 ++++++--
+ 3 files changed, 20 insertions(+), 7 deletions(-)
+
+diff --git a/scripts/merge_config.sh b/scripts/merge_config.sh
+index dde0c75..4ad151c 100755
+--- a/scripts/merge_config.sh
++++ b/scripts/merge_config.sh
+@@ -2,8 +2,12 @@
+ 
+ set -e
+ 
+-# avoid problems with sudo path
+-SYSREPOCFG=`su -c "which sysrepocfg" $USER`
++# avoid problems with sudo PATH
++if [ `id -u` -eq 0 ]; then
++    SYSREPOCFG=`su -c 'which sysrepocfg' -l $USER`
++else
++    SYSREPOCFG=`which sysrepocfg`
++fi
+ KS_KEY_NAME=genkey
+ 
+ # check that there is no listen/Call Home configuration yet
+diff --git a/scripts/merge_hostkey.sh b/scripts/merge_hostkey.sh
+index 87947fa..a0677ee 100755
+--- a/scripts/merge_hostkey.sh
++++ b/scripts/merge_hostkey.sh
+@@ -2,9 +2,14 @@
+ 
+ set -e
+ 
+-# avoid problems with sudo path
+-SYSREPOCFG=`su -c "which sysrepocfg" $USER`
+-OPENSSL=`su -c "which openssl" $USER`
++# avoid problems with sudo PATH
++if [ `id -u` -eq 0 ]; then
++    SYSREPOCFG=`su -c 'which sysrepocfg' -l $USER`
++    OPENSSL=`su -c 'which openssl' -l $USER`
++else
++    SYSREPOCFG=`which sysrepocfg`
++    OPENSSL=`which openssl`
++fi
+ 
+ # check that there is no SSH key with this name yet
+ KEYSTORE_KEY=`$SYSREPOCFG -X -x "/ietf-keystore:keystore/asymmetric-keys/asymmetric-key[name='genkey']/name"`
+diff --git a/scripts/setup.sh b/scripts/setup.sh
+index 81abf63..8bf6825 100755
+--- a/scripts/setup.sh
++++ b/scripts/setup.sh
+@@ -6,8 +6,12 @@ if [ -z "$NP2_MODULE_DIR" -o -z "$NP2_MODULE_PERMS" -o -z "$NP2_MODULE_OWNER" -o
+     exit 1
+ fi
+ 
+-# avoid problems with sudo path
+-SYSREPOCTL=`su -c "which sysrepoctl" $USER`
++# avoid problems with sudo PATH
++if [ `id -u` -eq 0 ]; then
++    SYSREPOCTL=`su -c 'which sysrepoctl' -l $USER`
++else
++    SYSREPOCTL=`which sysrepoctl`
++fi
+ MODDIR=${DESTDIR}${NP2_MODULE_DIR}
+ PERMS=${NP2_MODULE_PERMS}
+ OWNER=${NP2_MODULE_OWNER}
+-- 
+2.20.1
+
diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in
new file mode 100644
index 0000000000..fcf3aaf57d
--- /dev/null
+++ b/package/netopeer2/Config.in
@@ -0,0 +1,36 @@
+comment "netopeer2 needs a toolchain w/ C++, threads, dynamic library, host gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_HOST_GCC_AT_LEAST_4_8
+
+config BR2_PACKAGE_NETOPEER2
+	bool "netopeer2"
+	depends on BR2_USE_MMU # sysrepo
+	depends on !BR2_STATIC_LIBS # sysrepo
+	depends on BR2_INSTALL_LIBSTDCPP # sysrepo
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_LIBNETCONF2
+	select BR2_PACKAGE_PCRE # sysrepo
+	select BR2_PACKAGE_PCRE_UCP # syrepo
+	select BR2_PACKAGE_SYSREPO
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBSSH
+	select BR2_PACKAGE_LIBSSH_SERVER
+
+	help
+	  Netopeer2 is a set of tools implementing network
+	  configuration tools based on the NETCONF Protocol.
+
+	  This is the server part.
+
+	  https://github.com/CESNET/Netopeer2
+
+if BR2_PACKAGE_NETOPEER2
+
+config BR2_PACKAGE_NETOPEER2_CLI
+       bool "cli"
+       help
+         Enable netopeer2 CLI.
+
+endif
diff --git a/package/netopeer2/S52netopeer2 b/package/netopeer2/S52netopeer2
new file mode 100644
index 0000000000..cf53a8f109
--- /dev/null
+++ b/package/netopeer2/S52netopeer2
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
diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
new file mode 100644
index 0000000000..93a094d563
--- /dev/null
+++ b/package/netopeer2/netopeer2.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  66f3ad68cc6e41f3231b090ef27016ccbfe007cda7d08ec19f409f7429f46ff9  netopeer2-1.1.34.tar.gz
+sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
new file mode 100644
index 0000000000..2553501f1d
--- /dev/null
+++ b/package/netopeer2/netopeer2.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# netopeer2
+#
+################################################################################
+
+NETOPEER2_VERSION = 1.1.34
+NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
+NETOPEER2_DL_SUBDIR = netopeer2
+NETOPEER2_LICENSE = BSD-3-Clause
+NETOPEER2_LICENSE_FILES = LICENSE
+NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo
+
+NETOPEER2_CONF_OPTS += \
+	-DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
+
+define NETOPEER2_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
+		$(TARGET_DIR)/etc/init.d/S52netopeer2
+endef
+
+$(eval $(cmake-package))
-- 
2.20.1
