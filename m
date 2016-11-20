From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Nov 2016 18:22:24 +0100
Subject: [Buildroot] [PATCH v2,1/2] cjson: bump to version v1.0.1
Message-ID: <1479662545-64029-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v1 -> v2 (after review of Danomi Manchego):
 - Retrieve cjson version v1.0.1 instead of v1.0.0
 
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
index 0000000..6316f5c
--- /dev/null
+++ b/package/cjson/cjson.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  3686b4edcd8ec944e7f9cd9b2bb1a2acf265edc8ebbde94f50c8e5dc802fa157        cjson-v1.0.1.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 8f21ef8..c7f5659 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,26 +4,10 @@
 #
 ################################################################################
 
-CJSON_VERSION = 58
-CJSON_SITE_METHOD = svn
-CJSON_SITE = http://svn.code.sf.net/p/cjson/code
+CJSON_VERSION = v1.0.1
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
