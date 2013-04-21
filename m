From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:28:32 +0200
Subject: [Buildroot] [git commit] rapidjson: new package
Message-ID: <20130421213525.1B1C19B7A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5734f8d03524630f37fd09814605f3bd99b053b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/rapidjson/Config.in    |    6 ++++++
 package/rapidjson/rapidjson.mk |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 477cc85..06bcdef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -622,6 +622,7 @@ source "package/libxml2/Config.in"
 source "package/libxslt/Config.in"
 source "package/libyaml/Config.in"
 source "package/mxml/Config.in"
+source "package/rapidjson/Config.in"
 source "package/xerces/Config.in"
 source "package/yajl/Config.in"
 endmenu
diff --git a/package/rapidjson/Config.in b/package/rapidjson/Config.in
new file mode 100644
index 0000000..d442797
--- /dev/null
+++ b/package/rapidjson/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RAPIDJSON
+	bool "rapidjson"
+	help
+	  A fast JSON parser/generator for C++ with both SAX/DOM style API.
+
+	  https://code.google.com/p/rapidjson/
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
new file mode 100644
index 0000000..cc260e9
--- /dev/null
+++ b/package/rapidjson/rapidjson.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# rapidjson
+#
+#############################################################
+
+RAPIDJSON_VERSION = 0.11
+RAPIDJSON_SOURCE = rapidjson-$(RAPIDJSON_VERSION).zip
+RAPIDJSON_SITE = http://rapidjson.googlecode.com/files
+RAPIDJSON_LICENSE = MIT
+RAPIDJSON_LICENSE_FILES = license.txt
+RAPIDJSON_INSTALL_TARGET = NO
+RAPIDJSON_INSTALL_STAGING = YES
+
+define RAPIDJSON_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(RAPIDJSON_SOURCE)
+	mv $(@D)/rapidjson/* $(@D)
+	$(RM) -r $(@D)/rapidjson
+endef
+
+define RAPIDJSON_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/internal
+	$(INSTALL) -m 0644 $(@D)/include/rapidjson/*.h \
+		$(STAGING_DIR)/usr/include/rapidjson
+	$(INSTALL) -m 0644 $(@D)/include/rapidjson/internal/*.h \
+		$(STAGING_DIR)/usr/include/rapidjson/internal
+endef
+
+define RAPIDJSON_UNINSTALL_STAGING_CMDS
+	$(RM) -r $(STAGING_DIR)/usr/include/rapidjson
+endef
+
+$(eval $(generic-package))
