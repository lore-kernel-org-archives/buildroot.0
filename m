From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Date: Tue, 16 Feb 2016 12:18:13 +0530
Subject: [Buildroot] [PATCH 1/1] new package: jsen
Message-ID: <1455605293-1869-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

JSEN (JSON Sentinel) validates your JSON objects using JSON-Schema.

Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
---
 package/Config.in      |  1 +
 package/jsen/Config.in |  6 ++++++
 package/jsen/jsen.hash |  2 ++
 package/jsen/jsen.mk   | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/jsen/Config.in
 create mode 100644 package/jsen/jsen.hash
 create mode 100644 package/jsen/jsen.mk

diff --git a/package/Config.in b/package/Config.in
index a5b31aa..cb3a3c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -994,6 +994,7 @@ menu "JSON/XML"
 	source "package/expat/Config.in"
 	source "package/ezxml/Config.in"
 	source "package/jansson/Config.in"
+	source "package/jsen/Config.in"
 	source "package/json-c/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
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
index 0000000..e939739
--- /dev/null
+++ b/package/jsen/jsen.mk
@@ -0,0 +1,32 @@
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
+	# Install required directories
+	for dir in $(JSEN_DIRECTORIES_LIST); \
+	do \
+		$(INSTALL) -d $(TARGET_DIR)/usr/share/jsen/$$dir && \
+		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/jsen/$$dir \
+			$(@D)/$$dir/*.* || exit 1; \
+	done
+
+	# Install required files from the root directory
+	for file in $(JSEN_ROOT_FILES_LIST); \
+	do \
+		$(INSTALL) -D -m 0644 $(@D)/$$file \
+			$(TARGET_DIR)/usr/share/jsen/$$file \
+			|| exit 1; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
