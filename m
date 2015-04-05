From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 16:32:17 +0200
Subject: [Buildroot] [git commit] leveldb: new package
Message-ID: <20150405143403.662F68195B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed2346e6ed29941ab3f2342e7e03abf62962275f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - remove 003-allow-flags-from-environment.patch, and pass
    TARGET_CONFIGURE_OPTS in the environment instead.
  - convert the patches to Git formatted patches.
  - use the v1.18 tag instead of a commit hash.
  - do not pass TARGET_CONFIGURE_OPTS at install time, this is not
    needed.]

Signed-off-by: Steve James <ste@junkomatic.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 .../0001-Fix-compilation-with-g-4.8.2.patch        |   31 ++++++++++++++
 package/leveldb/0002-Add-install-recipe.patch      |   40 ++++++++++++++++++
 package/leveldb/Config.in                          |   13 ++++++
 package/leveldb/leveldb.mk                         |   44 ++++++++++++++++++++
 5 files changed, 129 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c49ee7b..de8e856 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -698,6 +698,7 @@ menu "Database"
 	source "package/berkeleydb/Config.in"
 	source "package/cppdb/Config.in"
 	source "package/gdbm/Config.in"
+	source "package/leveldb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
diff --git a/package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch b/package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch
new file mode 100644
index 0000000..f392160
--- /dev/null
+++ b/package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch
@@ -0,0 +1,31 @@
+From 8a8016f6d2af335ab205aa40d5274fc9b0c7a566 Mon Sep 17 00:00:00 2001
+From: Steve James <ste@junkomatic.net>
+Date: Sun, 5 Apr 2015 16:29:51 +0200
+Subject: [PATCH 1/2] Fix compilation with g++ 4.8.2
+
+Where db_iter.cc fails to get a typedef for ssize_t when compiled by
+GCC.
+
+Upstream-Status: Submitted [https://github.com/google/leveldb/issues/233]
+
+Signed-off-by: Steve James <ste@junkomatic.net>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ db/db_iter.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/db/db_iter.cc b/db/db_iter.cc
+index 3b2035e..c2e5f35 100644
+--- a/db/db_iter.cc
++++ b/db/db_iter.cc
+@@ -13,6 +13,7 @@
+ #include "util/logging.h"
+ #include "util/mutexlock.h"
+ #include "util/random.h"
++#include <sys/types.h> // for ssize_t
+ 
+ namespace leveldb {
+ 
+-- 
+2.1.0
+
diff --git a/package/leveldb/0002-Add-install-recipe.patch b/package/leveldb/0002-Add-install-recipe.patch
new file mode 100644
index 0000000..38c2ca8
--- /dev/null
+++ b/package/leveldb/0002-Add-install-recipe.patch
@@ -0,0 +1,40 @@
+From 818d59f093100d5f39db34d5686a9d983172d307 Mon Sep 17 00:00:00 2001
+From: Steve James <ste@junkomatic.net>
+Date: Sun, 5 Apr 2015 16:30:46 +0200
+Subject: [PATCH 2/2] Add install recipe
+
+Upstream-Status: Submitted [https://github.com/google/leveldb/pull/276]
+
+Signed-off-by: Steve James <ste@junkomatic.net>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 2bd2cad..530f2c3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -225,3 +225,19 @@ else
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
+2.1.0
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
+	  LevelDB is a fast key-value storage library written@Google that
+	  provides an ordered mapping from string keys to string values.
+
+	  https://github.com/google/leveldb
+
+comment "leveldb needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
new file mode 100644
index 0000000..e2c267b
--- /dev/null
+++ b/package/leveldb/leveldb.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# leveldb
+#
+################################################################################
+
+LEVELDB_VERSION = v1.18
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
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		$(LEVELDB_MAKE_ARGS) -C $(@D)
+endef
+
+define LEVELDB_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		INSTALL_ROOT=$(STAGING_DIR) INSTALL_PREFIX=/usr \
+		$(LEVELDB_MAKE_ARGS) -C $(@D) install
+endef
+
+define LEVELDB_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		INSTALL_ROOT=$(TARGET_DIR) INSTALL_PREFIX=/usr \
+		$(LEVELDB_MAKE_ARGS) -C $(@D) install
+endef
+
+$(eval $(generic-package))
