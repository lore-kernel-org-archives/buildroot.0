From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 20:49:45 +0100
Subject: [Buildroot] [PATCH v3,
 2/6] package/gerbera: security bump to version 1.6.4
In-Reply-To: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
References: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125194949.1173139-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- This version is compatible with libupnp 1.14.x which fix
  CallStranger a.k.a. CVE-2020-12695
- Drop all patches (already in version)
- expat is not needed since version 1.5.0 and
  https://github.com/gerbera/gerbera/commit/a4f0cccd6a1f741c55ca69b06cff3a964eebc1f3
- fmt is a mandatory dependency since version 1.5.0 and
  https://github.com/gerbera/gerbera/commit/fe81e5fc8898d6e3a53ce30ddaafb8439683f46f
- spdlog is a mandatory dependency since version 1.5.0 and
  https://github.com/gerbera/gerbera/commit/615d698fe4dce9d7462022a00c74af1fac7a1003
- pugixml is a mandatory dependency since version 1.5.0 and
  https://github.com/gerbera/gerbera/commit/c244006aa04ab2e4c5f3e7003ca727e05440238d
- libnpupnp can be used instead of libupnp since version 1.6.2 and
  https://github.com/gerbera/gerbera/commit/e648763626e3c2512801bd127a0a3b96c8716faf
- Set CXX_FILESYSTEM_NO_LINK_NEEDED to ON to avoid a build failure
  due to check_cxx_source_runs which has been added with
  https://github.com/gerbera/gerbera/commit/8ea0fce24ce9b1cf870837c3be984fed50581dfb
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3:
 - Bump to version 1.6.4 and add libnpupnp dependency

 ...build-without-js-taglib-or-atrailers.patch | 51 ---------------
 ...indLibMagic-cmake-fix-static-linking.patch | 63 -------------------
 ...make-FindMatroska-fix-static-linking.patch | 37 -----------
 package/gerbera/Config.in                     | 13 ++--
 package/gerbera/gerbera.hash                  |  4 +-
 package/gerbera/gerbera.mk                    | 18 ++++--
 6 files changed, 23 insertions(+), 163 deletions(-)
 delete mode 100644 package/gerbera/0001-fix-matroska-build-without-js-taglib-or-atrailers.patch
 delete mode 100644 package/gerbera/0002-cmake-FindLibMagic-cmake-fix-static-linking.patch
 delete mode 100644 package/gerbera/0003-cmake-FindMatroska-fix-static-linking.patch

