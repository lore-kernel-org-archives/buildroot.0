From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 09:54:19 +0200
Subject: [Buildroot] [git commit] package/leveldb: bump version to 1.22
Message-ID: <20191026074853.CD86388203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4168497bb47b0ee983ec62404612d42baaca43ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream switched to cmake, removed patches for the old buildsystem
and added new patch to install libmemenv.a and memenv.h.

Added license hash.

Package requires gcc >= 4.8:
https://github.com/google/leveldb/blob/master/CMakeLists.txt#L14

Removed "v" from LEVELDB_SITE to reflect current naming scheme.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/leveldb/0002-Add-install-recipe.patch      | 42 -------------
 .../leveldb/0002-CMake-install-libmemenv.a.patch   | 68 ++++++++++++++++++++++
 ...sition-independant-code-for-static-librar.patch | 52 -----------------
 package/leveldb/Config.in                          |  6 +-
 package/leveldb/leveldb.hash                       |  3 +-
 package/leveldb/leveldb.mk                         | 30 +---------
 6 files changed, 77 insertions(+), 124 deletions(-)

diff --git a/package/leveldb/0002-Add-install-recipe.patch b/package/leveldb/0002-Add-install-recipe.patch
deleted file mode 100644
index 29bf4a4831..0000000000
--- a/package/leveldb/0002-Add-install-recipe.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From bf646b73391d3d2d0b9780a399dd24880c66b9ab Mon Sep 17 00:00:00 2001
-From: Steve James <ste@junkomatic.net>
-Date: Sun, 5 Apr 2015 16:30:46 +0200
-Subject: [PATCH 2/2] Add install recipe
-
-Upstream-Status: Rejected [https://github.com/google/leveldb/pull/276]
-
-Signed-off-by: Steve James <ste@junkomatic.net>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[baruch: update for v1.19]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[Bernd: update for v1.20]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Makefile | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 07a5a1ead6fd..c87023db527a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -412,3 +412,17 @@ $(SHARED_OUTDIR)/%.o: %.cc
- 
- $(SHARED_OUTDIR)/port/port_posix_sse.o: port/port_posix_sse.cc
- 	$(CXX) $(CXXFLAGS) $(PLATFORM_SHARED_CFLAGS) $(PLATFORM_SSEFLAGS) -c $< -o $@
-+
-+INSTALL_ROOT = /
-+INSTALL_PREFIX= usr/local
-+
-+install: all
-+	install -d -m 0755 $(INSTALL_ROOT)$(INSTALL_PREFIX)/include/leveldb
-+	install -D -m 0644 include/leveldb/*.h $(INSTALL_ROOT)$(INSTALL_PREFIX)/include/leveldb
-+	install -d -m 0755 $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
-+	install -m 0644 $(STATIC_OUTDIR)/libleveldb.a $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
-+ifneq (,$(SHARED_LIBS))
-+	install -m 0755 $(SHARED_OUTDIR)/$(SHARED_LIB3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
-+	ln -sf $(SHARED_LIB3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib/$(SHARED_LIB1)
-+	ln -sf $(SHARED_LIB3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib/$(SHARED_LIB2)
-+endif
--- 
-2.1.0
-
diff --git a/package/leveldb/0002-CMake-install-libmemenv.a.patch b/package/leveldb/0002-CMake-install-libmemenv.a.patch
new file mode 100644
index 0000000000..85ee8a824b
--- /dev/null
+++ b/package/leveldb/0002-CMake-install-libmemenv.a.patch
@@ -0,0 +1,68 @@
+From 2fa960098e5b6f9daa9f7d6cab27188566859be8 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 12 Oct 2019 14:43:46 +0200
+Subject: [PATCH] CMake: install libmemenv.a
+
+Needed for qt5webkit
+https://git.busybox.net/buildroot/commit/?id=8a10d9ce311c6cb0490d76921cae55618c258354
+https://git.busybox.net/buildroot/commit/?id=16f847340d07dce620e4c3fc0a099aa79898d86a
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt | 26 +++++++++++++++++++++++++-
+ 1 file changed, 25 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a65afbf..83b2425 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -199,6 +199,24 @@ target_sources(leveldb
+     "${LEVELDB_PUBLIC_INCLUDE_DIR}/write_batch.h"
+ )
+ 
++set(libmemenv_a_sources
++    "${PROJECT_SOURCE_DIR}/helpers/memenv/memenv.cc"
++    "${PROJECT_SOURCE_DIR}/helpers/memenv/memenv.h"
++    )
++add_library(memenv STATIC ${libmemenv_a_sources})
++target_compile_definitions(memenv
++  PRIVATE
++    # Used by include/export.h when building shared libraries.
++    LEVELDB_COMPILE_LIBRARY
++    # Used by port/port.h.
++    ${LEVELDB_PLATFORM_NAME}=1
++)
++target_include_directories(memenv
++  PUBLIC
++    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
++    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
++)
++
+ if (WIN32)
+   target_sources(leveldb
+     PRIVATE
+@@ -418,7 +436,7 @@ endif(LEVELDB_BUILD_BENCHMARKS)
+ 
+ if(LEVELDB_INSTALL)
+   include(GNUInstallDirs)
+-  install(TARGETS leveldb
++  install(TARGETS leveldb memenv
+     EXPORT leveldbTargets
+     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+@@ -444,6 +462,12 @@ if(LEVELDB_INSTALL)
+     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/leveldb
+   )
+ 
++  install(
++    FILES
++      "${PROJECT_SOURCE_DIR}/helpers/memenv/memenv.h"
++    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/helpers/memenv
++  )
++
+   include(CMakePackageConfigHelpers)
+   write_basic_package_version_file(
+       "${PROJECT_BINARY_DIR}/leveldbConfigVersion.cmake"
+-- 
+2.20.1
+
diff --git a/package/leveldb/0003-Generate-position-independant-code-for-static-librar.patch b/package/leveldb/0003-Generate-position-independant-code-for-static-librar.patch
deleted file mode 100644
index dce06ec725..0000000000
--- a/package/leveldb/0003-Generate-position-independant-code-for-static-librar.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6ed1b57ef6bcee0d497c181730710b2b0fafbfb3 Mon Sep 17 00:00:00 2001
-From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
-Date: Fri, 31 Aug 2018 12:23:46 -0400
-Subject: [PATCH] Generate position independant code for static library
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf-8
-Content-Transfer-Encoding: 8bit
-
-Currently, only shared libraries are using the PIC flag.
-
-Generalize this flag for static libraries in order to let them linkable
-by dynamic libraries.
-
-Fixes:
-
-	/home/gportay/src/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-amd-linux-gnu/6.2.0/../../../../x86_64-amd-linux-gnu/bin/ld: /home/gportay/src/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libmemenv.a(memenv.o): relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC
-	/home/gportay/src/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libmemenv.a: error adding symbols: Bad value
-	collect2: error: ld returned 1 exit status
-
-Upstream-Status: Inappropriate [upstream has migrated to cmake]
-Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
----
- build_detect_platform | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/build_detect_platform b/build_detect_platform
-index d2a20ce..4839444 100755
---- a/build_detect_platform
-+++ b/build_detect_platform
-@@ -55,8 +55,8 @@ fi
- 
- COMMON_FLAGS=
- CROSS_COMPILE=
--PLATFORM_CCFLAGS=
--PLATFORM_CXXFLAGS=
-+PLATFORM_CCFLAGS="-fPIC"
-+PLATFORM_CXXFLAGS="-fPIC"
- PLATFORM_LDFLAGS=
- PLATFORM_LIBS=
- PLATFORM_SHARED_EXT="so"
-@@ -197,7 +197,7 @@ else
- EOF
-     if [ "$?" = 0 ]; then
-         COMMON_FLAGS="$COMMON_FLAGS -DLEVELDB_PLATFORM_POSIX -DLEVELDB_ATOMIC_PRESENT"
--        PLATFORM_CXXFLAGS="-std=c++0x"
-+        PLATFORM_CXXFLAGS="$PLATFORM_CXXFLAGS -std=c++0x"
-     else
-         COMMON_FLAGS="$COMMON_FLAGS -DLEVELDB_PLATFORM_POSIX"
-     fi
--- 
-2.18.0
-
diff --git a/package/leveldb/Config.in b/package/leveldb/Config.in
index 163a75e8f2..c767b88645 100644
--- a/package/leveldb/Config.in
+++ b/package/leveldb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LEVELDB
 	bool "leveldb"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_SNAPPY
 	help
@@ -10,5 +11,6 @@ config BR2_PACKAGE_LEVELDB
 
 	  https://github.com/google/leveldb
 
-comment "leveldb needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "leveldb needs a toolchain w/ C++, threads, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/leveldb/leveldb.hash b/package/leveldb/leveldb.hash
index 008c1a6c40..c4a8499dec 100644
--- a/package/leveldb/leveldb.hash
+++ b/package/leveldb/leveldb.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 f5abe8b5b209c2f36560b75f32ce61412f39a2922f7045ae764a2c23335b6664  leveldb-1.20.tar.gz
+sha256 55423cac9e3306f4a9502c738a001e4a339d1a38ffbee7572d4a07d5d63949b2  leveldb-1.22.tar.gz
+sha256 ccc19f1da0798ed666609b65a5b44dd8b3abe6fc08b9c0592eb76e82e174db19  LICENSE
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 6c1a0e66fb..8aabc7e7a7 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -4,35 +4,11 @@
 #
 ################################################################################
 
-LEVELDB_VERSION = 1.20
-LEVELDB_SITE = $(call github,google,leveldb,v$(LEVELDB_VERSION))
+LEVELDB_VERSION = 1.22
+LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
 LEVELDB_LICENSE = BSD-3-Clause
 LEVELDB_LICENSE_FILES = LICENSE
 LEVELDB_INSTALL_STAGING = YES
 LEVELDB_DEPENDENCIES = snappy
 
-# Disable the shared library for static only build
-ifeq ($(BR2_STATIC_LIBS),y)
-LEVELDB_MAKE_ARGS += SHARED_LIBS= SHARED_PROGRAMS=
-endif
-
-define LEVELDB_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) \
-		$(LEVELDB_MAKE_ARGS) -C $(@D)
-endef
-
-define LEVELDB_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) \
-		INSTALL_ROOT=$(STAGING_DIR) INSTALL_PREFIX=/usr \
-		$(LEVELDB_MAKE_ARGS) -C $(@D) install
-	$(INSTALL) -D -m 0644 $(@D)/out-static/libmemenv.a $(STAGING_DIR)/usr/lib/libmemenv.a
-	$(INSTALL) -D -m 0644 $(@D)/helpers/memenv/memenv.h $(STAGING_DIR)/usr/include/helpers/memenv/memenv.h
-endef
-
-define LEVELDB_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) \
-		INSTALL_ROOT=$(TARGET_DIR) INSTALL_PREFIX=/usr \
-		$(LEVELDB_MAKE_ARGS) -C $(@D) install
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
