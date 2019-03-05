From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Mar 2019 10:00:15 -0000
Subject: [Buildroot] [git commit] package/optee-client: new package
Message-ID: <20190305095736.029058E504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59cc32513383f0c9af4e9cb634762cd56e985725
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OP-TEE client API library and supplicant daemon from the
OP-TEE project are packaged in package/optee-client. An init script
launches the tee-supplicant deamon. Package is added to the
Security menu of BR configuration.

This change references in Buildroot the today's latest OP-TEE
revision release tagged 3.4.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Thomas:
 - remove version selection
 - add dependency on !BR2_STATIC_LIBS, as it unconditionally builds a
   shared library]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/optee-client/Config.in         | 17 ++++++++++++
 package/optee-client/S30optee          | 49 ++++++++++++++++++++++++++++++++++
 package/optee-client/optee-client.hash |  4 +++
 package/optee-client/optee-client.mk   | 18 +++++++++++++
 6 files changed, 90 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1aee2cfcc2..4089f00acd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -689,6 +689,7 @@ F:	package/szip/
 
 N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
+F:	package/optee-client/
 
 N:	Eugene Tarassov <eugene@largest.net>
 F:	package/tcf-agent/
diff --git a/package/Config.in b/package/Config.in
index 3f968498f4..7c010e1d21 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2079,6 +2079,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/optee-client/Config.in"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
new file mode 100644
index 0000000000..db0b7b7f9f
--- /dev/null
+++ b/package/optee-client/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_OPTEE_CLIENT
+	bool "optee-client"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Enable the OP-TEE client package that brings non-secure
+	  client application resources for OP-TEE support. OP-TEE
+	  client is a component delivered by the OP-TEE project.
+
+	  The client API library allows application to invoke trusted
+	  applications hosted in the OP-TEE OS secure world.  The
+	  supplicant provides services hosted by the non-secure world
+	  and invoked by the secure world.
+
+	  https://github.com/OP-TEE/optee_client
+
+comment "optee-client needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/optee-client/S30optee b/package/optee-client/S30optee
new file mode 100644
index 0000000000..17e6d6d2b8
--- /dev/null
+++ b/package/optee-client/S30optee
@@ -0,0 +1,49 @@
+#!/bin/sh
+
+DAEMON="tee-supplicant"
+PIDFILE="/var/run/$DAEMON.pid"
+
+DAEMON_ARGS="-d /dev/teepriv0"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $DAEMON_ARGS
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
+        start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature (does not
+		# reconfigure/restart on SIGHUP, just closes all open files).
+		restart;;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
+esac
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
new file mode 100644
index 0000000000..0da25ced2d
--- /dev/null
+++ b/package/optee-client/optee-client.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_client/archive/3.4.0.tar.gz
+sha256 7c131a44f4d73acb8816fba88bcd7e6a18537f0a522ae426a20e2ca7dc46a6ec  optee-client-3.4.0.tar.gz
+# Locally computed
+sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
new file mode 100644
index 0000000000..0a9fafd0d3
--- /dev/null
+++ b/package/optee-client/optee-client.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# optee-client
+#
+################################################################################
+
+OPTEE_CLIENT_VERSION = 3.4.0
+OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
+OPTEE_CLIENT_LICENSE = BSD-2-Clause
+OPTEE_CLIENT_LICENSE_FILES = LICENSE
+OPTEE_CLIENT_INSTALL_STAGING = YES
+
+define OPTEE_CLIENT_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
+		$(TARGET_DIR)/etc/init.d/S30optee
+endef
+
+$(eval $(cmake-package))
