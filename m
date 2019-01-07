From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon,  7 Jan 2019 11:24:53 +0100
Subject: [Buildroot] [PATCH v3 2/7] optee-client: new package
In-Reply-To: <1546856698-20032-1-git-send-email-etienne.carriere@linaro.org>
References: <1542996547-5003-1-git-send-email-etienne.carriere@linaro.org>
 <1546856698-20032-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1546856698-20032-2-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OP-TEE client API library and supplicant daemon from the
OP-TEE project are packaged in package/optee-client. An init script
launches the tee-supplicant deamon. Package is added to the
Security menu of BR configuration.

This change references in Buildroot the today's latest OP-TEE
revision release tagged 3.3.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
  - Add an entry in file DEVELOPERS.
  - Clean Config.in layout and description sections.
  - Drop BR2_PACKAGE_OPTEE_CLIENT_SYNCED_VERSION.
  - Clean optee-client.mk layout.
  - Remove OPTEE_CLIENT_INSTALL_STAGING indirection.
  - Replace optee-client.hash with per-version optee-client.hash files.
  - Support the released 3.x tags from OP-TEE project.
  - Correct license tag (client is BSD-2-Clause instead of BSD-3-Clause).
  - Rewrite the init script to use start-stop-daemon

Changes v1 -> v2:
  - Add option BR2_PACKAGE_OPTEE_CLIENT_SYNCED_VERSION to ensure
    OP-TEE client version is synced with OP-TEE OS version when
    the later if enabled.
  - Remove useless OPTEE_CLIENT_INSTALL_IMAGE=YES.

---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/optee-client/3.3.0/optee-client.hash |  4 ++
 package/optee-client/Config.in               | 55 ++++++++++++++++++++++++++++
 package/optee-client/S30optee                | 49 +++++++++++++++++++++++++
 package/optee-client/optee-client.mk         | 25 +++++++++++++
 6 files changed, 135 insertions(+)
 create mode 100644 package/optee-client/3.3.0/optee-client.hash
 create mode 100644 package/optee-client/Config.in
 create mode 100644 package/optee-client/S30optee
 create mode 100644 package/optee-client/optee-client.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 83c0ec8..0810e63 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -683,6 +683,7 @@ F:	package/szip/
 
 N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
+F:	package/optee-client/
 
 N:	Eugene Tarassov <eugene@largest.net>
 F:	package/tcf-agent/
diff --git a/package/Config.in b/package/Config.in
index 0df9b73..277a855 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2076,6 +2076,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/optee-client/Config.in"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
diff --git a/package/optee-client/3.3.0/optee-client.hash b/package/optee-client/3.3.0/optee-client.hash
new file mode 100644
index 0000000..ed7bf4e
--- /dev/null
+++ b/package/optee-client/3.3.0/optee-client.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_client/archive/3.3.0.tar.gz
+sha256 63af1567fdcdbe28b45be274266a89aa81bef3d0fd8ec5a6eb680046a92e1177  optee-client-3.3.0.tar.gz
+# Locally computed
+sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
new file mode 100644
index 0000000..b893a39
--- /dev/null
+++ b/package/optee-client/Config.in
@@ -0,0 +1,55 @@
+config BR2_PACKAGE_OPTEE_CLIENT
+	bool "optee-client"
+	help
+	  Enable the OP-TEE client package that brings non-secure
+	  client application resources for OP-TEE support. OP-TEE
+	  client is a component delivered by the OP-TEE project.
+
+	  The client API library allows application to invoke
+	  trusted applications hosted in the OP-TEE OS secure world.
+	  The supplicant provides services hosted by the non-secure
+	  world and invoked by the secure world.
+
+	  https://github.com/OP-TEE/optee_client
+
+if BR2_PACKAGE_OPTEE_CLIENT
+
+choice
+	prompt "version"
+	default BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	help
+	  Select the version of OP-TEE client you want to use
+
+config BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	bool "3.3.0"
+	help
+	  This fetches the registered release tag from the
+	  OP-TEE official Git repository.
+
+config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  Sync with a specific OP-TEE Git repository.
+
+endchoice
+
+if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT
+
+config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by
+	  Git E.G. a sha id, a tag, branch, ..
+
+endif
+
+config BR2_PACKAGE_OPTEE_CLIENT_VERSION
+	string
+	default "3.3.0"	if BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	default BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_VERSION \
+			if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT
+
+endif #BR2_PACKAGE_OPTEE_CLIENT
diff --git a/package/optee-client/S30optee b/package/optee-client/S30optee
new file mode 100644
index 0000000..17e6d6d
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
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
new file mode 100644
index 0000000..5cd741b
--- /dev/null
+++ b/package/optee-client/optee-client.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# optee-client
+#
+################################################################################
+
+OPTEE_CLIENT_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_VERSION))
+OPTEE_CLIENT_LICENSE = BSD-2-Clause
+OPTEE_CLIENT_LICENSE_FILES = LICENSE
+OPTEE_CLIENT_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT),y)
+OPTEE_CLIENT_SITE = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_URL))
+OPTEE_CLIENT_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(OPTEE_CLIENT_SOURCE)
+else
+OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
+endif
+
+define OPTEE_CLIENT_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
+		$(TARGET_DIR)/etc/init.d/S30optee
+endef
+
+$(eval $(cmake-package))
-- 
1.9.1
