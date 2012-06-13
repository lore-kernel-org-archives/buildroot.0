From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jun 2012 08:44:41 +0200
Subject: [Buildroot] [git commit] New package: cJSON
Message-ID: <20120613071733.8363596F13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0bf0be438801bbd1f30031529493e6e01523d8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/cjson/Config.in |    7 +++++++
 package/cjson/cjson.mk  |   43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b3a2f80..ddb504a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -469,6 +469,7 @@ source "package/slang/Config.in"
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
index 0000000..f0e1fc4
--- /dev/null
+++ b/package/cjson/cjson.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# cjson
+#
+#############################################################
+CJSON_VERSION         = undefined
+CJSON_SOURCE          = cJSONFiles.zip
+CJSON_SITE            = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/cjson/
+CJSON_INSTALL_STAGING = YES
+
+define CJSON_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(CJSON_SOURCE)
+endef
+
+define CJSON_BUILD_CMDS
+	cd $(@D)/cJSON && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fpic cJSON.c -o libcJSON.so
+endef
+
+define CJSON_INSTALL_STAGING_CMDS
+	$(INSTALL) -D $(@D)/cJSON/cJSON.h $(STAGING_DIR)/usr/include/cJSON.h
+	$(INSTALL) -D $(@D)/cJSON/libcJSON.so $(STAGING_DIR)/usr/lib/libcJSON.so
+endef
+
+define CJSON_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/cJSON/cJSON.h $(STAGING_DIR)/usr/include/cJSON.h
+	$(INSTALL) -D $(@D)/cJSON/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
+endef
+
+define CJSON_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/include/cJSON.h
+	rm -f $(STAGING_DIR)/usr/lib/libcJSON.so
+endef
+
+define CJSON_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/include/cJSON.h
+	rm -f $(TARGET_DIR)/usr/lib/libcJSON.so
+endef
+
+define CJSON_CLEAN_CMDS
+	cd $(@D)/cJSON && rm -f libcJSON.so
+endef
+
+$(eval $(call GENTARGETS))
