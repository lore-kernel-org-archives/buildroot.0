From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2020 14:53:15 +0100
Subject: [Buildroot] [git commit] package/libmdbx: new package
 (library/database).
Message-ID: <20201231133608.A665B83566@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f36093a49ea0b7ea18e1d8ffa0914158b848ec9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds libmdbx v0.9.2:
 - libmdbx is one of the fastest compact embeddable key-value ACID database.
 - libmdbx has a specific set of properties and capabilities,
   focused on creating unique lightweight solutions.
 - libmdbx surpasses the legendary LMDB (Lightning Memory-Mapped Database)
   in terms of reliability, features and performance.
 - https://github.com/erthink/libmdbx

Signed-off-by: Leonid Yuriev <leo@yuriev.ru>
[yann.morin.1998 at free.fr: split long lines]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/libmdbx/Config.in    | 45 ++++++++++++++++++++++++++++++++++++++++++++
 package/libmdbx/libmdbx.hash |  5 +++++
 package/libmdbx/libmdbx.mk   | 39 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 93 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bf0716aadb..263b57c308 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1487,6 +1487,9 @@ N:	Leon Anavi <leon.anavi@konsulko.com>
 F:	board/olimex/a10_olinuxino
 F:	configs/olimex_a10_olinuxino_lime_defconfig
 
+N:	Leonid Yuriev <leo@yuriev.ru>
+F:	package/libmdbx/
+
 N:	Lionel Flandrin <lionel@svkt.org>
 F:	package/python-babel/
 F:	package/python-daemonize/
diff --git a/package/Config.in b/package/Config.in
index 2dd477d1c6..30bb5814d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1380,6 +1380,7 @@ menu "Database"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
 	source "package/libgit2/Config.in"
+	source "package/libmdbx/Config.in"
 	source "package/libodb/Config.in"
 	source "package/libodb-boost/Config.in"
 	source "package/libodb-mysql/Config.in"
diff --git a/package/libmdbx/Config.in b/package/libmdbx/Config.in
new file mode 100644
index 0000000000..d13f73938f
--- /dev/null
+++ b/package/libmdbx/Config.in
@@ -0,0 +1,45 @@
+config BR2_PACKAGE_LIBMDBX
+	bool "libmdbx"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
+	help
+	  One of the fastest compact key-value ACID database
+	  without WAL. libmdbx has a specific set of properties
+	  and capabilities, focused on creating unique lightweight
+	  solutions.
+
+	  libmdbx surpasses the legendary LMDB in terms of
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
+config BR2_PACKAGE_LIBMDBX_CXX
+	bool "C++ API"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	help
+	  Enable modern C++11/14/17/20 API for libmdbx.
+
+comment "libmdbx C++ support needs a toolchain w/ C++11, gcc >= 4.8 w/o bug#64735"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+endif
+
+comment "libmdbx needs MMU, a toolchain w/ threads, gcc >= 4.4 w/ 4-byte atomics"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_SYNC_4 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
new file mode 100644
index 0000000000..0d3501f1d9
--- /dev/null
+++ b/package/libmdbx/libmdbx.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://github.com/erthink/libmdbx/releases/
+sha256  c35cc53d66d74ebfc86e39441ba26276541ac7892bf91dba1e70c83665a02767  libmdbx-amalgamated-0.9.2.tar.gz
+
+# Locally calculated
+sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
new file mode 100644
index 0000000000..878ea87c07
--- /dev/null
+++ b/package/libmdbx/libmdbx.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# libmdbx
+#
+################################################################################
+
+LIBMDBX_VERSION = 0.9.2
+LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
+LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
+LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBMDBX_LICENSE = OLDAP-2.8
+LIBMDBX_LICENSE_FILES = LICENSE
+LIBMDBX_REDISTRIBUTE = YES
+LIBMDBX_STRIP_COMPONENTS = 0
+LIBMDBX_INSTALL_STAGING = YES
+
+LIBMDBX_CONF_OPTS = \
+	-DMDBX_INSTALL_MANPAGES=OFF \
+	-DBUILD_FOR_NATIVE_CPU=OFF \
+	-DMDBX_BUILD_CXX=$(if $(BR2_PACKAGE_LIBMDBX_CXX),ON,OFF) \
+	-DMDBX_BUILD_TOOLS=$(if $(BR2_PACKAGE_LIBMDBX_TOOLS),ON,OFF)
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBMDBX_CONF_OPTS += -DMDBX_INSTALL_STATIC=ON
+else
+LIBMDBX_CONF_OPTS += -DMDBX_INSTALL_STATIC=OFF
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBMDBX_CONF_OPTS += \
+	-DMDBX_BUILD_SHARED_LIBRARY=ON \
+	-DMDBX_LINK_TOOLS_NONSTATIC=ON
+else
+LIBMDBX_CONF_OPTS += \
+	-DMDBX_BUILD_SHARED_LIBRARY=OFF \
+	-DMDBX_LINK_TOOLS_NONSTATIC=OFF
+endif
+
+$(eval $(cmake-package))
