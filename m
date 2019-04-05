From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Apr 2019 19:04:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.3.1
Message-ID: <20190405170422.13365-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove all patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-static-build-with-curl-and-libidn.patch |  41 ----
 ...cmake-FindFFMPEG-cmake-use-pkgconfig.patch | 175 ------------------
 ...FindLibUpnp.cmake-fix-static-linking.patch |  44 -----
 package/gerbera/gerbera.hash                  |   2 +-
 package/gerbera/gerbera.mk                    |   2 +-
 5 files changed, 2 insertions(+), 262 deletions(-)
 delete mode 100644 package/gerbera/0001-CMakeLists.txt-fix-static-build-with-curl-and-libidn.patch
 delete mode 100644 package/gerbera/0002-cmake-FindFFMPEG-cmake-use-pkgconfig.patch
 delete mode 100644 package/gerbera/0003-cmake-FindLibUpnp.cmake-fix-static-linking.patch

diff --git a/package/gerbera/0001-CMakeLists.txt-fix-static-build-with-curl-and-libidn.patch b/package/gerbera/0001-CMakeLists.txt-fix-static-build-with-curl-and-libidn.patch
deleted file mode 100644
index 94f742c3f8..0000000000
--- a/package/gerbera/0001-CMakeLists.txt-fix-static-build-with-curl-and-libidn.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From de0e7fe3b56cff79c11aedc89448814fab8d1877 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 8 Mar 2019 19:11:11 +0100
-Subject: [PATCH] MakeLists.txt: fix static build with curl and libidn2
-
-curl can be statically linked with libidn2, in this case, build fails:
-/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libcurl.a(libcurl_la-url.o): In function `free_idnconverted_hostname.isra.1':
-url.c:(.text+0xf4): undefined reference to `idn2_free'
-
-To fix this issue, add a call to pkg_check_modules to retrieve any
-needed dependencies
-
-Fixes:
- - http://autobuild.buildroot.org/results/be5893b507d22a23951efeea20c18642742cef5a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/gerbera/gerbera/pull/429]
----
- CMakeLists.txt | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d0eed230..e6b62c96 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -443,7 +443,11 @@ if(WITH_MYSQL)
- endif()
- 
- if(WITH_CURL)
--    find_package (CURL REQUIRED)
-+    find_package(PkgConfig QUIET)
-+    pkg_check_modules (CURL QUIET libcurl)
-+    if (NOT CURL_FOUND)
-+        find_package (CURL REQUIRED)
-+    endif()
-     if (CURL_FOUND)
-         include_directories(${CURL_INCLUDE_DIRS})
-         target_link_libraries (gerbera ${CURL_LIBRARIES})
--- 
-2.20.1
-
diff --git a/package/gerbera/0002-cmake-FindFFMPEG-cmake-use-pkgconfig.patch b/package/gerbera/0002-cmake-FindFFMPEG-cmake-use-pkgconfig.patch
deleted file mode 100644
index b5f79173b6..0000000000
--- a/package/gerbera/0002-cmake-FindFFMPEG-cmake-use-pkgconfig.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-From fbbc07ce53e884b1603461ee5642d5f02788678d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 21 Mar 2019 16:32:44 +0100
-Subject: [PATCH] cmake/FindFFMPEG.cmake: use pkgconfig
-
-ffmpeg has too many optional dependencies (opus, openssl, ...) instead
-of trying to find them all one by one, use pkg-config to get them and
-fallback on current mechanism
-
-Fixes:
- - http://autobuild.buildroot.org/results/2b99fabd798db84a0fce26ad696c58e54c6ff626
- - http://autobuild.buildroot.org/results/95e410e5ab34c6d4626a58f97c0d2d5e6829a300
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and backported) from:
-https://github.com/gerbera/gerbera/commit/fbbc07ce53e884b1603461ee5642d5f02788678d]
----
- cmake/FindFFMPEG.cmake | 147 +++++++++++++++++++++--------------------
- 1 file changed, 75 insertions(+), 72 deletions(-)
-
-diff --git a/cmake/FindFFMPEG.cmake b/cmake/FindFFMPEG.cmake
-index 0a4a409f..9548b566 100644
---- a/cmake/FindFFMPEG.cmake
-+++ b/cmake/FindFFMPEG.cmake
-@@ -82,70 +82,76 @@ ENDIF (NOT FFMPEG_INCLUDE_DIR)
- # ffmpeg uses relative includes such as <ffmpeg/avformat.h> or <libavcodec/avformat.h>
- get_filename_component(FFMPEG_INCLUDE_DIR ${FFMPEG_INCLUDE_DIR} ABSOLUTE)
- 
--FIND_LIBRARY(FFMPEG_avformat_LIBRARY avformat
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_avcodec_LIBRARY avcodec
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_avutil_LIBRARY avutil
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_swresample_LIBRARY swresample
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_vorbis_LIBRARY vorbis
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_dc1394_LIBRARY dc1394_control
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_vorbisenc_LIBRARY vorbisenc
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_theora_LIBRARY theora
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_dts_LIBRARY dts
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_gsm_LIBRARY gsm
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_swscale_LIBRARY swscale
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_z_LIBRARY z
--        /usr/local/lib
--        /usr/lib
--        )
--
--FIND_LIBRARY(FFMPEG_bz2_LIBRARY bz2
--        /usr/local/lib
--        /usr/lib
--        )
-+CHECK_STRUCT_HAS_MEMBER("struct AVStream" codecpar libavformat/avformat.h HAVE_AVSTREAM_CODECPAR LANGUAGE C)
-+
-+FIND_PACKAGE(PkgConfig QUIET)
-+PKG_CHECK_MODULES(FFMPEG QUIET libavformat libavutil)
-+IF (NOT FFMPEG_FOUND)
-+	FIND_LIBRARY(FFMPEG_avformat_LIBRARY avformat
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_avcodec_LIBRARY avcodec
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_avutil_LIBRARY avutil
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_swresample_LIBRARY swresample
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_vorbis_LIBRARY vorbis
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_dc1394_LIBRARY dc1394_control
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_vorbisenc_LIBRARY vorbisenc
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_theora_LIBRARY theora
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_dts_LIBRARY dts
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_gsm_LIBRARY gsm
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_swscale_LIBRARY swscale
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_z_LIBRARY z
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+
-+	FIND_LIBRARY(FFMPEG_bz2_LIBRARY bz2
-+		/usr/local/lib
-+		/usr/lib
-+		)
-+ENDIF(NOT FFMPEG_FOUND)
- 
- SET(FFMPEG_LIBRARIES)
- IF (FFMPEG_INCLUDE_DIR)
-@@ -205,9 +211,6 @@ IF (FFMPEG_INCLUDE_DIR)
-                 ENDIF (FFMPEG_bz2_LIBRARY)
- 
-                 SET(FFMPEG_LIBRARIES ${FFMPEG_LIBRARIES} CACHE INTERNAL "All presently found FFMPEG libraries.")
--
--                CHECK_STRUCT_HAS_MEMBER("struct AVStream" codecpar libavformat/avformat.h HAVE_AVSTREAM_CODECPAR LANGUAGE C)
--
-             ENDIF (FFMPEG_avutil_LIBRARY)
-         ENDIF (FFMPEG_avcodec_LIBRARY)
-     ENDIF (FFMPEG_avformat_LIBRARY)
diff --git a/package/gerbera/0003-cmake-FindLibUpnp.cmake-fix-static-linking.patch b/package/gerbera/0003-cmake-FindLibUpnp.cmake-fix-static-linking.patch
deleted file mode 100644
index 510bf2837f..0000000000
--- a/package/gerbera/0003-cmake-FindLibUpnp.cmake-fix-static-linking.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e2f8e6c30e43c1818a6677d17de87f53c9414405 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 2 Apr 2019 10:44:06 +0200
-Subject: [PATCH] cmake/FindLibUpnp.cmake: fix static linking
-
-Fix static linking with an openssl enabled upnp:
- - remove libupnp-1.8 from pkg_check_modules call otherwise test will
-   fail if libupnp-1.8.pc is not found
- - add PC_UPNP_LIBRARIES to UPNP_LIBRARIES
-
-Fixes:
- - http://autobuild.buildroot.org/results/10098c8972725d54b717ddc8ea41f4de5e5b066d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/gerbera/gerbera/pull/443]
----
- cmake/FindLibUpnp.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/FindLibUpnp.cmake b/cmake/FindLibUpnp.cmake
-index ec198d4d..5d2b032d 100644
---- a/cmake/FindLibUpnp.cmake
-+++ b/cmake/FindLibUpnp.cmake
-@@ -8,7 +8,7 @@
- #  UPNP_HAS_REUSEADDR - If LinUPnP was built with SO_REUSEADDR support
- 
- find_package(PkgConfig QUIET)
--pkg_check_modules (PC_UPNP QUIET libupnp-1.8 libupnp)
-+pkg_search_module (PC_UPNP QUIET libupnp-1.8 libupnp)
- 
- find_path(UPNP_INCLUDE_DIR upnp.h
-     HINTS ${PC_UPNP_INCLUDEDIR} ${PC_UPNP_INCLUDE_DIRS}
-@@ -41,7 +41,7 @@ FIND_PACKAGE_HANDLE_STANDARD_ARGS(UPnP
-     VERSION_VAR UPNP_VERSION_STRING)
- 
- if (UPNP_FOUND)
--    set (UPNP_LIBRARIES ${UPNP_UPNP_LIBRARY} ${UPNP_IXML_LIBRARY})
-+    set (UPNP_LIBRARIES ${UPNP_UPNP_LIBRARY} ${UPNP_IXML_LIBRARY} ${PC_UPNP_LIBRARIES})
-     set (UPNP_INCLUDE_DIRS ${UPNP_INCLUDE_DIR} )
- endif ()
- 
--- 
-2.14.1
-
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index bcac080c9d..5bbd8826b1 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	5e40971c519eb322fe0111754cafa12d99c47c2ae7d0f9f1aebb19b06e74a912	gerbera-v1.3.0.tar.gz
+sha256	89bbcebcf6beebb50b9453329b13e6a20e3e505dee5655486e90e1f085591f4a	gerbera-v1.3.1.tar.gz
 sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6	LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 7ded7cec74..5b69faaf82 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = v1.3.0
+GERBERA_VERSION = v1.3.1
 GERBERA_SITE = $(call github,gerbera,gerbera,$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
-- 
2.20.1
