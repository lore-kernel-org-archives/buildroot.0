From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 22 Nov 2018 16:22:54 +0100
Subject: [Buildroot] [PATCH 2/5] optee-client: new package
In-Reply-To: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
References: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1542900177-17343-2-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OP-TEE client API library and supplicant daemon from the
OP-TEE project.

The package is added to the Security menu of BR configuration.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/Config.in                      |  1 +
 package/optee-client/Config.in         | 62 ++++++++++++++++++++++++++++++++++
 package/optee-client/S30optee          | 26 ++++++++++++++
 package/optee-client/optee-client.hash |  4 +++
 package/optee-client/optee-client.mk   | 31 +++++++++++++++++
 5 files changed, 124 insertions(+)
 create mode 100644 package/optee-client/Config.in
 create mode 100644 package/optee-client/S30optee
 create mode 100644 package/optee-client/optee-client.hash
 create mode 100644 package/optee-client/optee-client.mk

diff --git a/package/Config.in b/package/Config.in
index b60e770..8c3b1bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2047,6 +2047,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/optee-client/Config.in"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
new file mode 100644
index 0000000..c3f28c1
--- /dev/null
+++ b/package/optee-client/Config.in
@@ -0,0 +1,62 @@
+config BR2_PACKAGE_OPTEE_CLIENT
+	bool "Embed OP-TEE client"
+	help
+	  Enable the OP-TEE client package that brings non-secure
+	  client application resources for OP-TEE support. OP-TEE
+	  client is a component delivered by the OP-TEE project.
+
+	  https://github.com/OP-TEE/optee_client
+
+	  The client API library allows application to invoke
+	  trusted applications hosted in the OP-TEE OS secure world.
+	  The supplicant provides services hosted by the non-secure
+	  world and invoked by the secure world.
+
+if BR2_PACKAGE_OPTEE_CLIENT
+
+choice
+	prompt "OP-TEE client version"
+	default BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	help
+	  Select the version of OP-TEE client you want to use
+
+config BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	bool "sync with latest registered release tag"
+	help
+	  Sync on latest release tag. This currently fetches the
+	  latest registered release tag from the OP-TEE official
+	  Git repository.
+
+config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT
+	bool "sync with a specific Git"
+	help
+	  Sync with a specific OP-TEE Git repository.
+
+endchoice
+
+config BR2_PACKAGE_OPTEE_CLIENT_VERSION
+	string
+	default "3.3.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	default BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_VERSION \
+				if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT
+	help
+	  Reference in the target Git repository to sync with.
+
+if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT
+
+config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_URL
+	string "Git repository site"
+	help
+	  Specific location of the reference source tree Git
+	  repository.
+
+config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_VERSION
+	string "target reference to pull in the Git repository"
+	help
+	  Package version reference to sync with. As source file
+	  reference is a Git repository, the version reference can
+	  be any Git reference as a tag or a sha1.
+
+endif
+
+endif #BR2_PACKAGE_OPTEE_CLIENT
diff --git a/package/optee-client/S30optee b/package/optee-client/S30optee
new file mode 100644
index 0000000..c893243
--- /dev/null
+++ b/package/optee-client/S30optee
@@ -0,0 +1,26 @@
+#!/bin/sh
+#
+# /etc/init.d/optee
+#
+# Start/stop tee-supplicant (OP-TEE normal world daemon)
+#
+case "$1" in
+    start)
+	if [ -e /usr/sbin/tee-supplicant -a -e /dev/teepriv0 ]; then
+		echo "Starting tee-supplicant..."
+		/usr/sbin/tee-supplicant &
+		exit 0
+	else
+		echo "tee-supplicant or TEE device not found"
+		exit 1
+	fi
+
+        ;;
+    stop)
+	killall tee-supplicant
+	;;
+    status)
+	cat /dev/teepriv0 2>&1 | grep -q "Device or resource busy" || not="not "
+	echo "tee-supplicant is ${not}active"
+	;;
+esac
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
new file mode 100644
index 0000000..ed7bf4e
--- /dev/null
+++ b/package/optee-client/optee-client.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_client/archive/3.3.0.tar.gz
+sha256 63af1567fdcdbe28b45be274266a89aa81bef3d0fd8ec5a6eb680046a92e1177  optee-client-3.3.0.tar.gz
+# Locally computed
+sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
new file mode 100644
index 0000000..e856ca5
--- /dev/null
+++ b/package/optee-client/optee-client.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# optee-client
+#
+################################################################################
+
+OPTEE_CLIENT_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_VERSION))
+OPTEE_CLIENT_LICENSE = BSD-3-Clause
+OPTEE_CLIENT_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT),y)
+OPTEE_CLIENT_SITE = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_URL))
+OPTEE_CLIENT_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(OPTEE_CLIENT_SOURCE)
+else
+OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
+endif
+
+define OPTEE_CLIENT_INSTALL_SUPPLICANT_SCRIPT
+	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
+		$(TARGET_DIR)/etc/init.d/S30optee
+endef
+
+define OPTEE_CLIENT_INSTALL_INIT_SYSV
+	$(OPTEE_CLIENT_INSTALL_SUPPLICANT_SCRIPT)
+endef
+
+OPTEE_CLIENT_INSTALL_STAGING = YES
+OPTEE_CLIENT_INSTALL_IMAGES = YES
+
+$(eval $(cmake-package))
-- 
1.9.1
