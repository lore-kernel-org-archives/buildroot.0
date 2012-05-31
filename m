From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 May 2012 22:50:37 -0400
Subject: [Buildroot] [PATCH] New package: cJSON
Message-ID: <1338432637-10766-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/Config.in       |    1 +
 package/cjson/Config.in |    7 +++++++
 package/cjson/cjson.mk  |   44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/cjson/Config.in
 create mode 100644 package/cjson/cjson.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..40c8f8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -454,6 +454,7 @@ source "package/slang/Config.in"
 endmenu
 
 menu "JSON/XML"
+source "package/cjson/Config.in"
 source "package/expat/Config.in"
 source "package/ezxml/Config.in"
 source "package/json-c/Config.in"
diff --git a/package/cjson/Config.in b/package/cjson/Config.in
new file mode 100644
index 0000000..ff90074
--- /dev/null
+++ b/package/cjson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CJSON
+	bool "cJSON"
+	help
+	  An ultra-lightweight, portable, single-file, simple-as-can-be ANSI-C
+	  compliant JSON parser, under MIT license.
+
+	  http://cjson.sourceforge.net/
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
new file mode 100644
index 0000000..d02452f
--- /dev/null
+++ b/package/cjson/cjson.mk
@@ -0,0 +1,44 @@
+#############################################################
+#
+# cjson
+#
+#############################################################
+CJSON_VERSION         = undefined
+CJSON_SOURCE          = cJSONFiles.zip
+CJSON_SITE            = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/cjson/
+CJSON_INSTALL_STAGING = YES
+CJSON_INSTALL_TARGET  = YES
+
+CJSON_ARCHIVE_DIR = cJSON
+
+define CJSON_EXTRACT_CMDS
+	unzip -o -q -d $(@D) $(DL_DIR)/$(CJSON_SOURCE)
+endef
+
+define CJSON_BUILD_CMDS
+	cd $(@D)/$(CJSON_ARCHIVE_DIR) && $(TARGET_CC) -Wall -O2 -shared -fpic cJSON.c -o libcJSON.so
+endef
+
+define CJSON_INSTALL_STAGING_CMDS
+	$(INSTALL) -D $(@D)/$(CJSON_ARCHIVE_DIR)/cJSON.h $(STAGING_DIR)/usr/include/cJSON.h
+	$(INSTALL) -D $(@D)/$(CJSON_ARCHIVE_DIR)/libcJSON.so $(STAGING_DIR)/usr/lib/libcJSON.so
+endef
+
+define CJSON_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/$(CJSON_ARCHIVE_DIR)/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
+endef
+
+define CJSON_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/lib/libcJSON.so
+	rm -f $(STAGING_DIR)/usr/include/cJSON.h
+endef
+
+define CJSON_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/libcJSON.so
+endef
+
+define CJSON_CLEAN_CMDS
+	cd $(@D)/$(CJSON_ARCHIVE_DIR) && rm -f libcJSON.so
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
