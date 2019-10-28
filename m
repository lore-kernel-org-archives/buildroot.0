From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 28 Oct 2019 10:03:26 +0100
Subject: [Buildroot] [PATCH v5 2/5] package/sysrepo: add package
In-Reply-To: <20191028090329.25432-1-heiko.thiery@gmail.com>
References: <20191028090329.25432-1-heiko.thiery@gmail.com>
Message-ID: <20191028090329.25432-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

sysrepo is a YANG-based configuration and operational state
data store for Unix/Linux applications. It is a dependency
of Netopeer, a NETCONF server.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...espect-CMAKE_INSTALL_PREFIX-and-DEST.patch | 33 ++++++++++
 ...t-make-systemd-unit-dir-configurable.patch | 40 +++++++++++++
 package/sysrepo/Config.in                     | 35 +++++++++++
 package/sysrepo/S50sysrepod                   | 45 ++++++++++++++
 package/sysrepo/S51sysrepo-plugind            | 50 ++++++++++++++++
 package/sysrepo/sysrepo.hash                  |  2 +
 package/sysrepo/sysrepo.mk                    | 60 +++++++++++++++++++
 9 files changed, 267 insertions(+)
 create mode 100644 package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
 create mode 100644 package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch
 create mode 100644 package/sysrepo/Config.in
 create mode 100644 package/sysrepo/S50sysrepod
 create mode 100644 package/sysrepo/S51sysrepo-plugind
 create mode 100644 package/sysrepo/sysrepo.hash
 create mode 100644 package/sysrepo/sysrepo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f41ac5f096..6f6b768e0d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1048,6 +1048,7 @@ F:	package/python-sip/
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
 F:	package/libyang/
+F:	package/sysrepo/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
 F:	package/json-glib/
diff --git a/package/Config.in b/package/Config.in
index a1ac5069aa..ae1c5013b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1680,6 +1680,7 @@ menu "Networking"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
 	source "package/sofia-sip/Config.in"
+	source "package/sysrepo/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
 	source "package/wampcc/Config.in"
