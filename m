From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 13 Aug 2014 16:05:41 +0200
Subject: [Buildroot] [PATCH 1/1] qt5base: add postgresql driver support
Message-ID: <1407938742-25932-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/qt5/qt5base/Config.in  | 12 ++++++++++++
 package/qt5/qt5base/qt5base.mk |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 67f211c..12f983f 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -62,6 +62,18 @@ config BR2_PACKAGE_QT5BASE_MYSQL
 	help
 	  Build MySQL plugin
 	  If unsure, say n.
+
+config BR2_PACKAGE_QT5BASE_PSQL
+	bool "PostgreSQL Plugin"
+	select BR2_PACKAGE_POSTGRESQL
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Build PostgreSQL plugin
+	  If unsure, say n.
+
+comment "PostgreSQL needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 choice
 	prompt "SQLite 3 support"
 	default BR2_PACKAGE_QT5BASE_SQLITE_NONE
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 712208f..88e86c4 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -66,6 +66,14 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-sql-mysql
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_PSQL),y)
+QT5BASE_CONFIGURE_OPTS += -plugin-sql-psql
+QT5BASE_CONFIGURE_ENV  += PSQL_LIBS=-L$(STAGING_DIR)/usr/lib
+QT5BASE_DEPENDENCIES   += postgresql
+else
+QT5BASE_CONFIGURE_OPTS += -no-sql-psql
+endif
+
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_QT),-plugin-sql-sqlite)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),-system-sqlite)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),sqlite)
@@ -170,6 +178,7 @@ define QT5BASE_CONFIGURE_CMDS
 		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
+		$(QT5BASE_CONFIGURE_ENV) \
 		./configure \
 		-v \
 		-prefix /usr \
-- 
1.8.3.2
