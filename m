From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Jun 2019 13:46:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.3.2
Message-ID: <20190622114640.20995-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...xiv2-header-that-include-all-headers.patch | 29 ------------
 ...m-taglib-config-when-cross-compiling.patch | 46 -------------------
 package/gerbera/gerbera.hash                  |  2 +-
 package/gerbera/gerbera.mk                    |  2 +-
 4 files changed, 2 insertions(+), 77 deletions(-)
 delete mode 100644 package/gerbera/0001-Use-exiv2-header-that-include-all-headers.patch
 delete mode 100644 package/gerbera/0002-Fix-find_program-taglib-config-when-cross-compiling.patch

diff --git a/package/gerbera/0001-Use-exiv2-header-that-include-all-headers.patch b/package/gerbera/0001-Use-exiv2-header-that-include-all-headers.patch
deleted file mode 100644
index 43de125e65..0000000000
--- a/package/gerbera/0001-Use-exiv2-header-that-include-all-headers.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c6692a857262af7ef13a95feef8fe7633790458f Mon Sep 17 00:00:00 2001
-From: Nicolas Serafini <serafini.nicolas@gmail.com>
-Date: Wed, 1 May 2019 10:24:47 +0200
-Subject: [PATCH] Use exiv2 header that include all headers
-
-With latest exiv2 0.27.1 there is a build error
-exiv2_handler.cc:179:21: error: 'AnyError' in namespace 'Exiv2' does not name a type
-
-Signed-off-by: Nicolas Serafini <serafini.nicolas@gmail.com>
-[Arnout: retrieved from https://github.com/gerbera/gerbera/pull/457]
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/metadata/exiv2_handler.cc | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/metadata/exiv2_handler.cc b/src/metadata/exiv2_handler.cc
-index f3a35d48..7f8c89bd 100644
---- a/src/metadata/exiv2_handler.cc
-+++ b/src/metadata/exiv2_handler.cc
-@@ -31,8 +31,7 @@
- /// \brief Implementeation of the Exiv2Handler class.
- 
- #ifdef HAVE_EXIV2
--#include <exiv2/exif.hpp>
--#include <exiv2/image.hpp>
-+#include <exiv2/exiv2.hpp>
- 
- #include "config_manager.h"
- #include "exiv2_handler.h"
diff --git a/package/gerbera/0002-Fix-find_program-taglib-config-when-cross-compiling.patch b/package/gerbera/0002-Fix-find_program-taglib-config-when-cross-compiling.patch
deleted file mode 100644
index d5cc908e22..0000000000
--- a/package/gerbera/0002-Fix-find_program-taglib-config-when-cross-compiling.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0f78b883f02651bd15a96a7294e01f94b28c20f8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 13 May 2019 13:42:14 +0200
-Subject: [PATCH] Fix find_program taglib-config when cross-compiling
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When cross-compiling Gerbera CMakes `find_program()` will search for
-binaries on the host. This is typically correct, e.g. when search for
-compilers or shells.
-
-When cross-compiling searching for `taglib-config` should not find the
-binary on the host, instead it should find the binary in the sysroot
-directory, as the host `taglib-config` will output the wrong host paths
-and libs, whereas the sysroot `taglib-config` will output the correct sysroot
-paths and libs.
-
-Therefore, use the `CMAKE_FIND_ROOT_PATH_MODE_PROGRAM` variable when
-cross-compiling. This variable controls whether the `CMAKE_FIND_ROOT_PATH`
-and `CMAKE_SYSROOT` are used by find_program().
-
-Backported from: 0f78b883f02651bd15a96a7294e01f94b28c20f8
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- cmake/FindTaglib.cmake | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/cmake/FindTaglib.cmake b/cmake/FindTaglib.cmake
-index 46a20ff2..7135d766 100644
---- a/cmake/FindTaglib.cmake
-+++ b/cmake/FindTaglib.cmake
-@@ -19,6 +19,9 @@ ELSE()
- 	endif(NOT TAGLIB_MIN_VERSION)
- 
- 	if(NOT WIN32)
-+            if (CMAKE_CROSSCOMPILING)
-+              set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
-+            endif(CMAKE_CROSSCOMPILING)
-             find_program(TAGLIBCONFIG_EXECUTABLE NAMES taglib-config PATHS
- 		   ${BIN_INSTALL_DIR}
-             )
--- 
-2.22.0
-
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 92a84c1aa6..05085b3279 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	9c4509189eab6bff0fe183e1dd54ea8cb17d7fb0bc6e21bb5b1a8ccaaf6c60d9	gerbera-1.3.1.tar.gz
+sha256	47515d5d9b640c31d114c74aa5532c3d6f40d6a8a60b00f1cb1cef7629d8d9db	gerbera-1.3.2.tar.gz
 sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6	LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index f868c72b57..a177a73107 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.3.1
+GERBERA_VERSION = 1.3.2
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
-- 
2.20.1
