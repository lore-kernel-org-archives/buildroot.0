From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 12:45:17 +0100
Subject: [Buildroot] [PATCH 1/12] Revert "package/mongodb: remove package"
Message-ID: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 13ccd7e7fef7a353151cd61cd3ecd6590dfb3ddf.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                                   |  6 --
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-add-missing-sysmacros-include.patch       | 19 +++++++
 package/mongodb/Config.in                          | 30 ++++++++++
 package/mongodb/mongodb.hash                       |  2 +
 package/mongodb/mongodb.mk                         | 66 ++++++++++++++++++++++
 7 files changed, 119 insertions(+), 6 deletions(-)
 create mode 100644 package/mongodb/0001-add-missing-sysmacros-include.patch
 create mode 100644 package/mongodb/Config.in
 create mode 100644 package/mongodb/mongodb.hash
 create mode 100644 package/mongodb/mongodb.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 80bab04448..25b48fba82 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -207,12 +207,6 @@ config BR2_PACKAGE_GNURADIO_QTGUI
 	help
 	  The gr-qtgui option was removed.
 
-config BR2_PACKAGE_MONGODB
-	bool "mongodb package removed"
-	select BR2_LEGACY
-	help
-	  The mongodb package was removed.
-
 config BR2_PACKAGE_LUACRYPTO
 	bool "luacrypto package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 4a19745852..9af02229bf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1956,6 +1956,7 @@ F:	package/aoetools/
 F:	package/curlpp/
 F:	package/daq/
 F:	package/libgdiplus/
+F:	package/mongodb/
 F:	package/pimd/
 F:	package/snort/
 F:	package/stella/
diff --git a/package/Config.in b/package/Config.in
index ad4fdb8bd0..783e5a55d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1214,6 +1214,7 @@ menu "Database"
 	source "package/leveldb/Config.in"
 	source "package/libgit2/Config.in"
 	source "package/libpqxx/Config.in"
+	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
diff --git a/package/mongodb/0001-add-missing-sysmacros-include.patch b/package/mongodb/0001-add-missing-sysmacros-include.patch
new file mode 100644
index 0000000000..3a8bfa16c7
--- /dev/null
+++ b/package/mongodb/0001-add-missing-sysmacros-include.patch
@@ -0,0 +1,19 @@
+Add missing <sys/sysmacros.h>
+
+mmap_v1_engine.cpp is using major()/minor(), which are defined by
+<sys/sysmacros.h>. This header file was implicitly included by
+<sys/types.h> in glibc < 2.28. But this glibc 2.28, this is no longer
+the case, so <sys/sysmacros.h> needs to be included explicitly.
+
+Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
+
+--- ./src/mongo/db/storage/mmap_v1/mmap_v1_engine.cpp
++++ ./src/mongo/db/storage/mmap_v1/mmap_v1_engine.cpp
+@@ -32,6 +32,7 @@
+ 
+ #include "mongo/db/storage/mmap_v1/mmap_v1_engine.h"
+ 
++#include <sys/sysmacros.h>
+ #include <boost/filesystem/path.hpp>
+ #include <boost/filesystem/operations.hpp>
+ #include <fstream>
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
new file mode 100644
index 0000000000..ed3ad56916
--- /dev/null
+++ b/package/mongodb/Config.in
@@ -0,0 +1,30 @@
+# from src/mongo/platform/bits.h
+config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
+	bool
+	# ARM needs LDREX/STREX, so ARMv6+
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
+	default y if BR2_aarch64 || BR2_i386 || BR2_powerpc64 || BR2_x86_64
+
+config BR2_PACKAGE_MONGODB
+	bool "mongodb"
+	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC # needs glibc malloc_usable_size
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  MongoDB is a cross-platform document-oriented database
+	  (NoSQL).
+
+	  It uses JSON-like documents with dynamic schemas (BSON),
+	  making the integration of data in certain types of
+	  applications easier and faster.
+
+	  https://www.mongodb.org/
+
+comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 4.8"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
new file mode 100644
index 0000000000..b01ad53ab5
--- /dev/null
+++ b/package/mongodb/mongodb.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 4764945631bca4ac5c2b239e04e91db00e39716915204349170c37cb7897c564  mongodb-r3.3.4.tar.gz
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
new file mode 100644
index 0000000000..54c904e51a
--- /dev/null
+++ b/package/mongodb/mongodb.mk
@@ -0,0 +1,66 @@
+################################################################################
+#
+# mongodb
+#
+################################################################################
+
+MONGODB_VERSION_BASE = 3.3.4
+MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
+MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
+
+MONGODB_LICENSE = AGPL-3.0, Apache-2.0
+MONGODB_LICENSE_FILES = GNU-AGPL-3.0.txt APACHE-2.0.txt
+
+MONGODB_DEPENDENCIES = host-scons
+
+MONGODB_SCONS_TARGETS = mongod mongos
+
+MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
+	-j"$(PARALLEL_JOBS)"
+
+MONGODB_SCONS_OPTS = --disable-warnings-as-errors
+
+# need to pass mongo version when not building from git repo
+MONGODB_SCONS_OPTS += MONGO_VERSION=$(MONGODB_VERSION_BASE)-
+
+# WiredTiger database storage engine only supported on 64 bits
+ifeq ($(BR2_ARCH_IS_64),y)
+MONGODB_SCONS_OPTS += --wiredtiger=on
+else
+MONGODB_SCONS_OPTS += --wiredtiger=off
+endif
+
+# JavaScript scripting engine and tcmalloc supported only on
+# x86/x86-64 systems. Mongo target is a shell interface that
+# depends on the javascript engine, so it will also only be
+# built on x86/x86-64 systems.
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+MONGODB_SCONS_OPTS += --js-engine=mozjs --allocator=tcmalloc
+MONGODB_SCONS_TARGETS += mongo
+else
+MONGODB_SCONS_OPTS += --js-engine=none --allocator=system
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MONGODB_DEPENDENCIES += openssl
+MONGODB_SCONS_OPTS += --ssl=SSL
+endif
+
+define MONGODB_BUILD_CMDS
+	(cd $(@D); \
+		$(SCONS) \
+		$(MONGODB_SCONS_ENV) \
+		$(MONGODB_SCONS_OPTS) \
+		$(MONGODB_SCONS_TARGETS))
+endef
+
+define MONGODB_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(SCONS) \
+		$(MONGODB_SCONS_ENV) \
+		$(MONGODB_SCONS_OPTS) \
+		--prefix=$(TARGET_DIR)/usr \
+		install)
+endef
+
+$(eval $(generic-package))
-- 
2.14.1
