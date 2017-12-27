From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 27 Dec 2017 13:08:10 -0500
Subject: [Buildroot] [PATCH 1/1] libpqxx: bump to 6.0.0
Message-ID: <20171227180810.19405-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:
- Add a hash for the license file.

- Change the URL from pqxx.org to the official GitHub repository, as releases
  are no longer being posted to the old download mirror.

- Remove the patch, this has been fixed in the upstream code for some time.

- Remove AUTORECONF, as it is no longer necessary because the patch has been
  removed.

- Require gcc >= 4.7, as C++11 is now mandatory:
  http://pqxx.org/development/libpqxx/

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 ...01-Fix-broken-sed-call-in-configure.ac.in.patch | 31 ----------------------
 package/libpqxx/Config.in                          |  5 ++--
 package/libpqxx/libpqxx.hash                       |  7 +++--
 package/libpqxx/libpqxx.mk                         |  7 ++---
 4 files changed, 8 insertions(+), 42 deletions(-)
 delete mode 100644 package/libpqxx/0001-Fix-broken-sed-call-in-configure.ac.in.patch

diff --git a/package/libpqxx/0001-Fix-broken-sed-call-in-configure.ac.in.patch b/package/libpqxx/0001-Fix-broken-sed-call-in-configure.ac.in.patch
deleted file mode 100644
index 672133a506..0000000000
--- a/package/libpqxx/0001-Fix-broken-sed-call-in-configure.ac.in.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d5120738a9b6b90d19e742f3c591727d16d76c9c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 26 Dec 2017 14:09:46 +0100
-Subject: [PATCH] Fix broken sed call in configure.ac.in
-
-Upstream fix from commit [1][2]
-
-[1] 80a9d5386641ac67d4ea1b602c786b45b40b252f
-[2] 85e9336740475be25ed19924cca0961f7d844c4b
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 32cf5cb5..77cf7edd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -480,7 +480,7 @@ occurring in the file.
- ])], -L${with_postgres_lib})
- 
- # Remove redundant occurrances of -lpq
--LIBS="`echo "$LIBS" | sed -e 's/-lpq[[:space:]]*[[:space:]]-lpq\>/-lpq/g'`"
-+LIBS=[`echo "$LIBS" | sed -e 's/-lpq * -lpq\>/-lpq/g'`]
- 
- AC_LANG_POP(C)
- 
--- 
-2.14.3
-
diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
index ddf14fd6ce..7832d2508e 100644
--- a/package/libpqxx/Config.in
+++ b/package/libpqxx/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBPQXX
 	bool "libpqxx"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_PACKAGE_POSTGRESQL
 	help
 	  libpqxx is the official C++ client API for PostgreSQL, the
@@ -8,6 +9,6 @@ config BR2_PACKAGE_LIBPQXX
 
 	  http://pqxx.org/development/libpqxx/
 
-comment "libpqxx needs toolchain w/ C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libpqxx needs toolchain w/ C++ support, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_PACKAGE_POSTGRESQL
diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 65c50c6752..372be603c5 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,4 +1,3 @@
-# From: http://pqxx.org/download/software/libpqxx/libpqxx-4.0.1.tar.gz.md5sum
-md5	6ea888b9ba85dd7cef1b182dc5f223a2  libpqxx-4.0.1.tar.gz
-# Locally computed after verifying md5sum:
-sha256	097ceda2797761ce517faa5bee186c883df1c407cb2aada613a16773afeedc38  libpqxx-4.0.1.tar.gz
+# Locally computed:
+sha256	81cac92458efd799fadb0374107464320d93eba71de05aedf21afb9c8dda7c3a	libpqxx-6.0.0.tar.gz
+sha256	9e1c78fa302e4e9738bf3315b130429035c03fcb0f046531ccd977cb474f6b31	COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 6a8c37a7cc..ccafa9ce71 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 4.0.1
-LIBPQXX_SITE = http://pqxx.org/download/software/libpqxx
+LIBPQXX_VERSION = 6.0.0
+LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
 LIBPQXX_LICENSE = BSD-3-Clause
 LIBPQXX_LICENSE_FILES = COPYING
 
-# 0001-Fix-broken-sed-call-in-configure.ac.in.patch
-LIBPQXX_AUTORECONF = YES
-
 LIBPQXX_CONF_ENV += ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
 
 $(eval $(autotools-package))
-- 
2.14.3