diff --git a/package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch b/package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
new file mode 100644
index 0000000000..5cb3606475
--- /dev/null
+++ b/package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
@@ -0,0 +1,33 @@
+From c4a2195febbd5d436f8de79d8391d8da9aa60ac4 Mon Sep 17 00:00:00 2001
+From: Michael Walle <michael@walle.cc>
+Date: Thu, 10 Oct 2019 14:58:16 +0200
+Subject: [PATCH 1/2] CMakeLists.txt: respect CMAKE_INSTALL_PREFIX and DESTDIR
+
+Don't use absolute pathnames in the install function. This way the files
+will be installed in the correct location even if CMAKE_INSTALL_PREFIX
+and DESTDIR are changed.
+
+Patch comes from upstream pull-request:
+https://github.com/sysrepo/sysrepo/pull/1638
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e4521088..14b7cd36 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -357,7 +357,7 @@ if(WITH_SYSTEMD)
+         ${PROJECT_SOURCE_DIR}/deploy/systemd/sysrepod.service
+         ${PROJECT_SOURCE_DIR}/deploy/systemd/sysrepo-plugind.service
+     )
+-    install(DIRECTORY ${PROJECT_SOURCE_DIR}/deploy/systemd/ DESTINATION "/lib/systemd/system"
++    install(DIRECTORY ${PROJECT_SOURCE_DIR}/deploy/systemd/ DESTINATION "lib/systemd/system"
+         FILES_MATCHING PATTERN "*.service")
+ endif()
+ 
+-- 
+2.20.1
+
diff --git a/package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch b/package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch
new file mode 100644
index 0000000000..3ab75f7957
--- /dev/null
+++ b/package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch
@@ -0,0 +1,40 @@
+From 906927b4ee2dd0d5bd669d193fc851d14919fbd1 Mon Sep 17 00:00:00 2001
+From: Michael Walle <michael@walle.cc>
+Date: Thu, 10 Oct 2019 14:38:57 +0200
+Subject: [PATCH 2/2] CMakeLists.txt: make systemd unit dir configurable
+
+Patch comes from upstream pull-request:
+https://github.com/sysrepo/sysrepo/pull/1638
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 14b7cd36..14c84675 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -217,6 +217,9 @@ else()
+     message(FATAL_ERROR "Unknown file format \"${FILE_FORMAT_EXT}\", must be json, xml, or lyb.")
+ endif()
+ 
++set(SYSTEMD_UNIT_DIR "lib/systemd/system/" CACHE STRING
++    "Path to the systemd service directory.")
++
+ # timeouts
+ set(REQUEST_TIMEOUT 15 CACHE STRING
+     "Timeout (in seconds) for Sysrepo API requests. Set to 0 for no timeout.")
+@@ -357,7 +360,8 @@ if(WITH_SYSTEMD)
+         ${PROJECT_SOURCE_DIR}/deploy/systemd/sysrepod.service
+         ${PROJECT_SOURCE_DIR}/deploy/systemd/sysrepo-plugind.service
+     )
+-    install(DIRECTORY ${PROJECT_SOURCE_DIR}/deploy/systemd/ DESTINATION "lib/systemd/system"
++    install(DIRECTORY ${PROJECT_SOURCE_DIR}/deploy/systemd/
++        DESTINATION "${SYSTEMD_UNIT_DIR}"
+         FILES_MATCHING PATTERN "*.service")
+ endif()
+ 
+-- 
+2.20.1
+
diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
new file mode 100644
index 0000000000..c2aac81ce9
--- /dev/null
+++ b/package/sysrepo/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_SYSREPO
+	bool "sysrepo"
+	depends on BR2_USE_MMU # libnetconf2
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # host-protbuf
+	select BR2_PACKAGE_LIBAVL
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBNETCONF2
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_PROTOBUF_C
+	help
+	  Sysrepo is an YANG-based configuration and operational state
+	  data store for Unix/Linux applications.
+
+	  https://github.com/sysrepo
+
+if BR2_PACKAGE_SYSREPO
+
+config BR2_PACKAGE_SYSREPO_EXAMPLES
+	bool "enable examples"
+	help
+	  Enable sysrepo examples.
+
+endif
+
+comment "sysrepo needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/sysrepo/S50sysrepod b/package/sysrepo/S50sysrepod
new file mode 100644
index 0000000000..2a3c6c9cf5
--- /dev/null
+++ b/package/sysrepo/S50sysrepod
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+DAEMON="sysrepod"
+PIDFILE="/var/run/$DAEMON.pid"
+
+SYSREPOD_ARGS=""
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -S -b -q -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- $SYSREPOD_ARGS
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
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
diff --git a/package/sysrepo/S51sysrepo-plugind b/package/sysrepo/S51sysrepo-plugind
new file mode 100644
index 0000000000..7463712961
--- /dev/null
+++ b/package/sysrepo/S51sysrepo-plugind
@@ -0,0 +1,50 @@
+#!/bin/sh
+
+DAEMON="sysrepo-plugind"
+PIDFILE="/var/run/$DAEMON.pid"
+
+SYSREPO_PLUGIND_ARGS=""
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -S -b -q -p $PIDFILE -x "/usr/bin/$DAEMON" \
+		-- $SYSREPO_PLUGIND_ARGS
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
+    start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
new file mode 100644
index 0000000000..48d8290797
--- /dev/null
+++ b/package/sysrepo/sysrepo.hash
@@ -0,0 +1,2 @@
+sha256 d3066c1776a6727b96bbb3517eb646d0bb6037e8e1addcbe873cae590493843e  sysrepo-0.7.8.tar.gz
+sha256 28a773bfffa828ec38c030fc8ace5f3aeb90926ec1309bbd135441c4387ce3cd  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
new file mode 100644
index 0000000000..31317d6236
--- /dev/null
+++ b/package/sysrepo/sysrepo.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# sysrepo
+#
+################################################################################
+
+SYSREPO_VERSION = 0.7.8
+SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
+SYSREPO_INSTALL_STAGING = YES
+SYSREPO_LICENSE = Apache-2.0
+SYSREPO_LICENSE_FILES = LICENSE
+SYSREPO_DEPENDENCIES = libev libnetconf2 libavl libyang pcre protobuf-c host-sysrepo
+HOST_SYSREPO_DEPENDENCIES = host-libev host-libnetconf2 host-libavl host-libyang host-pcre host-protobuf-c
+
+SYSREPO_CONF_OPTS = \
+	-DGEN_PYTHON2_TESTS=OFF \
+	-DENABLE_TESTS=OFF \
+	-DGEN_CPP_BINDINGS=OFF \
+	-DGEN_LANGUAGE_BINDINGS=OFF \
+	-DGEN_PYTHON_BINDINGS=OFF \
+	-DBUILD_CPP_EXAMPLES=OFF \
+	-DCALL_SYSREPOCTL_BIN=$(HOST_DIR)/bin/sysrepoctl \
+	-DCALL_SYSREPOCFG_BIN=$(HOST_DIR)/bin/sysrepocfg \
+	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
+	$(if $(BR2_INIT_SYSTEMD),-DWITH_SYSTEMD=ON) \
+	$(if $(BR2_INIT_SYSTEMD),-DSYSTEMD_UNIT_DIR=usr/lib/systemd/system)
+
+# On ARM, this is needed to prevent unaligned memory access with an optimized
+# build .. https://github.com/sysrepo/sysrepo/issues/947
+SYSREPO_CONF_OPTS += -DUSE_SR_MEM_MGMT=OFF
+
+define SYSREPO_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/sysrepo/S50sysrepod \
+		$(TARGET_DIR)/etc/init.d/S50sysrepod
+	$(INSTALL) -m 755 -D package/sysrepo/S51sysrepo-plugind \
+		$(TARGET_DIR)/etc/init.d/S51sysrepo-plugind
+endef
+
+define SYSREPO_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/systemd/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/sysrepod.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/sysrepo-plugind.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+endef
+
+HOST_SYSREPO_CONF_OPTS = \
+	-DGEN_PYTHON2_TESTS=OFF \
+	-DENABLE_TESTS=OFF \
+	-DGEN_CPP_BINDINGS=OFF \
+	-DGEN_LANGUAGE_BINDINGS=OFF \
+	-DGEN_PYTHON_BINDINGS=OFF \
+	-DCALL_TARGET_BINS_DIRECTLY=OFF \
+	-DBUILD_EXAMPLES=OFF \
+	-DBUILD_CPP_EXAMPLES=OFF \
+	-DREPOSITORY_LOC=$(HOST_DIR)/etc/sysrepo \
+	-DSUBSCRIPTIONS_SOCKET_DIR=$(HOST_DIR)/var/run/sysrepo-subscriptions
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
