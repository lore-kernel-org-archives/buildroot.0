From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Apr 2010 23:01:14 +0200
Subject: [Buildroot] [git commit master] package: get rid of database subdir
Message-ID: <20100426210142.CA80A20300@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=187f0a55323437e33f5a66ef670fe0e49f52bc45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not much point in a seperate subdir for only two packages.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    4 ++--
 package/database/Config.in                         |    4 ----
 package/database/database.mk                       |    1 -
 package/{database => }/mysql_client/Config.in      |    2 +-
 .../{database => }/mysql_client/mysql_client.mk    |    2 +-
 package/{database => }/sqlite/Config.in            |    0
 package/{database => }/sqlite/sqlite.mk            |    0
 7 files changed, 4 insertions(+), 9 deletions(-)
 delete mode 100644 package/database/Config.in
 delete mode 100644 package/database/database.mk
 rename package/{database => }/mysql_client/Config.in (90%)
 rename package/{database => }/mysql_client/mysql_client.mk (93%)
 rename package/{database => }/sqlite/Config.in (100%)
 rename package/{database => }/sqlite/sqlite.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index a4ef362..15f6c3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -232,8 +232,8 @@ endmenu
 
 menu "Database"
 source "package/berkeleydb/Config.in"
-source "package/database/mysql_client/Config.in"
-source "package/database/sqlite/Config.in"
+source "package/mysql_client/Config.in"
+source "package/sqlite/Config.in"
 endmenu
 
 menu "Filesystem"
diff --git a/package/database/Config.in b/package/database/Config.in
deleted file mode 100644
index 029b7cd..0000000
--- a/package/database/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-menu "Database"
-source "package/database/mysql_client/Config.in"
-source "package/database/sqlite/Config.in"
-endmenu
diff --git a/package/database/database.mk b/package/database/database.mk
deleted file mode 100644
index 9553847..0000000
--- a/package/database/database.mk
+++ /dev/null
@@ -1 +0,0 @@
-include package/database/*/*.mk
diff --git a/package/database/mysql_client/Config.in b/package/mysql_client/Config.in
similarity index 90%
rename from package/database/mysql_client/Config.in
rename to package/mysql_client/Config.in
index 92b349a..f07fdb4 100644
--- a/package/database/mysql_client/Config.in
+++ b/package/mysql_client/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_MYSQL_CLIENT
-	bool "MySQL 5.1 client"
+	bool "MySQL client"
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
diff --git a/package/database/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
similarity index 93%
rename from package/database/mysql_client/mysql_client.mk
rename to package/mysql_client/mysql_client.mk
index 7f3b091..4403653 100644
--- a/package/database/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -24,7 +24,7 @@ MYSQL_CLIENT_CONF_OPT = \
 	--enable-thread-safe-client \
 	$(ENABLE_DEBUG)
 
-$(eval $(call AUTOTARGETS,package/database,mysql_client))
+$(eval $(call AUTOTARGETS,package,mysql_client))
 
 $(MYSQL_CLIENT_HOOK_POST_INSTALL):
 	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
diff --git a/package/database/sqlite/Config.in b/package/sqlite/Config.in
similarity index 100%
rename from package/database/sqlite/Config.in
rename to package/sqlite/Config.in
diff --git a/package/database/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
similarity index 100%
rename from package/database/sqlite/sqlite.mk
rename to package/sqlite/sqlite.mk
-- 
1.6.3.3
