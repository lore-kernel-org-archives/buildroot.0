From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Jan 2011 22:55:37 +0100
Subject: [Buildroot] [git commit master 1/1] php: fix CFLAGS handling
Message-ID: <20110102220442.A6FCB8F346@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b25cf0a05c1146b8f09da0c73032f3e08f768d86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The shell doesn't understand += assignments. Fixes a build issue with
sqlite extension and !largefile (and possibly with ext toolchains as well).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php.mk |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 36b105d..aa99d23 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -19,6 +19,8 @@ PHP_CONF_OPT =  --mandir=/usr/share/man \
 		--with-config-file-path=/etc \
 		--localstatedir=/var \
 
+PHP_CFLAGS = $(TARGET_CFLAGS)
+
 ifneq ($(BR2_PACKAGE_PHP_CLI),y)
 	PHP_CONF_OPT += --disable-cli
 else
@@ -142,7 +144,7 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 	PHP_CONF_OPT += --with-sqlite
 ifneq ($(BR2_LARGEFILE),y)
-	PHP_CONF_ENV += CFLAGS+=" -DSQLITE_DISABLE_LFS"
+	PHP_CFLAGS += -DSQLITE_DISABLE_LFS
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE_UTF8),y)
 	PHP_CONF_OPT += --enable-sqlite-utf8
@@ -159,9 +161,9 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE_EXTERNAL),y)
 else
 	PHP_CONF_OPT += --with-pdo-sqlite
 endif
-	PHP_CONF_ENV += CFLAGS+=" -DSQLITE_OMIT_LOAD_EXTENSION"
+	PHP_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
 ifneq ($(BR2_LARGEFILE),y)
-	PHP_CONF_ENV += CFLAGS+=" -DSQLITE_DISABLE_LFS"
+	PHP_CFLAGS += -DSQLITE_DISABLE_LFS
 endif
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
@@ -192,4 +194,6 @@ define PHP_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/php*
 endef
 
+PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)"
+
 $(eval $(call AUTOTARGETS,package,php))
-- 
1.7.2.2
