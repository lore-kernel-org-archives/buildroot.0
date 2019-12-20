From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 20 Dec 2019 14:27:55 +0100
Subject: [Buildroot] [PATCH v1 3/3] package/sysrepo: bump to version 1.3.21
In-Reply-To: <20191220132756.32395-1-heiko.thiery@gmail.com>
References: <20191220132756.32395-1-heiko.thiery@gmail.com>
Message-ID: <20191220132756.32395-4-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

This Sysrepo is a complete rewrite of the older versions.

Thus several changes are made in the package to support this new version.

- several cmake config options dropped
- no systemd service scripts availble in upstream version
- no sysrepod daemon available
- drop patches that are no longer needed
- add new patch

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 ...espect-CMAKE_INSTALL_PREFIX-and-DEST.patch | 33 ----------
 ...BUGFIX-create-plugins-dir-recursivel.patch | 63 +++++++++++++++++++
 ...t-make-systemd-unit-dir-configurable.patch | 40 ------------
 package/sysrepo/S50sysrepod                   | 48 --------------
 package/sysrepo/sysrepo.hash                  |  4 +-
 package/sysrepo/sysrepo.mk                    | 31 ++-------
 6 files changed, 69 insertions(+), 150 deletions(-)
 delete mode 100644 package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
 create mode 100644 package/sysrepo/0001-sysrpeo-plugind-BUGFIX-create-plugins-dir-recursivel.patch
 delete mode 100644 package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch
 delete mode 100644 package/sysrepo/S50sysrepod

