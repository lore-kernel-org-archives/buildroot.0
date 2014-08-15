From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 11:22:34 +0200
Subject: [Buildroot] [git commit branch/next] qt: add postgresql driver
	support
Message-ID: <20140815092504.02E949C769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c46aabad7aa7feec88201e9aeef836fe1297189
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Reviewed-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.sql.in |    6 +++++-
 package/qt/qt.mk         |    3 +++
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 259a574..fd62657 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -30,11 +30,15 @@ config BR2_PACKAGE_QT_ODBC
 
 config BR2_PACKAGE_QT_PSQL
 	bool "PostgreSQL Driver"
-	depends on BROKEN # libpgsql not in BR
+	select BR2_PACKAGE_POSTGRESQL
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Build PostgreSQL driver
 	  If unsure, say n.
 
+comment "PostgreSQL needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 choice
 	prompt "SQLite 3 support"
 	default BR2_PACKAGE_QT_SQLITE_NONE
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 880e835..92a090f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -343,6 +343,8 @@ QT_CONFIGURE_OPTS += -qt-sql-odbc
 endif
 ifeq ($(BR2_PACKAGE_QT_PSQL),y)
 QT_CONFIGURE_OPTS += -qt-sql-psql
+QT_CONFIGURE_ENV  += PSQL_LIBS=-L$(STAGING_DIR)/usr/lib
+QT_DEPENDENCIES   += postgresql
 endif
 ifeq ($(BR2_PACKAGE_QT_SQLITE_QT),y)
 QT_CONFIGURE_OPTS += -qt-sql-sqlite
@@ -503,6 +505,7 @@ define QT_CONFIGURE_CMDS
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
+		$(QT_CONFIGURE_ENV) \
 		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" ./configure \
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
