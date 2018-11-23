From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Nov 2018 21:44:49 +0100
Subject: [Buildroot] [PATCH-2018.02.x 1/2] mariadb: drop my-small.cnf
 handling
Message-ID: <20181123204450.26813-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unbreaks builds without BR2_PACKAGE_MARIADB_SERVER as this only gets
installed if the server is enabled.

As pointed out in commit 2b82e014b40 (package/mariadb: bump version to
10.3.10), this file has been removed upstream in newer versions as it hasn't
been updated in >8 years and the compiled in defaults are sensible, so
completely remove the file handling instead of adding logic to only install
it if the server is enabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index e8ccf7a2a9..fa0b1485d5 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -112,8 +112,6 @@ endif
 # We also don't need the test suite on the target
 define MARIADB_POST_INSTALL
 	mkdir -p $(TARGET_DIR)/var/lib/mysql
-	$(INSTALL) -D -m 644 $(TARGET_DIR)/usr/share/mysql/my-small.cnf \
-		$(TARGET_DIR)/etc/mysql/my.cnf
 	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
 	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
 endef
-- 
2.11.0
