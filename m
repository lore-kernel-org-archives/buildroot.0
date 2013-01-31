From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Jan 2013 22:26:37 -0500
Subject: [Buildroot] [PATCH] cjson: change source to svn repo
Message-ID: <1359602797-4498-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original cJSON submittal downloaded a .zip file from SourceForge.
The .zip file did not have a version number, making it impossible
to gaurantee that the same archive is downloaded on any given build.
It also required a custom EXTRACT command.

This patch changes the source for cJSON to the svn repository
listed on the sf project web page - giving us an actual version
number, and letting us use buildroot's normal extraction functionality.
---
 package/cjson/cjson.mk |   22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 55af800..3722adb 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -3,28 +3,24 @@
 # cjson
 #
 #############################################################
-CJSON_VERSION         = undefined
-CJSON_SOURCE          = cJSONFiles.zip
-CJSON_SITE            = http://downloads.sourceforge.net/project/cjson
+CJSON_VERSION         = 42
+CJSON_SITE_METHOD     = svn
+CJSON_SITE            = https://cjson.svn.sourceforge.net/svnroot/cjson
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE         = MIT
 
-define CJSON_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(CJSON_SOURCE)
-endef
-
 define CJSON_BUILD_CMDS
-	cd $(@D)/cJSON && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC cJSON.c -o libcJSON.so
+	cd $(@D) && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC cJSON.c -o libcJSON.so
 endef
 
 define CJSON_INSTALL_STAGING_CMDS
-	$(INSTALL) -D $(@D)/cJSON/cJSON.h $(STAGING_DIR)/usr/include/cJSON.h
-	$(INSTALL) -D $(@D)/cJSON/libcJSON.so $(STAGING_DIR)/usr/lib/libcJSON.so
+	$(INSTALL) -D $(@D)/cJSON.h $(STAGING_DIR)/usr/include/cJSON.h
+	$(INSTALL) -D $(@D)/libcJSON.so $(STAGING_DIR)/usr/lib/libcJSON.so
 endef
 
 define CJSON_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/cJSON/cJSON.h $(TARGET_DIR)/usr/include/cJSON.h
-	$(INSTALL) -D $(@D)/cJSON/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
+	$(INSTALL) -D $(@D)/cJSON.h $(TARGET_DIR)/usr/include/cJSON.h
+	$(INSTALL) -D $(@D)/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
 endef
 
 define CJSON_UNINSTALL_STAGING_CMDS
@@ -38,7 +34,7 @@ define CJSON_UNINSTALL_TARGET_CMDS
 endef
 
 define CJSON_CLEAN_CMDS
-	cd $(@D)/cJSON && rm -f libcJSON.so
+	rm -f $(@D)/libcJSON.so
 endef
 
 $(eval $(generic-package))
-- 
1.7.9.5
