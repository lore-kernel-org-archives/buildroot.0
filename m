From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 12:45:18 +0100
Subject: [Buildroot] [PATCH 2/12] package/mongodb: add zlib mandatory
 dependency
In-Reply-To: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210114528.1753-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this change, mongodb uses its own embedded version of zlib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/Config.in  | 1 +
 package/mongodb/mongodb.mk | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index ed3ad56916..3748095a5b 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_MONGODB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_ZLIB
 	help
 	  MongoDB is a cross-platform document-oriented database
 	  (NoSQL).
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 54c904e51a..bcba6a40b3 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -11,14 +11,18 @@ MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 MONGODB_LICENSE = AGPL-3.0, Apache-2.0
 MONGODB_LICENSE_FILES = GNU-AGPL-3.0.txt APACHE-2.0.txt
 
-MONGODB_DEPENDENCIES = host-scons
+MONGODB_DEPENDENCIES = \
+	host-scons \
+	zlib
 
 MONGODB_SCONS_TARGETS = mongod mongos
 
 MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
 	-j"$(PARALLEL_JOBS)"
 
-MONGODB_SCONS_OPTS = --disable-warnings-as-errors
+MONGODB_SCONS_OPTS = \
+	--disable-warnings-as-errors \
+	--use-system-zlib
 
 # need to pass mongo version when not building from git repo
 MONGODB_SCONS_OPTS += MONGO_VERSION=$(MONGODB_VERSION_BASE)-
-- 
2.14.1