diff --git a/package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch b/package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
deleted file mode 100644
index 0db49c99d3..0000000000
--- a/package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c4a2195febbd5d436f8de79d8391d8da9aa60ac4 Mon Sep 17 00:00:00 2001
-From: Michael Walle <michael@walle.cc>
-Date: Thu, 10 Oct 2019 14:58:16 +0200
-Subject: [PATCH] CMakeLists.txt: respect CMAKE_INSTALL_PREFIX and DESTDIR
-
-Don't use absolute pathnames in the install function. This way the files
-will be installed in the correct location even if CMAKE_INSTALL_PREFIX
-and DESTDIR are changed.
-
-Patch comes from upstream pull-request:
-https://github.com/sysrepo/sysrepo/pull/1638
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e4521088..14b7cd36 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -357,7 +357,7 @@ if(WITH_SYSTEMD)
-         ${PROJECT_SOURCE_DIR}/deploy/systemd/sysrepod.service
-         ${PROJECT_SOURCE_DIR}/deploy/systemd/sysrepo-plugind.service
-     )
--    install(DIRECTORY ${PROJECT_SOURCE_DIR}/deploy/systemd/ DESTINATION "/lib/systemd/system"
-+    install(DIRECTORY ${PROJECT_SOURCE_DIR}/deploy/systemd/ DESTINATION "lib/systemd/system"
-         FILES_MATCHING PATTERN "*.service")
- endif()
- 
--- 
-2.20.1
-
diff --git a/package/sysrepo/0001-sysrpeo-plugind-BUGFIX-create-plugins-dir-recursivel.patch b/package/sysrepo/0001-sysrpeo-plugind-BUGFIX-create-plugins-dir-recursivel.patch
new file mode 100644
index 0000000000..e83e01aea2
--- /dev/null
+++ b/package/sysrepo/0001-sysrpeo-plugind-BUGFIX-create-plugins-dir-recursivel.patch
@@ -0,0 +1,63 @@
+From 353faffe13852c4204f158b5d4301405bd222c44 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <mvasko@cesnet.cz>
+Date: Fri, 20 Dec 2019 13:40:35 +0100
+Subject: [PATCH] sysrpeo-plugind BUGFIX create plugins dir recursively
+
+Refs #1719
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ src/executables/sysrepo-plugind.c | 30 +++++++++++++++++++++++++++++-
+ 1 file changed, 29 insertions(+), 1 deletion(-)
+
+diff --git a/src/executables/sysrepo-plugind.c b/src/executables/sysrepo-plugind.c
+index ddb41c26..ca22140e 100644
+--- a/src/executables/sysrepo-plugind.c
++++ b/src/executables/sysrepo-plugind.c
+@@ -206,6 +206,34 @@ daemon_init(int debug, sr_log_level_t log_level)
+     sr_log_syslog("sysrepo-plugind", log_level);
+ }
+ 
++/* from src/common.c */
++int
++sr_mkpath(const char *path, mode_t mode)
++{
++    char *p, *dup;
++
++    dup = strdup(path);
++    for (p = strchr(dup + 1, '/'); p; p = strchr(p + 1, '/')) {
++        *p = '\0';
++        if (mkdir(dup, mode) == -1) {
++            if (errno != EEXIST) {
++                *p = '/';
++                return -1;
++            }
++        }
++        *p = '/';
++    }
++    free(dup);
++
++    if (mkdir(path, mode) == -1) {
++        if (errno != EEXIST) {
++            return -1;
++        }
++    }
++
++    return 0;
++}
++
+ static int
+ load_plugins(struct srpd_plugin_s **plugins, int *plugin_count)
+ {
+@@ -231,7 +259,7 @@ load_plugins(struct srpd_plugin_s **plugins, int *plugin_count)
+             error_print(0, "Checking plugins dir existence failed (%s).", strerror(errno));
+             return -1;
+         }
+-        if (mkdir(plugins_dir, 00777) == -1) {
++        if (sr_mkpath(plugins_dir, 00777) == -1) {
+             error_print(0, "Creating plugins dir \"%s\" failed (%s).", plugins_dir, strerror(errno));
+             return -1;
+         }
+-- 
+2.20.1
+
diff --git a/package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch b/package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch
deleted file mode 100644
index bee8d99046..0000000000
--- a/package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 906927b4ee2dd0d5bd669d193fc851d14919fbd1 Mon Sep 17 00:00:00 2001
-From: Michael Walle <michael@walle.cc>
-Date: Thu, 10 Oct 2019 14:38:57 +0200
-Subject: [PATCH] CMakeLists.txt: make systemd unit dir configurable
-
-Patch comes from upstream pull-request:
-https://github.com/sysrepo/sysrepo/pull/1638
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- CMakeLists.txt | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 14b7cd36..14c84675 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -217,6 +217,9 @@ else()
-     message(FATAL_ERROR "Unknown file format \"${FILE_FORMAT_EXT}\", must be json, xml, or lyb.")
- endif()
- 
-+set(SYSTEMD_UNIT_DIR "lib/systemd/system/" CACHE STRING
-+    "Path to the systemd service directory.")
-+
- # timeouts
- set(REQUEST_TIMEOUT 15 CACHE STRING
-     "Timeout (in seconds) for Sysrepo API requests. Set to 0 for no timeout.")
-@@ -357,7 +360,8 @@ if(WITH_SYSTEMD)
-         ${PROJECT_SOURCE_DIR}/deploy/systemd/sysrepod.service
-         ${PROJECT_SOURCE_DIR}/deploy/systemd/sysrepo-plugind.service
-     )
--    install(DIRECTORY ${PROJECT_SOURCE_DIR}/deploy/systemd/ DESTINATION "lib/systemd/system"
-+    install(DIRECTORY ${PROJECT_SOURCE_DIR}/deploy/systemd/
-+        DESTINATION "${SYSTEMD_UNIT_DIR}"
-         FILES_MATCHING PATTERN "*.service")
- endif()
- 
--- 
-2.20.1
-
diff --git a/package/sysrepo/S50sysrepod b/package/sysrepo/S50sysrepod
deleted file mode 100644
index f1e8a03c6d..0000000000
--- a/package/sysrepo/S50sysrepod
+++ /dev/null
@@ -1,48 +0,0 @@
-#!/bin/sh
-
-DAEMON="sysrepod"
-PIDFILE="/var/run/$DAEMON.pid"
-
-SYSREPOD_ARGS=""
-
-# shellcheck source=/dev/null
-[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
-
-start() {
-	printf 'Starting %s: ' "$DAEMON"
-	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" \
-		-- $SYSREPOD_ARGS
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-case "$1" in
-	start|stop|restart)
-		"$1";;
-	*)
-		echo "Usage: $0 {start|stop|restart}"
-		exit 1
-esac
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 48d8290797..ff2e1166b2 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,2 +1,2 @@
-sha256 d3066c1776a6727b96bbb3517eb646d0bb6037e8e1addcbe873cae590493843e  sysrepo-0.7.8.tar.gz
-sha256 28a773bfffa828ec38c030fc8ace5f3aeb90926ec1309bbd135441c4387ce3cd  LICENSE
+sha256 be405a33b1713d1114f3c092a6349b25a2de2a0f43a15dc6984c029f70230b3b  sysrepo-1.3.21.tar.gz
+sha256 b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index f693ff70da..02ae756bb8 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 0.7.8
+SYSREPO_VERSION = 1.3.21
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = Apache-2.0
@@ -13,45 +13,22 @@ SYSREPO_DEPENDENCIES = libev libavl libyang pcre protobuf-c host-sysrepo
 HOST_SYSREPO_DEPENDENCIES = host-libev host-libavl host-libyang host-pcre host-protobuf-c
 
 SYSREPO_CONF_OPTS = \
-	-DIS_DEVELOPER_CONFIGURATION=OFF \
-	-DGEN_PYTHON2_TESTS=OFF \
-	-DENABLE_TESTS=OFF \
-	-DGEN_CPP_BINDINGS=OFF \
-	-DGEN_LANGUAGE_BINDINGS=OFF \
-	-DGEN_PYTHON_BINDINGS=OFF \
-	-DBUILD_CPP_EXAMPLES=OFF \
-	-DCALL_SYSREPOCTL_BIN=$(HOST_DIR)/bin/sysrepoctl \
-	-DCALL_SYSREPOCFG_BIN=$(HOST_DIR)/bin/sysrepocfg \
+	-DCMAKE_BUILD_TYPE=Release \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
-	$(if $(BR2_INIT_SYSTEMD),-DWITH_SYSTEMD=ON) \
-	$(if $(BR2_INIT_SYSTEMD),-DSYSTEMD_UNIT_DIR=/usr/lib/systemd/system)
-
-# On ARM, this is needed to prevent unaligned memory access with an optimized
-# build .. https://github.com/sysrepo/sysrepo/issues/947
-SYSREPO_CONF_OPTS += -DUSE_SR_MEM_MGMT=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 SYSREPO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
 define SYSREPO_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/sysrepo/S50sysrepod \
-		$(TARGET_DIR)/etc/init.d/S50sysrepod
 	$(INSTALL) -m 755 -D package/sysrepo/S51sysrepo-plugind \
 		$(TARGET_DIR)/etc/init.d/S51sysrepo-plugind
 endef
 
 HOST_SYSREPO_CONF_OPTS = \
-	-DGEN_PYTHON2_TESTS=OFF \
-	-DENABLE_TESTS=OFF \
-	-DGEN_CPP_BINDINGS=OFF \
-	-DGEN_LANGUAGE_BINDINGS=OFF \
-	-DGEN_PYTHON_BINDINGS=OFF \
-	-DCALL_TARGET_BINS_DIRECTLY=OFF \
+	-DCMAKE_BUILD_TYPE=Release \
 	-DBUILD_EXAMPLES=OFF \
-	-DBUILD_CPP_EXAMPLES=OFF \
-	-DREPOSITORY_LOC=$(HOST_DIR)/etc/sysrepo \
-	-DSUBSCRIPTIONS_SOCKET_DIR=$(HOST_DIR)/var/run/sysrepo-subscriptions
+	-DREPO_PATH=$(TARGET_DIR)/etc/sysrepo
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.20.1
