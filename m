From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 14 Nov 2017 15:54:42 +0100
Subject: [Buildroot] [PATCH 1/1] Add TCF Agent package
Message-ID: <20171114145442.16734-1-norbert.lange@andritz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
---
 package/Config.in                                  |  1 +
 ...add-CMake-install-target-for-agent-binary.patch | 35 ++++++++++++++++
 package/tcfagent/Config.in                         | 16 ++++++++
 package/tcfagent/S55tcfagent                       | 47 ++++++++++++++++++++++
 package/tcfagent/tcfagent.hash                     |  4 ++
 package/tcfagent/tcfagent.mk                       | 38 +++++++++++++++++
 package/tcfagent/tcfagent.service                  | 10 +++++
 7 files changed, 151 insertions(+)
 create mode 100644 package/tcfagent/0001-add-CMake-install-target-for-agent-binary.patch
 create mode 100644 package/tcfagent/Config.in
 create mode 100755 package/tcfagent/S55tcfagent
 create mode 100644 package/tcfagent/tcfagent.hash
 create mode 100644 package/tcfagent/tcfagent.mk
 create mode 100644 package/tcfagent/tcfagent.service

diff --git a/package/Config.in b/package/Config.in
index fe5ccc434e..ab152677e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -124,6 +124,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/stress-ng/Config.in"
 	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
+	source "package/tcfagent/Config.in"
 	source "package/tinymembench/Config.in"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
