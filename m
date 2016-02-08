From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  8 Feb 2016 18:04:03 +0100
Subject: [Buildroot] [PATCH v4] package/sqlite: add optional support for
	libedit
Message-ID: <1454951043-29268-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: rebased
v3: rebased
v2: removed BR2_PACKAGE_SQLITE_READLINE (Thomas, Peter)

 Config.in.legacy         | 11 +++++++++++
 package/sqlite/Config.in |  7 -------
 package/sqlite/sqlite.mk |  9 ++++++---
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3677f86..0ea8c7d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,17 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_SQLITE_READLINE
+	bool "command-line editing support was updated"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	select BR2_LEGACY
+	help
+	  This option was removed in favour of the sqlite package
+	  deciding itself depending on the enabled packages whether
+	  command-line editing should be enabled, it also also takes
+	  libedit into account.
+
 config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
 	bool "openpowerlink debug option has been removed"
 	select BR2_LEGACY
diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 7ea9eb1..c9fde53 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -8,13 +8,6 @@ config BR2_PACKAGE_SQLITE
 
 if BR2_PACKAGE_SQLITE
 
-config BR2_PACKAGE_SQLITE_READLINE
-	bool "Command-line editing"
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_READLINE
-	help
-	  Enable command-line editing. This requires ncurses and readline.
-
 config BR2_PACKAGE_SQLITE_STAT3
 	bool "Additional query optimizations (stat3)"
 	help
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 1603e00..df59d1f 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -45,11 +45,14 @@ else
 SQLITE_CONF_OPTS += --disable-threadsafe
 endif
 
-ifeq ($(BR2_PACKAGE_SQLITE_READLINE),y)
+ifeq ($(BR2_PACKAGE_READLINE),y)
 SQLITE_DEPENDENCIES += ncurses readline
-SQLITE_CONF_OPTS += --enable-readline
+SQLITE_CONF_OPTS += --disable-editline --enable-readline
+else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+SQLITE_DEPENDENCIES += libedit
+SQLITE_CONF_OPTS += --enable-editline --disable-readline
 else
-SQLITE_CONF_OPTS += --disable-readline
+SQLITE_CONF_OPTS += --disable-editline --disable-readline
 endif
 
 $(eval $(autotools-package))
-- 
2.7.0
