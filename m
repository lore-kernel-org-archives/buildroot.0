From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed,  7 Dec 2011 20:00:10 +0100
Subject: [Buildroot] [PATCH 4/4] sqlite: add option to enable additional
	query optimizations (stat3)
In-Reply-To: <1323284410-8884-1-git-send-email-s.neumann@raumfeld.com>
References: <1323284410-8884-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1323284410-8884-4-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/sqlite/Config.in |    8 ++++++++
 package/sqlite/sqlite.mk |    4 ++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index f9b12ae..b7b17c6 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -14,3 +14,11 @@ config BR2_PACKAGE_SQLITE_READLINE
 	help
 	  Enable command-line editing. This requires ncurses and readline.
 
+config BR2_PACKAGE_SQLITE_STAT3
+	bool "Additional query optimizations (stat3)"
+	depends on BR2_PACKAGE_SQLITE
+	help
+	  Adds additional logic to the ANALYZE command and to the query
+	  planner that can help SQLite to choose a better query plan under
+	  certain situations.
+
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 0bee337..042c7f9 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -16,6 +16,10 @@ ifneq ($(BR2_LARGEFILE),y)
 SQLITE_CFLAGS += -DSQLITE_DISABLE_LFS
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
+endif
+
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
 SQLITE_CONF_OPT = \
-- 
1.7.5.4
