From: Leonid Yuriev <leo@yuriev.ru>
Date: Sun, 27 Sep 2020 22:49:49 +0300
Subject: [Buildroot] [PATCH v1 1/1] package/libmdbx: new package
 (library/database).
Message-ID: <20200927194949.790269-1-leo@yuriev.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - libmdbx is one of the fastest compact embeddable key-value ACID database.

 - libmdbx has a specific set of properties and capabilities,
   focused on creating unique lightweight solutions.

 - libmdbx is superior to legendary LMDB (Lightning Memory-Mapped Database)
   in terms of reliability, features and performance.

https://github.com/erthink/libmdbx

Signed-off-by: Leonid Yuriev <leo@yuriev.ru>

---
This patch adds libmdbx v0.8.2 mostly for review and testing.
After obtaining a feedback I plan update this to v0.9.1,
which is scheduled for release next week.

Signed-off-by: Leonid Yuriev <leo@yuriev.ru>
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...x-remove-requirements-for-C-compiler.patch | 26 +++++++++
 .../0002-mdbx-fix-build-with-uclibc.patch     | 37 ++++++++++++
 .../0003-mdbx-fix-so-lib-install-dir.patch    | 55 ++++++++++++++++++
 package/libmdbx/Config.in                     | 35 +++++++++++
 package/libmdbx/libmdbx.hash                  |  2 +
 package/libmdbx/libmdbx.mk                    | 58 +++++++++++++++++++
 8 files changed, 217 insertions(+)
 create mode 100644 package/libmdbx/0001-mdbx-remove-requirements-for-C-compiler.patch
 create mode 100644 package/libmdbx/0002-mdbx-fix-build-with-uclibc.patch
 create mode 100644 package/libmdbx/0003-mdbx-fix-so-lib-install-dir.patch
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
diff --git a/package/libmdbx/0001-mdbx-remove-requirements-for-C-compiler.patch b/package/libmdbx/0001-mdbx-remove-requirements-for-C-compiler.patch
new file mode 100644
index 0000000000..9a0cf2c9e0
--- /dev/null
+++ b/package/libmdbx/0001-mdbx-remove-requirements-for-C-compiler.patch
@@ -0,0 +1,26 @@
+From 9f05805a77786d7544903f75f200bc6d12a28d8a Mon Sep 17 00:00:00 2001
+From: Leonid Yuriev <leo@yuriev.ru>
+Date: Sun, 27 Sep 2020 18:12:21 +0300
+Subject: [PATCH 1/2] mdbx: remove requirements for C++ compiler.
+
+Change-Id: I958cbdfc925076335b8cb08eabb1777659e1d287
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e00f34034..27f24c131 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -89,7 +89,7 @@ if(DEFINED PROJECT_NAME)
+ else()
+   set(SUBPROJECT OFF)
+   set(NOT_SUBPROJECT ON)
+-  project(libmdbx C CXX)
++  project(libmdbx C)
+   if(NOT MDBX_AMALGAMATED_SOURCE AND NOT DEFINED BUILD_TESTING)
+     set(BUILD_TESTING ON)
+   endif()
+-- 
+2.28.0
+
diff --git a/package/libmdbx/0002-mdbx-fix-build-with-uclibc.patch b/package/libmdbx/0002-mdbx-fix-build-with-uclibc.patch
new file mode 100644
index 0000000000..bfd1bf3154
--- /dev/null
+++ b/package/libmdbx/0002-mdbx-fix-build-with-uclibc.patch
@@ -0,0 +1,37 @@
+From 6879d49a7af3ae48da773d0e55119a61aa9657ac Mon Sep 17 00:00:00 2001
+From: Leonid Yuriev <leo@yuriev.ru>
+Date: Sun, 27 Sep 2020 12:50:13 +0300
+Subject: [PATCH 2/2] mdbx: fix build with uclibc.
+
+Change-Id: I907fecd84b335a84d5f1dcaa44ac489c4dfb1907
+---
+ mdbx.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/mdbx.c b/mdbx.c
+index 5059cefe2..808347c72 100644
+--- a/mdbx.c
++++ b/mdbx.c
+@@ -22168,7 +22168,18 @@ typedef struct _FILE_PROVIDER_EXTERNAL_INFO_V1 {
+ 
+ /*----------------------------------------------------------------------------*/
+ 
+-#if _POSIX_C_SOURCE > 200212 &&                                                \
++#if defined(__UCLIBC__)
++__extern_C void __assert(const char *, const char *, unsigned int, const char *)
++#ifdef __THROW
++    __THROW
++#else
++    __nothrow
++#endif /* __THROW */
++    __noreturn;
++#define __assert_fail(assertion, file, line, function)                         \
++  __assert(assertion, file, line, function)
++
++#elif _POSIX_C_SOURCE > 200212 &&                                              \
+     /* workaround for avoid musl libc wrong prototype */ (                     \
+         defined(__GLIBC__) || defined(__GNU_LIBRARY__))
+ /* Prototype should match libc runtime. ISO POSIX (2003) & LSB 1.x-3.x */
+-- 
+2.28.0
+
diff --git a/package/libmdbx/0003-mdbx-fix-so-lib-install-dir.patch b/package/libmdbx/0003-mdbx-fix-so-lib-install-dir.patch
new file mode 100644
index 0000000000..d42b8b910f
--- /dev/null
+++ b/package/libmdbx/0003-mdbx-fix-so-lib-install-dir.patch
@@ -0,0 +1,55 @@
+From 79bdadcebf9d6ea62198ec4b892fcb58dca256a8 Mon Sep 17 00:00:00 2001
+From: Leonid Yuriev <leo@yuriev.ru>
+Date: Sun, 27 Sep 2020 18:29:47 +0300
+Subject: [PATCH 3/3] mdbx: fix so-lib install dir.
+
+Change-Id: I1e3e7deee0ec9e34aea0d61e59c3be316c0a0815
+---
+ CMakeLists.txt | 12 ++++--------
+ 1 file changed, 4 insertions(+), 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 27f24c131..f7056dce5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -582,16 +582,14 @@ endif()
+ if(MDBX_BUILD_SHARED_LIBRARY)
+   if(CMAKE_VERSION VERSION_LESS 3.12)
+     install(TARGETS mdbx EXPORT libmdbx
+-      RUNTIME DESTINATION bin COMPONENT runtime
+-      LIBRARY DESTINATION bin COMPONENT runtime
++      LIBRARY DESTINATION lib COMPONENT runtime
+       OBJECTS DESTINATION lib COMPONENT devel
+       ARCHIVE DESTINATION lib COMPONENT devel
+       PUBLIC_HEADER DESTINATION include COMPONENT devel
+       INCLUDES DESTINATION include COMPONENT devel)
+   else()
+     install(TARGETS mdbx EXPORT libmdbx
+-      RUNTIME DESTINATION bin COMPONENT runtime
+-      LIBRARY DESTINATION bin COMPONENT runtime
++      LIBRARY DESTINATION lib COMPONENT runtime
+       NAMELINK_COMPONENT devel
+       OBJECTS DESTINATION lib COMPONENT devel
+       ARCHIVE DESTINATION lib COMPONENT devel
+@@ -627,16 +625,14 @@ endif(MDBX_BUILD_TOOLS)
+ if(MDBX_INSTALL_STATIC)
+   if(CMAKE_VERSION VERSION_LESS 3.12)
+     install(TARGETS mdbx-static EXPORT libmdbx
+-      RUNTIME DESTINATION bin COMPONENT runtime
+-      LIBRARY DESTINATION bin COMPONENT runtime
++      LIBRARY DESTINATION lib COMPONENT runtime
+       OBJECTS DESTINATION lib COMPONENT devel
+       ARCHIVE DESTINATION lib COMPONENT devel
+       PUBLIC_HEADER DESTINATION include COMPONENT devel
+       INCLUDES DESTINATION include COMPONENT devel)
+   else()
+     install(TARGETS mdbx-static EXPORT libmdbx
+-      RUNTIME DESTINATION bin COMPONENT runtime
+-      LIBRARY DESTINATION bin COMPONENT runtime
++      LIBRARY DESTINATION lib COMPONENT runtime
+       NAMELINK_COMPONENT devel
+       OBJECTS DESTINATION lib COMPONENT devel
+       ARCHIVE DESTINATION lib COMPONENT devel
+-- 
+2.28.0
+
diff --git a/package/libmdbx/Config.in b/package/libmdbx/Config.in
new file mode 100644
index 0000000000..596d5ff4e1
--- /dev/null
+++ b/package/libmdbx/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_LIBMDBX
+	bool "libmdbx"
+        depends on BR2_USE_MMU
+        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+        depends on BR2_TOOLCHAIN_HAS_SYNC_4
+#	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  One of the fastest compact key-value ACID database
+          without WAL. libmdbx has a specific set of properties
+          and capabilities, focused on creating unique lightweight
+          solutions.
+
+	  libmdbx is superior to legendary LMDB in terms of
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
+endif
+
+comment "libmdbx needs a toolchain w/ threads"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+# comment "libmdbx needs a glibc toolchain"
+#	depend on BR2_TOOLCHAIN_USES_GLIBC
+
+# comment "libmdbx needs a toolchain w/ C++"
+#	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
new file mode 100644
index 0000000000..3280047951
--- /dev/null
+++ b/package/libmdbx/libmdbx.hash
@@ -0,0 +1,2 @@
+sha256  6c92c6d79800135f61a4cde783a5b8c0902c28a90b802a2fe0478addc8156cbb  amalgamated.tar.gz
+sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
new file mode 100644
index 0000000000..2d69794971
--- /dev/null
+++ b/package/libmdbx/libmdbx.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# libmdbx
+#
+# One of the fastest embeddable key-value ACID database without WAL. libmdbx is
+# superior to legendary LMDB in terms of reliability, features and performance.
+#
+################################################################################
+
+LIBMDBX_VERSION = 0.8.2
+LIBMDBX_SOURCE = amalgamated.tar.gz
+LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
+LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBMDBX_LICENSE = OLDAP-2.8
+LIBMDBX_LICENSE_FILES = LICENSE
+LIBMDBX_REDISTRIBUTE = YES
+LIBMDBX_STRIP_COMPONENTS = 0
+# LIBMDBX_DEPENDENCIES =
+
+LIBMDBX_CONF_OPTS = -DMDBX_INSTALL_MANPAGES:BOOL=OFF -DBUILD_FOR_NATIVE_CPU:BOOL=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBMDBX_INSTALL_STAGING = YES
+LIBMDBX_CONF_OPTS += -DMDBX_INSTALL_STATIC:BOOL=ON
+else
+LIBMDBX_INSTALL_STAGING = NO
+LIBMDBX_CONF_OPTS += -DMDBX_INSTALL_STATIC:BOOL=OFF
+endif
+
+ifeq ($(BR2_SHARED_LIBS),y)
+
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
+# TODO:
+#  - MDBX_TXN_CHECKOWNER
+#  - MDBX_TRUST_RTC
+#  - MDBX_BUILD_CXX
+
+$(eval $(cmake-package))
-- 
2.28.0
