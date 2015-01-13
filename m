From: Steve James <ste@junkomatic.net>
Date: Tue, 13 Jan 2015 10:53:57 +0000
Subject: [Buildroot] [PATCH v6] leveldb: new package
Message-ID: <1421146437-17829-1-git-send-email-ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steve James <ste@junkomatic.net>
---
Changes v5 -> v6:
  - Separated & simplified upstream patches
Changes v4 -> v5:
  - Simplify our make by patching Buildroot support into upstream
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


 package/Config.in                                  |  1 +
 package/leveldb/001-ssize_t-undefined.patch        | 17 +++++++++
 package/leveldb/002-add-install-recipe.patch       | 38 +++++++++++++++++++
 .../leveldb/003-allow-flags-from-environment.patch | 34 +++++++++++++++++
 package/leveldb/Config.in                          | 13 +++++++
 package/leveldb/leveldb.mk                         | 44 ++++++++++++++++++++++
 6 files changed, 147 insertions(+)
 create mode 100644 package/leveldb/001-ssize_t-undefined.patch
 create mode 100644 package/leveldb/002-add-install-recipe.patch
 create mode 100644 package/leveldb/003-allow-flags-from-environment.patch
 create mode 100644 package/leveldb/Config.in
 create mode 100644 package/leveldb/leveldb.mk

diff --git a/package/Config.in b/package/Config.in
index 90d334c..e9f2255 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -631,6 +631,7 @@ menu "Database"
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
diff --git a/package/leveldb/002-add-install-recipe.patch b/package/leveldb/002-add-install-recipe.patch
new file mode 100644
index 0000000..203f5bd
--- /dev/null
+++ b/package/leveldb/002-add-install-recipe.patch
@@ -0,0 +1,38 @@
+From 023bb673aad6b44f889ca9d96bc2eb32e4c6d6f8 Mon Sep 17 00:00:00 2001
+From: Steve James <ste@junkomatic.net>
+Date: Mon, 12 Jan 2015 13:32:24 +0000
+Subject: [PATCH 1/1] add install recipe
+
+Signed-off-by: Steve James <ste@junkomatic.net>
+Upstream-Status: Submitted [https://github.com/google/leveldb/pull/276]
+---
+ Makefile | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 24f214a..8f68ca8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -229,3 +229,19 @@ else
+ .c.o:
+ 	$(CC) $(CFLAGS) -c $< -o $@
+ endif
++
++INSTALL_ROOT = /
++INSTALL_PREFIX= usr/local
++
++install: $(SHARED) $(LIBRARY)
++	install -d -m 0755 $(INSTALL_ROOT)$(INSTALL_PREFIX)/include/leveldb
++	install -D -m 0644 include/leveldb/*.h $(INSTALL_ROOT)$(INSTALL_PREFIX)/include/leveldb
++	install -d -m 0755 $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
++  ifneq (,$(LIBRARY))
++	install -m 0644 $(LIBRARY) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
++  endif
++  ifneq (,$(SHARED))
++	install -m 0755 $(SHARED3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
++	ln -sf $(SHARED3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib/$(SHARED1)
++	ln -sf $(SHARED3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib/$(SHARED2)
++  endif
+-- 
+1.9.1
+
diff --git a/package/leveldb/003-allow-flags-from-environment.patch b/package/leveldb/003-allow-flags-from-environment.patch
new file mode 100644
index 0000000..d1914f0
--- /dev/null
+++ b/package/leveldb/003-allow-flags-from-environment.patch
@@ -0,0 +1,34 @@
+From bca474961da4f102ef1d8b817b856808c9453a9e Mon Sep 17 00:00:00 2001
+From: Steve James <ste@junkomatic.net>
+Date: Mon, 12 Jan 2015 14:04:44 +0000
+Subject: [PATCH 1/1] allow flags from environment
+
+Signed-off-by: Steve James <ste@junkomatic.net>
+Upstream-Status: Submitted [https://github.com/google/leveldb/pull/277]
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 24f214a..43ece67 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,11 +20,11 @@ $(shell CC="$(CC)" CXX="$(CXX)" TARGET_OS="$(TARGET_OS)" \
+ # this file is generated by the previous line to set build flags and sources
+ include build_config.mk
+ 
+-CFLAGS += -I. -I./include $(PLATFORM_CCFLAGS) $(OPT)
+-CXXFLAGS += -I. -I./include $(PLATFORM_CXXFLAGS) $(OPT)
++override CFLAGS += -I. -I./include $(PLATFORM_CCFLAGS) $(OPT)
++override CXXFLAGS += -I. -I./include $(PLATFORM_CXXFLAGS) $(OPT)
+ 
+-LDFLAGS += $(PLATFORM_LDFLAGS)
+-LIBS += $(PLATFORM_LIBS)
++override LDFLAGS += $(PLATFORM_LDFLAGS)
++override LIBS += $(PLATFORM_LIBS)
+ 
+ LIBOBJECTS = $(SOURCES:.cc=.o)
+ MEMENVOBJECTS = $(MEMENV_SOURCES:.cc=.o)
+-- 
+1.9.1
+
diff --git a/package/leveldb/Config.in b/package/leveldb/Config.in
new file mode 100644
index 0000000..af097e5
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
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
new file mode 100644
index 0000000..3c03515
--- /dev/null
+++ b/package/leveldb/leveldb.mk
@@ -0,0 +1,44 @@
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
+# We will pass optimisation level via CFLAGS so remove leveldb default
+LEVELDB_MAKE_ARGS += OPTIM=
+
+# Disable the static library for shared only build
+ifeq ($(BR2_SHARED_LIBS),y)
+LEVELDB_MAKE_ARGS += LIBRARY=
+endif
+
+# Disable the shared library for static only build
+ifeq ($(BR2_STATIC_LIBS),y)
+LEVELDB_MAKE_ARGS += SHARED=
+endif
+
+define LEVELDB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(LEVELDB_MAKE_ARGS) -C $(@D)
+endef
+
+define LEVELDB_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		INSTALL_ROOT=$(STAGING_DIR) INSTALL_PREFIX=/usr \
+		$(LEVELDB_MAKE_ARGS) -C $(@D) install
+endef
+
+define LEVELDB_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		INSTALL_ROOT=$(TARGET_DIR) INSTALL_PREFIX=/usr \
+		$(LEVELDB_MAKE_ARGS) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