diff --git a/package/tcfagent/0001-add-CMake-install-target-for-agent-binary.patch b/package/tcfagent/0001-add-CMake-install-target-for-agent-binary.patch
new file mode 100644
index 0000000000..bb9c334d91
--- /dev/null
+++ b/package/tcfagent/0001-add-CMake-install-target-for-agent-binary.patch
@@ -0,0 +1,35 @@
+From 9140c630085833acfe565f27195a876c6656f068 Mon Sep 17 00:00:00 2001
+From: Norbert Lange <norbert.lange@andritz.com>
+Date: Mon, 30 Oct 2017 16:22:40 +0100
+Subject: [PATCH] add CMake install target for agent binary
+
+allows use in automated buildsystems like Buildroot
+---
+ agent/CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/agent/CMakeLists.txt b/agent/CMakeLists.txt
+index aef15b96..7868987a 100644
+--- a/agent/CMakeLists.txt
++++ b/agent/CMakeLists.txt
+@@ -1,6 +1,7 @@
+ # -*- cmake -*-
+ 
+ cmake_minimum_required(VERSION 2.8)
++include(GNUInstallDirs)
+ 
+ set(CMAKE_COLOR_MAKEFILE OFF)
+ 
+@@ -43,3 +44,9 @@ message(STATUS "machine:" ${TCF_MACHINE})
+ 
+ add_executable(agent tcf/main/main.c)
+ target_link_libraries(agent ${TCF_LIB_NAME})
++
++install(TARGETS agent ${TCF_LIB_NAME}
++  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
++)
+-- 
+2.14.2
+
diff --git a/package/tcfagent/Config.in b/package/tcfagent/Config.in
new file mode 100644
index 0000000000..1374fdf88d
--- /dev/null
+++ b/package/tcfagent/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_TCFAGENT
+	bool "tcfagent"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # snmp++
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Target Communication Framework Agent is an example application
+	  using the Target Communication Framework Library.
+
+	  Target Communication Framework is universal, extensible, simple,
+	  lightweight, vendor agnostic framework for tools and targets to
+	  communicate for purpose of debugging, profiling, code patching and
+	  other device software development needs. tcf-agent is a daemon,
+	  which provides TCF services that can be used by local and remote clients.
+
+comment "tcfagent needs a toolchain w/ threads, C++, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tcfagent/S55tcfagent b/package/tcfagent/S55tcfagent
new file mode 100755
index 0000000000..b022d5eb92
--- /dev/null
+++ b/package/tcfagent/S55tcfagent
@@ -0,0 +1,47 @@
+#!/bin/sh
+#
+# Start tcf-agent....
+#
+
+DAEMON_PATH=/usr/sbin/tcf-agent
+DAEMON_NAME=tcf-agent
+DAEMON_ARGS="-d -L- -l0"
+
+PIDFILE=/var/run/$DAEMON_NAME.pid
+[ ! -r /etc/default/$DAEMON_NAME ] || . /etc/default/$DAEMON_NAME
+
+start() {
+      printf "Starting $DAEMON_NAME: "
+      start-stop-daemon -S -q -o \
+      -x $DAEMON_PATH -- $DAEMON_ARGS &&
+        PPID=$(pidof $(basename $DAEMON_PATH)) &&
+        echo $PPID > $PIDFILE
+
+      [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+  printf "Stopping $DAEMON_NAME: "
+  start-stop-daemon -K -o -s HUP -q -p $PIDFILE \
+        -x $DAEMON_PATH &&
+        rm -f $PIDFILE
+  [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+    start)
+  start
+  ;;
+    stop)
+  stop
+  ;;
+    restart|reload)
+  stop
+  start
+  ;;
+  *)
+  echo "Usage: $0 {start|stop|restart}"
+  exit 1
+esac
+
+exit $?
diff --git a/package/tcfagent/tcfagent.hash b/package/tcfagent/tcfagent.hash
new file mode 100644
index 0000000000..ffed5dcb19
--- /dev/null
+++ b/package/tcfagent/tcfagent.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  47d34c0778aa8b9e2c26132c9bb03d643bfb8e44d03ce862d06f2f93edcb63ae  org.eclipse.tcf.agent-1.3.0.tar.gz
+sha256  34188fd2daeadf6574071f5004f9a7a55b3ac73efe9db203a01559ee1013b2db  org.eclipse.tcf.agent-1.4_neon.tar.gz
+sha256  4b6c757e2bed92a0a791d0687425d462c974abe4c79f80e27e362fdaa59107f5  org.eclipse.tcf.agent-1.5_oxygen.tar.gz
diff --git a/package/tcfagent/tcfagent.mk b/package/tcfagent/tcfagent.mk
new file mode 100644
index 0000000000..30bd366137
--- /dev/null
+++ b/package/tcfagent/tcfagent.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# TCFAGENT
+#
+################################################################################
+
+TCFAGENT_VERSION = 1.5_oxygen
+# the tar.xz link was broken the time this file got authored
+TCFAGENT_SOURCE = org.eclipse.tcf.agent-$(TCFAGENT_VERSION).tar.gz
+TCFAGENT_SITE = http://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/snapshot
+# see https://wiki.spdx.org/view/Legal_Team/License_List/Licenses_Under_Consideration
+TCFAGENT_LICENSE = BSD-3-Clause
+TCFAGENT_LICENSE_FILES = agent/edl-v10.html
+
+TCFAGENT_DEPENDENCIES = util-linux
+TCFAGENT_SUBDIR = agent
+TCFAGENT_CONF_OPTS = -DBUILD_SHARED_LIBS=Off
+
+define TCFAGENT_RENAME_AGENT
+	mv $(TARGET_DIR)/usr/bin/agent $(TARGET_DIR)/usr/sbin/tcf-agent
+endef
+
+TCFAGENT_POST_INSTALL_TARGET_HOOKS += TCFAGENT_RENAME_AGENT
+
+define TCFAGENT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/tcfagent/tcfagent.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/tcfagent.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/tcfagent.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/tcfagent.service
+endef
+
+define TCFAGENT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/tcfagent/S55tcfagent \
+		$(TARGET_DIR)/etc/init.d/S55tcfagent
+endef
+
+$(eval $(cmake-package))
diff --git a/package/tcfagent/tcfagent.service b/package/tcfagent/tcfagent.service
new file mode 100644
index 0000000000..2f57fca3c8
--- /dev/null
+++ b/package/tcfagent/tcfagent.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Target Communication Framework Agent
+After=network.target
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/tcf-agent -L- -l0
+
+[Install]
+WantedBy=multi-user.target
-- 
2.15.0
