From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 22:49:31 +0200
Subject: [Buildroot] [git commit] package/leveldb: turn snappy into an
 optional dependency
Message-ID: <20200526203306.97F4F91898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39ef24f8bbe44d7850179f10fe0ab7e08e06059d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

snappy is not a mandatory dependency to build leveldb. Back when it
was introduced in Buildroot, as of version 1.18, the build logic
already made snappy an optional dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
