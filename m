From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 23:03:31 +1300
Subject: [Buildroot] [git commit] jsmn: new package
Message-ID: <20170128100442.D3EC581938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8bd91bf8958b9644b9fe1965dd81b19507f0a7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
[Thomas:
 - fix license, it's MIT, not BSD
 - use TARGET_CONFIGURE_OPTS instead of manually passing CC and AR
 - use full destination path
 - keep only sha256 hash
 - rewrap Config.in help text]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |  1 +
 package/jsmn/Config.in |  8 ++++++++
 package/jsmn/jsmn.hash |  2 ++
 package/jsmn/jsmn.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0dded56..6ce19df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1126,6 +1126,7 @@ menu "JSON/XML"
 	source "package/expat/Config.in"
 	source "package/ezxml/Config.in"
 	source "package/jansson/Config.in"
+	source "package/jsmn/Config.in"
 	source "package/json-c/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
diff --git a/package/jsmn/Config.in b/package/jsmn/Config.in
new file mode 100644
index 0000000..ab14273
--- /dev/null
+++ b/package/jsmn/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_JSMN
+	bool "jsmn"
+	help
+	  jsmn (pronounced like 'jasmine') is a minimalistic JSON
+	  parser in C. It can be easily integrated into
+	  resource-limited or embedded projects.
+
+	  https://github.com/zserge/jsmn/
diff --git a/package/jsmn/jsmn.hash b/package/jsmn/jsmn.hash
new file mode 100644
index 0000000..91f6420
--- /dev/null
+++ b/package/jsmn/jsmn.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  e08993848b2abab62aa9572a560bb6e5ed4762f8537cd67c4de6cb17e17090a0    jsmn-6021415cc75e7922d45b12935f56348b064d8a7f.tar.gz
diff --git a/package/jsmn/jsmn.mk b/package/jsmn/jsmn.mk
new file mode 100644
index 0000000..30dd9c8
--- /dev/null
+++ b/package/jsmn/jsmn.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# jsmn
+#
+################################################################################
+
+JSMN_VERSION = 6021415cc75e7922d45b12935f56348b064d8a7f
+JSMN_SITE = $(call github,zserge,jsmn,$(JSMN_VERSION))
+JSMN_LICENSE = MIT
+JSMN_LICENSE_FILES = LICENSE
+# static library only
+JSMN_INSTALL_STAGING = YES
+JSMN_INSTALL_TARGET = NO
+
+define JSMN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define JSMN_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0644 $(@D)/libjsmn.a $(STAGING_DIR)/usr/lib/libjsmn.a
+	$(INSTALL) -m 0644 $(@D)/jsmn.h $(STAGING_DIR)/usr/include/jsmn.h
+endef
+
+$(eval $(generic-package))
