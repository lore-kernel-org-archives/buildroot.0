From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 22:16:17 +0200
Subject: [Buildroot] [git commit] package/postgresql: add configure and
 includedir-server output to pg_config
Message-ID: <20201008210211.5831A881AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=787ad0b35d0d5d38b5e3da473fb861f903ba65bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some external packages call pg_config to determine the installed
PostgreSQL server includedir and configure options. Add this output to
Buildroots own pg_config, so these packages correctly compile.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/pg_config     | 8 +++++++-
 package/postgresql/postgresql.mk | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/postgresql/pg_config b/package/postgresql/pg_config
index 642252f27f..59a9e6cfad 100644
--- a/package/postgresql/pg_config
+++ b/package/postgresql/pg_config
@@ -11,12 +11,18 @@ case "$1" in
   --includedir)
 	echo "$prefix/include"
 	;;
+  --includedir-server)
+	echo "$prefix/include/postgresql/server"
+	;;
   --libdir)
 	echo "$prefix/lib"
 	;;
   --version)
 	echo "PostgreSQL @POSTGRESQL_VERSION@"
 	;;
+  --configure)
+	echo "@POSTGRESQL_CONF_OPTIONS@"
+	;;
   *)
-	echo "Usage: $0 {--includedir|--libdir|--version}"
+	echo "Usage: $0 {--includedir|--includedir-server|--libdir|--version|--configure}"
 esac
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 18c7b2ade4..3630b5a385 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -115,6 +115,7 @@ POSTGRESQL_POST_INSTALL_TARGET_HOOKS += POSTGRESQL_INSTALL_TARGET_FIXUP
 define POSTGRESQL_INSTALL_CUSTOM_PG_CONFIG
 	$(INSTALL) -m 0755 -D package/postgresql/pg_config \
 		$(STAGING_DIR)/usr/bin/pg_config
+	$(SED) "s|@POSTGRESQL_CONF_OPTIONS@|$(POSTGRESQL_CONF_OPTS)|g" $(STAGING_DIR)/usr/bin/pg_config
 	$(SED) "s|@POSTGRESQL_VERSION@|$(POSTGRESQL_VERSION)|g" $(STAGING_DIR)/usr/bin/pg_config
 endef
 
