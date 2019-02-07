From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Feb 2019 19:50:30 +0100
Subject: [Buildroot] [git commit] package/mongodb: remove package
Message-ID: <20190207185122.D1CCE8842C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13ccd7e7fef7a353151cd61cd3ecd6590dfb3ddf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/dd4/dd412fae45a84e44e7e6a49f8cdb124d0851c1df/

The mongodb version used (3.3.4) is no longer supported by upstream and
fails to build with openssl 1.1.1x.  On top of that it uses internal copies
of boost, pcre and zlib instead of the system ones.

Bumping the version to 3.4.19 (which is still supported until September
2019) has been tried, but it:

- No longer builds for 32bit ARM

- Doesn't build without extra patches, E.G.:
  https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch?h=rocko

- Doesn't build with the system version of boost (1.69.0)

- Also fails to build with openssl-1.1.1x

So it looks like mongodb needs to be bumped to the 3.6.x series (which
changes the license to the SSPL) - Or simply dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |  6 ++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../0001-add-missing-sysmacros-include.patch       | 19 -------
 package/mongodb/Config.in                          | 30 ----------
 package/mongodb/mongodb.hash                       |  2 -
 package/mongodb/mongodb.mk                         | 66 ----------------------
 7 files changed, 6 insertions(+), 119 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 25b48fba82..80bab04448 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -207,6 +207,12 @@ config BR2_PACKAGE_GNURADIO_QTGUI
 	help
 	  The gr-qtgui option was removed.
 
+config BR2_PACKAGE_MONGODB
+	bool "mongodb package removed"
+	select BR2_LEGACY
+	help
+	  The mongodb package was removed.
+
 config BR2_PACKAGE_LUACRYPTO
 	bool "luacrypto package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index aec9fdb34c..f2e69cc041 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1954,7 +1954,6 @@ F:	package/aoetools/
 F:	package/curlpp/
 F:	package/daq/
 F:	package/libgdiplus/
-F:	package/mongodb/
 F:	package/pimd/
 F:	package/snort/
 F:	package/stella/
diff --git a/package/Config.in b/package/Config.in
index cc232b9fba..29862c478c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1214,7 +1214,6 @@ menu "Database"
 	source "package/leveldb/Config.in"
 	source "package/libgit2/Config.in"
 	source "package/libpqxx/Config.in"
-	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
diff --git a/package/mongodb/0001-add-missing-sysmacros-include.patch b/package/mongodb/0001-add-missing-sysmacros-include.patch
deleted file mode 100644
index 3a8bfa16c7..0000000000
--- a/package/mongodb/0001-add-missing-sysmacros-include.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Add missing <sys/sysmacros.h>
-
-mmap_v1_engine.cpp is using major()/minor(), which are defined by
-<sys/sysmacros.h>. This header file was implicitly included by
-<sys/types.h> in glibc < 2.28. But this glibc 2.28, this is no longer
-the case, so <sys/sysmacros.h> needs to be included explicitly.
-
-Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
-
---- ./src/mongo/db/storage/mmap_v1/mmap_v1_engine.cpp
-+++ ./src/mongo/db/storage/mmap_v1/mmap_v1_engine.cpp
-@@ -32,6 +32,7 @@
- 
- #include "mongo/db/storage/mmap_v1/mmap_v1_engine.h"
- 
-+#include <sys/sysmacros.h>
- #include <boost/filesystem/path.hpp>
- #include <boost/filesystem/operations.hpp>
- #include <fstream>
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
deleted file mode 100644
index ed3ad56916..0000000000
--- a/package/mongodb/Config.in
+++ /dev/null
@@ -1,30 +0,0 @@
-# from src/mongo/platform/bits.h
-config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
-	bool
-	# ARM needs LDREX/STREX, so ARMv6+
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
-	default y if BR2_aarch64 || BR2_i386 || BR2_powerpc64 || BR2_x86_64
-
-config BR2_PACKAGE_MONGODB
-	bool "mongodb"
-	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_GLIBC # needs glibc malloc_usable_size
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	help
-	  MongoDB is a cross-platform document-oriented database
-	  (NoSQL).
-
-	  It uses JSON-like documents with dynamic schemas (BSON),
-	  making the integration of data in certain types of
-	  applications easier and faster.
-
-	  https://www.mongodb.org/
-
-comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 4.8"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
deleted file mode 100644
index b01ad53ab5..0000000000
--- a/package/mongodb/mongodb.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256 4764945631bca4ac5c2b239e04e91db00e39716915204349170c37cb7897c564  mongodb-r3.3.4.tar.gz
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
deleted file mode 100644
index 54c904e51a..0000000000
--- a/package/mongodb/mongodb.mk
+++ /dev/null
@@ -1,66 +0,0 @@
-################################################################################
-#
-# mongodb
-#
-################################################################################
-
-MONGODB_VERSION_BASE = 3.3.4
-MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
-MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
-
-MONGODB_LICENSE = AGPL-3.0, Apache-2.0
-MONGODB_LICENSE_FILES = GNU-AGPL-3.0.txt APACHE-2.0.txt
-
-MONGODB_DEPENDENCIES = host-scons
-
-MONGODB_SCONS_TARGETS = mongod mongos
-
-MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
-	-j"$(PARALLEL_JOBS)"
-
-MONGODB_SCONS_OPTS = --disable-warnings-as-errors
-
-# need to pass mongo version when not building from git repo
-MONGODB_SCONS_OPTS += MONGO_VERSION=$(MONGODB_VERSION_BASE)-
-
-# WiredTiger database storage engine only supported on 64 bits
-ifeq ($(BR2_ARCH_IS_64),y)
-MONGODB_SCONS_OPTS += --wiredtiger=on
-else
-MONGODB_SCONS_OPTS += --wiredtiger=off
-endif
-
-# JavaScript scripting engine and tcmalloc supported only on
-# x86/x86-64 systems. Mongo target is a shell interface that
-# depends on the javascript engine, so it will also only be
-# built on x86/x86-64 systems.
-ifeq ($(BR2_i386)$(BR2_x86_64),y)
-MONGODB_SCONS_OPTS += --js-engine=mozjs --allocator=tcmalloc
-MONGODB_SCONS_TARGETS += mongo
-else
-MONGODB_SCONS_OPTS += --js-engine=none --allocator=system
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MONGODB_DEPENDENCIES += openssl
-MONGODB_SCONS_OPTS += --ssl=SSL
-endif
-
-define MONGODB_BUILD_CMDS
-	(cd $(@D); \
-		$(SCONS) \
-		$(MONGODB_SCONS_ENV) \
-		$(MONGODB_SCONS_OPTS) \
-		$(MONGODB_SCONS_TARGETS))
-endef
-
-define MONGODB_INSTALL_TARGET_CMDS
-	(cd $(@D); \
-		$(SCONS) \
-		$(MONGODB_SCONS_ENV) \
-		$(MONGODB_SCONS_OPTS) \
-		--prefix=$(TARGET_DIR)/usr \
-		install)
-endef
-
-$(eval $(generic-package))
