From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Date: Wed, 17 Feb 2016 16:23:03 +0530
Subject: [Buildroot] [PATCH v2 1/1] jsen: new package JSEN (JSON Sentinel)
	validates your JSON objects using JSON-Schema.
Message-ID: <1455706383-8951-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes v1->v2
-Added the jsen under the javascript menu(as suggested by Thomas).
-Updated the loop for retrieving the JSEN directories.

Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
---
 package/Config.in      |  1 +
 package/jsen/Config.in |  6 ++++++
 package/jsen/jsen.hash |  2 ++
 package/jsen/jsen.mk   | 20 ++++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/jsen/Config.in
 create mode 100644 package/jsen/jsen.hash
 create mode 100644 package/jsen/jsen.mk

diff --git a/package/Config.in b/package/Config.in
index a5b31aa..1e511de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -985,6 +985,7 @@ menu "External jQuery plugins"
 endmenu
 endif
 	source "package/jsmin/Config.in"
+	source "package/jsen/Config.in"
 	source "package/json-javascript/Config.in"
 endmenu
 
diff --git a/package/jsen/Config.in b/package/jsen/Config.in
new file mode 100644
index 0000000..8c41a19
--- /dev/null
+++ b/package/jsen/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JSEN
+	bool "jsen"
+	help
+	  JSEN (JSON Sentinel) validates your JSON objects using JSON-Schema.
+
+	  https://github.com/bugventure/jsen
diff --git a/package/jsen/jsen.hash b/package/jsen/jsen.hash
new file mode 100644
index 0000000..fdfcd93
--- /dev/null
+++ b/package/jsen/jsen.hash
@@ -0,0 +1,2 @@
+# Locally Computed
+sha256  651b3ae5c92865705c144175a8297305788a0e9a1f46ee9b8caa127c6bce6709  jsen-v0.6.0.tar.gz
diff --git a/package/jsen/jsen.mk b/package/jsen/jsen.mk
new file mode 100644
index 0000000..f5949aa
--- /dev/null
+++ b/package/jsen/jsen.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# jsen
+#
+################################################################################
+
+JSEN_VERSION = v0.6.0
+JSEN_SITE = $(call github,bugventure,jsen,$(JSEN_VERSION))
+JSEN_LICENSE = MIT
+JSEN_LICENSE_FILES = LICENSE
+JSEN_DIRECTORIES_LIST = dist lib
+JSEN_ROOT_FILES_LIST = index.js
+
+define JSEN_INSTALL_TARGET_CMDS
+        mkdir -p $(TARGET_DIR)/usr/share/jsen
+        $(foreach d,dist lib index.js,\
+                cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/jsen/$(sep))
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
