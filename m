From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 12:45:24 +0100
Subject: [Buildroot] [PATCH 8/12] package/mongodb: bump to version 4.0.6
In-Reply-To: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210114528.1753-8-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-add-missing-sysmacros-include.patch       | 19 --------
 ....cpp-fix-build-with-gcc-7-and-fpermissive.patch | 55 ++++++++++++++++++++++
 package/mongodb/Config.in                          | 10 ++--
 package/mongodb/mongodb.hash                       |  4 +-
 package/mongodb/mongodb.mk                         | 14 ++++--
 5 files changed, 73 insertions(+), 29 deletions(-)
 delete mode 100644 package/mongodb/0001-add-missing-sysmacros-include.patch
 create mode 100644 package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch

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
index 2eaa9e908c..8bfbe0168c 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -1,9 +1,9 @@
-# from src/mongo/platform/bits.h
+# from https://docs.mongodb.com/manual/installation/#supported-platforms
 config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
 	bool
 	# ARM needs LDREX/STREX, so ARMv6+
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
-	default y if BR2_aarch64 || BR2_i386 || BR2_powerpc64 || BR2_x86_64
+	default y if BR2_aarch64 || BR2_powerpc64 || BR2_x86_64
 
 config BR2_PACKAGE_MONGODB
 	bool "mongodb"
@@ -12,7 +12,7 @@ config BR2_PACKAGE_MONGODB
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_PACKAGE_SNAPPY
 	select BR2_PACKAGE_YAML_CPP
 	select BR2_PACKAGE_ZLIB
@@ -26,8 +26,8 @@ config BR2_PACKAGE_MONGODB
 
 	  https://www.mongodb.org/
 
-comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 6"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index b01ad53ab5..916323d7c1 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,2 +1,4 @@
 # Locally computed:
-sha256 4764945631bca4ac5c2b239e04e91db00e39716915204349170c37cb7897c564  mongodb-r3.3.4.tar.gz
+sha256 5db85f06b2a0b2ae393339a4aed1366928aaef2b46c7c32826fa87c3217dc6f7  mongodb-r4.0.6.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
+sha256 09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 07b854842f..8679641c5d 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,14 +4,17 @@
 #
 ################################################################################
 
-MONGODB_VERSION_BASE = 3.3.4
+MONGODB_VERSION_BASE = 4.0.6
 MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
 MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 
-MONGODB_LICENSE = AGPL-3.0, Apache-2.0
-MONGODB_LICENSE_FILES = GNU-AGPL-3.0.txt APACHE-2.0.txt
+MONGODB_LICENSE = Apache-2.0 (drivers), SSPL (database)
+MONGODB_LICENSE_FILES = APACHE-2.0.txt LICENSE-Community.txt
 
 MONGODB_DEPENDENCIES = \
+	host-python-cheetah \
+	host-python-pyyaml \
+	host-python-typing \
 	host-scons \
 	snappy \
 	yaml-cpp \
@@ -24,6 +27,7 @@ MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
 
 MONGODB_SCONS_OPTS = \
 	--disable-warnings-as-errors \
+	--enable-free-mon=off \
 	--use-system-snappy \
 	--use-system-yaml \
 	--use-system-zlib
@@ -51,7 +55,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGODB_DEPENDENCIES += openssl
-MONGODB_SCONS_OPTS += --ssl=SSL
+MONGODB_SCONS_OPTS += \
+	--ssl \
+	--ssl-provider=openssl
 endif
 
 define MONGODB_BUILD_CMDS
-- 
2.14.1
