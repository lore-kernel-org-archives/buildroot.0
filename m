From: Leonid Yuriev <leo@yuriev.ru>
Date: Fri,  2 Oct 2020 14:21:43 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/libmdbx: new package
 (library/database).
In-Reply-To: <20201002112143.17656-1-leo@yuriev.ru>
References: <20201002112143.17656-1-leo@yuriev.ru>
Message-ID: <20201002112143.17656-2-leo@yuriev.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds libmdbx v0.9.1:
 - libmdbx is one of the fastest compact embeddable key-value ACID database.
 - libmdbx has a specific set of properties and capabilities,
   focused on creating unique lightweight solutions.
 - libmdbx surpasses the legendary LMDB (Lightning Memory-Mapped Database)
   in terms of reliability, features and performance.

https://github.com/erthink/libmdbx

Signed-off-by: Leonid Yuriev <leo@yuriev.ru>

---
Changes v1 -> v2:
  - libmdbx version v0.8.2 -> v0.9.1 (released 2020-09-30)

Signed-off-by: Leonid Yuriev <leo@yuriev.ru>
---
 DEVELOPERS                   |  3 ++
 package/Config.in            |  1 +
 package/libmdbx/Config.in    | 35 ++++++++++++++++++++++
 package/libmdbx/libmdbx.hash |  2 ++
 package/libmdbx/libmdbx.mk   | 57 ++++++++++++++++++++++++++++++++++++
 5 files changed, 98 insertions(+)
 create mode 100644 package/libmdbx/Config.in
 create mode 100644 package/libmdbx/libmdbx.hash
 create mode 100644 package/libmdbx/libmdbx.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9352d891d3..301372fc40 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1544,6 +1544,9 @@ N:	Leon Anavi <leon.anavi@konsulko.com>
 F:	board/olimex/a10_olinuxino
 F:	configs/olimex_a10_olinuxino_lime_defconfig
 
+N:	Leonid Yuriev <leo@yuriev.ru>
+F:	package/libmdbx
+
 N:	Lionel Flandrin <lionel@svkt.org>
 F:	package/python-babel/
 F:	package/python-daemonize/
diff --git a/package/Config.in b/package/Config.in
index 51583d07d6..f87e0388a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1370,6 +1370,7 @@ menu "Database"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
 	source "package/libgit2/Config.in"
+	source "package/libmdbx/Config.in"
 	source "package/libodb/Config.in"
 	source "package/libodb-boost/Config.in"
 	source "package/libodb-mysql/Config.in"
diff --git a/package/libmdbx/Config.in b/package/libmdbx/Config.in
new file mode 100644
index 0000000000..7d2d321095
--- /dev/null
+++ b/package/libmdbx/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_LIBMDBX
+	bool "libmdbx"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	help
+	  One of the fastest compact key-value ACID database
+	  without WAL. libmdbx has a specific set of properties
+	  and capabilities, focused on creating unique lightweight
+	  solutions.
+
+	  libmdbx surpasses the legendary legendary LMDB in terms of
+	  reliability, features and performance.
+
+	  https://github.com/erthink/libmdbx
+
+if BR2_PACKAGE_LIBMDBX
+
+config BR2_PACKAGE_LIBMDBX_TOOLS
+	bool "install tools"
+	help
+	  Install libmdbx tools for checking, dump, restore
+	  and show statistics of databases.
+
+# C++ API is preliminary for now
+#config BR2_PACKAGE_LIBMDBX_CXX
+#	bool "C++ API"
+#	select BR2_INSTALL_LIBSTDCPP
+#	help
+#	  Enable modern C++ API for libmdbx.
+
+endif
+
+comment "libmdbx needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
new file mode 100644
index 0000000000..f48cd81a7d
--- /dev/null
+++ b/package/libmdbx/libmdbx.hash
@@ -0,0 +1,2 @@
+sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
+sha256  c7fb24381eb4d92f2e2edc17e577cb721269683c816c6cca307c58f6f346e786  libmdbx-amalgamated-0.9.1.tar.gz
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
new file mode 100644
index 0000000000..894b7f0838
--- /dev/null
+++ b/package/libmdbx/libmdbx.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# libmdbx
+#
+# One of the fastest embeddable key-value ACID database without WAL. libmdbx is
+# superior to legendary LMDB in terms of reliability, features and performance.
+#
+################################################################################
+
+LIBMDBX_VERSION = 0.9.1
+LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
+LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
+LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBMDBX_LICENSE = OLDAP-2.8
+LIBMDBX_LICENSE_FILES = LICENSE
+LIBMDBX_REDISTRIBUTE = YES
+LIBMDBX_STRIP_COMPONENTS = 0
+LIBMDBX_INSTALL_STAGING = YES
+
+LIBMDBX_CONF_OPTS = -DMDBX_INSTALL_MANPAGES:BOOL=OFF -DBUILD_FOR_NATIVE_CPU:BOOL=OFF
+
+# C++ API is preliminary for now
+#ifeq ($(BR2_PACKAGE_LIBMDBX_CXX),y)
+#LIBMDBX_CONF_OPTS += -DMDBX_BUILD_CXX:BOOL=ON
+#else
+#LIBMDBX_CONF_OPTS += -DMDBX_BUILD_CXX:BOOL=OFF
+#endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBMDBX_CONF_OPTS += -DMDBX_INSTALL_STATIC:BOOL=ON
+else
+LIBMDBX_CONF_OPTS += -DMDBX_INSTALL_STATIC:BOOL=OFF
+endif
+
+ifeq ($(BR2_SHARED_LIBS),y)
+LIBMDBX_CONF_OPTS += -DMDBX_BUILD_SHARED_LIBRARY:BOOL=ON
+LIBMDBX_INSTALL_TARGET = YES
+ifeq ($(BR2_PACKAGE_LIBMDBX_TOOLS),y)
+LIBMDBX_CONF_OPTS += -DMDBX_BUILD_TOOLS:BOOL=ON -DMDBX_LINK_TOOLS_NONSTATIC:BOOL=ON
+else
+LIBMDBX_CONF_OPTS += -DMDBX_BUILD_TOOLS:BOOL=OFF
+endif
+
+else
+
+LIBMDBX_CONF_OPTS += -DMDBX_BUILD_SHARED_LIBRARY:BOOL=OFF
+ifeq ($(BR2_PACKAGE_LIBMDBX_TOOLS),y)
+LIBMDBX_CONF_OPTS += -DMDBX_BUILD_TOOLS:BOOL=ON -DMDBX_LINK_TOOLS_NONSTATIC:BOOL=OFF
+LIBMDBX_INSTALL_TARGET = YES
+else
+LIBMDBX_CONF_OPTS += -DMDBX_BUILD_TOOLS:BOOL=OFF
+LIBMDBX_INSTALL_TARGET = NO
+endif
+
+endif
+
+$(eval $(cmake-package))
-- 
2.28.0
