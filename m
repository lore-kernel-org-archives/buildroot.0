From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed,  5 Sep 2012 17:28:58 +0300
Subject: [Buildroot] [PATCH 3/9] firefox: sqlite dependency needs new
	compile-time options
In-Reply-To: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1346855344-15081-4-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/sqlite/Config.in |   34 ++++++++++++++++++++++++++++++++++
 package/sqlite/sqlite.mk |   12 ++++++++++++
 2 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 25aaa3f..75bce70 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -22,3 +22,37 @@ config BR2_PACKAGE_SQLITE_STAT3
 	  planner that can help SQLite to choose a better query plan under
 	  certain situations.
 
+config BR2_PACKAGE_SQLITE_ENABLE_FTS3
+	bool "Enables version 3 of the full-text search engine"
+	depends on BR2_PACKAGE_SQLITE
+	help
+	  When this option is defined in the amalgamation 
+	  (see http://www.sqlite.org/amalgamation.html), version 3 of
+	  the full-text search engine is added to the build automatically.
+
+config BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
+	bool "Enables sqlite3_unlock_notify() interface"
+	depends on BR2_PACKAGE_SQLITE
+	help
+	  This option enables the sqlite3_unlock_notify() interface and its
+	  accosiated functionality. See the documentation 
+	  http://www.sqlite.org/unlock_notify.html for additional information.
+
+config BR2_PACKAGE_SQLITE_SECURE_DELETE
+	bool "Sets the secure_delete pragma on by default"
+	depends on BR2_PACKAGE_SQLITE
+	help
+	  This compile-time option changes the default settings of the
+	  secure_delete pragma. When this option is not used, secure_delete
+	  defaults to off. When this option is present, secure_delete defaults
+	  to on.
+
+	  The secure_delete setting causes deleted content to be overwritten
+	  with zeros. There is a small performance penalty for this since 
+	  additional I/O must occur. On the other hand, secure_delete can
+	  prevent sensitive information from lingering in unused parts 
+	  of the database file after it has allegedly been deleted.
+	  See the documentation on the 
+	  http://www.sqlite.org/pragma.html#pragma_secure_delete
+	  for additional information.
+
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 7b5b4aa..0320cc4 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -21,6 +21,18 @@ ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE_SECURE_DELETE),y)
+SQLITE_CFLAGS += -DSQLITE_SECURE_DELETE
+endif
+
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
 SQLITE_CONF_OPT = \
-- 
1.7.7.6
