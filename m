From: Steve James <ste@junkomatic.net>
Date: Tue, 23 Dec 2014 17:16:23 +0000
Subject: [Buildroot] [PATCH v2] leveldb: new package
Message-ID: <201412231716.23849.ste@junkomatic.net>
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
Changes v1 -> v2:
  - Upstream release labels don't include package name, giving us an
    anonymous download archive, so use $(call github) method instead
  - Use $(TARGET_CONFIGURE_OPTS)
  - Support new shared vs static vs shared+static possibilities

 package/Config.in                           |    1 +
 package/leveldb/001-ssize_t-undefined.patch |   17 ++++++++
 package/leveldb/Config.in                   |   12 ++++++
 package/leveldb/leveldb.mk                  |   59 
+++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 package/leveldb/001-ssize_t-undefined.patch
 create mode 100644 package/leveldb/Config.in
 create mode 100644 package/leveldb/leveldb.mk

diff --git a/package/Config.in b/package/Config.in
index e2b73dd..17e4345 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -627,6 +627,7 @@ menu "Database"
 	source "package/berkeleydb/Config.in"
 	source "package/cppdb/Config.in"
 	source "package/gdbm/Config.in"
+	source "package/leveldb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
diff --git a/package/leveldb/001-ssize_t-undefined.patch 
b/package/leveldb/001-ssize_t-undefined.patch
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
index 0000000..0a4a079
--- /dev/null
+++ b/package/leveldb/leveldb.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# leveldb
+#
+################################################################################
+
+LEVELDB_VERSION = 803d69203a62faf50f1b77897310a3a1fcae712b
+LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
+LEVELDB_LICENSE = BSD-3c
+LEVELDB_LICENSE_FILES = LICENSE
+LEVELDB_INSTALL_STAGING = YES
+LEVELDB_DEPENDENCIES = snappy
+
+# The leveldb build has some basic autoconf-like behaviour which assumes the
+# target is the host. We hard-wire it to the right outcome for Buildroot
+# irrespective of the host.
+LEVELDB_MAKE_ARGS = TARGET_OS=Linux
+
+# Default leveldb compiler flags
+LEVELDB_CFLAGS = -DNDEBUG -I. -I./include -std=c++0x -pthread -DOS_LINUX -
DLEVELDB_PLATFORM_POSIX
+
+TARGET_CFLAGS += $(LEVELDB_CFLAGS)
+TARGET_CXXFLAGS += $(LEVELDB_CFLAGS)
+TARGET_MAKE_ARGS += $(LEVELDB_MAKE_ARGS)
+
+define LEVELDB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) 
$(TARGET_MAKE_ARGS)
+endef
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+define LEVELDB_INSTALL_STAGING_CMDS_STATIC
+	$(INSTALL) -D -m 0644 $(@D)/libleveldb.a $(STAGING_DIR)/usr/lib
+endef
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+define LEVELDB_INSTALL_STAGING_CMDS_SHARED
+	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(STAGING_DIR)/usr/lib
+	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so.1
+	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so
+endef
+endif
+
+define LEVELDB_INSTALL_STAGING_CMDS
+	$(LEVELDB_INSTALL_STAGING_CMDS_STATIC)
+	$(LEVELDB_INSTALL_STAGING_CMDS_SHARED)
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/leveldb
+	$(INSTALL) -D -m 0644 $(@D)/include/leveldb/*.h 
$(STAGING_DIR)/usr/include/leveldb
+endef
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+define LEVELDB_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib
+	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so.1
+	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so
+endef
+endif
+
+$(eval $(generic-package))
-- 
1.7.10.4
