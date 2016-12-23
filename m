From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 23 Dec 2016 22:30:30 +0100
Subject: [Buildroot] [PATCH 1/1] hiredis: new package
Message-ID: <1482528630-122180-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minimalistic C client for Redis >= 1.2

It is minimalistic because it just adds minimal support for
the protocol, but at the same time it uses a high level
printf-alike API in order to make it much higher level than
otherwise suggested by its minimal code base and the lack of
explicit bindings for every Redis command.

https://github.com/redis/hiredis

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in            |  1 +
 package/hiredis/Config.in    | 12 ++++++++++++
 package/hiredis/hiredis.hash |  2 ++
 package/hiredis/hiredis.mk   | 31 +++++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/hiredis/Config.in
 create mode 100644 package/hiredis/hiredis.hash
 create mode 100644 package/hiredis/hiredis.mk

diff --git a/package/Config.in b/package/Config.in
index b6b409c..df17dd6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -925,6 +925,7 @@ menu "Database"
 	source "package/berkeleydb/Config.in"
 	source "package/cppdb/Config.in"
 	source "package/gdbm/Config.in"
+	source "package/hiredis/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
 	source "package/libpqxx/Config.in"
diff --git a/package/hiredis/Config.in b/package/hiredis/Config.in
new file mode 100644
index 0000000..1656355
--- /dev/null
+++ b/package/hiredis/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HIREDIS
+	bool "hiredis"
+	help
+	  Minimalistic C client for Redis >= 1.2
+
+	  It is minimalistic because it just adds minimal support for
+	  the protocol, but at the same time it uses a high level
+	  printf-alike API in order to make it much higher level than
+	  otherwise suggested by its minimal code base and the lack of
+	  explicit bindings for every Redis command.
+
+	  https://github.com/redis/hiredis
diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
new file mode 100644
index 0000000..2c788a6
--- /dev/null
+++ b/package/hiredis/hiredis.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	717e6fc8dc2819bef522deaca516de9e51b9dfa68fe393b7db5c3b6079196f78	hiredis-v0.13.3.tar.gz
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
new file mode 100644
index 0000000..a747db4
--- /dev/null
+++ b/package/hiredis/hiredis.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# hiredis
+#
+################################################################################
+
+HIREDIS_VERSION = v0.13.3
+HIREDIS_SITE = $(call github,redis,hiredis,$(HIREDIS_VERSION))
+HIREDIS_LICENSE = BSD-3c
+HIREDIS_LICENSE_FILES = COPYING
+HIREDIS_INSTALL_STAGING = YES
+
+HIREDIS_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	PREFIX=/usr
+
+define HIREDIS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(HIREDIS_MAKE_OPTS) -C $(@D)
+endef
+
+define HIREDIS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(HIREDIS_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) install
+endef
+
+define HIREDIS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(HIREDIS_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
