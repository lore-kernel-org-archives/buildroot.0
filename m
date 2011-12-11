From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 22:17:58 +0100
Subject: [Buildroot] [git commit] sqlite: add option to enable additional
	query optimizations (stat3)
Message-ID: <20111211215606.833238F8D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bb9a6db18f9c54df3356bc5116ac064637e8368
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sqlite/Config.in |    8 ++++++++
 package/sqlite/sqlite.mk |    4 ++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index f9b12ae..25aaa3f 100644
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
