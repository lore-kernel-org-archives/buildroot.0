From: Jared Bents <Jared.Bents@collins.com>
Date: Wed, 28 Nov 2018 08:14:02 -0600
Subject: [Buildroot] [next v2 1/1] package/proftpd: add mod_sql_sqlite
Message-ID: <20181128141402.11502-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable mod_sql_sqlite as a compile time option

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
[v1->v2]: Update for sqlite dependency
---
 package/proftpd/Config.in  | 10 ++++++++++
 package/proftpd/proftpd.mk |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index b615a5ff4c..14f5d566d3 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -31,6 +31,16 @@ config BR2_PACKAGE_PROFTPD_MOD_SQL
 	help
 	  Compile ProFTPD with mode_sql support.
 
+if BR2_PACKAGE_PROFTPD_MOD_SQL
+
+config BR2_PACKAGE_PROFTPD_MOD_SQL_SQLITE
+	bool "mod_sql_sqlite support"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Compile ProFTPD with mode_sql_sqlite support.
+
+endif
+
 config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
 	bool "mod_quotatab support"
 	help
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
