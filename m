From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:34:03 +0100
Subject: [Buildroot] [git commit] package/proftpd: add mod_sql_sqlite
Message-ID: <20181209163051.C32D28B80E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=694846b92a607856fd3abac30c393aa84c9df589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable mod_sql_sqlite as a compile time option

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proftpd/Config.in  | 10 ++++++++++
 package/proftpd/proftpd.mk |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 3af0092339..edec37c8dd 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -31,6 +31,16 @@ config BR2_PACKAGE_PROFTPD_MOD_SQL
 	help
 	  Compile ProFTPD with mod_sql support.
 
+if BR2_PACKAGE_PROFTPD_MOD_SQL
+
+config BR2_PACKAGE_PROFTPD_MOD_SQL_SQLITE
+	bool "mod_sql_sqlite support"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Compile ProFTPD with mod_sql_sqlite support.
+
+endif
+
 config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
 	bool "mod_quotatab support"
 	help
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index a228d58e03..592c069ad3 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -47,6 +47,11 @@ ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SQL),y)
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
