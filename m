From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 11:23:45 +0100
Subject: [Buildroot] [PATCH 4/4] package/sqlite: add optional support for
	libedit
In-Reply-To: <1453544625-30597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453544625-30597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453544625-30597-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only one library is used for command-line editing by sqlite, therefore
create a choice option between current readline support and libedit.

The default of the choice option is readline in order to not change
current behaviour in buildroot. Please note that sqlite first checks
for libedit and, if found, ignores readline, see configure.ac,
lines 50+:

  if test x"$LIBS" != "x"; then
     AC_DEFINE([HAVE_EDITLINE],1,Define to use BSD editline)
  else
    unset ac_cv_search_readline
  fi

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/Config.in | 14 +++++++++++++-
 package/sqlite/sqlite.mk |  7 +++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 7ea9eb1..31add17 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -8,13 +8,25 @@ config BR2_PACKAGE_SQLITE
 
 if BR2_PACKAGE_SQLITE
 
+choice
+	prompt "Command-line editing"
+	default BR2_PACKAGE_SQLITE_READLINE
+	help
+	  Enable command-line editing.
+
+config BR2_PACKAGE_SQLITE_LIBEDIT
+	bool "libedit"
+	select BR2_PACKAGE_LIBEDIT
+
 config BR2_PACKAGE_SQLITE_READLINE
-	bool "Command-line editing"
+	bool "readline"
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
 	  Enable command-line editing. This requires ncurses and readline.
 
+endchoice
+
 config BR2_PACKAGE_SQLITE_STAT3
 	bool "Additional query optimizations (stat3)"
 	help
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 1603e00..594baff 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -45,6 +45,13 @@ else
 SQLITE_CONF_OPTS += --disable-threadsafe
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE_LIBEDIT),y)
+SQLITE_DEPENDENCIES += libedit
+SQLITE_CONF_OPTS += --enable-editline
+else
+SQLITE_CONF_OPTS += --disable-editline
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE_READLINE),y)
 SQLITE_DEPENDENCIES += ncurses readline
 SQLITE_CONF_OPTS += --enable-readline
-- 
2.7.0.rc3
