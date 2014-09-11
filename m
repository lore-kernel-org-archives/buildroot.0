From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 11 Sep 2014 17:43:32 +0200
Subject: [Buildroot] [PATCH 1/1] sqlite: add option to disable fsync
In-Reply-To: <1410450212-30718-1-git-send-email-bos@je-eigen-domein.nl>
References: <1410450212-30718-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1410450212-30718-2-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For use-cases in which performance is more important than data integrity.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/sqlite/Config.in | 8 ++++++++
 package/sqlite/sqlite.mk | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index fe6cc08..298f1ca 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -53,4 +53,12 @@ config BR2_PACKAGE_SQLITE_SECURE_DELETE
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
-- 
1.8.3.2
