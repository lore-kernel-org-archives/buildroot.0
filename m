From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:13:40 +0100
Subject: [Buildroot] [git commit branch/next] package/mongodb: new package
Message-ID: <20190213214530.EB8CC8A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5b7678b4a2cc6a2659ac1637bf74ea7ff14c147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Here is the list of the changes compared to the removed mongodb 3.3.4
version:
- Remove patch (not applicable anymore)
- Add patch (sent upstream) to fix openssl build with gcc 7 and
  -fpermissive
- Remove 32 bits x86 platforms, removed since version 3.4:
  https://docs.mongodb.com/manual/installation/#supported-platforms
- Change license: since October 2018, license is SSPL:
  - https://www.mongodb.com/community/licensing
  - https://jira.mongodb.org/browse/SERVER-38767
- gcc must be at least 5.3 so add a dependency on gcc >= 6
- Add a dependency on host-python-xxx modules:
  https://github.com/mongodb/mongo/blob/r4.0.6/docs/building.md
- Use system versions of boost, pcre, snappy, sqlite, yaml-cpp and zlib
  instead of embedded mongodb ones
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |  6 --
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ....cpp-fix-build-with-gcc-7-and-fpermissive.patch | 55 +++++++++++++
 package/mongodb/Config.in                          | 40 ++++++++++
 package/mongodb/mongodb.hash                       |  4 +
 package/mongodb/mongodb.mk                         | 92 ++++++++++++++++++++++
 7 files changed, 193 insertions(+), 6 deletions(-)

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
index f2e69cc041..c17ba6db99 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -789,6 +789,7 @@ F:	package/libxslt/
 F:	package/mbedtls/
 F:	package/minissdpd/
 F:	package/minizip/
+F:	package/mongodb/
 F:	package/motion/
 F:	package/mutt/
 F:	package/ncmpc/
diff --git a/package/Config.in b/package/Config.in
index 29862c478c..cc232b9fba 100644
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
diff --git a/package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch b/package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch
new file mode 100644
index 0000000000..b4b1746682
--- /dev/null
+++ b/package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch
@@ -0,0 +1,55 @@
+From 362be06fc16a5ad0f9e9aa90cc763c5242e8e35c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Feb 2019 12:41:45 +0100
+Subject: [PATCH] ssl_manager.cpp: fix build with gcc 7 and -fpermissive
+
+Change prototype of DERToken::parse function from
+parse(ConstDataRange cdr, size_t* outLength);
+to parse(ConstDataRange cdr, uint64_t* outLength);
+
+Otherwise, we got the following error:
+
+src/mongo/util/net/ssl_manager.cpp: In static member function 'static mongo::StatusWith<mongo::{anonymous}::DERToken> mongo::{anonymous}::DERToken::parse(mongo::ConstDataRange, size_t*)':
+src/mongo/util/net/ssl_manager.cpp:575:79: error: invalid conversion from 'size_t* {aka unsigned int*}' to 'long unsigned int*' [-fpermissive]
+  if (mongoUnsignedAddOverflow64(tagAndLengthByteCount, derLength, outLength) ||
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mongodb/mongo/pull/1296]
+---
+ src/mongo/util/net/ssl_manager.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/mongo/util/net/ssl_manager.cpp b/src/mongo/util/net/ssl_manager.cpp
+index b93ebe84a4..3511eb5d99 100644
+--- a/src/mongo/util/net/ssl_manager.cpp
++++ b/src/mongo/util/net/ssl_manager.cpp
+@@ -782,7 +782,7 @@ public:
+      *
+      * Returns a DERToken which consists of the (tag, length, value) tuple.
+      */
+-    static StatusWith<DERToken> parse(ConstDataRange cdr, size_t* outLength);
++    static StatusWith<DERToken> parse(ConstDataRange cdr, uint64_t* outLength);
+ 
+ private:
+     DERType _type{DERType::EndOfContent};
+@@ -799,7 +799,7 @@ struct DataType::Handler<DERToken> {
+                        size_t length,
+                        size_t* advanced,
+                        std::ptrdiff_t debug_offset) {
+-        size_t outLength;
++        uint64_t outLength;
+ 
+         auto swPair = DERToken::parse(ConstDataRange(ptr, length), &outLength);
+ 
+@@ -844,7 +844,7 @@ StatusWith<std::string> readDERString(ConstDataRangeCursor& cdc) {
+ }
+ 
+ 
+-StatusWith<DERToken> DERToken::parse(ConstDataRange cdr, size_t* outLength) {
++StatusWith<DERToken> DERToken::parse(ConstDataRange cdr, uint64_t* outLength) {
+     const size_t kTagLength = 1;
+     const size_t kTagLengthAndInitialLengthByteLength = kTagLength + 1;
+ 
+-- 
+2.14.1
+
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
new file mode 100644
index 0000000000..969b8e062f
--- /dev/null
+++ b/package/mongodb/Config.in
@@ -0,0 +1,40 @@
+# from https://docs.mongodb.com/manual/installation/#supported-platforms
+config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
+	bool
+	# ARM needs LDREX/STREX, so ARMv6+
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
+	default y if BR2_aarch64 || BR2_powerpc64 || BR2_x86_64
+
+config BR2_PACKAGE_MONGODB
+	bool "mongodb"
+	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC # needs glibc malloc_usable_size
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_IOSTREAMS
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_SNAPPY
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_YAML_CPP
+	select BR2_PACKAGE_ZLIB
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
+comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 6"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
new file mode 100644
index 0000000000..916323d7c1
--- /dev/null
+++ b/package/mongodb/mongodb.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256 5db85f06b2a0b2ae393339a4aed1366928aaef2b46c7c32826fa87c3217dc6f7  mongodb-r4.0.6.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
+sha256 09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
new file mode 100644
index 0000000000..e420ecb41d
--- /dev/null
+++ b/package/mongodb/mongodb.mk
@@ -0,0 +1,92 @@
+################################################################################
+#
+# mongodb
+#
+################################################################################
+
+MONGODB_VERSION_BASE = 4.0.6
+MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
+MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
+
+MONGODB_LICENSE = Apache-2.0 (drivers), SSPL (database)
+MONGODB_LICENSE_FILES = APACHE-2.0.txt LICENSE-Community.txt
+
+MONGODB_DEPENDENCIES = \
+	boost \
+	host-python-cheetah \
+	host-python-pyyaml \
+	host-python-typing \
+	host-scons \
+	pcre \
+	snappy \
+	sqlite \
+	yaml-cpp \
+	zlib
+
+MONGODB_SCONS_TARGETS = mongod mongos
+
+MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
+	-j"$(PARALLEL_JOBS)"
+
+MONGODB_SCONS_OPTS = \
+	--disable-warnings-as-errors \
+	--use-system-boost \
+	--use-system-pcre \
+	--use-system-snappy \
+	--use-system-sqlite \
+	--use-system-yaml \
+	--use-system-zlib
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
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+MONGODB_DEPENDENCIES += libcurl
+MONGODB_SCONS_OPTS += --enable-free-mon=on
+else
+MONGODB_SCONS_OPTS += --enable-free-mon=off
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MONGODB_DEPENDENCIES += openssl
+MONGODB_SCONS_OPTS += \
+	--ssl \
+	--ssl-provider=openssl
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
