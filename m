From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:06:40 +0100
Subject: [Buildroot] [git commit] package/dovecot: Remove bzip2 and zlib
	options
Message-ID: <20160216220706.144F681836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f39ac4d288858989782c8321f9da78236a11a3c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The next patch of this series will add optional xz and lz4 support, to
avoid adding new options for these compression packages simplify the
configuration of dovecot by removing the options handling optional
compression support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy           | 14 ++++++++++++++
 package/dovecot/Config.in  | 12 ------------
 package/dovecot/dovecot.mk |  4 ++--
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2fda9f8..081bacd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,20 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_DOVECOT_BZIP2
+	bool "bzip2 support option has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BZIP2
+	help
+	  Bzip2 support is built if the bzip2 package is selected.
+
+config BR2_PACKAGE_DOVECOT_ZLIB
+	bool "zlib support option has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ZLIB
+	help
+	  Zlib support is built if the zlib package is selected.
+
 config BR2_PACKAGE_E2FSPROGS_FINDFS
 	bool "e2fsprogs findfs option has been removed"
 	select BR2_LEGACY
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 3baae6e..194efb6 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -13,12 +13,6 @@ config BR2_PACKAGE_DOVECOT
 
 if BR2_PACKAGE_DOVECOT
 
-config BR2_PACKAGE_DOVECOT_BZIP2
-	bool "bzip2 support"
-	select BR2_PACKAGE_BZIP2
-	help
-	  Enable bzip2 support.
-
 config BR2_PACKAGE_DOVECOT_MYSQL
 	bool "mysql support"
 	select BR2_PACKAGE_MYSQL
@@ -43,12 +37,6 @@ config BR2_PACKAGE_DOVECOT_SQLITE
 	help
 	  Enable SQLite support.
 
-config BR2_PACKAGE_DOVECOT_ZLIB
-	bool "zlib support"
-	select BR2_PACKAGE_ZLIB
-	help
-	  Enable zlib support.
-
 source package/dovecot-pigeonhole/Config.in
 
 endif # BR2_PACKAGE_DOVECOT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 8451e52..eea9efc 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -33,7 +33,7 @@ ifeq ($(BR2_PACKAGE_DOVECOT_MYSQL)$(BR2_PACKAGE_DOVECOT_SQLITE),)
 DOVECOT_CONF_OPTS += --without-sql
 endif
 
-ifeq ($(BR2_PACKAGE_DOVECOT_BZIP2),y)
+ifeq ($(BR2_PACKAGE_BZIP2),y)
 DOVECOT_CONF_OPTS += --with-bzlib
 DOVECOT_DEPENDENCIES += bzip2
 else
@@ -76,7 +76,7 @@ else
 DOVECOT_CONF_OPTS += --without-sqlite
 endif
 
-ifeq ($(BR2_PACKAGE_DOVECOT_ZLIB),y)
+ifeq ($(BR2_PACKAGE_ZLIB),y)
 DOVECOT_CONF_OPTS += --with-zlib
 DOVECOT_DEPENDENCIES += zlib
 else
