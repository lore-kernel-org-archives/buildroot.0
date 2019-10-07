From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 21:45:32 +0200
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.30.0
Message-ID: <20191007194927.4A08389120@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ba88d0d9e10a80af65da058a467f2b8107435bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.sqlite.org/releaselog/3_30_0.html

Changed Config.in option from stat3 to stat4
https://www.sqlite.org/compile.html#enable_stat3
"This option used to cause the ANALYZE command to collect index
 histogram data in the sqlite_stat3 table. But that functionality was
 superceded by SQLITE_ENABLE_STAT4 as of SQLite version 3.8.1
 (2013-10-17). The SQLITE_ENABLE_STAT3 compile-time option continued to
 be supported through version 3.29.0 (2019-07-10) but has now become a
 no-op."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy           | 6 ++++++
 package/sqlite/Config.in   | 4 ++--
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 6 +++---
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e06ba2783b..4a670f0f0e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_SQLITE_STAT3
+	bool "sqlite stat3 support was removed"
+	select BR2_LEGACY
+	help
+	  Upstream removed the support for stat3.
+
 config BR2_KERNEL_HEADERS_5_1
 	bool "kernel headers version 5.1.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 517af50e67..87c0f6c073 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -9,8 +9,8 @@ config BR2_PACKAGE_SQLITE
 
 if BR2_PACKAGE_SQLITE
 
-config BR2_PACKAGE_SQLITE_STAT3
-	bool "Additional query optimizations (stat3)"
+config BR2_PACKAGE_SQLITE_STAT4
+	bool "Additional query optimizations (stat4)"
 	help
 	  Adds additional logic to the ANALYZE command and to the
 	  query planner that can help SQLite to choose a better query
diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 649bfba58e..e297ce3342 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
 # From https://www.sqlite.org/download.html
-sha1 053d8237eb9741b0e297073810668c2611a8e38e  sqlite-autoconf-3290000.tar.gz
+sha1 785c0f6f00fe1871cb1dd97893267cb50db03b9b  sqlite-autoconf-3300000.tar.gz
 # Calculated based on the hash above
-sha256 8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b  sqlite-autoconf-3290000.tar.gz
+sha256 e0a8cf4c7a87455e55e10413d16f358ca121ccec687fe1301eac95e2d340fc58  sqlite-autoconf-3300000.tar.gz
 # Locally calculated
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 9bd196aaef..ba5b5c5d00 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3290000
+SQLITE_VERSION = 3300000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2019
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
-SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
+ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
 endif
 
 ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
