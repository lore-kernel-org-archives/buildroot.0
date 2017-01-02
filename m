From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 11:49:19 +0100
Subject: [Buildroot] [PATCH 1/1] jsmn: new package
In-Reply-To: <1483354166-8331-1-git-send-email-david.bachelart@bbright.com>
References: <1483354166-8331-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483354166-8331-2-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in      |  1 +
 package/jsmn/Config.in |  7 +++++++
 package/jsmn/jsmn.hash |  4 ++++
 package/jsmn/jsmn.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/jsmn/Config.in
 create mode 100644 package/jsmn/jsmn.hash
 create mode 100644 package/jsmn/jsmn.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..69e956c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1096,6 +1096,7 @@ menu "JSON/XML"
 	source "package/expat/Config.in"
 	source "package/ezxml/Config.in"
 	source "package/jansson/Config.in"
+	source "package/jsmn/Config.in"
 	source "package/json-c/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
diff --git a/package/jsmn/Config.in b/package/jsmn/Config.in
new file mode 100644
index 0000000..23d20f5
--- /dev/null
+++ b/package/jsmn/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_JSMN
+	bool "jsmn"
+	help
+	  jsmn (pronounced like 'jasmine') is a minimalistic JSON parser in C. It can 
+	  be easily integrated into resource-limited or embedded projects.
+
+	  https://github.com/zserge/jsmn/
diff --git a/package/jsmn/jsmn.hash b/package/jsmn/jsmn.hash
new file mode 100644
index 0000000..5cc51c3
--- /dev/null
+++ b/package/jsmn/jsmn.hash
@@ -0,0 +1,4 @@
+# Locally computed
+md5 78e2731c5697a3c35795b6350402e015    jsmn-6021415cc75e7922d45b12935f56348b064d8a7f.tar.gz
+sha1    09b1a3493db6b1a77b03bc835aa9be6345db5269    jsmn-6021415cc75e7922d45b12935f56348b064d8a7f.tar.gz
+sha256  e08993848b2abab62aa9572a560bb6e5ed4762f8537cd67c4de6cb17e17090a0    jsmn-6021415cc75e7922d45b12935f56348b064d8a7f.tar.gz
diff --git a/package/jsmn/jsmn.mk b/package/jsmn/jsmn.mk
new file mode 100644
index 0000000..788694d
--- /dev/null
+++ b/package/jsmn/jsmn.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# jsmn
+#
+################################################################################
+
+JSMN_VERSION = 6021415cc75e7922d45b12935f56348b064d8a7f
+JSMN_SITE = $(call github,zserge,jsmn,$(JSMN_VERSION))
+JSMN_LICENSE = BSD
+JSMN_LICENSE_FILES = LICENSE
+
+JSMN_INSTALL_STAGING = YES
+
+define JSMN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		AR="$(TARGET_AR)"
+endef
+
+define JSMN_INSTALL_STAGING_CMDS
+    $(INSTALL) -m 0644 $(@D)/libjsmn.a $(STAGING_DIR)/usr/lib/
+    $(INSTALL) -m 0644 $(@D)/jsmn.h $(STAGING_DIR)/usr/include/
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
