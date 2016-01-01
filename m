From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jan 2016 18:33:22 +0100
Subject: [Buildroot] [git commit] mongodb: new package
Message-ID: <20160101173842.60739827C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22b916c6f1259085fa3800fb64e63a782724d69f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compiled and tested on arm (beaglebone black), aarch64 (qemu),
i386 (qemu) and x86_64 (qemu).

[Peter: limit to supported archs, disable -Werror]
Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |  1 +
 package/mongodb/Config.in    | 28 +++++++++++++++++++
 package/mongodb/mongodb.hash |  2 ++
 package/mongodb/mongodb.mk   | 66 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9145d15..61b516a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -812,6 +812,7 @@ menu "Database"
 	source "package/gdbm/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
+	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
new file mode 100644
index 0000000..7665c86
--- /dev/null
+++ b/package/mongodb/Config.in
@@ -0,0 +1,28 @@
+# from src/mongo/platform/bits.h
+config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_arm ||  \
+		BR2_i386 || BR2_powerpc64 || BR2_x86_64
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
+	  MongoDB is a cross-platform document-oriented database (NoSQL).
+
+	  It uses JSON-like documents with dynamic schemas (BSON), making
+	  the integration of data in certain types of applications easier
+	  and faster.
+
+	  https://www.mongodb.org/
+
+comment "mongodb needs a (e)glibc toolchain w/ wchar, threads, C++, gcc >= 4.8"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
new file mode 100644
index 0000000..0bdd66d
--- /dev/null
+++ b/package/mongodb/mongodb.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 316496375f41f322839529d36e75e3275fdec468f7656fdbeb53ec8dc1ca5275  mongodb-r3.2.0.tar.gz
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
new file mode 100644
index 0000000..1eed897
--- /dev/null
+++ b/package/mongodb/mongodb.mk
@@ -0,0 +1,66 @@
+################################################################################
+#
+# mongodb
+#
+################################################################################
+
+MONGODB_VERSION_BASE = 3.2.0
+MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
+MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
+
+MONGODB_LICENSE = AGPLv3, Apache-2.0
+MONGODB_LICENSE_FILES = GNU-AGPL-3.0.txt, APACHE-2.0.txt
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
