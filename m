From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 19 Nov 2016 16:25:48 +0100
Subject: [Buildroot] [PATCH 1/2] cjson: bump to version v1.0.0
Message-ID: <1479569149-123944-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/cjson/Config.in  |  4 +---
 package/cjson/cjson.hash |  2 ++
 package/cjson/cjson.mk   | 22 +++-------------------
 3 files changed, 6 insertions(+), 22 deletions(-)
 create mode 100644 package/cjson/cjson.hash

diff --git a/package/cjson/Config.in b/package/cjson/Config.in
index bbe4c4a..04eff4c 100644
--- a/package/cjson/Config.in
+++ b/package/cjson/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_CJSON
 	bool "cJSON"
-	# For static build with cJSON.c directly see README
-	depends on !BR2_STATIC_LIBS
 	help
 	  An ultra-lightweight, portable, single-file, simple-as-can-be ANSI-C
 	  compliant JSON parser, under MIT license.
 
-	  http://cjson.sourceforge.net/
+	  https://github.com/DaveGamble/cJSON
diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
new file mode 100644
index 0000000..1fd6805
--- /dev/null
+++ b/package/cjson/cjson.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e49954e3b50f2257ab0c890b6151e794790ef7cce881426cb0e0e80037beabb4        cjson-v1.0.0.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 8f21ef8..46cf6a2 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,26 +4,10 @@
 #
 ################################################################################
 
-CJSON_VERSION = 58
-CJSON_SITE_METHOD = svn
-CJSON_SITE = http://svn.code.sf.net/p/cjson/code
+CJSON_VERSION = v1.0.0
+CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
 
-define CJSON_BUILD_CMDS
-	cd $(@D) && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC -lm \
-		cJSON.c -o libcJSON.so
-endef
-
-define CJSON_INSTALL_STAGING_CMDS
-	$(INSTALL) -D $(@D)/cJSON.h $(STAGING_DIR)/usr/include/cJSON.h
-	$(INSTALL) -D $(@D)/libcJSON.so $(STAGING_DIR)/usr/lib/libcJSON.so
-endef
-
-define CJSON_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/cJSON.h $(TARGET_DIR)/usr/include/cJSON.h
-	$(INSTALL) -D $(@D)/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.5.0
