From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 May 2020 07:22:01 +0200
Subject: [Buildroot] [PATCH 1/2] package/leveldb: turn snappy into an
 optional dependency
Message-ID: <20200518052203.1667697-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

snappy is not a mandatory dependency to build leveldb. Back when it
was introduced in Buildroot, as of version 1.18, the build logic
already made snappy an optional dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/leveldb/Config.in  | 1 -
 package/leveldb/leveldb.mk | 5 ++++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/leveldb/Config.in b/package/leveldb/Config.in
index c767b88645..c4279fcb64 100644
--- a/package/leveldb/Config.in
+++ b/package/leveldb/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LEVELDB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_SNAPPY
 	help
 	  LevelDB is a fast key-value storage library written at Google
 	  that provides an ordered mapping from string keys to string
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index cf3c096f5d..684b618679 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -9,9 +9,12 @@ LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
 LEVELDB_LICENSE = BSD-3-Clause
 LEVELDB_LICENSE_FILES = LICENSE
 LEVELDB_INSTALL_STAGING = YES
-LEVELDB_DEPENDENCIES = snappy
 LEVELDB_CONF_OPTS = \
 	-DLEVELDB_BUILD_BENCHMARKS=OFF \
 	-DLEVELDB_BUILD_TESTS=OFF
 
+ifeq ($(BR2_PACKAGE_SNAPPY),y)
+LEVELDB_DEPENDENCIES += snappy
+endif
+
 $(eval $(cmake-package))
-- 
2.26.2
