From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 17:53:28 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/postgresql: add
 configure and includedir-server output to pg_config
Message-ID: <20201011160119.00F6D877BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec5d9ab6fc80b72454c0f419d73bd96604ce064f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Some external packages call pg_config to determine the installed
PostgreSQL server includedir and configure options. Add this output to
Buildroots own pg_config, so these packages correctly compile.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 787ad0b35d0d5d38b5e3da473fb861f903ba65bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
