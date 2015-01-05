From: Steve James <ste@junkomatic.net>
Date: Mon,  5 Jan 2015 14:47:47 +0000
Subject: [Buildroot] [PATCH v4] leveldb: new package
Message-ID: <1420469267-26272-1-git-send-email-ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds new package: leveldb

  LevelDB is a fast key-value storage library written at Google that
  provides an ordered mapping from string keys to string values.

Signed-off-by: Steve James <ste@junkomatic.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v3 -> v4:
  - Don't damage global scope make macros
  - Add dependency on threads toolchain
Changes v2 -> v3:
  - Re-submit without line wrapping
Changes v1 -> v2:
  - Upstream release labels don't include package name, giving us an
    anonymous download archive, so use $(call github) method instead
  - Use $(TARGET_CONFIGURE_OPTS)
  - Support new shared vs static vs shared+static possibilities

 package/Config.in                           |  1 +
 package/leveldb/001-ssize_t-undefined.patch | 17 +++++++++
 package/leveldb/Config.in                   | 13 +++++++
 package/leveldb/leveldb.mk                  | 57 +++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 package/leveldb/001-ssize_t-undefined.patch
 create mode 100644 package/leveldb/Config.in
 create mode 100644 package/leveldb/leveldb.mk

diff --git a/package/Config.in b/package/Config.in
index 8d91b04..25efec5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -630,6 +630,7 @@ menu "Database"
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
index 0000000..535e217
--- /dev/null
+++ b/package/leveldb/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LEVELDB
+	bool "leveldb"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_SNAPPY
+	help
+	  LevelDB is a fast key-value storage library written at Google that
+	  provides an ordered mapping from string keys to string values.
+
+	  https://github.com/google/leveldb
+
+comment "leveldb needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
new file mode 100644
index 0000000..1612c9d
--- /dev/null
+++ b/package/leveldb/leveldb.mk
@@ -0,0 +1,57 @@
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
+LEVELDB_FLAGS += -DNDEBUG -I. -I./include -pthread -DOS_LINUX -DLEVELDB_PLATFORM_POSIX
+LEVELDB_CFLAGS += $(LEVELDB_FLAGS) $(TARGET_CFLAGS)
+LEVELDB_CXXFLAGS += $(LEVELDB_FLAGS) $(TARGET_CXXFLAGS) -std=c++0x
+
+LEVELDB_MAKE_ARGS += CFLAGS="$(LEVELDB_CFLAGS)" CXXFLAGS="$(LEVELDB_CXXFLAGS)"
+
+# The lelveldb build has some basic autoconf-style behaviour.
+# We hard-wire it here to the right outcome for Buildroot
+LEVELDB_MAKE_ARGS += TARGET_OS=Linux
+
+define LEVELDB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(LEVELDB_MAKE_ARGS) -C $(@D)
+endef
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+define LEVELDB_INSTALL_STAGING_STATIC
+	$(INSTALL) -D -m 0644 $(@D)/libleveldb.a $(STAGING_DIR)/usr/lib
+endef
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+define LEVELDB_INSTALL_STAGING_SHARED
+	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(STAGING_DIR)/usr/lib
+	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so.1
+	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so
+endef
+endif
+
+define LEVELDB_INSTALL_STAGING_CMDS
+	$(LEVELDB_INSTALL_STAGING_STATIC)
+	$(LEVELDB_INSTALL_STAGING_SHARED)
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/leveldb
+	$(INSTALL) -D -m 0644 $(@D)/include/leveldb/*.h $(STAGING_DIR)/usr/include/leveldb
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
1.9.1
