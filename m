From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 23:51:59 +0200
Subject: [Buildroot] [git commit] sqlite: add option to disable fsync
Message-ID: <20140913215512.0E0A69CF11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ede457c5e0e6ee2512a19482c2f6aaf7a0fc118
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For use-cases in which performance is more important than data integrity.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/Config.in |    9 +++++++++
 package/sqlite/sqlite.mk |    4 ++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index fe6cc08..7ea9eb1 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -53,4 +53,13 @@ config BR2_PACKAGE_SQLITE_SECURE_DELETE
 	  http://www.sqlite.org/pragma.html#pragma_secure_delete
 	  for additional information.
 
+config BR2_PACKAGE_SQLITE_NO_SYNC
+	bool "Disable fsync"
+	help
+	  By default SQLite forces all database transactions to storage
+	  immediately using fsync() to protect against data loss in case
+	  of power failure.
+	  This option turns this behavior off resulting in higher performance
+	  especially when using slow flash storage.
+
 endif
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index e30b710..d960ce8 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -33,6 +33,10 @@ ifeq ($(BR2_PACKAGE_SQLITE_SECURE_DELETE),y)
 SQLITE_CFLAGS += -DSQLITE_SECURE_DELETE
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE_NO_SYNC),y)
+SQLITE_CFLAGS += -DSQLITE_NO_SYNC
+endif
+
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
 SQLITE_CONF_OPT = \
