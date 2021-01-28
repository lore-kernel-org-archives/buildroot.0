From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 20:23:03 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/gerbera: bump to
 version 1.4.0
Message-ID: <20210128200123.84D1C813B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb0225ae436999ec6159018fbb7f01fd733d0a8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Also:
 * Drop patch 0001 (fix static linking of libmagic) applied upstream
 * Add optional dependency on libmatroska
 * Add upstream patch to fix building with libmatroska
 * Adjust spacing in hash file to 2 spaces

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6976f312fa84d4a9c4bbf99ed3b173085780dcd9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ake-FindLibMagic.cmake-fix-static-linking.patch | 60 ----------------------
 ...oska-build-without-js-taglib-or-atrailers.patch | 51 ++++++++++++++++++
 package/gerbera/config.xml                         |  4 ++
 package/gerbera/gerbera.hash                       |  4 +-
 package/gerbera/gerbera.mk                         |  9 +++-
 5 files changed, 65 insertions(+), 63 deletions(-)

diff --git a/package/gerbera/0001-cmake-FindLibMagic.cmake-fix-static-linking.patch b/package/gerbera/0001-cmake-FindLibMagic.cmake-fix-static-linking.patch
deleted file mode 100644
index 5a189614f7..0000000000
--- a/package/gerbera/0001-cmake-FindLibMagic.cmake-fix-static-linking.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 64f49c6131f4112e5efd8b69094235f13882ccf5 Mon Sep 17 00:00:00 2001
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
-Fixes:
- - http://autobuild.buildroot.org/results/37b1ef54dc41100689f311fbc31fc9300dc6ae63
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
--- 
-2.24.1
-
diff --git a/package/gerbera/0001-fix-matroska-build-without-js-taglib-or-atrailers.patch b/package/gerbera/0001-fix-matroska-build-without-js-taglib-or-atrailers.patch
new file mode 100644
index 0000000000..6898e8ebee
--- /dev/null
+++ b/package/gerbera/0001-fix-matroska-build-without-js-taglib-or-atrailers.patch
@@ -0,0 +1,51 @@
+From 0ac781b0b0deef5c02c32a70ac484f882c3f4dd0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 24 Dec 2019 18:55:57 +0100
+Subject: [PATCH] fix matroska build without js, taglib or atrailers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+i2i function is used in matroska_handler.cc but this function is defined
+only if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS)
+as a result compilation fails if HAVE_MATROSKA is set but HAVE_JS,
+HAVE_TAGLIG or ATRAILERS are not.
+
+Backported from: 0ac781b0b0deef5c02c32a70ac484f882c3f4dd0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ src/string_converter.cc | 2 +-
+ src/string_converter.h  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/string_converter.cc b/src/string_converter.cc
+index f669c661..7a3c55d7 100644
+--- a/src/string_converter.cc
++++ b/src/string_converter.cc
+@@ -218,7 +218,7 @@ Ref<StringConverter> StringConverter::p2i()
+ }
+ #endif
+ 
+-#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS)
++#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS) || defined(HAVE_MATROSKA)
+ 
+ Ref<StringConverter> StringConverter::i2i()
+ {
+diff --git a/src/string_converter.h b/src/string_converter.h
+index 58495430..f75bf833 100644
+--- a/src/string_converter.h
++++ b/src/string_converter.h
+@@ -65,7 +65,7 @@ public:
+     static zmm::Ref<StringConverter> p2i();
+ 
+ #endif
+-#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS)
++#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS) || defined(HAVE_MATROSKA)
+     /// \brief safeguard - internal to internal - needed to catch some
+     /// scenarious where the user may have forgotten to add proper conversion
+     /// in the script.
+-- 
+2.26.1
+
diff --git a/package/gerbera/config.xml b/package/gerbera/config.xml
index fa990d1502..ddaaa7f18f 100644
--- a/package/gerbera/config.xml
+++ b/package/gerbera/config.xml
@@ -79,6 +79,9 @@
         <map from="flv" to="video/x-flv"/>
         <map from="mkv" to="video/x-matroska"/>
         <map from="mka" to="audio/x-matroska"/>
+        <map from="dsf" to="audio/x-dsd"/>
+        <map from="dff" to="audio/x-dsd"/>
+        <map from="wv" to="audio/x-wavpack"/>
         <!-- Uncomment the line below for PS3 divx support -->
         <!-- <map from="avi" to="video/divx"/> -->
         <!-- Uncomment the line below for D-Link DSM / ZyXEL DMA-1000 -->
@@ -107,6 +110,7 @@
         <treat mimetype="audio/mp4" as="mp4"/>
         <treat mimetype="video/x-matroska" as="mkv"/>
         <treat mimetype="audio/x-matroska" as="mka"/>
+        <treat mimetype="audio/x-dsd" as="dsd"/>
       </mimetype-contenttype>
     </mappings>
   </import>
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 533a903882..b1fdcbf2d0 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	c7fbb6104dd03ed22d114c7b1fbe95eb7f90893148630e16b0a4c23f1f631341	gerbera-1.3.4.tar.gz
-sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6	LICENSE.md
+sha256	904a9031c85ac805e4c139f363510226952683d7257acd1dee25ba1e97fd7651  gerbera-1.4.0.tar.gz
+sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 21c6836952..7f0ac664fe 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.3.4
+GERBERA_VERSION = 1.4.0
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
@@ -63,6 +63,13 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 GERBERA_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMATROSKA),y)
+GERBERA_DEPENDENCIES += libmatroska
+GERBERA_CONF_OPTS += -DWITH_MATROSKA=ON
+else
+GERBERA_CONF_OPTS += -DWITH_MATROSKA=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 GERBERA_DEPENDENCIES += mysql
 GERBERA_CONF_OPTS += -DWITH_MYSQL=ON
