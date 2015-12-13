From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 13 Dec 2015 10:40:38 -0200
Subject: [Buildroot] [PATCH 1/1] mongodb: new package
Message-ID: <1450010438-10933-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compiled and tested on arm (beaglebone black), aarch64 (qemu),
i386 (qemu) and x86_64 (qemu).

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/Config.in            |  1 +
 package/mongodb/Config.in    | 20 ++++++++++++++
 package/mongodb/mongodb.hash |  2 ++
 package/mongodb/mongodb.mk   | 64 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 package/mongodb/Config.in
 create mode 100644 package/mongodb/mongodb.hash
 create mode 100644 package/mongodb/mongodb.mk

diff --git a/package/Config.in b/package/Config.in
index 00aedad84395..9f4457d0810c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -783,6 +783,7 @@ menu "Database"
 	source "package/gdbm/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
+	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
new file mode 100644
index 000000000000..31f5f7459395
--- /dev/null
+++ b/package/mongodb/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_MONGODB
+	bool "mongodb"
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
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
new file mode 100644
index 000000000000..0bdd66db93f8
--- /dev/null
+++ b/package/mongodb/mongodb.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 316496375f41f322839529d36e75e3275fdec468f7656fdbeb53ec8dc1ca5275  mongodb-r3.2.0.tar.gz
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
new file mode 100644
index 000000000000..3bf449a23183
--- /dev/null
+++ b/package/mongodb/mongodb.mk
@@ -0,0 +1,64 @@
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
+# need to pass mongo version when not building from git repo
+MONGODB_SCONS_OPTS = MONGO_VERSION=$(MONGODB_VERSION_BASE)-
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
+# build on x86/x86-64 systems.
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
1.9.1
