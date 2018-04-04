From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:59:54 +0200
Subject: [Buildroot] [git commit] postgresql: add version output to pg_config
Message-ID: <20180404205959.F380683D03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8193cd84a56f5c8fe925c2c74271e474c191b6f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some external packages call pg_config to determine the installed PostgreSQL
version. Add this output to Buildroots own pg_config, so these packages
correctly compile.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
