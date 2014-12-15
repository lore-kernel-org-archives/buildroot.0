From: Steve James <ste@junkomatic.net>
Date: Mon, 15 Dec 2014 15:41:19 +0000
Subject: [Buildroot] [PATCH] leveldb: new package
Message-ID: <201412151541.19296.ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds new package: leveldb

  LevelDB is a fast key-value storage library written at Google that
  provides an ordered mapping from string keys to string values.

Signed-off-by: Steve James <ste@junkomatic.net>
---
 package/Config.in                           |    1 +
 package/leveldb/001-ssize_t-undefined.patch |   17 ++++++++++++++
 package/leveldb/Config.in                   |   12 ++++++++++
 package/leveldb/leveldb.mk                  |   34 +++++++++++++++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 package/leveldb/001-ssize_t-undefined.patch
 create mode 100644 package/leveldb/Config.in
 create mode 100644 package/leveldb/leveldb.mk

diff --git a/package/Config.in b/package/Config.in
index 48be2df..cd1f76b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -624,6 +624,7 @@ menu "Database"
 	source "package/berkeleydb/Config.in"
 	source "package/cppdb/Config.in"
 	source "package/gdbm/Config.in"
+	source "package/leveldb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
diff --git a/package/leveldb/001-ssize_t-undefined.patch b/package/leveldb/001-ssize_t-undefined.patch
new file mode 100644
index 0000000..9a958d8
--- /dev/null
+++ b/package/leveldb/001-ssize_t-undefined.patch
@@ -0,0 +1,17 @@
+Fix leveldb issue 233 leveldb does not compile with g++ 4.8.2
+
+Where db_iter.cc fails to get a typedef for ssize_t when compiled by GCC.
+
+Upstream-Status: Submitted [https://github.com/google/leveldb/issues/233]
+Signed-off-by: Steve James <ste@junkomatic.net>
+
+--- a/db/db_iter.cc.orig	2014-12-08 16:54:31.384615752 +0000
++++ b/db/db_iter.cc	2014-12-08 16:54:35.464656890 +0000
+@@ -13,6 +13,7 @@
+ #include "util/logging.h"
+ #include "util/mutexlock.h"
+ #include "util/random.h"
++#include <sys/types.h> // for ssize_t
+ 
+ namespace leveldb {
+ 
diff --git a/package/leveldb/Config.in b/package/leveldb/Config.in
new file mode 100644
index 0000000..fffd44b
--- /dev/null
+++ b/package/leveldb/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LEVELDB
+	bool "leveldb"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_SNAPPY
+	help
+	  LevelDB is a fast key-value storage library written at Google that
+	  provides an ordered mapping from string keys to string values.
+
+	  https://github.com/google/leveldb
+
+comment "leveldb needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
new file mode 100644
index 0000000..d11ef59
--- /dev/null
+++ b/package/leveldb/leveldb.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# leveldb
+#
+################################################################################
+
+LEVELDB_VERSION = 1.18
+LEVELDB_SITE = https://github.com/google/leveldb/archive/
+LEVELDB_SOURCE = v$(LEVELDB_VERSION).tar.gz
+LEVELDB_LICENSE = BSD-3c
+LEVELDB_LICENSE_FILES = LICENSE
+LEVELDB_INSTALL_STAGING = YES
+LEVELDB_DEPENDENCIES = snappy
+
+define LEVELDB_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" -C $(@D) all
+endef
+
+define LEVELDB_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/libleveldb.a       $(STAGING_DIR)/usr/lib
+	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(STAGING_DIR)/usr/lib
+	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so.1
+	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/leveldb
+	$(INSTALL) -D -m 0644 $(@D)/include/leveldb/*.h $(STAGING_DIR)/usr/include/leveldb
+endef
+
+define LEVELDB_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib
+	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so.1
+	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
