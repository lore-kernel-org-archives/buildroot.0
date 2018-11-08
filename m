From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu,  8 Nov 2018 09:09:50 -0800
Subject: [Buildroot] [PATCH 1/1] mariadb: fix mysql_config when cross
 compiling
In-Reply-To: <20181108170950.30189-1-chrismcc@gmail.com>
References: <20181108170950.30189-1-chrismcc@gmail.com>
Message-ID: <20181108170950.30189-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mariadb_config in staging is not a shell script, this breaks
mysql_config when cross-compiling.  This in turn breaks package builds
needing the location of the include and library files. So remove it after
installation into $TARGET_DIR

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/mariadb/mariadb.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 06d6365fab..52d47f98fc 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -125,10 +125,15 @@ endif
 
 # We don't need mysql_config on the target as it's only useful in staging
 # We also don't need the test suite on the target
+# Also mariadb_config in staging is not a shell script, this breaks
+# mysql_config when cross-compiling.  This in turn breaks package builds
+# needing the location of the include and library files. So remove it after
+# installation into $TARGET_DIR
 define MARIADB_POST_INSTALL
 	mkdir -p $(TARGET_DIR)/var/lib/mysql
 	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
 	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
+	$(RM) $(STAGING_DIR)/usr/bin/mariadb_config
 endef
 
 MARIADB_POST_INSTALL_TARGET_HOOKS += MARIADB_POST_INSTALL
-- 
2.14.5
