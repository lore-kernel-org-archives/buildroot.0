From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 17 Mar 2016 15:00:08 +0100
Subject: [Buildroot] [PATCH 1/1] owncloud: new package
Message-ID: <1458223208-7133-1-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add package owncloud 9.0.0: http://www.owncloud.org
Copy static files to /usr/lib/owncloud and dynamic files to
/var/lib/owncloud.

owncloud needs php, mysql and a webserver. MySQL and the webserver
can be provided by different packages therefore no specific
dependency is set.

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
---
 package/Config.in              |  1 +
 package/owncloud/Config.in     |  9 +++++++++
 package/owncloud/owncloud.hash |  3 +++
 package/owncloud/owncloud.mk   | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/owncloud/Config.in
 create mode 100644 package/owncloud/owncloud.hash
 create mode 100644 package/owncloud/owncloud.mk

diff --git a/package/Config.in b/package/Config.in
index 2401867..eeaa791 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1453,6 +1453,7 @@ endif
 	source "package/openssh/Config.in"
 	source "package/openswan/Config.in"
 	source "package/openvpn/Config.in"
+	source "package/owncloud/Config.in"
 	source "package/p910nd/Config.in"
 	source "package/phidgetwebservice/Config.in"
 	source "package/portmap/Config.in"
diff --git a/package/owncloud/Config.in b/package/owncloud/Config.in
new file mode 100644
index 0000000..8fe18de
--- /dev/null
+++ b/package/owncloud/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OWNCLOUD
+	bool "owncloud"
+	depends on BR2_PACKAGE_PHP	 # runtime
+	help
+	  OwnCloud is a web app for accessing and sharing your files,
+	  calendars, contacts, mail and more.
+
+comment "OwnCloud needs PHP"
+    depends on !BR2_PACKAGE_PHP
diff --git a/package/owncloud/owncloud.hash b/package/owncloud/owncloud.hash
new file mode 100644
index 0000000..c40c87f
--- /dev/null
+++ b/package/owncloud/owncloud.hash
@@ -0,0 +1,3 @@
+# Hashes from: https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2.{md5,sha256}
+md5	 1f14d7f2faa0ba704901e062301854db					owncloud-9.0.0.tar.bz2
+sha256	 d16737510a77a81489f7c4d5e19b0756fa2ea1c5081ba174b0fec0f00da3a77c	owncloud-9.0.0.tar.bz2
diff --git a/package/owncloud/owncloud.mk b/package/owncloud/owncloud.mk
new file mode 100644
index 0000000..ff9e105
--- /dev/null
+++ b/package/owncloud/owncloud.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# owncloud
+#
+################################################################################
+
+OWNCLOUD_VERSION = 9.0.0
+OWNCLOUD_SOURCE = owncloud-$(OWNCLOUD_VERSION).tar.bz2
+OWNCLOUD_SITE = https://download.owncloud.org/community
+OWNCLOUD_DEPENDENCIES =
+OWNCLOUD_LICENSE = AGPL
+OWNCLOUD_LICENSE_FILES = COPYING-AGPL
+
+define OWNCLOUD_INSTALL_TARGET_CMDS
+	#install files /usr/lib
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -a $(@D) $(TARGET_DIR)/usr/lib/owncloud
+	#move dynamic files in /var/lib and make symbolic links
+	mkdir -p $(TARGET_DIR)/var/lib/owncloud
+	mkdir -p $(TARGET_DIR)/var/lib/owncloud/data
+	mv $(TARGET_DIR)/usr/lib/owncloud/config $(TARGET_DIR)/var/lib/owncloud/
+	mv $(TARGET_DIR)/usr/lib/owncloud/apps $(TARGET_DIR)/var/lib/owncloud/
+	#use relative path so that permissions can be set by OWNCLOUD_PERMISSIONS hook
+	ln -s ../../../var/lib/owncloud/data $(TARGET_DIR)/usr/lib/owncloud/data
+	ln -s ../../../var/lib/owncloud/config $(TARGET_DIR)/usr/lib/owncloud/config
+	ln -s ../../../var/lib/owncloud/apps $(TARGET_DIR)/usr/lib/owncloud/apps
+endef
+
+define OWNCLOUD_PERMISSIONS
+	/usr/lib/owncloud r -1 root root - - - - -
+	/var/lib/owncloud r -1 www-data www-data - - - - -
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
