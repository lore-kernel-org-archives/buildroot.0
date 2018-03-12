From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Mar 2018 06:12:30 -0400
Subject: [Buildroot] [PATCH v3 1/2] postgresql: add version output to
 pg_config
Message-ID: <20180312101231.2280-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some external packages call pg_config to determine the installed PostgreSQL
version. Add this output to Buildroots own pg_config, so these packages
correctly compile.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v3:
 - Added this patch to the series.

 package/postgresql/pg_config     | 5 ++++-
 package/postgresql/postgresql.mk | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/postgresql/pg_config b/package/postgresql/pg_config
index 85c0e63ddb..642252f27f 100644
--- a/package/postgresql/pg_config
+++ b/package/postgresql/pg_config
@@ -14,6 +14,9 @@ case "$1" in
   --libdir)
 	echo "$prefix/lib"
 	;;
+  --version)
+	echo "PostgreSQL @POSTGRESQL_VERSION@"
+	;;
   *)
-	echo "Usage: $0 {--includedir|--libdir}"
+	echo "Usage: $0 {--includedir|--libdir|--version}"
 esac
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index c6b689a146..94b3e60e59 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -84,6 +84,7 @@ POSTGRESQL_POST_INSTALL_TARGET_HOOKS += POSTGRESQL_INSTALL_TARGET_FIXUP
 define POSTGRESQL_INSTALL_CUSTOM_PG_CONFIG
 	$(INSTALL) -m 0755 -D package/postgresql/pg_config \
 		$(STAGING_DIR)/usr/bin/pg_config
+	$(SED) "s|@POSTGRESQL_VERSION@|$(POSTGRESQL_VERSION)|g" $(STAGING_DIR)/usr/bin/pg_config
 endef
 
 POSTGRESQL_POST_INSTALL_STAGING_HOOKS += POSTGRESQL_INSTALL_CUSTOM_PG_CONFIG
-- 
2.14.3