diff --git a/package/gerbera/0001-fix-matroska-build-without-js-taglib-or-atrailers.patch b/package/gerbera/0001-fix-matroska-build-without-js-taglib-or-atrailers.patch
deleted file mode 100644
index 6898e8ebee..0000000000
--- a/package/gerbera/0001-fix-matroska-build-without-js-taglib-or-atrailers.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 0ac781b0b0deef5c02c32a70ac484f882c3f4dd0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 24 Dec 2019 18:55:57 +0100
-Subject: [PATCH] fix matroska build without js, taglib or atrailers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-i2i function is used in matroska_handler.cc but this function is defined
-only if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS)
-as a result compilation fails if HAVE_MATROSKA is set but HAVE_JS,
-HAVE_TAGLIG or ATRAILERS are not.
-
-Backported from: 0ac781b0b0deef5c02c32a70ac484f882c3f4dd0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- src/string_converter.cc | 2 +-
- src/string_converter.h  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/string_converter.cc b/src/string_converter.cc
-index f669c661..7a3c55d7 100644
---- a/src/string_converter.cc
-+++ b/src/string_converter.cc
-@@ -218,7 +218,7 @@ Ref<StringConverter> StringConverter::p2i()
- }
- #endif
- 
--#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS)
-+#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS) || defined(HAVE_MATROSKA)
- 
- Ref<StringConverter> StringConverter::i2i()
- {
-diff --git a/src/string_converter.h b/src/string_converter.h
-index 58495430..f75bf833 100644
---- a/src/string_converter.h
-+++ b/src/string_converter.h
-@@ -65,7 +65,7 @@ public:
-     static zmm::Ref<StringConverter> p2i();
- 
- #endif
--#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS)
-+#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS) || defined(HAVE_MATROSKA)
-     /// \brief safeguard - internal to internal - needed to catch some
-     /// scenarious where the user may have forgotten to add proper conversion
-     /// in the script.
--- 
-2.26.1
-
diff --git a/package/gerbera/0002-cmake-FindLibMagic-cmake-fix-static-linking.patch b/package/gerbera/0002-cmake-FindLibMagic-cmake-fix-static-linking.patch
deleted file mode 100644
index f6cc276e70..0000000000
--- a/package/gerbera/0002-cmake-FindLibMagic-cmake-fix-static-linking.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 7fdcabd80c823694d190e5baa8c657ffcae5e777 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 31 Jan 2020 17:14:11 +0100
-Subject: [PATCH] cmake/FindLibMagic.cmake: fix static linking
-
-libmagic can optionally depends on xz (for lzma) or bzip2 since version
-5.38 and
-https://github.com/file/file/commit/b259a07ea95827f565faa20f0316e5b2704064f7
-so use pkg-config to retrieve those static dependencies and avoid the
-following build failure:
-
-[100%] Linking CXX executable gerbera
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/br-user/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmagic.a(compress.o): in function `uncompressbuf':
-compress.c:(.text+0x69c): undefined reference to `BZ2_bzDecompressInit'
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x710): undefined reference to `BZ2_bzDecompress'
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x730): undefined reference to `BZ2_bzDecompressEnd'
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x7bc): undefined reference to `lzma_auto_decoder'
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x828): undefined reference to `lzma_code'
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x848): undefined reference to `lzma_end'
-
-It should be noted that libmagic.pc is not currently provided in the
-official file package (which provides libmagic), an issue has been
-opened to add libmagic.pc: https://bugs.astron.com/view.php?id=136
-
-Fixes:
- - http://autobuild.buildroot.org/results/37b1ef54dc41100689f311fbc31fc9300dc6ae63
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/gerbera/gerbera/commit/7fdcabd80c823694d190e5baa8c657ffcae5e777]
----
- cmake/FindLibMagic.cmake | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/FindLibMagic.cmake b/cmake/FindLibMagic.cmake
-index f68ab923..04995af4 100644
---- a/cmake/FindLibMagic.cmake
-+++ b/cmake/FindLibMagic.cmake
-@@ -1,11 +1,22 @@
- INCLUDE (FindPackageHandleStandardArgs)
- 
--FIND_PATH(MAGIC_INCLUDE_DIR magic.h)
--FIND_LIBRARY(MAGIC_LIBRARIES NAMES magic)
-+find_package(PkgConfig QUIET)
-+
-+pkg_check_modules(PC_MAGIC QUIET libmagic)
-+
-+FIND_PATH(MAGIC_INCLUDE_DIR magic.h
-+    HINTS ${PC_MAGIC_INCLUDEDIR} ${PC_MAGIC_INCLUDE_DIRS})
-+FIND_LIBRARY(MAGIC_LIBRARIES NAMES magic
-+    HINTS ${PC_MAGIC_LIBDIR} ${PC_MAGIC_LIBRARY_DIRS})
- 
- # handle the QUIETLY and REQUIRED arguments and set MAGIC_FOUND to TRUE
- find_package_handle_standard_args(MAGIC DEFAULT_MSG MAGIC_LIBRARIES)
- 
-+if (MAGIC_FOUND)
-+    set (MAGIC_LIBRARIES ${MAGIC_LIBRARY} ${PC_MAGIC_LIBRARIES})
-+    set (MAGIC_INCLUDE_DIRS ${MAGIC_INCLUDE_DIR} )
-+endif ()
-+
- MARK_AS_ADVANCED(
-     MAGIC_LIBRARIES
-     MAGIC_INCLUDE_DIRS )
diff --git a/package/gerbera/0003-cmake-FindMatroska-fix-static-linking.patch b/package/gerbera/0003-cmake-FindMatroska-fix-static-linking.patch
deleted file mode 100644
index 128d617045..0000000000
--- a/package/gerbera/0003-cmake-FindMatroska-fix-static-linking.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From aab2eacbaad10759294f4fd74bbb5ecef3cf3a8d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 24 Dec 2019 22:57:18 +0100
-Subject: [PATCH] cmake/FindMatroska: fix static linking
-
-Fix static linking with libmatrasoka by adding PC_EBM_LIBRARIES to
-EBML_LIBRARIES and PC_MAT_LIBRARIES to MATROSKA_LIBRARIES
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/gerbera/gerbera/commit/aab2eacbaad10759294f4fd74bbb5ecef3cf3a8d]
----
- cmake/FindMatroska.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/FindMatroska.cmake b/cmake/FindMatroska.cmake
-index 4b09a5ec..12ca593d 100644
---- a/cmake/FindMatroska.cmake
-+++ b/cmake/FindMatroska.cmake
-@@ -23,7 +23,7 @@ FIND_LIBRARY(EBML_LIBRARY ebml
- FIND_PACKAGE_HANDLE_STANDARD_ARGS(EBML
-     REQUIRED_VARS EBML_LIBRARY EBML_INCLUDE_DIR)
- if (EBML_FOUND)
--    set (EBML_LIBRARIES ${EBML_LIBRARY})
-+    set (EBML_LIBRARIES ${EBML_LIBRARY} ${PC_EBM_LIBRARIES})
-     set (EBML_INCLUDE_DIRS ${EBML_INCLUDE_DIR} )
- endif ()
- MARK_AS_ADVANCED(
-@@ -41,7 +41,7 @@ find_library(MATROSKA_LIBRARY matroska
- FIND_PACKAGE_HANDLE_STANDARD_ARGS(MATROSKA
-     REQUIRED_VARS MATROSKA_LIBRARY MATROSKA_INCLUDE_DIR)
- if (MATROSKA_FOUND)
--    set (MATROSKA_LIBRARIES ${MATROSKA_LIBRARY})
-+    set (MATROSKA_LIBRARIES ${MATROSKA_LIBRARY} ${PC_MAT_LIBRARIES})
-     set (MATROSKA_INCLUDE_DIRS ${MATROSKA_INCLUDE_DIR} )
- endif ()
- MARK_AS_ADVANCED(
diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index e10f78b77e..5025b3753f 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -5,10 +5,12 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17 optional
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_PACKAGE_LIBUPNP # libupnp18
-	select BR2_PACKAGE_EXPAT
+	depends on BR2_USE_WCHAR # fmt
+	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBUPNP18
+	select BR2_PACKAGE_LIBUPNP if !BR2_PACKAGE_LIBNPUPNP
+	select BR2_PACKAGE_PUGIXML
+	select BR2_PACKAGE_SPDLOG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -19,9 +21,8 @@ config BR2_PACKAGE_GERBERA
 
 	  https://gerbera.io
 
-comment "gerbera needs a toolchain w/ C++, threads, gcc >= 7"
+comment "gerbera needs a toolchain w/ C++, threads, wchar, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_PACKAGE_LIBUPNP
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index b1fdcbf2d0..e584db1354 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	904a9031c85ac805e4c139f363510226952683d7257acd1dee25ba1e97fd7651  gerbera-1.4.0.tar.gz
-sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
+sha256  cbe7ea78977db8c02fcca1759ed149f199a590afaf4a6d21ffcca8623d1a0cc5  gerbera-1.6.4.tar.gz
+sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 7f0ac664fe..f26615a8f8 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,20 +4,23 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.4.0
+GERBERA_VERSION = 1.6.4
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
 GERBERA_DEPENDENCIES = \
-	expat \
+	fmt \
 	host-pkgconf \
-	libupnp18 \
+	$(if $(BR2_PACKAGE_LIBUPNP),libupnp) \
+	pugixml \
+	spdlog \
 	sqlite \
 	util-linux \
 	zlib
 GERBERA_CONF_OPTS = \
 	-DWITH_DEBUG=OFF \
-	-DWITH_JS=OFF
+	-DWITH_JS=OFF \
+	-DCXX_FILESYSTEM_NO_LINK_NEEDED=ON
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
@@ -70,6 +73,13 @@ else
 GERBERA_CONF_OPTS += -DWITH_MATROSKA=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNPUNP),y)
+GERBERA_DEPENDENCIES += libnpupnp
+GERBERA_CONF_OPTS += -DWITH_NPUPNP=ON
+else
+GERBERA_CONF_OPTS += -DWITH_NPUPNP=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 GERBERA_DEPENDENCIES += mysql
 GERBERA_CONF_OPTS += -DWITH_MYSQL=ON
-- 
2.29.2
