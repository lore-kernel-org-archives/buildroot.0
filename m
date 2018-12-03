From: Jared Bents <Jared.Bents@collins.com>
Date: Mon,  3 Dec 2018 08:34:18 -0600
Subject: [Buildroot] [next v3 1/1] package/proftpd: add mod_sql_sqlite
Message-ID: <20181203143418.5153-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable mod_sql_sqlite as a compile time option

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
[v1->v2]: Update for sqlite dependency
[v2->v3]: Update help info from mode_* to mod_* per request
          from <ryan.barnett@collins.com>
---
 package/proftpd/Config.in  | 14 ++++++++++++--
 package/proftpd/proftpd.mk |  5 +++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index b615a5ff4c..7c57fed35a 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -29,12 +29,22 @@ config BR2_PACKAGE_PROFTPD_MOD_SFTP
 config BR2_PACKAGE_PROFTPD_MOD_SQL
 	bool "mod_sql support"
 	help
-	  Compile ProFTPD with mode_sql support.
+	  Compile ProFTPD with mod_sql support.
+
+if BR2_PACKAGE_PROFTPD_MOD_SQL
+
+config BR2_PACKAGE_PROFTPD_MOD_SQL_SQLITE
+	bool "mod_sql_sqlite support"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Compile ProFTPD with mod_sql_sqlite support.
+
+endif
 
 config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
 	bool "mod_quotatab support"
 	help
-	  Compile ProFTPD with mode_quotatab support. This module
+	  Compile ProFTPD with mod_quotatab support. This module
 	  is required in order to support quota tables:
 	        1. mod_quotatab_file
 	        2. mod_quotatab_ldap
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 8f3ff5088e..dd71c51e7e 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -46,6 +46,11 @@ ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SQL),y)
 PROFTPD_MODULES += mod_sql
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SQL_SQLITE),y)
+PROFTPD_MODULES += mod_sql_sqlite
+PROFTPD_DEPENDENCIES += sqlite
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB),y)
 PROFTPD_MODULES += mod_quotatab
 endif
-- 
2.18.0
